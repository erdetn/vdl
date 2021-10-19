module vdl

#include <SDL2/SDL_pixels.h>

pub const alpha_opaque = int(C.SDL_ALPHA_OPAQUE)
pub const alpha_transparent = int(C.SDL_ALPHA_TRANSPARENT)

pub enum PixelType { // SDL_PixelType
    uknown   = C.SDL_PIXELTYPE_UNKNOWN
    index1   = C.SDL_PIXELTYPE_INDEX1
    index4   = C.SDL_PIXELTYPE_INDEX4
    index8   = C.SDL_PIXELTYPE_INDEX8
    packed8  = C.SDL_PIXELTYPE_PACKED8
    packed16 = C.SDL_PIXELTYPE_PACKED16
    packed32 = C.SDL_PIXELTYPE_PACKED32
    arrayu8  = C.SDL_PIXELTYPE_ARRAYU8
    arrayu16 = C.SDL_PIXELTYPE_ARRAYU16
    arrayu32 = C.SDL_PIXELTYPE_ARRAYU32
    arrayf16 = C.SDL_PIXELTYPE_ARRAYF16
    arrayf32 = C.SDL_PIXELTYPE_ARRAYF32
}

pub enum BitmapOrder { // SDL_BitmapOrder
    @none      = C.SDL_BITMAPORDER_NONE
    order_4321 = C.SDL_BITMAPORDER_4321
    order_1234 = C.SDL_BITMAPORDER_1234
}

pub enum PackedOrder { // SDL_PackedOrder
    @none    = C.SDL_PACKEDORDER_NONE
    xrgb     = C.SDL_PACKEDORDER_XRGB
    rgbx     = C.SDL_PACKEDORDER_RGBX
    argb     = C.SDL_PACKEDORDER_ARGB
    rgba     = C.SDL_PACKEDORDER_RGBA
    xbgr     = C.SDL_PACKEDORDER_XBGR
    bgrx     = C.SDL_PACKEDORDER_BGRX
    abgr     = C.SDL_PACKEDORDER_ABGR
    bgra     = C.SDL_PACKEDORDER_BGRA
}

pub enum ArrayOrder { // SDL_ArrayOrder
    @none    = C.SDL_ARRAYORDER_NONE
    rgb      = C.SDL_ARRAYORDER_RGB
    rgba     = C.SDL_ARRAYORDER_RGBA
    argb     = C.SDL_ARRAYORDER_ARGB
    bgr      = C.SDL_ARRAYORDER_BGR
    bgra     = C.SDL_ARRAYORDER_BGRA
    abgr     = C.SDL_ARRAYORDER_ABGR
}

pub enum PackedLayout { // SDL_PackedLayout
    @none           = C.SDL_PACKEDLAYOUT_NONE
    layout_332      = C.SDL_PACKEDLAYOUT_332
    layout_4444     = C.SDL_PACKEDLAYOUT_4444
    layout_1555     = C.SDL_PACKEDLAYOUT_1555
    layout_5551     = C.SDL_PACKEDLAYOUT_5551
    layout_565      = C.SDL_PACKEDLAYOUT_565
    layout_8888     = C.SDL_PACKEDLAYOUT_8888
    layout_2101010  = C.SDL_PACKEDLAYOUT_2101010
    layou_1010102   = C.SDL_PACKEDLAYOUT_1010102
}

pub enum PixelFormatEnum { // SDL_PixelFormatEnum
    unknown     = C.SDL_PIXELFORMAT_UNKNOWN
    index1_lsb  = C.SDL_PIXELFORMAT_INDEX1LSB
    index1_msb  = C.SDL_PIXELFORMAT_INDEX1MSB
    index4_lsb  = C.SDL_PIXELFORMAT_INDEX4LSB
    index4_msb  = C.SDL_PIXELFORMAT_INDEX4MSB
    index8      = C.SDL_PIXELFORMAT_INDEX8
    rgb332      = C.SDL_PIXELFORMAT_RGB332
    rgb444      = C.SDL_PIXELFORMAT_RGB444
    rgb555      = C.SDL_PIXELFORMAT_RGB555
    bgr555      = C.SDL_PIXELFORMAT_BGR555
    argb4444    = C.SDL_PIXELFORMAT_ARGB4444
    rgba4444    = C.SDL_PIXELFORMAT_RGBA4444
    abgr4444    = C.SDL_PIXELFORMAT_ABGR4444
    bgra4444    = C.SDL_PIXELFORMAT_BGRA4444
    argb1555    = C.SDL_PIXELFORMAT_ARGB1555
    rgba5551    = C.SDL_PIXELFORMAT_RGBA5551
    abgr1555    = C.SDL_PIXELFORMAT_ABGR1555
    bgra5551    = C.SDL_PIXELFORMAT_BGRA5551
    rgb565      = C.SDL_PIXELFORMAT_RGB565
    bgr565      = C.SDL_PIXELFORMAT_BGR565
    rb24        = C.SDL_PIXELFORMAT_RGB24
    bgr24       = C.SDL_PIXELFORMAT_BGR24
    rgb888      = C.SDL_PIXELFORMAT_RGB888
    rgbx8888    = C.SDL_PIXELFORMAT_RGBX8888
    bgr888      = C.SDL_PIXELFORMAT_BGR888
    bgrx8888    = C.SDL_PIXELFORMAT_BGRX8888
    argb8888    = C.SDL_PIXELFORMAT_ARGB8888
    rgba8888    = C.SDL_PIXELFORMAT_RGBA8888
    abgr8888    = C.SDL_PIXELFORMAT_ABGR8888
    bgra8888    = C.SDL_PIXELFORMAT_BGRA8888
    argb2101010 = C.SDL_PIXELFORMAT_ARGB2101010

    rgba32 = C.SDL_PIXELFORMAT_RGBA32
    argb32 = C.SDL_PIXELFORMAT_ARGB32
    bgra32 = C.SDL_PIXELFORMAT_BGRA32
    abgr32 = C.SDL_PIXELFORMAT_ABGR32

    yv12 = C.SDL_PIXELFORMAT_YV12
    iyuv = C.SDL_PIXELFORMAT_IYUV
    yuv2 = C.SDL_PIXELFORMAT_YUY2
    uyvy = C.SDL_PIXELFORMAT_UYVY
    yvyu = C.SDL_PIXELFORMAT_YVYU
    nv12 = C.SDL_PIXELFORMAT_NV12
    nv21 = C.SDL_PIXELFORMAT_NV21

    external_oes = C.SDL_PIXELFORMAT_EXTERNAL_OES
}

struct C.SDL_Color {
    r u8
    g u8
    b u8
    a u8
}

pub type Color = C.SDL_Color

struct C.SDL_Palette {
    ncolors  int
    colors   &C.SDL_Color
    version  u32
    refcount int
}

pub struct Palette { 
	ptr &C.SDL_Palette
}

struct C.SDL_PixelFormat {
	// Everything in the pixel format structure is read-only.
    format  u32
    palette &C.SDL_Palette
    bits_per_pixel u8
    bytes_per_pixel u8
    padding [2]u8
    red_mask u32
    green_mask u32
    blue_mask u32
    alpha_mask u32
    red_loss u8
    green_loss u8
    blue_loss u8
    alpha_loss u8
    red_shift u8
    green_shift u8
    blue_shift u8
    alpha_shift u8
    refcount int
    next &C.SDL_PixelFormat
}

pub struct PixelFormat {
	ptr &C.SDL_PixelFormat
} 

fn C.SDL_GetPixelFormatName(u32) &char
pub fn get_pixel_format_name(format u32) string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetPixelFormatName(format))
	}
}

fn C.SDL_PixelFormatEnumToMasks(u32, &int, &u32, &u32, &u32, &u32) C.SDL_bool
pub fn pixelformat_to_masks(format u32) (bool, int, u32, u32, u32, u32){
	bits_per_pixel := int(0)
	red_mask := u32(0)
	green_mask := u32(0)
	blue_mask := u32(0)
	alpha_mask := u32(0)

	rc := unsafe {
		C.SDL_PixelFormatEnumToMasks(format,
			&bits_per_pixel,
			&red_mask, &green_mask, &blue_mask, &alpha_mask)
	}

	if rc != C.SDL_bool(C.SDL_TRUE) {
		return false, int(0), u32(0), u32(0), u32(0), u32(0)
	} 

	return true, bits_per_pixel, red_mask, green_mask, blue_mask, alpha_mask
}

fn C.SDL_MasksToPixelFormatEnum(int, u32, u32, u32, u32) u32
pub fn masks_to_pixelformat(bits_per_pixel int, 
                            red_mask u32, green_mask u32, blue_mask u32,
                            alpha_mask u32) u32 {
	return C.SDL_MasksToPixelFormatEnum(bits_per_pixel, red_mask, green_mask, blue_mask, alpha_mask)
}


fn C.SDL_AllocFormat(u32) &C.SDL_PixelFormat
pub fn new_pixel_format(pixel_format u32) PixelFormat {
	return PixelFormat {
		ptr: C.SDL_AllocFormat(pixel_format)
	}
}

fn C.SDL_FreeFormat(&C.SDL_PixelFormat)
pub fn (mut this PixelFormat)free() {
	C.SDL_FreeFormat(this.ptr)
}

fn C.SDL_AllocPalette(int) &C.SDL_Palette
pub fn new_palette(num_colors int) Palette {
	return Palette {
		ptr: C.SDL_AllocPalette(num_colors)
	}
}

fn C.SDL_SetPixelFormatPalette(&C.SDL_PixelFormat, &C.SDL_Palette) int
pub fn (this PixelFormat)set_palette(palette Palette) bool {
	rc := C.SDL_SetPixelFormatPalette(this.ptr, palette.ptr)

	return rc == int(0)
}

fn C.SDL_SetPaletteColors(&C.SDL_Palette, &C.SDL_Color, int, int) int
pub fn (this Palette)set_colors(colors []Color, first_color int) bool {
	if colors.len == 0 {
		return false
	}

	rc := unsafe {
		C.SDL_SetPaletteColors(this.ptr, &colors[0], first_color, colors.len)
	}

	return rc == 0
}

fn C.SDL_FreePalette(&C.SDL_Palette)
pub fn (mut this Palette)free() {
	C.SDL_FreePalette(this.ptr)
}

fn C.SDL_MapRGB(&C.SDL_PixelFormat, u8, u8, u8) u32
pub fn (this PixelFormat)map_rgb(red u8, green u8, blue u8) u32 {
	return C.SDL_MapRGB(this.ptr, red, green, blue)
}

fn C.SDL_MapRGBA(&C.SDL_PixelFormat, u8, u8, u8, u8) u32
pub fn (this PixelFormat)map_rgba(red u8, green u8, blue u8, alpha u8) u32 {
	return C.SDL_MapRGBA(this.ptr, red, green, blue, alpha)
}

fn C.SDL_GetRGB(u32, &C.SDL_PixelFormat, &u8, &u8, &u8)
pub fn (this PixelFormat)rgb(pixel u32) (u8, u8, u8) {
	red := u8(0)
	green := u8(0)
	blue := u8(0)

	unsafe {
		C.SDL_GetRGB(pixel, this.ptr, &red, &green, &blue)
	}

	return red, green, blue
}							

fn C.SDL_GetRGBA(u32, &C.SDL_PixelFormat, &u8, &u8, &u8, &u8)
pub fn (this PixelFormat)rgba(pixel u32) (u8, u8, u8, u8) {
	red := u8(0)
	green := u8(0)
	blue := u8(0)
	alpha := u8(0)

	unsafe {
		C.SDL_GetRGBA(pixel, this.ptr, &red, &green, &blue, &alpha)
	}

	return red, green, blue, alpha
}

fn C.SDL_CalculateGammaRamp(f64, &u16)
pub fn calculate_gamma_ramp(gamma f64) u16 {
	ramp := u16(0)
	unsafe {
		C.SDL_CalculateGammaRamp(gamma, &ramp)
	}
	return ramp
}