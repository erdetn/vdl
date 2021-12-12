// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum TouchDeviceType {
	invaide = C.SDL_TOUCH_DEVICE_INVALID
	direct = C.SDL_TOUCH_DEVICE_DIRECT
	indirect_absolute = C.SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE
	indirect_relative = C.SDL_TOUCH_DEVICE_INDIRECT_RELATIVE
}

struct C.SDL_Finger {
	id       C.SDL_FingerID
	x        f32
	y        f32
	pressure f32
}

pub type Finger = C.SDL_Finger

const touch_mouse_id = C.SDL_TOUCH_MOUSEID

const mouse_id = C.SDL_MOUSE_TOUCHID

fn C.SDL_GetNumTouchDevices() int
pub fn get_num_touch_devices() int {
	return C.SDL_GetNumTouchDevices()
}

fn C.SDL_GetTouchDevice(index int) C.SDL_TouchID
pub fn get_touch_device(index int) int {
	return int(C.SDL_GetTouchDevice(index))
}

fn C.SDL_GetTouchDeviceType(C.SDL_TouchID) C.SDL_TouchDeviceType
pub fn get_touch_device_type(touch_id int) TouchDeviceType {
	return TouchDeviceType(C.SDL_GetTouchDeviceType(C.SDL_TouchID(touch_id)))
}

fn C.SDL_GetNumTouchFingers(C.SDL_TouchID) int
pub fn get_touch_fingers_count(touch_id int) int {
	return C.SDL_GetNumTouchFingers(C.SDL_TouchID(touch_id))
}

fn C.SDL_GetTouchFinger(C.SDL_TouchID, int) &C.SDL_Finger
pub fn new_touch_finger(touch_id int, index int) Finger {
	mut this := Finger{C.SDL_FingerID(0), f32(0), f32(0), f32(0)}
	this = *(&Finger(C.SDL_GetTouchFinger(C.SDL_TouchID(touch_id), index)))
	return this
}

pub fn (this Finger) id() int {
	return int(this.id)
}

pub fn (this Finger) x() f32 {
	return this.x
}

pub fn (this Finger) y() f32 {
	return this.y
}

pub fn (this Finger) point() (f32, f32) {
	return this.x, this.y
}

pub fn (this Finger) pressure() f32 {
	return this.pressure
}
