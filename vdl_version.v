// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

struct C.SDL_version {
	major u8
	minor u8
	patch u8
}

pub type Version = C.SDL_version

fn C.SDL_GetVersion(&C.SDL_version)
pub fn get_version() Version {
	this := Version{0, 0, 0}
	unsafe {
		C.SDL_GetRevision(&this)
	}
	return This
}

fn C.SDL_GetRevision() &char
pub fn (this Version) revision() string {
	mut rstr := ''
	unsafe {
		rstr = cstring_to_vstring(C.SDL_GetRevision())
	}
	return rstr
}

fn C.SDL_GetRevisionNumber() int
pub fn (this Version) revision_number() int {
	return C.SDL_GetRevisionNumber()
}

pub fn (this Version) str() string {
	mut rstr := 'SDL2 version: <'
	rst += '$this.major, $this.minor, $this.patch>'
	return rstr
}

pub fn (this Version) major() u8 {
	return this.major
}

pub fn (this Version) minor() u8 {
	return this.minor
}

pub fn (this Version) patch() u8 {
	return this.patch
}

