module vdl

fn C.SDL_GetTicks() u32
pub fn ticks() u32 {
	return C.SDL_GetTicks()
}

fn C.SDL_GetPerformanceCounter() u64
pub fn get_performance_counter() u64 {
	return C.SDL_GetPerformanceCounter()
}

fn C.SDL_GetPerformanceFrequency() u64
pub fn get_performance_frequency() u64 {
	return C.SDL_GetPerformanceFrequency()
}

fn C.SDL_Delay(u32)
pub fn delay(in_ms u32) {
	C.SDL_Delay(in_ms)
}
// Timers are not supported //
