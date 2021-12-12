// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub struct KeySym { // C.SDL_Keysym
	scancode ScanCode // C.SDL_Scancode (physical key code)
	sym      KeyCode  // C.SDL_Keycode  (virtual  key code)
	mod      u16      // key modifier
	unused   u32
}

fn C.SDL_GetModState() C.SDL_Keymod
pub fn (this KeySym) modifier_state() KeyModifier {
	return KeyModifier(C.SDL_GetModState())
}

fn C.SDL_SetModState(C.SDL_Keymod)
pub fn (this KeySym) set_modifier_state(modifier KeyModifier) {
	C.SDL_SetModState(C.SDL_Keymod(modifier))
}

fn C.SDL_GetKeyFromScancode(C.SDL_Scancode) C.SDL_Keycode
fn C.SDL_GetScancodeFromKey(C.SDL_Keycode) C.SDL_Scancode
fn C.SDL_GetScancodeName(C.SDL_Scancode) &char
fn C.SDL_GetScancodeFromName(&char) C.SDL_Scancode
fn C.SDL_GetKeyName(C.SDL_Keycode) &char
fn C.SDL_GetKeyFromName(&char) C.SDL_Keycode
fn C.SDL_StartTextInput()
fn C.SDL_IsTextInputActive() C.SDL_bool
fn C.SDL_StopTextInput()
fn C.SDL_SetTextInputRect(&C.SDL_Rect)
fn C.SDL_HasScreenKeyboardSupport() &C.SDL_bool
fn C.SDL_IsScreenKeyboardShown(&C.SDL_Window) C.SDL_bool
