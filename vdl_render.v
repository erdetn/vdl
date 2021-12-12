// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum RendererFlags { // SDL_RendererFlags
	software = C.SDL_RENDERER_SOFTWARE
	accelerated = C.SDL_RENDERER_ACCELERATED
	present_vsync = C.SDL_RENDERER_PRESENTVSYNC
	target_texture = C.SDL_RENDERER_TARGETTEXTURE
}

struct C.SDL_RendererInfo {
	name                &char   // The name of the renderer
	flags               u32     // Supported ::SDL_RendererFlags
	num_texture_formats u32     // The number of available texture formats
	texture_formats     [16]u32 // The available texture formats
	max_texture_width   int     // The maximum texture width
	max_texture_height  int     // The maximum texture height
}

pub struct RendererInfo {
	ptr &C.SDL_RendererInfo
}

struct C.SDL_Vertex {
	poistion C.SDL_FPoint
	color    C.SDL_Color
	tex_cord C.SDL_FPoint
}

pub enum TextureAccess { // SDL_TextureAccess
	@static = C.SDL_TEXTUREACCESS_STATIC
	streaming = C.SDL_TEXTUREACCESS_STREAMING
	target = C.SDL_TEXTUREACCESS_TARGET
}

pub enum TextureModulate { // SDL_TextureModulate
	@none = C.SDL_TEXTUREMODULATE_NONE
	color = C.SDL_TEXTUREMODULATE_COLOR
	alpha = C.SDL_TEXTUREMODULATE_ALPHA
}

pub enum RendererFlip { // SDL_RendererFlip
	@none = C.SDL_FLIP_NONE
	horizontal = C.SDL_FLIP_HORIZONTAL
	vertical = C.SDL_FLIP_VERTICAL
}

pub struct Renderer {
	ptr &C.SDL_Renderer
}

pub struct Texture {
	ptr &C.SDL_Texture
}

fn C.SDL_GetNumRenderDrivers() int
pub fn get_num_render_drivers() int {
	return C.SDL_GetNumRenderDrivers()
}

fn C.SDL_GetRenderDriverInfo(int, &C.SDL_RendererInfo) int
pub fn get_render_driver_info(index int) RendererInfo {
	ret := RendererInfo{
		ptr: &C.SDL_RendererInfo(voidptr(0))
	}

	unsafe {
		C.SDL_GetRenderDriverInfo(index, ret.ptr)
	}

	return ret
}

fn C.SDL_CreateRenderer(&C.SDL_Window, int, u32) &C.SDL_Renderer
pub fn (this Window) create_renderer(index int, flags RendererFlags) Renderer {
	ret := Renderer{
		ptr: C.SDL_CreateRenderer(this.ptr, index, u32(flags))
	}
	return ret
}

fn C.SDL_CreateSoftwareRenderer(&C.SDL_Surface) &C.SDL_Renderer
pub fn (this Surface) create_software_renderer() Renderer {
	return Renderer{
		ptr: C.SDL_CreateSoftwareRenderer(this.ptr)
	}
}

fn C.SDL_GetRenderer(&C.SDL_Window) &C.SDL_Renderer
pub fn (this Window) renderer() Renderer {
	return Renderer{
		ptr: C.SDL_GetRenderer(this.ptr)
	}
}

fn C.SDL_GetRendererInfo(&C.SDL_Renderer, &C.SDL_RendererInfo) int
pub fn (this Renderer) info() RendererInfo {
	ret := RendererInfo{
		ptr: &C.SDL_RendererInfo(voidptr(0))
	}
	unsafe {
		C.SDL_GetRendererInfo(this.ptr, ret.ptr)
	}
	return ret
}

fn C.SDL_GetRendererOutputSize(&C.SDL_Renderer, &int, &int) int
pub fn (this Renderer) output_size() (int, int) {
	width := int(0)
	height := int(0)

	unsafe {
		C.SDL_GetRendererOutputSize(this.ptr, &width, &height)
	}
	return width, height
}

fn C.SDL_CreateTexture(&C.SDL_Renderer, u32, int, int, int) &C.SDL_Texture
pub fn (this Renderer) new_texture(format PixelFormatEnum, access TextureAccess, width int, height int) Texture {
	return Texture{
		ptr: C.SDL_CreateTexture(this.ptr, u32(format), int(access), width, height)
	}
}

fn C.SDL_CreateTextureFromSurface(&C.SDL_Renderer, &C.SDL_Surface) &C.SDL_Texture
pub fn (this Renderer) new_texture_from_surface(surface Surface) Texture {
	return Texture{
		ptr: C.SDL_CreateTextureFromSurface(this.ptr, surface.ptr)
	}
}

fn C.SDL_QueryTexture(&C.SDL_Texture, &u32, &int, &int, &int) int
pub fn (this Texture) query() (PixelFormatEnum, TextureAccess, int, int) {
	format := u32(0)
	access := int(0)
	width := int(0)
	height := int(0)

	unsafe {
		C.SDL_QueryTexture(this.ptr, &format, &access, &width, &height)
	}

	return PixelFormatEnum(format), TextureAccess(access), width, height
}

fn C.SDL_SetTextureColorMod(&C.SDL_Texture, u8, u8, u8) int
pub fn (this Texture) set_color_mod(red u8, green u8, blue u8) {
	C.SDL_SetTextureColorMod(this.ptr, red, green, blue)
}

fn C.SDL_GetTextureColorMod(&C.SDL_Texture, &u8, &u8, &u8) int
pub fn (this Texture) color_mod() (u8, u8, u8) {
	red := u8(0)
	green := u8(0)
	blue := u8(0)

	unsafe {
		C.SDL_GetTextureColorMod(this.ptr, &red, &green, &blue)
	}
	return red, green, blue
}

fn C.SDL_SetTextureAlphaMod(&C.SDL_Texture, u8) int
pub fn (this Texture) set_alpha_mod(alpha u8) {
	C.SDL_SetTextureAlphaMod(this.ptr, alpha)
}

fn C.SDL_GetTextureAlphaMod(&C.SDL_Texture, &u8) int
pub fn (this Texture) alpha_mod() u8 {
	alpha := u8(0)
	unsafe {
		C.SDL_GetTextureAlphaMod(this.ptr, &alpha)
	}
	return alpha
}

fn C.SDL_SetTextureBlendMode(&C.SDL_Texture, C.SDL_BlendMode) int
pub fn (this Texture) set_blend_mode(blend_mode BlendMode) {
	C.SDL_SetTextureBlendMode(this.ptr, C.SDL_BlendMode(blend_mode))
}

fn C.SDL_GetTextureBlendMode(&C.SDL_Texture, &int) int
pub fn (this Texture) blend_mode() BlendMode {
	bm := int(0)

	unsafe {
		C.SDL_GetTextureBlendMode(this.ptr, &bm)
	}

	return BlendMode(bm)
}

fn C.SDL_UpdateTexture(&C.SDL_Texture, &C.SDL_Rect, voidptr, int) int
pub fn (this Texture) update(rect Rectangle, pixels voidptr, pitch int) bool {
	rc := unsafe {
		C.SDL_UpdateTexture(this.ptr, &C.SDL_Rect(&rect), pixels, pitch)
	}
	return rc == 0
}

fn C.SDL_UpdateYUVTexture(&C.SDL_Texture, &C.SDL_Rect, &u8, int, &u8, int, &u8, int) int
pub fn (this Texture) update_yuv(rect Rectangle, y_plane []u8, y_pitch int, u_plane []u8, u_pitch int, v_plane []u8, v_pitch int) bool {
	rc := unsafe {
		C.SDL_UpdateYUVTexture(this.ptr, &C.SDL_Rect(&rect), &y_plane[0], y_pitch, &u_plane[0],
			u_pitch, &v_plane[0], v_pitch)
	}
	return rc == 0
}

fn C.SDL_RenderTargetSupported(&C.SDL_Renderer) C.SDL_bool
pub fn (this Renderer) target_supported() bool {
	rc := C.SDL_RenderTargetSupported(this.ptr)
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_SetRenderTarget(&C.SDL_Renderer, &C.SDL_Texture) int
pub fn (this Renderer) set_target(texture Texture) bool {
	rc := C.SDL_SetRenderTarget(this.ptr, texture.ptr)
	return rc == 0
}

fn C.SDL_GetRenderTarget(&C.SDL_Renderer) &C.SDL_Texture
pub fn (this Renderer) target() Texture {
	return Texture{
		ptr: C.SDL_GetRenderTarget(this.ptr)
	}
}

fn C.SDL_RenderSetLogicalSize(&C.SDL_Renderer, int, int) int
pub fn (this Renderer) set_logical_size(width int, height int) bool {
	rc := C.SDL_RenderSetLogicalSize(this.ptr, width, height)
	return rc == 0
}

fn C.SDL_RenderGetLogicalSize(&C.SDL_Renderer, &int, &int)
pub fn (this Renderer) logical_size() (int, int) {
	width := int(0)
	height := int(0)

	unsafe {
		C.SDL_RenderGetLogicalSize(this.ptr, &width, &height)
	}
	return width, height
}

fn C.SDL_RenderSetIntegerScale(&C.SDL_Renderer, C.SDL_bool) int

pub fn (this Renderer) enable_integer_scale() {
	C.SDL_RenderSetIntegerScale(this.ptr, C.SDL_bool(C.SDL_TRUE))
}

pub fn (this Renderer) disable_integer_scale() {
	C.SDL_RenderSetIntegerScale(this.ptr, C.SDL_bool(C.SDL_FALSE))
}

fn C.SDL_RenderGetIntegerScale(&C.SDL_Renderer) C.SDL_bool
pub fn (this Renderer) is_integer_scale() bool {
	rc := C.SDL_RenderGetIntegerScale(this.ptr)
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_RenderSetViewport(&C.SDL_Renderer, &C.SDL_Rect) int
pub fn (this Renderer) set_viewport(rect Rectangle) bool {
	rc := unsafe {
		C.SDL_RenderSetViewport(this.ptr, &C.SDL_Rect(&rect))
	}
	return rc == 0
}

fn C.SDL_RenderGetViewport(&C.SDL_Renderer, &C.SDL_Rect)
pub fn (this Renderer) viewport() Rectangle {
	rect := new_rectangle(0, 0, 0, 0)
	unsafe {
		C.SDL_RenderGetViewport(this.ptr, &C.SDL_Rect(&rect))
	}
	return rect
}

fn C.SDL_RenderSetClipRect(&C.SDL_Renderer, &C.SDL_Rect) int
pub fn (this Renderer) set_clip_rectangle(rect Rectangle) bool {
	rc := unsafe {
		C.SDL_RenderSetClipRect(this.ptr, &C.SDL_Rect(&rect))
	}
	return rc == 0
}

fn C.SDL_RenderGetClipRect(&C.SDL_Renderer, &C.SDL_Rect)
pub fn (this Renderer) get_clip_rectangle() Rectangle {
	rect := new_rectangle(0, 0, 0, 0)
	unsafe {
		C.SDL_RenderGetClipRect(this.ptr, &C.SDL_Rect(&rect))
	}
	return rect
}

fn C.SDL_RenderIsClipEnabled(&C.SDL_Renderer) C.SDL_bool
pub fn (this Renderer) is_clip_enabled() bool {
	rc := C.SDL_RenderIsClipEnabled(this.ptr)
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_RenderSetScale(&C.SDL_Renderer, f32, f32) int
pub fn (this Renderer) set_scale(scale_x f32, scale_y f32) bool {
	rc := C.SDL_RenderSetScale(this.ptr, scale_x, scale_y)
	return rc == 0
}

fn C.SDL_RenderGetScale(&C.SDL_Renderer, &f32, &f32)
pub fn (this Renderer) scale() (f32, f32) {
	sx := f32(0)
	sy := f32(0)

	unsafe {
		C.SDL_RenderGetScale(this.ptr, &sx, &sy)
	}
	return sx, sy
}

fn C.SDL_SetRenderDrawColor(&C.SDL_Renderer, u8, u8, u8, u8) int
pub fn (this Renderer) set_draw_color(color Color) bool {
	rc := C.SDL_SetRenderDrawColor(this.ptr, color.r, color.g, color.b, color.a)
	return rc == 0
}

fn C.SDL_GetRenderDrawColor(&C.SDL_Renderer, &u8, &u8, &u8, &u8) int
pub fn (this Renderer) draw_color() Color {
	red := u8(0)
	green := u8(0)
	blue := u8(0)
	alpha := u8(0)

	unsafe {
		C.SDL_GetRenderDrawColor(this.ptr, &red, &green, &blue, &alpha)
	}
	return Color{
		r: red
		g: green
		b: blue
		a: alpha
	}
}

fn C.SDL_SetRenderDrawBlendMode(&C.SDL_Renderer, C.SDL_BlendMode) int
pub fn (this Renderer) set_draw_blend_mode(blend_mode BlendMode) bool {
	rc := C.SDL_SetRenderDrawBlendMode(this.ptr, C.SDL_BlendMode(blend_mode))
	return rc == 0
}

fn C.SDL_GetRenderDrawBlendMode(&C.SDL_Renderer, &C.SDL_BlendMode) int
pub fn (this Renderer) draw_blend_mode() BlendMode {
	bm := BlendMode.@none
	unsafe {
		C.SDL_GetRenderDrawBlendMode(this.ptr, &C.SDL_BlendMode(&bm))
	}
	return bm
}

fn C.SDL_RenderClear(&C.SDL_Renderer) int
pub fn (this Renderer) clear() bool {
	rc := C.SDL_RenderClear(this.ptr)
	return rc == 0
}

fn C.SDL_RenderDrawPoint(&C.SDL_Renderer, int, int) int
pub fn (this Renderer) draw_point(x int, y int) {
	C.SDL_RenderDrawPoint(this.ptr, x, y)
}

fn C.SDL_RenderDrawPoints(&C.SDL_Renderer, &C.SDL_Point, int) int
pub fn (this Renderer) draw_points(points []Point) {
	unsafe {
		C.SDL_RenderDrawPoints(this.ptr, &C.SDL_Point(&points[0]), points.len)
	}
}

fn C.SDL_RenderDrawLine(&C.SDL_Renderer, int, int, int, int) int
pub fn (this Renderer) draw_line(x1 int, y1 int, x2 int, y2 int) {
	C.SDL_RenderDrawLine(this.ptr, x1, y2, x2, y2)
}

fn C.SDL_RenderDrawLines(&C.SDL_Renderer, &C.SDL_Point, int) int
pub fn (this Renderer) draw_lines(points []Point) {
	unsafe {
		C.SDL_RenderDrawLines(this.ptr, &C.SDL_Point(&points[0]), points.len)
	}
}

fn C.SDL_RenderDrawRect(&C.SDL_Renderer, &C.SDL_Rect) int
pub fn (this Renderer) draw_rectangle(rect Rectangle) {
	tmp := rect
	unsafe {
		C.SDL_RenderDrawRect(this.ptr, &tmp)
	}
}

fn C.SDL_RenderDrawRects(&C.SDL_Renderer, &C.SDL_Rect, int) int
pub fn (this Renderer) draw_rectangles(rects []Rectangle) {
	unsafe {
		C.SDL_RenderDrawRects(this.ptr, &C.SDL_Rect(&rects[0]), rects.len)
	}
}

fn C.SDL_RenderFillRect(&C.SDL_Renderer, &C.SDL_Rect) int
pub fn (this Renderer) fill_rectangle(rect Rectangle) {
	tmp := rect
	unsafe {
		C.SDL_RenderFillRect(this.ptr, &tmp)
	}
}

fn C.SDL_RenderFillRects(&C.SDL_Renderer, &C.SDL_Rect, int) int
pub fn (this Renderer) fill_rectangles(rects []Rectangle) {
	unsafe {
		C.SDL_RenderFillRects(this.ptr, &C.SDL_Rect(&rects[0]), rects.len)
	}
}

fn C.SDL_RenderCopy(&C.SDL_Renderer, &C.SDL_Texture, &C.SDL_Rect, &C.SDL_Rect) int
pub fn (this Renderer) copy(texture Texture, src_rect Rectangle, dst_rect Rectangle) {
	rs := src_rect
	rd := dst_rect
	unsafe {
		C.SDL_RenderCopy(this.ptr, texture.ptr, &rs, &rd)
	}
}

fn C.SDL_RenderDrawPointF(&C.SDL_Renderer, f32, f32)
pub fn (this Renderer) draw_fpoint(x f32, y f32) {
	C.SDL_RenderDrawPointF(this.ptr, x, y)
}

fn C.SDL_RenderDrawPointsF(&C.SDL_Renderer, &C.SDL_FPoint, int) int
pub fn (this Renderer) draw_fpoints(points []FPoint) {
	unsafe {
		C.SDL_RenderDrawPointsF(this.ptr, &C.SDL_FPoint(&points[0]), points.len)
	}
}

fn C.SDL_RenderDrawLineF(&C.SDL_Renderer, f32, f32, f32, f32) int
pub fn (this Renderer) draw_fline(x1 f32, y1 f32, x2 f32, y2 f32) {
	C.SDL_RenderDrawLineF(this.ptr, x1, y1, x2, y2)
}

fn C.SDL_RenderDrawLinesF(&C.SDL_Renderer, &C.SDL_FPoint, int) int
pub fn (this Renderer) draw_flines(points []FPoint) {
	unsafe {
		C.SDL_RenderDrawLinesF(this.ptr, &C.SDL_FPoint(&points[0]), points.len)
	}
}

fn C.SDL_RenderDrawRectF(&C.SDL_Renderer, &C.SDL_FRect) int
pub fn (this Renderer) draw_frectangle(frect FRectangle) {
	fr := frect
	unsafe {
		C.SDL_RenderDrawRectF(this.ptr, &C.SDL_FRect(&fr))
	}
}

fn C.SDL_RenderDrawRectsF(&C.SDL_Renderer, &C.SDL_FRect, int) int
pub fn (this Renderer) draw_frectangles(frects []FRectangle) {
	unsafe {
		C.SDL_RenderDrawRectsF(this.ptr, &C.SDL_FRect(&frects[0]), frects.len)
	}
}

fn C.SDL_RenderFillRectF(&C.SDL_Renderer, &C.SDL_FRect) int
pub fn (this Renderer) fill_frectangle(frect FRectangle) {
	fr := frect
	unsafe {
		C.SDL_RenderFillRectF(this.ptr, &fr)
	}
}

fn C.SDL_RenderFillRectsF(&C.SDL_Renderer, &C.SDL_FRect, int) int
pub fn (this Renderer) fill_frectangles(frects []FRectangle) {
	unsafe {
		C.SDL_RenderFillRectsF(this.ptr, &C.SDL_FRect(&frects[0]), frects.len)
	}
}

fn C.SDL_RenderPresent(&C.SDL_Renderer)
pub fn (this Renderer) update() {
	C.SDL_RenderPresent(this.ptr)
}

fn C.SDL_DestroyTexture(&C.SDL_Texture)
pub fn (mut this Texture) free() {
	C.SDL_DestroyTexture(this.ptr)
}

fn C.SDL_DestroyRenderer(&C.SDL_Renderer)
pub fn (mut this Renderer) free() {
	C.SDL_DestroyRenderer(this.ptr)
}

fn C.SDL_RenderFlush(&C.SDL_Renderer) int
pub fn (this Renderer) flush() bool {
	rc := C.SDL_RenderFlush(this.ptr)
	return rc == 0
}

fn C.SDL_GL_BindTexture(&C.SDL_Texture, &f32, &f32) int
pub fn (this Texture) bind_gl() (f32, f32) {
	wf := f32(0)
	hf := f32(0)

	unsafe {
		C.SDL_GL_BindTexture(this.ptr, &wf, &hf)
	}
	return wf, hf
}

fn C.SDL_GL_UnbindTexture(&C.SDL_Texture) int
pub fn (this Texture) unbind_gl() {
	C.SDL_GL_UnbindTexture(this.ptr)
}
