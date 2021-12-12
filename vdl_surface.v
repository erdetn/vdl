// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

struct C.SDL_Surface {}

pub struct Surface {
	ptr &C.SDL_Surface
}

pub enum SurfaceFlag {
	sw_surface = C.SDL_SWSURFACE
	preallocated = C.SDL_PREALLOC
	rle_encoded = C.SDL_RLEACCEL
	dont_free = C.SDL_DONTFREE
	aligned = C.SDL_SIMD_ALIGNED
}

struct C.SDL_Surface {
	flags     u32
	format    &C.SDL_PixelFormat
	w         int
	h         int
	pitch     int
	pixels    voidptr
	userdata  voidptr
	locked    int
	lock_data voidptr
	clip_rect C.SDL_Rect
	map       &C.SDL_BlitMap
	refcount  int
}

pub enum YuvConversionMode {
	jpeg = C.SDL_YUV_CONVERSION_JPEG
	bt601 = C.SDL_YUV_CONVERSION_BT601
	bt709 = C.SDL_YUV_CONVERSION_BT709
	automatic = C.SDL_YUV_CONVERSION_AUTOMATIC
}

fn C.SDL_CreateRGBSurface(u32, int, int, int, u32, u32, u32, u32) &C.SDL_Surface
pub fn new_rgb_surface(flags u32, width int, height int, depth int, rmask u32, gmask u32, bmask u32, amask u32) Surface {
	return Surface{
		ptr: C.SDL_CreateRGBSurface(flags, width, height, depth, rmask, gmask, bmask,
			amask)
	}
}

fn C.SDL_CreateRGBSurfaceWithFormat(u32, int, int, int, u32) &C.SDL_Surface
pub fn new_surface_with_format(flags u32, width int, height int, depth int, format int) Surface {
	return Surface{
		ptr: C.SDL_CreateRGBSurfaceWithFormat(flags, width, height, depth, format)
	}
}

fn C.SDL_CreateRGBSurfaceFrom(voidptr, int, int, int, int, u32, u32, u32, u32) &C.SDL_Surface
pub fn new_surface_from(pixels voidptr, width int, height int, depth int, pitch int, rmask u32, gmask u32, bmask u32, amask u32) Surface {
	return Surface{
		ptr: C.SDL_CreateRGBSurfaceFrom(pixels, width, height, depth, pitch, rmask, gmask,
			bmask, amask)
	}
}

fn C.SDL_FreeSurface(&C.SDL_Surface)
pub fn (mut this Surface) free() {
	C.SDL_FreeSurface(this.ptr)
}

fn C.SDL_SetSurfacePalette(&C.SDL_Surface, &C.SDL_Palette) int
pub fn (this Surface) set_palette(palette Palette) bool {
	rc := C.SDL_SetSurfacePalette(this.ptr, palette.ptr)
	return rc == 0
}

fn C.SDL_LockSurface(&C.SDL_Surface) int
pub fn (this Surface) lock_pixels() bool {
	rc := C.SDL_LockSurface(this.ptr)
	return rc == 0
}

fn C.SDL_UnlockSurface(&C.SDL_Surface)
pub fn (this Surface) unlock_pixels() {
	C.SDL_UnlockSurface(this.ptr)
}

fn C.SDL_LoadBMP_RW(&C.SDL_RWops, int) &C.SDL_Surface
pub fn load_bmp(filename string) Surface {
	return Surface{
		ptr: C.SDL_LoadBMP_RW(C.SDL_RWFromFile(&char(filename.str), &char('rb'.str)),
			1)
	}
}

fn C.SDL_SaveBMP_RW(&C.SDL_Surface, &C.SDL_RWops, int) int
pub fn (this Surface) save(filename string) bool {
	rc := C.SDL_SaveBMP_RW(this.ptr, C.SDL_RWFromFile(&char(filename.str), &char('rb'.str)),
		1)
	return rc == 0
}

fn C.SDL_SetSurfaceRLE(&C.SDL_Surface, int) int
pub fn (this Surface) enable_rle() bool {
	rc := C.SDL_SetSurfaceRLE(this.ptr, 1)
	return rc == 0
}

pub fn (this Surface) disable_rle() bool {
	rc := C.SDL_SetSurfaceRLE(this.ptr, 0)
	return rc == 0
}

fn C.SDL_SetColorKey(&C.SDL_Surface, int, int) int
pub fn (this Surface) enable_color_key(key u32) bool {
	rc := C.SDL_SetColorKey(this.ptr, 1, key)
	return rc == 0
}

pub fn (this Surface) disable_color_key(key u32) bool {
	rc := C.SDL_SetColorKey(this.ptr, 0, key)
	return rc == 0
}

fn C.SDL_HasColorKey(&C.SDL_Surface) C.SDL_bool
pub fn (this Surface) has_color_key() bool {
	return C.SDL_HasColorKey(this.ptr) == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_GetColorKey(&C.SDL_Surface, &u32) int
pub fn (this Surface) color_key() u32 {
	key := u32(0)
	unsafe {
		C.SDL_GetColorKey(this.ptr, &key)
	}
	return key
}

fn C.SDL_SetSurfaceColorMod(&C.SDL_Surface, u8, u8, u8) int
pub fn (this Surface) set_color_mod(red u8, green u8, blue u8) bool {
	rc := C.SDL_SetSurfaceColorMod(this.ptr, red, green, blue)
	return rc == 0
}

fn C.SDL_GetSurfaceColorMod(&C.SDL_Surface, &u8, &u8, &u8) int
pub fn (this Surface) color_mod() (int, int, int) {
	red := u8(0)
	green := u8(0)
	blue := u8(0)

	unsafe {
		C.SDL_GetSurfaceColorMod(this.ptr, &red, &green, &blue)
	}
	return red, green, blue
}

fn C.SDL_SetSurfaceAlphaMod(&C.SDL_Surface, u8) int
pub fn (this Surface) set_alpha_mod(alpha u8) bool {
	rc := C.SDL_SetSurfaceAlphaMod(this.ptr, alpha)
	return rc == 0
}

fn C.SDL_GetSurfaceAlphaMod(&C.SDL_Surface, &u8) int
pub fn (this Surface) alpha_mod() u8 {
	alpha := u8(0)
	unsafe {
		C.SDL_GetSurfaceAlphaMod(this.ptr, &alpha)
	}
	return alpha
}

fn C.SDL_SetSurfaceBlendMode(&C.SDL_Surface, C.SDL_BlendMode) int
pub fn (this Surface) set_blend_mod(blend_mode BlendMode) bool {
	rc := C.SDL_SetSurfaceBlendMode(this.ptr, C.SDL_BlendMode(blend_mode))
	return rc == 0
}

fn C.SDL_GetSurfaceBlendMode(&C.SDL_Surface, &C.SDL_BlendMode) int

// TODO:
fn C.SDL_SetClipRect(&C.SDL_Surface, &C.SDL_Rect) C.SDL_bool

fn C.SDL_GetClipRect(&C.SDL_Surface, &C.SDL_Rect)

fn C.SDL_DuplicateSurface(&C.SDL_Surface) &C.SDL_Surface
pub fn (this Surface) duplicate() Surface {
	return Surface{
		ptr: C.SDL_DuplicateSurface(this.ptr)
	}
}

fn C.SDL_ConvertSurface(&C.SDL_Surface, &C.SDL_PixelFormat, flags, u32) &C.SDL_Surface
fn C.SDL_ConvertSurfaceFormat(&C.SDL_Surface, pixel_format, u32, flags, u32) &C.SDL_Surface
fn C.SDL_ConvertPixels(width int, height int, src_format u32, src voidptr, src_pitch int, dst_format u32, dst voidptr, dst_pitch int) int

fn C.SDL_FillRect(&C.SDL_Surface, &C.SDL_Rect, u32) int
fn C.SDL_FillRects(&C.SDL_Surface, &C.SDL_Rect, int, u32) int

pub fn (this Surface) fill_rectangle(rect Rectangle, color Color) {
	mut color32 := u32(0)

	color32 = (u32(color.r) << 16) | (u32(color.g) << 8) | (u32(color.b))
	C.SDL_FillRect(this.ptr, &rect, color32)
}

pub fn (this Surface) fill_rectangles(rect []Rectangle, color Color) {
	mut color32 := u32(0)

	color32 = (u32(color.r) << 16) | (u32(color.g) << 8) | (u32(color.b))
	unsafe {
		C.SDL_FillRects(this.ptr, &C.SDL_Rect(&rect[0]), rect.len, color32)
	}
}

// TODO
// Fix me: Blit not supported.
fn C.SDL_UpperBlit(&C.SDL_Surface, &C.SDL_Rect, &C.SDL_Surface, &C.SDL_Rect) int
fn C.SDL_LowerBlit(&C.SDL_Surface, &C.SDL_Rect, &C.SDL_Surface, &C.SDL_Rect) int
fn C.SDL_SoftStretch(&C.SDL_Surface, &C.SDL_Rect, &C.SDL_Surface, &C.SDL_Rect) int
fn C.SDL_UpperBlitScaled(&C.SDL_Surface, &C.SDL_Rect, &C.SDL_Surface, &C.SDL_Rect) int
fn C.SDL_LowerBlitScaled(&C.SDL_Surface, &C.SDL_Rect, &C.SDL_Surface, &C.SDL_Rect) int
fn C.SDL_SetYUVConversionMode(C.SDL_YUV_CONVERSION_MODE)
fn C.SDL_GetYUVConversionMode() C.SDL_YUV_CONVERSION_MODE
fn C.SDL_GetYUVConversionModeForResolution(int, int) C.SDL_YUV_CONVERSION_MODE
