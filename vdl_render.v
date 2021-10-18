module vdl

pub enum RendererFlags { // SDL_RendererFlags
    software       = C.SDL_RENDERER_SOFTWARE      
    accelerated    = C.SDL_RENDERER_ACCELERATED   
    present_vsync  = C.SDL_RENDERER_PRESENTVSYNC  
    target_texture = C.SDL_RENDERER_TARGETTEXTURE 
}

struct C.SDL_RendererInfo {
    name   &char                  // The name of the renderer
    flags  u32                    // Supported ::SDL_RendererFlags
    num_texture_formats u32       // The number of available texture formats
    texture_formats [16]u32       // The available texture formats
    max_texture_width int         // The maximum texture width
    max_texture_height int        // The maximum texture height
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
    @static    = C.SDL_TEXTUREACCESS_STATIC
    streaming = C.SDL_TEXTUREACCESS_STREAMING
    target    = C.SDL_TEXTUREACCESS_TARGET
}

pub enum TextureModulate { // SDL_TextureModulate
    @none    = C.SDL_TEXTUREMODULATE_NONE
    color    = C.SDL_TEXTUREMODULATE_COLOR
    alpha    = C.SDL_TEXTUREMODULATE_ALPHA
}

pub enum RendererFlip { // SDL_RendererFlip
    @none      = C.SDL_FLIP_NONE
    horizontal = C.SDL_FLIP_HORIZONTAL
    vertical   = C.SDL_FLIP_VERTICAL
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
pub fn (this Window)create_renderer(index int, flags RendererFlags) Renderer {
    ret := Renderer {
        ptr: C.SDL_CreateRenderer(this.ptr, index, u32(flags))
    }
    return ret
}

fn C.SDL_CreateSoftwareRenderer(&C.SDL_Surface) &C.SDL_Renderer
pub fn (this Surface)create_software_renderer() Renderer {
    return Renderer {
        ptr: C.SDL_CreateSoftwareRenderer(this.ptr)
    }
}

fn C.SDL_GetRenderer(&C.SDL_Window) &C.SDL_Renderer
pub fn (this Window)renderer() Renderer {
    return Renderer {
        ptr: C.SDL_GetRenderer(this.ptr)
    }
}

fn C.SDL_GetRendererInfo(&C.SDL_Renderer, &C.SDL_RendererInfo) int
pub fn (this Renderer)info() RendererInfo {
    ret := RendererInfo{
        ptr: &C.SDL_RendererInfo(voidptr(0))
    }
    unsafe {
        C.SDL_GetRendererInfo(this.ptr, ret.ptr)
    }
    return ret
}

fn C.SDL_GetRendererOutputSize(&C.SDL_Renderer, &int, &int) int
pub fn (this Renderer)output_size() (int, int) {
    width := int(0)
    height := int(0)

    unsafe {
        C.SDL_GetRendererOutputSize(this.ptr, &width, &height)
    }
    return width, height
}        

fn C.SDL_CreateTexture(&C.SDL_Renderer, u32, int, int, int) &C.SDL_Texture
pub fn (this Renderer)create_texture(format PixelFormatEnum, access TextureAccess, width int, height int) Texture{
    return Texture {
        ptr: C.SDL_CreateTexture(this.ptr, u32(format), int(access), width, height)
    }
}
