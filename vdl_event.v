// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl


pub const released = C.SDL_RELEASED

pub const pressed = C.SDL_PRESSED

pub enum EventType { // SDL_EventType
	@none = C.SDL_FIRSTEVENT
	quit = C.SDL_QUIT
	app_terminating = C.SDL_APP_TERMINATING
	app_low_memory = C.SDL_APP_LOWMEMORY
	app_will_enter_background = C.SDL_APP_WILLENTERBACKGROUND
	app_did_enter_background = C.SDL_APP_DIDENTERBACKGROUND
	app_will_enter_foreground = C.SDL_APP_WILLENTERFOREGROUND
	app_did_enter_foreground = C.SDL_APP_DIDENTERFOREGROUND
	display_event = C.SDL_DISPLAYEVENT
	window_event = C.SDL_WINDOWEVENT
	system_event = C.SDL_SYSWMEVENT
	keydown = C.SDL_KEYDOWN
	keyup = C.SDL_KEYUP
	text_editing = C.SDL_TEXTEDITING
	text_input = C.SDL_TEXTINPUT
	keymap_changed = C.SDL_KEYMAPCHANGED
	mouse_motion = C.SDL_MOUSEMOTION
	mouse_button_down = C.SDL_MOUSEBUTTONDOWN
	mouse_button_up = C.SDL_MOUSEBUTTONUP
	mouse_wheel = C.SDL_MOUSEWHEEL
	joy_axis_motion = C.SDL_JOYAXISMOTION
	joy_ball_motion = C.SDL_JOYBALLMOTION
	joy_hat_motion = C.SDL_JOYHATMOTION
	joy_button_down = C.SDL_JOYBUTTONDOWN
	joy_button_up = C.SDL_JOYBUTTONUP
	joy_device_added = C.SDL_JOYDEVICEADDED
	joy_device_removed = C.SDL_JOYDEVICEREMOVED
	controller_axis_motion = C.SDL_CONTROLLERAXISMOTION
	controller_button_down = C.SDL_CONTROLLERBUTTONDOWN
	controller_button_up = C.SDL_CONTROLLERBUTTONUP
	controller_device_added = C.SDL_CONTROLLERDEVICEADDED
	controller_device_removed = C.SDL_CONTROLLERDEVICEREMOVED
	controller_device_mapped = C.SDL_CONTROLLERDEVICEREMAPPED
	finger_down = C.SDL_FINGERDOWN
	finger_up = C.SDL_FINGERUP
	finger_motion = C.SDL_FINGERMOTION
	dollar_gesture = C.SDL_DOLLARGESTURE
	dollar_record = C.SDL_DOLLARRECORD
	multigesture = C.SDL_MULTIGESTURE
	clipboard_update = C.SDL_CLIPBOARDUPDATE
	drop_file = C.SDL_DROPFILE
	drop_text = C.SDL_DROPTEXT
	drop_begin = C.SDL_DROPBEGIN
	drop_complete = C.SDL_DROPCOMPLETE
	audio_device_added = C.SDL_AUDIODEVICEADDED
	audio_device_removed = C.SDL_AUDIODEVICEREMOVED
	sensor_update = C.SDL_SENSORUPDATE
	render_targets_reset = C.SDL_RENDER_TARGETS_RESET
	render_device_reset = C.SDL_RENDER_DEVICE_RESET
	user_event = C.SDL_USEREVENT
	last_event = C.SDL_LASTEVENT
}

pub struct C.SDL_CommonEvent {
pub:
	@type     u32
	timestamp u32
}

pub type CommonEvent = C.SDL_CommonEvent

pub struct C.SDL_DisplayEvent {
pub:
	@type     u32
	timestamp u32
	display   u32
	event     u8
	padding1  u8
	padding2  u8
	padding3  u8
	data1     int
}

pub type DisplayEvent = C.SDL_CommonEvent

pub struct C.SDL_WindowEvent {
pub:
	@type     u32
	timestamp u32
	windowID  u32
	event     u8
	padding1  u8
	padding2  u8
	padding3  u8
	data1     int
	data2     int
}

pub type WindowEvent = C.SDL_WindowEvent

pub struct C.SDL_KeyboardEvent {
pub:
	@type     u32 // C.SDL_KEYDOWN or C.SDL_KEYUP
	timestamp u32
	windowID  u32
	state     u8 // C.SDL_PRESSED or C.SDL_RELEASED
	repeat    u8
	padding2  u8
	padding3  u8
	keysym    C.SDL_Keysym // The key that was pressed or released
}

pub type KeyboardEvent = C.SDL_KeyboardEvent

pub struct C.SDL_TextEditingEvent {
pub:
	@type     u32
	timestamp u32
	windowID  u32
	text      [32]u8
	start     int
	length    int
}

pub type TextEditingEvent = C.SDL_TextEditingEvent

pub struct C.SDL_TextInputEvent {
pub:
	@type     u32
	timestamp u32
	windowID  u32
	text      [32]u8
}

pub type TextInputEvent = C.SDL_TextInputEvent

pub struct C.SDL_MouseMotionEvent {
pub:
	@type     u32 // C.SDL_MOUSEMOTION
	timestamp u32
	windowID  u32
	which     u32 // The mouse instance ID or C.SDL_TOUCH_MOUSEID
	state     u32 // button state
	x         int
	y         int
	xrel      int
	yrel      int
}

pub type MouseMotionEvent = C.SDL_MouseMotionEvent

pub struct C.SDL_MouseButtonEvent {
pub:
	@type     u32 // C.SDL_MOUSEBUTTONDOWN or C.SDL_MOUSEBUTTONUP
	timestamp u32
	windowID  u32
	which     u32 // The mouse instance ID or C.SDL_TOUCH_MOUSEID
	button    u8
	state     u8 // C.SDL_PRESSED or C.SDL_RELEASED
	clicks    u8 // 1 for single-click, 2 for double-click, etc
	padding1  u8
	x         int
	y         int
}

pub type MouseButtonEvent = C.SDL_MouseButtonEvent

pub struct C.SDL_MouseWheelEvent {
pub:
	@type     u32 // C.SDL_MOUSEWHEEL
	timestamp u32
	windowID  u32
	which     u32 // The mouse instance ID or C.SDL_TOUCH_MOUSEID
	x         int
	y         int
	direction u32 // One of the C.SDL_MOUSEWHEEL_* defines
}

pub type MouseWheelEvent = C.SDL_MouseWheelEvent

pub struct C.SDL_JoyAxisEvent {
pub:
	@type     u32
	timestamp u32
	which     C.SDL_JoystickID
	axis      u8
	padding1  u8
	padding2  u8
	padding3  u8
	value     i16
	padding4  u16
}

pub type JoyAxisEvent = C.SDL_JoyAxisEvent

pub struct C.SDL_JoyBallEvent {
pub:
	@type     u32
	timestamp u32
	which     C.SDL_JoystickID
	ball      u8
	padding1  u8
	padding2  u8
	padding3  u8
	xrel      i16
	yrel      i16
}

pub type JoyBallEvent = C.SDL_JoyBallEvent

pub struct C.SDL_JoyHatEvent {
pub:
	@type     u32 // C.SDL_JOYHATMOTION
	timestamp u32
	which     C.SDL_JoystickID
	hat       u8
	value     u8
	// C.SDL_HAT_LEFTUP C.SDL_HAT_UP C.SDL_HAT_RIGHTUP
	// C.SDL_HAT_LEFT C.SDL_HAT_CENTERED C.SDL_HAT_RIGHT
	// C.SDL_HAT_LEFTDOWN C.SDL_HAT_DOWN C.SDL_HAT_RIGHTDOWN
	padding1 u8
	padding2 u8
}

pub type JoyHatEvent = C.SDL_JoyHatEvent

pub struct C.SDL_JoyButtonEvent {
pub:
	@type     u32 // C.SDL_JOYBUTTONDOWN or C.SDL_JOYBUTTONUP
	timestamp u32
	which     C.SDL_JoystickID
	button    u8
	state     u8 // C.SDL_PRESSED or C.SDL_RELEASED
	padding1  u8
	padding2  u8
}

pub type JoyButtonEvent = C.SDL_JoyButtonEvent

pub struct C.SDL_JoyDeviceEvent {
pub:
	@type     u32 // C.SDL_JOYDEVICEADDED or C.SDL_JOYDEVICEREMOVED
	timestamp u32
	which     int
}

pub type JoyDeviceEvent = C.SDL_JoyDeviceEvent

pub struct C.SDL_ControllerAxisEvent {
pub:
	@type     u32 // C.SDL_CONTROLLERAXISMOTION
	timestamp u32
	which     C.SDL_JoystickID
	axis      u8
	padding1  u8
	padding2  u8
	padding3  u8
	value     i16
	padding4  u16
}

pub type ControllerAxisEvent = C.SDL_ControllerAxisEvent

pub struct C.SDL_ControllerButtonEvent {
pub:
	@type     u32 // C.SDL_CONTROLLERBUTTONDOWN or C.SDL_CONTROLLERBUTTONUP
	timestamp u32
	which     C.SDL_JoystickID
	button    u8
	state     u8
	padding1  u8
	padding2  u8
}

pub type ControllerButtonEvent = C.SDL_ControllerButtonEvent

pub struct C.SDL_ControllerDeviceEvent {
pub:
	@type     u32 // C.SDL_CONTROLLERDEVICEADDED, C.SDL_CONTROLLERDEVICEREMOVED or C.SDL_CONTROLLERDEVICEREMAPPED
	timestamp u32
	which     int
}

pub type ControllerDeviceEvent = C.SDL_ControllerDeviceEvent

pub struct C.SDL_AudioDeviceEvent {
pub:
	@type     u32 // C.SDL_AUDIODEVICEADDED or C.SDL_AUDIODEVICEREMOVED
	timestamp u32
	which     u32
	iscapture u8
	padding1  u8
	padding2  u8
	padding3  u8
}

pub type AudioDeviceEvent = C.SDL_AudioDeviceEvent

pub struct C.SDL_TouchFingerEvent {
pub:
	@type     u32 // C.SDL_FINGERMOTION or C.SDL_FINGERDOWN or C.SDL_FINGERUP
	timestamp u32
	touchId   C.SDL_TouchID
	fingerId  C.SDL_FingerID
	x         f32 // 0...1
	y         f32 // 0...1
	dx        f32 // -1...1
	dy        f32 // -1...1
	pressure  f32 // 0...1
}

pub type TouchFingerEvent = C.SDL_TouchFingerEvent

pub struct C.SDL_MultiGestureEvent {
pub:
	@type      u32 // C.SDL_MULTIGESTURE
	timestamp  u32
	touchId    C.SDL_TouchID
	dTheta     f32
	dDist      f32
	x          f32
	y          f32
	numFingers u16
	padding    u16
}

pub type MultiGestureEvent = C.SDL_MultiGestureEvent

pub struct C.SDL_DollarGestureEvent {
pub:
	@type      u32 // C.SDL_DOLLARGESTURE or C.SDL_DOLLARRECORD
	timestamp  u32
	touchId    C.SDL_TouchID
	gestureId  C.SDL_GestureID
	numFingers u32
	error      f32
	x          f32
	y          f32
}

pub type DollarGestureEvent = C.SDL_DollarGestureEvent

pub struct C.SDL_DropEvent {
pub:
	@type     u32 // C.SDL_DROPBEGIN or C.SDL_DROPFILE or C.SDL_DROPTEXT or C.SDL_DROPCOMPLETE
	timestamp u32
	file      &char
	windowID  u32
}

pub type DropEvent = C.SDL_DropEvent

pub struct C.SDL_SensorEvent {
pub:
	@type     u32 // C.SDL_SENSORUPDATE
	timestamp u32
	which     int
	data      [6]f32
}

pub type SensorEvent = C.SDL_SensorEvent

pub struct C.SDL_QuitEvent {
pub:
	@type     u32 // C.SDL_QUIT
	timestamp u32
}

pub type QuitEvent = C.SDL_QuitEvent

pub struct C.SDL_OSEvent {
pub:
	@type     u32 // C.SDL_QUIT
	timestamp u32
}

pub type SDL_OSEvent = C.SDL_OSEvent

pub struct C.SDL_UserEvent {
pub:
	@type     u32 // C.SDL_USEREVENT or C.SDL_LASTEVENT-1
	timestamp u32
	windowID  u32
	code      int
	data1     voidptr
	data2     voidptr
}

pub type UserEvent = C.SDL_UserEvent

struct C.SDL_SysWMmsg {}

pub type SystemMessage = C.SDL_SysWMmsg

pub struct C.SDL_SysWMEvent {
pub:
	@type     u32 // C.SDL_SYSWMEVENT
	timestamp u32
	msg       &C.SDL_SysWMmsg
}

pub type SysWindowEvent = C.SDL_SysWMEvent

[typedef]
union C.SDL_Event {
pub:
	@type    u32
	common   CommonEvent
	display  DisplayEvent
	window   WindowEvent
	key      KeyboardEvent
	edit     TextEditingEvent
	text     TextInputEvent
	motion   MouseMotionEvent
	button   MouseButtonEvent
	wheel    MouseWheelEvent
	jaxis    JoyAxisEvent
	jball    JoyBallEvent
	jhat     JoyHatEvent
	jbutton  JoyButtonEvent
	jdevice  JoyDeviceEvent
	caxis    ControllerAxisEvent
	cbutton  ControllerButtonEvent
	cdevice  ControllerDeviceEvent
	adevice  AudioDeviceEvent
	sensor   SensorEvent
	quite    QuitEvent
	user     UserEvent
	syswn    SysWindowEvent
	tfinger  TouchFingerEvent
	mgesture MultiGestureEvent
	dgesture DollarGestureEvent
	drop     DropEvent

	padding [56]u32
}

pub type Event = C.SDL_Event

fn C.SDL_PumpEvents()
pub fn (this Event) pump() {
	C.SDL_PumpEvents()
}

pub enum EventAction { // C.SDL_eventaction
	add = C.SDL_ADDEVENT
	peek = C.SDL_PEEKEVENT
	get = C.SDL_GETEVENT
}

fn C.SDL_PeepEvents(&C.SDL_Event, int, C.SDL_eventaction, u32, u32) int
pub fn (mut this Event) peep(num_events int, action EventAction, from_event_type EventType, to_event_type EventType) int {
	rc := unsafe {
		C.SDL_PeepEvents(&C.SDL_Event(&this), num_events, C.SDL_eventaction(action), u32(from_event_type),
			u32(to_event_type))
	}
	return rc
}

fn C.SDL_HasEvent(u32) C.SDL_bool
fn C.SDL_HasEvents(u32, u32) C.SDL_bool

pub fn (mut this Event) has_event(from_event EventType, to_event EventType) bool {
	if to_event == EventType.@none {
		rc1 := C.SDL_HasEvent(u32(from_event))
		return rc1 == C.SDL_bool(C.SDL_TRUE)
	}

	rc2 := C.SDL_HasEvents(u32(from_event), u32(to_event))
	return rc2 == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_FlushEvent(u32)
fn C.SDL_FlushEvents(u32, u32)
pub fn (mut this Event) flush(from_event EventType, to_event EventType) {
	if to_event == EventType.@none {
		C.SDL_FlushEvent(u32(from_event))
		return
	}
	C.SDL_FlushEvents(u32(from_event), u32(to_event))
}

fn C.SDL_PollEvent(&C.SDL_Event) int
pub fn (mut this Event) poll() bool {
	mut rc := int(0)
	unsafe {
		rc = C.SDL_PollEvent(&C.SDL_Event(&this))
	}
	return rc == int(1)
}

fn C.SDL_WaitEvent(&C.SDL_Event) int
fn C.SDL_WaitEventTimeout(&C.SDL_Event, int) int
pub fn (mut this Event) wait(timeout_ms int) bool {
	mut rc := int(0)

	if timeout_ms == 0 {
		unsafe {
			rc = C.SDL_WaitEvent(&C.SDL_Event(&this))
		}
	} else {
		unsafe {
			rc = C.SDL_WaitEventTimeout(&C.SDL_Event(&this), timeout_ms)
		}
	}
	return rc == int(1)
}

fn C.SDL_PushEvent(&C.SDL_Event) int
pub fn (mut this Event) push(event Event) bool {
	tevent := event
	rc := unsafe {
		C.SDL_PushEvent(&C.SDL_Event(&tevent))
	}
	return rc == int(1)
}

fn C.SDL_RegisterEvents(int) u32
pub fn (mut this Event) register(num_events int) u32 {
	return C.SDL_RegisterEvents(num_events)
}

// Note: Event filter and event watch not supported //
