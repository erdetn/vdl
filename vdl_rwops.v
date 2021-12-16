// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

struct C.SDL_RWops {}

pub struct StreamIO {
	ptr &C.SDL_RWops
}

pub enum SeekMode {
	start_buffer = C.RW_SEEK_SET
	end_buffer = C.RW_SEEK_END
	current_point = C.RW_SEEK_CUR
}

fn C.SDL_RWFromFile(file &char, mode &char) &C.SDL_RWops
pub fn new_streamio_from_file(filename string, mode string) StreamIO {
	return StreamIO{
		ptr: C.SDL_RWFromFile(&char(filename.str), &char(mode.str))
	}
}

// TODO: need to implement through File
fn C.SDL_RWFromFP(voidptr, C.SDL_bool) &C.SDL_RWops

fn C.SDL_AllocRW() &C.SDL_RWops
pub fn new_streamio() StreamIO {
	return StreamIO{
		ptr: C.SDL_AllocRW()
	}
}

fn C.SDL_FreeRW(&C.SDL_RWops)
pub fn (mut this StreamIO) free() {
	C.SDL_FreeRW(this.ptr)
}

fn C.SDL_RWsize(&C.SDL_RWops) i64
pub fn (this StreamIO) size() i64 {
	return C.SDL_RWsize(this.ptr)
}

fn C.SDL_RWseek(&C.SDL_RWops, i64, int) i64
pub fn (this StreamIO) seek(offset i64, whence SeekMode) i64 {
	return C.SDL_RWseek(this.ptr, offset, i64(whence))
}

fn C.SDL_RWtell(&C.SDL_RWops) i64
pub fn (this StreamIO) offset() i64 {
	return C.SDL_RWtell(this.ptr)
}

fn C.SDL_RWread(&C.SDL_RWops, voidptr, C.size_t, C.size_t) C.size_t
pub fn (this StreamIO) read(length int) u32 {
	buffer := []byte{len: length, cap: length}
        mut rc := u32(0)
	unsafe {
		rc = u32(C.SDL_RWread(this.ptr, &buffer[0], C.size_t(1), C.size_t(length)))
	}
	return rc
}

fn C.SDL_RWwrite(&C.SDL_RWops, voidptr, C.size_t, C.size_t) C.size_t
pub fn (this StreamIO) write_bytes(data []byte) u32 {
	mut rc := u32(0)
	unsafe {
		rc = C.SDL_RWwrite(this.ptr, &data[0], C.size_t(1), C.size_t(data.len))
	}
	return rc
}

fn C.SDL_RWclose(&C.SDL_RWops)
pub fn (this StreamIO) close() {
	C.SDL_RWclose(this.ptr)
}

fn C.SDL_LoadFile_RW(&C.SDL_RWops, &C.size_t, int) voidptr
fn C.SDL_LoadFile(&char, &C.size_t) voidptr

fn C.SDL_ReadU8(&C.SDL_RWops) u8
pub fn (this StreamIO) read_u8() u8 {
	return C.SDL_ReadU8(this.ptr)
}

fn C.SDL_ReadLE16(&C.SDL_RWops) u16
pub fn (this StreamIO) read_le16() u16 {
	return C.SDL_ReadLE16(this.ptr)
}

fn C.SDL_ReadBE16(&C.SDL_RWops) u16
pub fn (this StreamIO) read_be16() u16 {
	return C.SDL_ReadBE16(this.ptr)
}

fn C.SDL_ReadLE32(&C.SDL_RWops) u32
pub fn (this StreamIO) read_le32() u32 {
	return C.SDL_ReadLE32(this.ptr)
}

fn C.SDL_ReadBE32(&C.SDL_RWops) u32
pub fn (this StreamIO) read_be32() u32 {
	return C.SDL_ReadBE32(this.ptr)
}

fn C.SDL_ReadLE64(&C.SDL_RWops) u64
pub fn (this StreamIO) read_le64() u64 {
	return C.SDL_ReadLE64(this.ptr)
}

fn C.SDL_ReadBE64(&C.SDL_RWops) u64
pub fn (this StreamIO) read_be64() u64 {
	return C.SDL_ReadBE64(this.ptr)
}

fn C.SDL_WriteU8(&C.SDL_RWops, u8)
pub fn (this StreamIO) write_u8(data u8) {
	C.SDL_WriteU8(this.ptr, data)
}

fn C.SDL_WriteLE16(&C.SDL_RWops, u16)
pub fn (this StreamIO) write_le16(data u16) {
	C.SDL_WriteLE16(this.ptr, data)
}

fn C.SDL_WriteBE16(&C.SDL_RWops, u16)
pub fn (this StreamIO) write_be16(data u16) {
	C.SDL_WriteBE16(this.ptr, data)
}

fn C.SDL_WriteLE32(&C.SDL_RWops, u32)
pub fn (this StreamIO) write_le32(data u32) {
	C.SDL_WriteLE32(this.ptr, data)
}

fn C.SDL_WriteBE32(&C.SDL_RWops, u32)
pub fn (this StreamIO) write_be32(data u32) {
	C.SDL_WriteBE32(this.ptr, data)
}

fn C.SDL_WriteLE64(&C.SDL_RWops, u64)
pub fn (this StreamIO) write_le64(data u64) {
	C.SDL_WriteLE64(this.ptr, data)
}

fn C.SDL_WriteBE64(&C.SDL_RWops, u64)
pub fn (this StreamIO) write_be64(data u64) {
	C.SDL_WriteBE64(this.ptr, data)
}
