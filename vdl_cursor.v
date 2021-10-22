module vdl


struct C.SDL_Cursor{}
pub struct Cursor {
    ptr &C.SDL_Cursor
}

pub enum SystemCursor { // C.SDL_SystemCursor
    arrow = C.SDL_SYSTEM_CURSOR_ARROW
    ibeam = C.SDL_SYSTEM_CURSOR_IBEAM
    wait  = C.SDL_SYSTEM_CURSOR_WAIT
    cross_hair = C.SDL_SYSTEM_CURSOR_CROSSHAIR
    wait_arrow = C.SDL_SYSTEM_CURSOR_WAITARROW
    
	size_en_se = C.SDL_SYSTEM_CURSOR_SIZENWSE // Double arrow pointing northwest and southeast //
    size_ne_sw = C.SDL_SYSTEM_CURSOR_SIZENESW // Double arrow pointing northeast and southwest //
    size_we    = C.SDL_SYSTEM_CURSOR_SIZEWE   // Double arrow pointing west and east           //
    size_ns    = C.SDL_SYSTEM_CURSOR_SIZENS   // Double arrow pointing north and south         //
    size_all   = C.SDL_SYSTEM_CURSOR_SIZEALL
    
	crossbones = C.SDL_SYSTEM_CURSOR_NO
    hand       = C.SDL_SYSTEM_CURSOR_HAND
    
	num_cursoes = C.SDL_NUM_SYSTEM_CURSORS
}

pub enum MouseWheelDirection { // C.SDL_MouseWheelDirection
    normal  = C.SDL_MOUSEWHEEL_NORMAL
    flipped = C.SDL_MOUSEWHEEL_FLIPPED
}

fn C.SDL_GetMouseFocus() &C.SDL_Window

fn C.SDL_GetMouseState(&int, &int) u32

fn C.SDL_GetGlobalMouseState(&int, &int) u32

fn C.SDL_GetRelativeMouseState(&int, &int) u32

fn C.SDL_WarpMouseInWindow(&C.SDL_Window, int, int)

fn C.SDL_WarpMouseGlobal(int, int) int

fn C.SDL_SetRelativeMouseMode(C.SDL_bool) int

fn C.SDL_CaptureMouse(C.SDL_bool) int

fn C.SDL_GetRelativeMouseMode() C.SDL_bool

fn C.SDL_CreateCursor(&u8, &u8, int, int, int, int) &C.SDL_Cursor

fn C.SDL_CreateColorCursor(&C.SDL_Surface, int, int) &C.SDL_Cursor

fn C.SDL_CreateSystemCursor(C.SDL_SystemCursor) &C.SDL_Cursor

fn C.SDL_SetCursor(&C.SDL_Cursor)

fn C.SDL_GetCursor() &C.SDL_Cursor

fn C.SDL_GetDefaultCursor() &C.SDL_Cursor

fn C.SDL_FreeCursor(&C.SDL_Cursor)

// toggle: 1 show it / 0 hide it
// return: 1 if cursor is shown, or 0 if cursor is hidden
fn C.SDL_ShowCursor(int) int

pub enum MouseVisibility {
    hidden = 0
    shown  = 1
}

// Button 1:  Left mouse button
// Button 2:  Middle mouse button
// Button 3:  Right mouse button
 pub enum MouseButtonState {
    left   = C.SDL_BUTTON_LEFT     // 1
    middle = C.SDL_BUTTON_MIDDLE   // 2
    right  = C.SDL_BUTTON_RIGHT    // 3
    x1     = C.SDL_BUTTON_X1       // 4
    x2     = C.SDL_BUTTON_X2       // 5
    
    left_mask   = C.SDL_BUTTON_LMASK
    middle_mask = C.SDL_BUTTON_MMASK
    right_maks  = C.SDL_BUTTON_RMASK

    x1_mask = C.SDL_BUTTON_X1MASK
    x2_mask = C.SDL_BUTTON_X2MASK
}
