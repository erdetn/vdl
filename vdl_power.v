module vdl

pub enum PowerState { // SDL_PowerState
    unknown    = C.SDL_POWERSTATE_UNKNOWN
    on_battery = C.SDL_POWERSTATE_ON_BATTERY
    no_battery = C.SDL_POWERSTATE_NO_BATTERY
    charging   = C.SDL_POWERSTATE_CHARGING
    charged    = C.SDL_POWERSTATE_CHARGED
} 

fn C.SDL_GetPowerInfo(&int, &int) C.SDL_PowerState

pub fn power_state() PowerState {
	return PowerState(C.SDL_GetPowerInfo(voidptr(0), voidptr(0)))
}

pub fn battery_percentage() int {
	btr := int(0)

	unsafe {
		C.SDL_GetPowerInfo(voidptr(0), &btr)
	}
	return btr
}

pub fn battery_time() int {
	btr := int(0)

	unsafe {
		C.SDL_GetPowerInfo(&btr, voidptr(0))
	}
	return int(btr/60) // in minutes
}
