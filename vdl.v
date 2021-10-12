module vdl

[flag]
pub enum InitializeMode {
	nothing         = 0
	timer           = C.SDL_INIT_TIMER          // 0x00000001u
	audio           = C.SDL_INIT_AUDIO          // 0x00000010u
	video           = C.SDL_INIT_VIDEO          // 0x00000020u  /**< SDL_INIT_VIDEO implies SDL_INIT_EVENTS */
	joystick        = C.SDL_INIT_JOYSTICK       // 0x00000200u  /**< SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS */
	haptic          = C.SDL_INIT_HAPTIC         // 0x00001000u
	game_controller = C.SDL_INIT_GAMECONTROLLER // 0x00002000u  /**< SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK */
	events          = C.SDL_INIT_EVENTS         // 0x00004000u
	sensor          = C.SDL_INIT_SENSOR         // 0x00008000u
	no_parachute    = C.SDL_INIT_NOPARACHUTE    // 0x00100000u  /**< compatibility; this flag is ignored. */
	everything      = C.SDL_INIT_EVERYTHING
}

fn C.SDL_Init(int) int
pub fn init(init_mode InitializeMode) bool {
	rc := C.SDL_Init(int(init_mode))

	return rc == 0
}

fn C.SDL_InitSubSystem(int) int
pub fn init_subsystem(init_mode InitializeMode) bool {
	rc := C.SDL_InitSubSystem(int(init_mode))
	return rc == 0
}

fn C.SDL_QuitSubSystem(int)
pub fn quit_subsystem(init_mode InitializeMode) {
	C.SDL_QuitSubSystem(int(init_mode))
}

fn C.SDL_WasInit(u32) u32 
pub fn initialized_modes(init_mode InitializeMode) InitializeMode {
	mut ret := InitializeMode.nothing

	rc := C.SDL_WasInit(u32(init_mode))

	if rc & u32(InitializeMode.timer) != 0 {
		ret |= InitializeMode.timer
	}
	
	if rc & u32(InitializeMode.audio) != 0 {
		ret |= InitializeMode.audio
	}
	
	if rc & u32(InitializeMode.video) != 0{
		ret |= InitializeMode.video
	}
	
	if rc & u32(InitializeMode.joystick) != 0 {
		ret |= InitializeMode.joystick
	}
	
	if rc & u32(InitializeMode.haptic) != 0 {
		ret |= InitializeMode.haptic
	}
	
	if rc & u32(InitializeMode.game_controller) != 0 {
		ret |= InitializeMode.game_controller
	}
	
	if rc & u32(InitializeMode.events) != 0 {
		ret |= InitializeMode.events
	}
	
	if rc & u32(InitializeMode.sensor) != 0 {
		ret |= InitializeMode.sensor
	}

	if rc & u32(InitializeMode.everything) != 0 {
		ret |= InitializeMode.everything
	}

	return ret
}

fn C.SDL_Quit()
pub fn quit() {
	C.SDL_Quit()
}
