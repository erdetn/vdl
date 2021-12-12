// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum SensorType {
	invalide = C.SDL_SENSOR_INVALID
	unknown = C.SDL_SENSOR_UNKNOWN
	accelerometer = C.SDL_SENSOR_ACCEL
	gyroscope = C.SDL_SENSOR_GYRO
}

pub const gravity = f32(9.80665)

fn C.SDL_NumSensors() int
pub fn number_of_sensors() int {
	return C.SDL_NumSensors()
}

fn C.SDL_SensorGetDeviceName(device_index int) &char
pub fn sensor_device_name(device_index int) string {
	mut rstr := ''
	unsafe {
		rstr = cstring_to_vstring(C.SDL_SensorGetDeviceName(device_index))
	}
	return rstr
}

fn C.SDL_SensorGetDeviceType(device_index int) C.SDL_SensorType
pub fn sensor_device_type(device_index int) SensorType {
	return SensorType(C.SDL_SensorGetDeviceType(device_index))
}

fn C.SDL_SensorGetDeviceNonPortableType(device_index int) int
pub fn sensor_device_non_portable_type(device_index int) int {
	return C.SDL_SensorGetDeviceNonPortableType(device_index)
}

fn C.SDL_SensorGetDeviceInstanceID(device_index int) C.SDL_SensorID
pub fn sensor_device_id(device_index int) int {
	return int(C.SDL_SensorGetDeviceInstanceID(device_index))
}

struct C.SDL_Sensor {}

pub struct Sensor {
mut:
	ptr &C.SDL_Sensor
}

pub fn new_sensor() Sensor {
	return Sensor{
		ptr: voidptr(0)
	}
}

fn C.SDL_SensorOpen(device_index int) &C.SDL_Sensor
pub fn (mut this Sensor) open(device_index int) {
	unsafe {
		this.ptr = C.SDL_SensorOpen(device_index)
	}
}

fn C.SDL_SensorFromInstanceID(instance_id C.SDL_SensorID) &C.SDL_Sensor
pub fn new_sensor_from_instance_id(instance_id int) Sensor {
	return unsafe {
		Sensor{
			ptr: C.SDL_SensorFromInstanceID(C.SDL_SensorID(instance_id))
		}
	}
}

fn C.SDL_SensorGetName(&C.SDL_Sensor) &char
pub fn (this Sensor) name() string {
	mut rstr := ''
	unsafe {
		rstr = cstring_to_vstring(C.SDL_SensorGetName(this.ptr))
	}
	return rstr
}

fn C.SDL_SensorGetType(&C.SDL_Sensor) C.SDL_SensorType
pub fn (this Sensor) sensor_type() SensorType {
	return SensorType(C.SDL_SensorGetType(this.ptr))
}

fn C.SDL_SensorGetNonPortableType(&C.SDL_Sensor) int
pub fn (this Sensor) non_portable_type() int {
	return C.SDL_SensorGetNonPortableType(this.ptr)
}

fn C.SDL_SensorGetInstanceID(&C.SDL_Sensor) C.SDL_SensorID
pub fn (this Sensor) id() int {
	return int(C.SDL_SensorGetInstanceID(this.ptr))
}

fn C.SDL_SensorGetData(&C.SDL_Sensor, &f32, int) int
pub fn (this Sensor) data() []f32 {
	data := []f32{len: 3, cap: 3}
	unsafe {
		C.SDL_SensorGetData(this.ptr, &data[0], 3)
	}
	return data
}

fn C.SDL_SensorClose(&C.SDL_Sensor)
pub fn (this Sensor) close() {
	C.SDL_SensorClose(this.ptr)
}

fn C.SDL_SensorUpdate()

[inline]
pub fn sensors_update() {
	C.SDL_SensorUpdate()
}

[inline]
pub fn (this Sensor) update() {
	C.SDL_SensorUpdate()
}
