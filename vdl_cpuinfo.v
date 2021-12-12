// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

fn C.SDL_GetCPUCount() int
pub fn cpu_cores() int {
	return C.SDL_GetCPUCount()
}

fn C.SDL_GetCPUCacheLineSize() int
pub fn cpu_cache_line_size() int {
	return C.SDL_GetCPUCacheLineSize()
}

fn C.SDL_HasRDTSC() C.SDL_bool
pub fn has_rdtsc() bool {
	rc := C.SDL_HasRDTSC()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasAltiVec() C.SDL_bool
pub fn cpu_has_altivec() bool {
	rc := C.SDL_HasAltiVec()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasMMX() C.SDL_bool
pub fn cpu_has_mmx() bool {
	rc := C.SDL_HasMMX()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_Has3DNow() C.SDL_bool
pub fn cpu_has_3dnow() bool {
	rc := C.SDL_Has3DNow()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasSSE() C.SDL_bool
pub fn cpu_has_sse() bool {
	rc := C.SDL_HasSSE()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasSSE2() C.SDL_bool
pub fn spu_has_sse2() bool {
	rc := C.SDL_HasSSE2()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasSSE3() C.SDL_bool
pub fn cpu_has_sse3() bool {
	rc := C.SDL_HasSSE3()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasSSE41() C.SDL_bool
pub fn cpu_has_sse41() bool {
	rc := C.SDL_HasSSE41()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasSSE42() C.SDL_bool
pub fn cpu_has_sse42() bool {
	rc := C.SDL_HasSSE42()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasAVX() C.SDL_bool
pub fn cpu_has_avx() bool {
	rc := C.SDL_HasAVX()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasAVX2() C.SDL_bool
pub fn cpu_has_avx2() bool {
	rc := C.SDL_HasAVX2()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasAVX512F() C.SDL_bool
pub fn cpu_has_avx512f() bool {
	rc := C.SDL_HasAVX512F()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_HasNEON() C.SDL_bool
pub fn cpu_has_neon() bool {
	rc := C.SDL_HasNEON()
	return rc == C.SDL_bool(C.SDL_TRUE)
}

fn C.SDL_GetSystemRAM() int
pub fn system_ram() int {
	return C.SDL_GetSystemRAM()
}
