// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

#define SDL_IMAGE_MAJOR_VERSION 2
#define SDL_IMAGE_MINOR_VERSION 0
#define SDL_IMAGE_PATCHLEVEL    5

pub enum ImageInitFlag {
	jpg = C.IMG_INIT_JPG
	png = C.IMG_INIT_PNG
	tif = C.IMG_INIT_TIF
	webp = C.IMG_INIT_WEBP
}

fn C.IMG_Init(flags int) int
pub fn load_image_module(flags ImageInitFlag) bool {
	rc := C.IMG_Init(int(flags))
	return rc != 0
}

fn C.IMG_Quit()
pub fn unload_image_module() {
	C.IMG_Quit()
}

pub enum ImageType {
	bmp
	cur
	gif
	ico
	jpg
	lbm
	pcx
	png
	pnm
	tga
	tif
	xcf
	xpm
	xv
}

fn get_image_type_string(image_type ImageType) string {
	return match image_type {
		.bmp { 'BMP' }
		.cur { 'CUR' }
		.gif { 'GIF' }
		.ico { 'ICO' }
		.jpg { 'JPG' }
		.lbm { 'LBM' }
		.pcx { 'PCX' }
		.png { 'PNG' }
		.pnm { 'PNM' }
		.tga { 'TGA' }
		.tif { 'TIF' }
		.xcf { 'XCF' }
		.xpm { 'XPM' }
		.xv { 'XV' }
	}
}

fn C.IMG_LoadTyped_RW(&C.SDL_RWops, int, &char) &C.SDL_Surface
pub fn (this StreamIO) load_image_type(image_type ImageType) ?Surface {
	unsafe {
		mode := &char(get_image_type_string(image_type).str)
		sptr := C.IMG_LoadTyped_RW(this.ptr, 0, mode)
		if sptr == voidptr(0) {
			return error('Failed to load image.')
		}
	}
	return Surface{
		ptr: sptr
	}
}

fn C.IMG_Load(&char) &C.SDL_Surface
pub fn load_image(filename string) ?Surface {
	unsafe {
		sptr := C.IMG_Load(&char(filename.str))
		if sptr == voidptr(0) {
			return error('Failed to load image.')
		}
	}
	return Surface{
		ptr: sptr
	}
}

fn C.IMG_Load_RW(&C.SDL_RWops, int) &C.SDL_Surface
pub fn (this StreamIO) load_image() ?Surface {
	unsafe {
		sptr := C.IMG_Load_RW(this.ptr, 0)
		if sptr == voidptr(0) {
			return error('Failed to load image.')
		}
	}
	return Surface{
		ptr: sptr
	}
}

/*
Load an image directly into a render texture.
*/
fn C.IMG_LoadTexture(&C.SDL_Renderer, &char) &C.SDL_Texture
fn C.IMG_LoadTexture_RW(&C.SDL_Renderer, &C.SDL_RWops, int) &C.SDL_Texture
fn C.IMG_LoadTextureTyped_RW(&C.SDL_Renderer, &C.SDL_RWops, int, &char) &C.SDL_Texture

// Functions to detect a file type, given a seekable source
fn C.IMG_isICO(&C.SDLRWops) int
pub fn (this StreamIO) is_ico() bool {
	return C.IMG_isICO(this.ptr) == 1
}

fn C.IMG_isCUR(&C.SDLRWops) int
pub fn (this StreamIO) is_cur() bool {
	return C.IMG_isCUR(this.ptr) == 1
}

fn C.IMG_isBMP(&C.SDLRWops) int
pub fn (this StreamIO) is_bmp() bool {
	return C.IMG_isBMP(this.ptr) == 1
}

fn C.IMG_isGIF(&C.SDLRWops) int
pub fn (this StreamIO) is_gif() bool {
	return C.IMG_isGIF(this.ptr) == 1
}

fn C.IMG_isJPG(&C.SDLRWops) int
pub fn (this StreamIO) is_jpg() bool {
	return C.IMG_isJPG(this.ptr) == 1
}

fn C.IMG_isLBM(&C.SDLRWops) int
pub fn (this StreamIO) is_lbm() bool {
	return C.IMG_isLBM(this.ptr) == 1
}

fn C.IMG_isPCX(&C.SDLRWops) int
fn C.IMG_isPNG(&C.SDLRWops) int
fn C.IMG_isPNM(&C.SDLRWops) int
fn C.IMG_isSVG(&C.SDLRWops) int
fn C.IMG_isTIF(&C.SDLRWops) int
fn C.IMG_isXCF(&C.SDLRWops) int
fn C.IMG_isXPM(&C.SDLRWops) int
fn C.IMG_isXV(&C.SDLRWops) int
fn C.IMG_isWEBP(&C.SDLRWops) int

// Individual loading functions
fn C.IMG_LoadICO_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadCUR_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadBMP_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadGIF_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadJPG_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadLBM_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadPCX_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadPNG_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadPNM_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadSVG_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadTGA_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadTIF_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadXCF_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadXPM_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadXV_RW(&C.SDLRWops) &C.SDL_Surface
fn C.IMG_LoadWEBP_RW(&C.SDLRWops) &C.SDL_Surface

// Individual saving functions
fn C.IMG_SavePNG(&C.SDL_Surface, &char)
fn C.IMG_SavePNG_RW(&C.SDL_Surface, &C.SDL_RWops, int)
fn C.IMG_SaveJPG(&C.SDL_Surface, &char, int)
fn C.IMG_SaveJPG_RW(&C.SDL_Surface, &C.SDL_RWops, int, int)
