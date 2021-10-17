module vdl

fn C.SDL_SetError(&char) int
pub fn set_error(message string) {
	if message.len == 0 {
		return
	}

	C.SDL_SetError(&char(message.str))
}

fn C.SDL_GetError() &char
pub fn get_error() string {
	cstr := C.SDL_GetError()
	return unsafe {cstr.vstring()}
}

fn C.SDL_ClearError()
pub fn clear_erro() {
	C.SDL_ClearError()
}

pub enum ErrorCode {
	out_of_memory = C.SDL_ENOMEM
    error_read    = C.SDL_EFREAD
    error_write   = C.SDL_EFWRITE
    error_seek    = C.SDL_EFSEEK
    unsupported   = C.SDL_UNSUPPORTED
    last_error    = C.SDL_LASTERROR
}

fn C.SDL_Error(int) int
pub fn emit_error(error_code ErrorCode) {
	C.SDL_Error(int(error_code))
}
