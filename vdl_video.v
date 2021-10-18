module vdl

#include <stdio.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_video.h>

#flag -I /usr/include
#flag -I /usr/include/
#flag -I /usr/include/SDL2

#flag -lSDL2

struct C.SDL_DisplayMode {
	format u32
	w      int
	h      int
	refresh_rate int
	driverdata voidptr
}

pub struct DisplayMode {
	ptr &C.SDL_DisplayMode
}

struct C.SDL_Window {}

pub struct Window {
	ptr &C.SDL_Window
}

const null_window = Window{voidptr(0)}

fn C.SDL_CreateWindow(&char, int, int ,int , int u32) &C.SDL_Window
pub fn new_window(title string, x int, y int, width int, height int, flags WindowFlags) Window {
	return Window {
		C.SDL_CreateWindow(
			&char(title.str),
			x, y, width, height,
			flags.value()
		)
	}
}

fn C.SDL_GetWindowDisplayIndex(&C.SDL_Window) int
pub fn (this Window) display_index() int {
	return C.SDL_GetWindowDisplayIndex(this.ptr)
}

fn C.SDL_SetWindowDisplayMode(&C.SDL_Window, &C.SDL_DisplayMode) int
pub fn (this Window)set_display_mode(display_mode DisplayMode) {
	unsafe {
		C.SDL_SetWindowDisplayMode(this.ptr, display_mode.ptr)
	}
}

fn C.SDL_GetWindowDisplayMode(&C.SDL_Window, &C.SDL_DisplayMode) int
pub fn (this Window)display_mode() DisplayMode {
	tmp := DisplayMode{
			ptr: &C.SDL_DisplayMode(voidptr(0))
	}

	unsafe { C.SDL_SetWindowDisplayMode(this.ptr, tmp.ptr) }
	return tmp
}

fn C.SDL_GetWindowPixelFormat(&C.SDL_Window) u32 
pub fn (this Window)pixel_format() u32 {
	return C.SDL_GetWindowPixelFormat(this.ptr)
}


[flag]
pub enum WindowFlags {
	@none
    fullscreen
    opengl
    shown
    hidden
    borderless
    resizable
    minimized
    maximized
    mouse_grabbed
    input_focus
    mouse_focus
    fullscreen_desktop
    foreign
    allow_highdpi
	mouse_capture
    always_on_top
    skip_taskbar
    utility
    tooltip
    popup_menu
    keyboard_grabbed
    vulkan
    metal
    input_grabbed
}

pub fn (mut this WindowFlags)parse(value u32) {
	mut ret := WindowFlags.@none

	if value & u32(C.SDL_WINDOW_FULLSCREEN) == u32(C.SDL_WINDOW_FULLSCREEN) {
		ret = ret | WindowFlags.fullscreen
	}

	if value & u32(C.SDL_WINDOW_OPENGL) == u32(C.SDL_WINDOW_OPENGL) {
		ret = ret | WindowFlags.opengl
	}

	if value & u32(C.SDL_WINDOW_SHOWN) == u32(C.SDL_WINDOW_SHOWN) {
		ret = ret | WindowFlags.shown
	}

	if value & u32(C.SDL_WINDOW_HIDDEN) == u32(C.SDL_WINDOW_HIDDEN) {
		ret = ret | WindowFlags.hidden
	}

	if value & u32(C.SDL_WINDOW_BORDERLESS) == u32(C.SDL_WINDOW_BORDERLESS) {
		ret = ret | WindowFlags.borderless
	}

	if value & u32(C.SDL_WINDOW_RESIZABLE) == u32(C.SDL_WINDOW_RESIZABLE) {
		ret = ret | WindowFlags.resizable
	}

	if value & u32(C.SDL_WINDOW_MINIMIZED) == u32(C.SDL_WINDOW_MINIMIZED) {
		ret = ret | WindowFlags.minimized
	}

	if value & u32(C.SDL_WINDOW_MAXIMIZED) == u32(C.SDL_WINDOW_MAXIMIZED) {
		ret = ret | WindowFlags.maximized
	}

	if value & u32(C.SDL_WINDOW_INPUT_FOCUS) == u32(C.SDL_WINDOW_INPUT_FOCUS) {
		ret = ret | WindowFlags.input_focus
	}

	if value & u32(C.SDL_WINDOW_MOUSE_FOCUS) == u32(C.SDL_WINDOW_MOUSE_FOCUS) {
		ret = ret | WindowFlags.mouse_focus
	}

	if value & u32(C.SDL_WINDOW_FULLSCREEN_DESKTOP) == u32(C.SDL_WINDOW_FULLSCREEN_DESKTOP) {
		ret = ret | WindowFlags.fullscreen_desktop
	}

	if value & u32(C.SDL_WINDOW_FOREIGN) == u32(C.SDL_WINDOW_FOREIGN) {
		ret = ret | WindowFlags.foreign
	}

	if value & u32(C.SDL_WINDOW_ALLOW_HIGHDPI) == u32(C.SDL_WINDOW_ALLOW_HIGHDPI) {
		ret = ret | WindowFlags.allow_highdpi
	}

	if value & u32(C.SDL_WINDOW_MOUSE_CAPTURE) == u32(C.SDL_WINDOW_MOUSE_CAPTURE) {
		ret = ret | WindowFlags.mouse_capture
	}

	if value & u32(C.SDL_WINDOW_ALWAYS_ON_TOP) == u32(C.SDL_WINDOW_ALWAYS_ON_TOP) {
		ret = ret | WindowFlags.always_on_top
	}

	if value & u32(C.SDL_WINDOW_SKIP_TASKBAR) == u32(C.SDL_WINDOW_SKIP_TASKBAR) {
		ret = ret | WindowFlags.skip_taskbar
	}

	if value & u32(C.SDL_WINDOW_UTILITY) == u32(C.SDL_WINDOW_UTILITY) {
		ret = ret | WindowFlags.utility
	}

	if value & u32(C.SDL_WINDOW_TOOLTIP) == u32(C.SDL_WINDOW_TOOLTIP) {
		ret = ret | WindowFlags.tooltip
	}

	if value & u32(C.SDL_WINDOW_POPUP_MENU) == u32(C.SDL_WINDOW_POPUP_MENU) {
		ret = ret | WindowFlags.popup_menu
	}

	if value & u32(C.SDL_WINDOW_KEYBOARD_GRABBED) == u32(C.SDL_WINDOW_KEYBOARD_GRABBED) {
		ret = ret | WindowFlags.keyboard_grabbed
	}

	if value & u32(C.SDL_WINDOW_VULKAN) == u32(C.SDL_WINDOW_VULKAN) {
		ret = ret | WindowFlags.vulkan
	}

	if value & u32(C.SDL_WINDOW_METAL) == u32(C.SDL_WINDOW_METAL) {
		ret = ret | WindowFlags.metal
	}

	if value & u32(C.SDL_WINDOW_INPUT_GRABBED) == u32(C.SDL_WINDOW_INPUT_GRABBED) {
		ret = ret | WindowFlags.input_grabbed
	}

	this = ret
}

pub fn (this WindowFlags)value() u32 {
	mut ret := u32(0)

	if this.has(.fullscreen) { ret |= u32(C.SDL_WINDOW_FULLSCREEN) }
	if this.has(.opengl) { ret |= u32(C.SDL_WINDOW_OPENGL) }
	if this.has(.shown) { ret |= u32(C.SDL_WINDOW_SHOWN) }
	if this.has(.hidden) { ret |= u32(C.SDL_WINDOW_HIDDEN) }
	if this.has(.borderless){ ret |= u32(C.SDL_WINDOW_BORDERLESS) }
	if this.has(.resizable){ ret |= u32(C.SDL_WINDOW_RESIZABLE) }
	if this.has(.minimized){ ret |= u32(C.SDL_WINDOW_MINIMIZED) }
	if this.has(.maximized){ ret |= u32(C.SDL_WINDOW_MAXIMIZED) }
	if this.has(.input_focus){ ret |= u32(C.SDL_WINDOW_INPUT_FOCUS) }
	if this.has(.mouse_focus){ ret |= u32(C.SDL_WINDOW_MOUSE_FOCUS) }
	if this.has(.fullscreen_desktop) { ret |= u32(C.SDL_WINDOW_FULLSCREEN_DESKTOP) }
	if this.has(.foreign) { ret |= u32(C.SDL_WINDOW_FOREIGN) }
	if this.has(.allow_highdpi) { ret |= u32(C.SDL_WINDOW_ALLOW_HIGHDPI) }
	if this.has(.mouse_capture) { ret |= u32(C.SDL_WINDOW_MOUSE_CAPTURE) }
	if this.has(.always_on_top) { ret |= u32(C.SDL_WINDOW_ALWAYS_ON_TOP) }
	if this.has(.skip_taskbar)  { ret |= u32(C.SDL_WINDOW_SKIP_TASKBAR) }
	if this.has(.utility) { ret |= u32(C.SDL_WINDOW_UTILITY) }
	if this.has(.tooltip) { ret |= u32(C.SDL_WINDOW_TOOLTIP) }
	if this.has(.popup_menu) { ret |= u32(C.SDL_WINDOW_POPUP_MENU) }
	if this.has(.keyboard_grabbed) { ret |= u32(C.SDL_WINDOW_KEYBOARD_GRABBED) }
	if this.has(.vulkan) { ret |= u32(C.SDL_WINDOW_VULKAN) }
	if this.has(.metal) { ret |= u32(C.SDL_WINDOW_METAL) }
	if this.has(.input_grabbed) { ret |= u32(C.SDL_WINDOW_INPUT_GRABBED) }

	return ret
}

pub enum WindowEventId {
	@none         = C.SDL_WINDOWEVENT_NONE
	shown         = C.SDL_WINDOWEVENT_SHOWN
	hidden        = C.SDL_WINDOWEVENT_HIDDEN
	exposed       = C.SDL_WINDOWEVENT_EXPOSED
	moved         = C.SDL_WINDOWEVENT_MOVED
	resized       = C.SDL_WINDOWEVENT_RESIZED
	size_changed  = C.SDL_WINDOWEVENT_SIZE_CHANGED
	minimzed      = C.SDL_WINDOWEVENT_MINIMIZED
	maximized     = C.SDL_WINDOWEVENT_MAXIMIZED
	restored      = C.SDL_WINDOWEVENT_RESTORED
	enter         = C.SDL_WINDOWEVENT_ENTER
	leave         = C.SDL_WINDOWEVENT_LEAVE
	focus_gained  = C.SDL_WINDOWEVENT_FOCUS_GAINED
	focus_lost    = C.SDL_WINDOWEVENT_FOCUS_LOST
	close         = C.SDL_WINDOWEVENT_CLOSE
	take_focus    = C.SDL_WINDOWEVENT_TAKE_FOCUS
	hit_test      = C.SDL_WINDOWEVENT_HIT_TEST
}

pub fn (this WindowEventId)value() u32 {
	return u32(this)
}

pub fn (this WindowEventId)parse(value u32) WindowEventId{
	return WindowEventId(value)
}

pub enum DisplayEventId {
	@none           = C.SDL_DISPLAYEVENT_NONE
	orientation     = C.SDL_DISPLAYEVENT_ORIENTATION
}

pub fn (this DisplayEventId)value() u32 {
	return u32(this)
}

pub fn (mut this DisplayEventId)parse(value u32) {
	this = DisplayEventId(value)
}

pub enum DisplayOrientation {
	uknown            = C.SDL_ORIENTATION_UNKNOWN
	landscape         = C.SDL_ORIENTATION_LANDSCAPE
	landscape_flipped = C.SDL_ORIENTATION_LANDSCAPE_FLIPPED
	portrait          = C.SDL_ORIENTATION_PORTRAIT
	portrait_flipped  = C.SDL_ORIENTATION_PORTRAIT_FLIPPED
}

pub enum GlConfigAttributes {
    red_size                   = C.SDL_GL_RED_SIZE
    green_size                 = C.SDL_GL_GREEN_SIZE
    blue_size                  = C.SDL_GL_BLUE_SIZE
    alpha_size                 = C.SDL_GL_ALPHA_SIZE
    buffer_size                = C.SDL_GL_BUFFER_SIZE
    double_buffer              = C.SDL_GL_DOUBLEBUFFER
    depth_size                 = C.SDL_GL_DEPTH_SIZE
    stencil_size               = C.SDL_GL_STENCIL_SIZE
    accum_red_size             = C.SDL_GL_ACCUM_RED_SIZE
    accum_green_size           = C.SDL_GL_ACCUM_GREEN_SIZE
    accum_blue_size            = C.SDL_GL_ACCUM_BLUE_SIZE
    accum_alpha_size           = C.SDL_GL_ACCUM_ALPHA_SIZE
    stereo                     = C.SDL_GL_STEREO
    multisample_buffers        = C.SDL_GL_MULTISAMPLEBUFFERS
    multisample_samples        = C.SDL_GL_MULTISAMPLESAMPLES
    accelerated_visual         = C.SDL_GL_ACCELERATED_VISUAL
    retained_backing           = C.SDL_GL_RETAINED_BACKING
    major_version              = C.SDL_GL_CONTEXT_MAJOR_VERSION
    minor_version              = C.SDL_GL_CONTEXT_MINOR_VERSION
    egl                        = C.SDL_GL_CONTEXT_EGL
    context_flags              = C.SDL_GL_CONTEXT_FLAGS
    profile_mask               = C.SDL_GL_CONTEXT_PROFILE_MASK
    share_with_current_contaxt = C.SDL_GL_SHARE_WITH_CURRENT_CONTEXT
    framebuffer_srgb_capable   = C.SDL_GL_FRAMEBUFFER_SRGB_CAPABLE
    release_behaviour          = C.SDL_GL_CONTEXT_RELEASE_BEHAVIOR
    reset_notification         = C.SDL_GL_CONTEXT_RESET_NOTIFICATION
    no_error                   = C.SDL_GL_CONTEXT_NO_ERROR
}

pub enum GlProfile {
    core          = C.SDL_GL_CONTEXT_PROFILE_CORE          // 0x0001
    compatibility = C.SDL_GL_CONTEXT_PROFILE_COMPATIBILITY // 0x0002
    profile_es    = C.SDL_GL_CONTEXT_PROFILE_ES            // 0x0004
}

pub enum GlContextFlag {
    debug_flag             = C.SDL_GL_CONTEXT_DEBUG_FLAG              // 0x0001
    fordward_compatible    = C.SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG // 0x0002
    robust_access          = C.SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      // 0x0004
    reset_isolation        = C.SDL_GL_CONTEXT_RESET_ISOLATION_FLAG    // 0x0008
}

pub enum GlContextRelease {
    behaviour_none   = C.SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE   // 0x0000
    behaviour_flush  = C.SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH  // 0x0001
}

pub enum GlContextResetNotification {
    no_notification = C.SDL_GL_CONTEXT_RESET_NO_NOTIFICATION // 0x0000
    lose_context    = C.SDL_GL_CONTEXT_RESET_LOSE_CONTEXT    // 0x0001
}

/// Video subsystem begins ///

fn C.SDL_VideoInit(&char) int
pub fn video_init(driver_name string) bool {
	rc := C.SDL_VideoInit(&char(driver_name.str))
	return rc == 0
}

fn C.SDL_VideoQuit()
pub fn video_quit(){
	C.SDL_VideoQuit()
}

fn C.SDL_GetNumVideoDrivers() int
pub fn get_num_of_video_drivers() int {
	return C.SDL_GetNumVideoDrivers()
}

fn C.SDL_GetVideoDriver(int) &char
pub fn get_name_of_video_driver(index int) string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetVideoDriver(index))
	}
}

fn C.SDL_GetCurrentVideoDriver() &char
pub fn get_current_video_driver() string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetCurrentVideoDriver())
	}
}

fn C.SDL_GetNumVideoDisplays() int
pub fn get_num_of_video_devices() int {
	return C.SDL_GetNumVideoDisplays()
}

fn C.SDL_GetDisplayName(int) &char
pub fn get_display_name(display_index int) string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetDisplayName(display_index))
	}
}

fn C.SDL_GetDisplayBounds(int, &C.SDL_Rect) int
pub fn get_display_bounds(display_index int) Rectangle {
	ret := new_rectangle(0, 0, 0, 0)

	unsafe {
		C.SDL_GetDisplayBounds(display_index, &ret)
	}

	return ret
}

fn C.SDL_GetDisplayUsableBounds(int, &C.SDL_Rect)
pub fn get_display_usable_bounds(display_index int) Rectangle {
	ret := new_rectangle(0, 0, 0, 0)

	unsafe {
		C.SDL_GetDisplayUsableBounds(display_index, &ret)
	}

	return ret
}

pub struct DisplayDPI {
	diagonal_dpi   f64
	horizontal_dpi f64
	vertical_dpi   f64
}

fn C.SDL_GetDisplayDPI(int, &f64, &f64, &f64) int
pub fn get_display_dpi(display_index int) DisplayDPI {
	ddpi := f64(0)
	hdpi := f64(0)
	vdpi := f64(0)

	unsafe {
		C.SDL_GetDisplayDPI(display_index, &ddpi, &hdpi, &vdpi)
	}

	return DisplayDPI{
		ddpi, hdpi, vdpi
	}
}

fn C.SDL_GetDisplayOrientation(int)int
pub fn get_display_orientation(display_index int) DisplayOrientation {
	rc := C.SDL_GetDisplayOrientation(display_index)

	return DisplayOrientation(rc)
}

fn C.SDL_GetNumDisplayModes(int)int
pub fn get_num_display_mode(display_index int) int {
	return C.SDL_GetNumDisplayModes(display_index)
}

fn C. SDL_GetDisplayMode(int, int, &C.SDL_DisplayMode) int
pub fn get_display_mode(display_index int, mode_index int) ?DisplayMode {
	tmp := DisplayMode {
		ptr: &C.SDL_DisplayMode(voidptr(0))
	}

	rc := unsafe {
		C.SDL_GetDisplayMode(display_index, mode_index, tmp.ptr)
	}

	if rc != 0 {
		return error('Failed to get display mode.')
	}
	return tmp
}

fn C.SDL_GetDesktopDisplayMode(int, &C.SDL_DisplayMode) int
pub fn get_desktop_display_mode(display_index int) ?DisplayMode {
	tmp := DisplayMode {
		ptr: &C.SDL_DisplayMode(voidptr(0))
	}

	rc := unsafe {
		C.SDL_GetDesktopDisplayMode(display_index, tmp.ptr)
	}

	if rc != 0 {
		return error('Failed to get desktop display mode.')
	}
	return tmp
}

fn C.SDL_GetCurrentDisplayMode(int, &C.SDL_DisplayMode) int
pub fn get_current_display_mode(display_index int) ?DisplayMode {
	tmp := DisplayMode {
		ptr: &C.SDL_DisplayMode(voidptr(0))
	}

	rc := unsafe {
		C.SDL_GetCurrentDisplayMode(display_index, tmp.ptr)
	}

	if rc != 0 {
		return error('Failed to get desktop display mode.')
	}
	return tmp
}

fn C.SDL_GetClosestDisplayMode(int, &DisplayMode, &DisplayMode) &DisplayMode
// TODO: get_closest_display_mode

/// Video subsystem ends ///


fn C.SDL_CreateWindowFrom(voidptr) &C.SDL_Window
pub fn new_window_from(data voidptr) Window {
	return Window {
		&C.SDL_Window(data)
	}
}

fn C.SDL_GetWindowID(&C.SDL_Window) u32
pub fn (this Window)id() u32 {
	return C.SDL_GetWindowID(this.ptr)
}

fn C.SDL_GetWindowFromID(u32) &C.SDL_Window
pub fn get_window_from_id(id u32) ?Window {
	mut this := Window {
		C.SDL_GetWindowFromID(id)
	}

	if this.ptr == voidptr(0) {
		return error('Failed to obtain Window from ID (id = ${id}).')
	} 
	return this
}

fn C.SDL_GetWindowFlags(&C.SDL_Window) u32 
pub fn (this Window)flags() WindowFlags {
	mut ret := WindowFlags.@none
	rc := C.SDL_GetWindowFlags(this.ptr)

	ret.parse(rc)
	return ret
}

fn C.SDL_SetWindowTitle(&C.SDL_Window, &char)
pub fn (this Window)set_title(title string) {
	unsafe {
		C.SDL_SetWindowTitle(this.ptr, &char(title.str))
	}
}

fn C.SDL_GetWindowTitle(&C.SDL_Window) &char
pub fn (this Window)title() string {
	return unsafe {
		cstring_to_vstring(C.SDL_GetWindowTitle(this.ptr))
	}
}

// TODO:
fn C.SDL_SetWindowIcon(&C.SDL_Window, C.SDL_Surface)

// TODO:
fn C.SDL_SetWindowData(&C.SDL_Window, &char, voidptr)

// TODO:
fn C.SDL_GetWindowData(&C.SDL_Window, &char) voidptr

fn C.SDL_SetWindowPosition(&C.SDL_Window, int, int)
pub fn (this Window)set_position(x int, y int) {
	C.SDL_SetWindowPosition(this.ptr, x, y)
}

fn C.SDL_GetWindowPosition(&C.SDL_Window, &int, &int)
pub fn (this Window)position() (int, int) {
	x_ := int(0)
	y_ := int(0)

	unsafe {
		C.SDL_GetWindowPosition(this.ptr, &x_, &y_)
	}

	return x_, y_
}

fn C.SDL_SetWindowSize(&C.SDL_Window, int, int)
pub fn (this Window)set_size(width int, height int) {
	C.SDL_SetWindowSize(this.ptr, width, height)
}

fn C.SDL_GetWindowSize(&C.SDL_Window, &int, &int)
pub fn (this Window)size() (int, int) {
	w_ := int(0)
	h_ := int(0)

	unsafe {
		C.SDL_GetWindowSize(this.ptr, &w_, &h_)
	}

	return w_, h_
}

pub struct BordersSize {
	top    int
	left   int
	right  int
	bottom int
}

pub const invisible_border = BordersSize{0, 0, 0, 0}

// int SDL_GetWindowBordersSize(SDL_Window * window, int *top, int *left,
// int *bottom, int *right);
fn C.SDL_GetWindowBordersSize(&C.SDL_Window, &int, &int, &int, &int) int

pub fn (this Window)borders_size() ?BordersSize {
	top_ := int(0)
	bottom_ := int(0)
	left_ := int(0)
	right_ := int(0)

	rc := unsafe {
		C.SDL_GetWindowBordersSize(this.ptr, &top_, &left_, &bottom_, &right_)
	}

	if rc == int(-1) {
		return error('Failed to obtain window\'s borders size.')
	}

	return BordersSize {
		top_, left_, right_, bottom_
	}
}

fn C.SDL_SetWindowMinimumSize(&C.SDL_Window, int, int)
pub fn (this Window)set_min_size(min_width int, min_height int) {
	C.SDL_SetWindowMinimumSize(this.ptr, min_width, min_height)
}

fn C.SDL_GetWindowMinimumSize(&C.SDL_Window, &int, &int)
pub fn (this Window)min_size() (int, int) {
	min_w := int(0)
	min_h := int(0)

	unsafe {
		C.SDL_GetWindowMinimumSize(this.ptr, &min_w, &min_h)
	}
	return min_w, min_h
}

fn C.SDL_SetWindowMaximumSize(&C.SDL_Window, int, int)
pub fn (this Window)set_max_size(max_width int, max_height int){
	C.SDL_SetWindowMaximumSize(this.ptr, max_width, max_height)
}

fn C.SDL_GetWindowMaximumSize(&C.SDL_Window, &int, &int)
pub fn (this Window)max_size() (int, int) {
	max_w := int(0)
	max_h := int(0)

	unsafe {
		C.SDL_GetWindowMaximumSize(this.ptr, &max_w, &max_h)
	}

	return max_w, max_h
}

fn C.SDL_SetWindowBordered(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)set_border(show bool) {
	tmp := if show {C.SDL_bool(C.SDL_TRUE)} else {C.SDL_bool(C.SDL_FALSE)}
	C.SDL_SetWindowBordered(this.ptr, C.SDL_bool(tmp))
}

fn C.SDL_SetWindowResizable(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)set_resizable(resizable bool) {
	tmp := if resizable { C.SDL_bool(C.SDL_TRUE) } else {C.SDL_bool(C.SDL_FALSE)}
	C.SDL_SetWindowResizable(this.ptr, C.SDL_bool(tmp))
}

fn C.SDL_SetWindowAlwaysOnTop(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)set_always_on_top(on_top bool){
	tmp := if on_top {C.SDL_bool(C.SDL_TRUE)} else {C.SDL_bool(C.SDL_FALSE)}
	C.SDL_SetWindowAlwaysOnTop(this.ptr, C.SDL_bool(tmp))
}

fn C.SDL_ShowWindow(&C.SDL_Window)
pub fn (this Window)show() {
	C.SDL_ShowWindow(this.ptr)
}

fn C.SDL_HideWindow(&C.SDL_Window)
pub fn (this Window)hide() {
	C.SDL_HideWindow(this.ptr)
}

fn C.SDL_RaiseWindow(&C.SDL_Window)
pub fn (this Window)raise() {
	C.SDL_RaiseWindow(this.ptr)
}

fn C.SDL_MaximizeWindow(&C.SDL_Window)
pub fn (this Window)maximize() {
	C.SDL_MaximizeWindow(this.ptr)
}

fn C.SDL_MinimizeWindow(&C.SDL_Window)
pub fn (this Window)minimize() {
	C.SDL_MinimizeWindow(this.ptr)
}

fn C.SDL_RestoreWindow(&C.SDL_Window)
pub fn (this Window)restore() {
	C.SDL_RestoreWindow(this.ptr)
}

fn C.SDL_SetWindowFullscreen(&C.SDL_Window, u32) int
pub fn (this Window)fullscreen(real_fullscreen bool) bool {
	flag := if real_fullscreen {
		C.SDL_WINDOW_FULLSCREEN
	} else {
		C.SDL_WINDOW_FULLSCREEN_DESKTOP
	}

	rc := C.SDL_SetWindowFullscreen(this.ptr, flag)

	return rc == 0
}

// SDL_Surface * SDLCALL SDL_GetWindowSurface(SDL_Window * window);
// TODO:
fn C.SDL_GetWindowSurface(&C.SDL_Window) &C.SDL_Surface

fn C.SDL_UpdateWindowSurface(&C.SDL_Window) int
pub fn (this Window)update_surface() bool {
	rc := C.SDL_UpdateWindowSurface(this.ptr)
	return rc == 0
}

fn C.SDL_UpdateWindowSurfaceRects(&C.SDL_Window, &C.SDL_Rect, int) int
pub fn (this Window)update_surfaces(rects []Rectangle) bool {
	if rects.len == 0 {
		return false 
	}

	rc := unsafe {
		C.SDL_UpdateWindowSurfaceRects(this.ptr, &rects[0], rects.len)
	}
	return rc == 0
}

fn C.SDL_SetWindowGrab(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)grab(grabbed bool) {
	tmp_grabbed := if grabbed {
		C.SDL_bool(C.SDL_TRUE)
	} else {
		C.SDL_bool(C.SDL_FALSE)
	}
	C.SDL_SetWindowGrab(this.ptr, C.SDL_bool(tmp_grabbed))
}

fn C.SDL_SetWindowKeyboardGrab(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)keyboard_grab(grabbed bool) {
	tmp_grabbed := if grabbed {
		C.SDL_bool(C.SDL_TRUE)
	} else {
		C.SDL_bool(C.SDL_FALSE)
	}
	C.SDL_SetWindowKeyboardGrab(this.ptr, C.SDL_bool(tmp_grabbed))
}

fn C.SDL_SetWindowMouseGrab(&C.SDL_Window, C.SDL_bool)
pub fn (this Window)mouse_grab(grabbed bool) {
	tmp_grabbed := if grabbed {
		C.SDL_bool(C.SDL_TRUE)
	} else {
		C.SDL_bool(C.SDL_FALSE)
	}
	C.SDL_SetWindowMouseGrab(this.ptr, C.SDL_bool(tmp_grabbed))
}

fn C.SDL_GetWindowGrab(&C.SDL_Window) C.SDL_bool
pub fn (this Window)is_grabbed() bool {
	rc := C.SDL_GetWindowGrab(this.ptr)

	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_GetWindowKeyboardGrab(&C.SDL_Window) C.SDL_bool
pub fn (this Window)is_keyboard_grabbed() bool {
	rc := C.SDL_GetWindowKeyboardGrab(this.ptr)
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_GetWindowMouseGrab(&C.SDL_Window) C.SDL_bool
pub fn (this Window)is_mouse_grabbed() bool {
	rc := C.SDL_GetWindowMouseGrab(this.ptr)
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_GetGrabbedWindow() &C.SDL_Window
pub fn grabbed_window() Window {
	return Window {
		C.SDL_GetGrabbedWindow()
	}
}

fn C.SDL_SetWindowBrightness(&C.SDL_Window, f32) int
pub fn (this Window)set_brightness(brightness f32) bool {
	// brightness the brightness (gamma multiplier) value to set where 0.0
	// is completely dark and 1.0 is normal brightness
	rc := C.SDL_SetWindowBrightness(this.ptr, brightness)
	return rc == 0
}

fn C.SDL_GetWindowBrightness(&C.SDL_Window) f32
pub fn (this Window)brightness() f32 {
	return C.SDL_GetWindowBrightness(this.ptr)
}

fn C.SDL_SetWindowOpacity(&C.SDL_Window, f32) int
pub fn (this Window)set_opacity(opacity f32) bool {
	rc := C.SDL_SetWindowOpacity(this.ptr, opacity)
	return rc == 0
}

fn C.SDL_GetWindowOpacity(&C.SDL_Window, &f64) int
pub fn (this Window)opacity() f64 {
	ret := f64(0)
	unsafe {
		C.SDL_GetWindowOpacity(this.ptr, &ret)
	}
	return ret
}

fn C.SDL_SetWindowModalFor(&C.SDL_Window, &C.SDL_Window) int
pub fn (this Window)set_modal_for(parent Window) bool {
	rc := C.SDL_SetWindowModalFor(this.ptr, parent.ptr)
	return if rc == 0 {true} else {false}
}

fn C.SDL_SetWindowInputFocus(&C.SDL_Window) int
pub fn (this Window)focus() bool {
	rc := C.SDL_SetWindowInputFocus(this.ptr)
	return rc == 0
}

fn C.SDL_SetWindowGammaRamp(&C.SDL_Window, &u16, &u16, &u16) int
pub fn (this Window)set_gamma_ramp(red []u16, green []u16, blue []u16)? {
	if red.len != 256 {
		return error('<red> doesn\'t contain 256 elements of translation table.')
	} else if green.len != 256 {
		return error('<green> doesn\'t contain 256 elements of translation table.')
	} else if blue.len != 256 {
		return error('<blue> doesn\'t contain 256 elements of translation table.')
	}

	rc := unsafe {
		C.SDL_SetWindowGammaRamp(this.ptr, &red[0], &green[0], &blue[0])
	}

	if rc != 0 {
		return error('Set the gamma translation table for the red, green, and blue channels.')
	}
}

fn C.SDL_GetWindowGammaRamp(&C.SDL_Window, &u16, &u16, &u16) int
pub fn (this Window)gamma_ramp() ?([]u16, []u16, []u16) {
	red_tbl   := []u16{len: 256, cap: 256, init: 0}
	green_tbl := []u16{len: 256, cap: 256, init: 0}
	blue_tbl  := []u16{len: 256, cap: 256, init: 0}

	rc := unsafe {
		C.SDL_GetWindowGammaRamp(this.ptr, &red_tbl[0], &green_tbl[0], &blue_tbl[0])
	}

	if rc != 0 {
		return error('Failed to obtain gamma ramp table.')
	}
	return red_tbl, green_tbl, blue_tbl
}

pub enum HitTestResult {
    normal             = C.SDL_HITTEST_NORMAL
    draggable          = C.SDL_HITTEST_DRAGGABLE
    resize_top_left    = C.SDL_HITTEST_RESIZE_TOPLEFT
    resize_top         = C.SDL_HITTEST_RESIZE_TOP
    resize_top_right   = C.SDL_HITTEST_RESIZE_TOPRIGHT
    resize_right       = C.SDL_HITTEST_RESIZE_RIGHT
    bottom_right       = C.SDL_HITTEST_RESIZE_BOTTOMRIGHT
    resize_bottom      = C.SDL_HITTEST_RESIZE_BOTTOM
    resize_bottom_left = C.SDL_HITTEST_RESIZE_BOTTOMLEFT
    resize_left        = C.SDL_HITTEST_RESIZE_LEFT
}


// TODO:
// typedef SDL_HitTestResult (SDLCALL *SDL_HitTest)(SDL_Window *win,
// const SDL_Point *area, void *data);

// TODO
// extern DECLSPEC int SDLCALL SDL_SetWindowHitTest(SDL_Window * window,
// SDL_HitTest callback, void *callback_data);

fn C.SDL_DestroyWindow(&C.SDL_Window)
pub fn (this Window)destroy() {
	C.SDL_DestroyWindow(this.ptr)
}

pub struct ScreenSaver {
mut:
	is_enabled bool
}

fn C.SDL_IsScreenSaverEnabled() C.SDL_bool
pub fn is_screensaver_enabled() bool {
	rc := C.SDL_IsScreenSaverEnabled()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

pub fn new_screensaver() ScreenSaver {
	return ScreenSaver {
		is_screensaver_enabled()
	}
}

pub fn (mut this ScreenSaver)enabled() bool {
	this.is_enabled = is_screensaver_enabled()
	return this.is_enabled
}

fn C.SDL_EnableScreenSaver()
pub fn enable_screensaver() {
	C.SDL_EnableScreenSaver()
}

pub fn (mut this ScreenSaver)enable() {
	enable_screensaver()
	this.enabled()
}

fn C.SDL_DisableScreenSaver()
pub fn disable_screensaver() {
	C.SDL_DisableScreenSaver()
}

pub fn (mut this ScreenSaver) disable() {
	disable_screensaver()
	this.enabled()
}
