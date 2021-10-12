module vdl

[flag]
pub enum InitializeMode {
	nothing         // 0
	timer           // C.SDL_INIT_TIMER          // 0x00000001u
	audio           // C.SDL_INIT_AUDIO          // 0x00000010u
	video           // C.SDL_INIT_VIDEO          // 0x00000020u  /**< SDL_INIT_VIDEO implies SDL_INIT_EVENTS */
	joystick        // C.SDL_INIT_JOYSTICK       // 0x00000200u  /**< SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS */
	haptic          // C.SDL_INIT_HAPTIC         // 0x00001000u
	game_controller // C.SDL_INIT_GAMECONTROLLER // 0x00002000u  /**< SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK */
	events          // C.SDL_INIT_EVENTS         // 0x00004000u
	sensor          // C.SDL_INIT_SENSOR         // 0x00008000u
	no_parachute    // C.SDL_INIT_NOPARACHUTE    // 0x00100000u  /**< compatibility; this flag is ignored. */
	everything      // C.SDL_INIT_EVERYTHING
}

pub fn(this InitializeMode)value() u32{
	mut rc := 0

	if this == InitializeMode.timer {
		rc |= C.SDL_INIT_TIMER
	}

	if this == InitializeMode.audio {
		rc |= C.SDL_INIT_AUDIO
	}

	if this == InitializeMode.joystick {
		rc |= C.SDL_INIT_JOYSTICK
	}

	if this == InitializeMode.haptic {
		rc |= C.SDL_INIT_HAPTIC
	}

	if this == InitializeMode.game_controller {
		rc |= C.SDL_INIT_GAMECONTROLLER
	}

	if this == InitializeMode.events {
		rc |= C.SDL_INIT_EVENTS
	}

	if this == InitializeMode.sensor {
		rc |= C.SDL_INIT_SENSOR
	}
	
	if this == InitializeMode.no_parachute {
		rc |= C.SDL_INIT_NOPARACHUTE
	}

	if this == InitializeMode.everything {
		rc |= C.SDL_INIT_EVERYTHING
	}

	return u32(rc)
}

pub fn (this InitializeMode)mode(value u32) InitializeMode{
	mut ret := InitializeMode.nothing

	if value & u32(C.SDL_INIT_TIMER) != 0 {
		ret = ret | InitializeMode.timer
	}
	
	if value & u32(C.SDL_INIT_AUDIO) != 0 {
		ret = ret | InitializeMode.audio
	}
	
	if value & u32(C.SDL_INIT_VIDEO) != 0 {
		ret = ret | InitializeMode.video
	}
	
	if value & u32(C.SDL_INIT_JOYSTICK) != 0 {
		ret = ret | InitializeMode.joystick
	}
	
	if value & u32(C.SDL_INIT_HAPTIC) != 0 {
		ret = ret | InitializeMode.haptic
	}
	
	if value & u32(C.SDL_INIT_GAMECONTROLLER) != 0 {
		ret = ret | InitializeMode.game_controller
	}
	
	if value & u32(C.SDL_INIT_EVENTS) != 0 {
		ret = ret | InitializeMode.events
	}
	
	if value & u32(C.SDL_INIT_SENSOR) != 0 {
		ret = ret | InitializeMode.sensor
	}

	if value & u32(C.SDL_INIT_EVERYTHING) != 0 {
		ret = ret | InitializeMode.everything
	}

	return ret
}

fn C.SDL_Init(int) int
pub fn init(init_mode InitializeMode) bool {
	rc := C.SDL_Init(int(init_mode.value()))

	return rc == 0
}

fn C.SDL_InitSubSystem(int) int
pub fn init_subsystem(init_mode InitializeMode) bool {
	rc := C.SDL_InitSubSystem(int(init_mode.value()))
	return rc == 0
}

fn C.SDL_QuitSubSystem(int)
pub fn quit_subsystem(init_mode InitializeMode) {
	C.SDL_QuitSubSystem(int(init_mode.value()))
}

fn C.SDL_WasInit(u32) u32 
pub fn initialized_modes(init_mode InitializeMode) InitializeMode {
	rc := C.SDL_WasInit(u32(init_mode.value()))
	return init_mode.mode(rc)
}

fn C.SDL_Quit()
pub fn quit() {
	C.SDL_Quit()
}
