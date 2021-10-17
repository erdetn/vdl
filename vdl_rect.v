module vdl

struct C.SDL_Point {
	x int
	y int
}

pub type Point = C.SDL_Point

struct C.SDL_FPoint {
    x f64
    y f64
}

pub fn (this Point)str() string {
	mut str := '<Point>{'
	str += 'x: ${this.x}, '
	str += 'y: ${this.y}}'

	return str
}

pub type FPoint = C.SDL_FPoint

struct C.SDL_FRect {
	x f64
	y f64
	w f64
	h f64
}

pub fn (this FPoint)str() string {
	mut str := '<FPoint>{'
	str += 'x: ${this.x}, '
	str += 'y: ${this.y}}'

	return str
}

pub fn new_point(xi int, yi int) Point {
	return Point {
		x: xi,
		y: yi
	}
}

pub fn new_fpoint(xf f64, yf f64) FPoint {
	return  FPoint {
		x: xf,
		y: yf
	}
}

struct C.SDL_Rect {
    x int
	y int
	w int
	h int
}

pub type Rectangle = C.SDL_Rect

pub fn new_rectangle(start_x int, start_y int, width int, height int) Rectangle {
	return Rectangle {
		x: start_x,
		y: start_y,
		w: width,
		h: height
	}
}

pub fn (this Rectangle)has_point(point Point) bool {
	return point.x >= this.x && point.x < (this.x + this.w) &&
	       point.y >= this.y && point.y < (this.y + this.h)
}

pub fn (this Rectangle)is_empty() bool {
	return this.w <= 0 || this.h <= 0
}

pub fn (this Rectangle) == (ref Rectangle) bool {
	return this.x == ref.x &&
	       this.y == ref.y &&
		   this.w == ref.w &&
		   this.h == ref.h
}

fn C.SDL_HasIntersection(&C.SDL_Rect, &C.SDL_Rect) C.SDL_bool
pub fn (this Rectangle)has_intersection(ref Rectangle) bool {
	return unsafe {
		C.SDL_HasIntersection(&this, &ref) == C.SDL_bool(C.SDL_TRUE)
	}
}

pub fn (this Rectangle) % (ref Rectangle) Rectangle {
	return intersect_rectangle(this, ref)
}

fn C.SDL_IntersectRect(&C.SDL_Rect, &C.SDL_Rect, &C.SDL_Rect) C.SDL_bool
pub fn intersect_rectangle(a Rectangle, b Rectangle) Rectangle {
	mut ret := new_rectangle(0, 0, 0, 0)

	unsafe {
		C.SDL_IntersectRect(&a, &b, &ret) == C.SDL_bool(C.SDL_TRUE)
	}

	return ret
}

pub fn (this Rectangle)intersection(ref Rectangle) Rectangle {
	return intersect_rectangle(this, ref)
}

fn C.SDL_UnionRect(&C.SDL_Rect, &C.SDL_Rect, &C.SDL_Rect)
pub fn union_rectangle(a Rectangle, b Rectangle) Rectangle {
	mut ret := new_rectangle(0, 0, 0, 0)


	unsafe {
		C.SDL_UnionRect(&a, &b, &ret)
	}

	return ret
}

// + is the "union" operator when it comes to Rectangle data type
pub fn (this Rectangle) + (ref Rectangle) Rectangle{
	ret := union_rectangle(&this, &ref)
	return ret
}

fn C.SDL_EnclosePoints(&C.SDL_Point, int, &C.SDL_Rect, &C.SDL_Rect) C.SDL_bool

pub fn enclose_points(points []Point) Rectangle {
	ret := new_rectangle(0, 0, 0, 0)

	unsafe {
		C.SDL_EnclosePoints(&points[0], points.len, voidptr(0), &ret)
	}

	return ret
}

pub fn (this Rectangle)enclose_points(points []Point) Rectangle {
	ret := new_rectangle(0, 0, 0, 0)

	unsafe {
		C.SDL_EnclosePoints(&points[0], points.len, &this, &ret)
	}

	return ret
}

pub fn (mut this Rectangle)fit_to(points []Point) {
	ret := new_rectangle(0, 0, 0, 0)
	tmp := this

	unsafe {
		C.SDL_EnclosePoints(&points[0], points.len, &tmp, &ret)
	}
	this = ret
}

pub fn (this Rectangle)str() string {
	mut str := '<Rectangle>{'
	str += 'x: ${this.x}, '
	str += 'y: ${this.y}, '
	str += 'width: ${this.w}, '
	str += 'height: ${this.h}}'

	return str
}

// TODO:
// extern DECLSPEC SDL_bool SDLCALL SDL_IntersectRectAndLine(const SDL_Rect *
// rect, int *X1, int *Y1, int *X2, int *Y2);
