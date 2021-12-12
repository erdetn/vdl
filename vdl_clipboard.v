// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl


fn C.SDL_SetClipboardText(&char) int
pub fn set_clipboard_text(text string) u32 {
	rc := unsafe {
		C.SDL_SetClipboardText(&char(text.str))
	}
	return u32(rc)
}

fn C.SDL_GetClipboardText() &char
pub fn get_clipboard_text() string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetClipboardText())
	}
}

fn C.SDL_HasClipboardText() C.SDL_bool
pub fn has_clipboard_text() bool {
	rc := C.SDL_HasClipboardText()
	return rc == C.SDL_bool(C.SDL_TRUE)
}
