// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

struct C.SDL_RWops {}

fn C.SDL_RWFromFile(file &char, mode &char) &C.SDL_RWops
fn C.SDL_RWFromFP(voidptr, C.SDL_bool) &C.SDL_RWops
fn C.SDL_AllocRW() &C.SDL_RWops
fn C.SDL_FreeRW(&C.SDL_RWops)
fn C.SDL_RWsize(&C.SDL_RWops) i64
fn C.SDL_RWseek(&C.SDL_RWops, i64, int) i64
fn C.SDL_RWtell(&C.SDL_RWops) i64
fn C.SDL_RWread(&C.SDL_RWops, voidptr, C.size_t, C.size_t) C.size_t
fn C.SDL_RWwrite(&C.SDL_RWops, voidptr, C.size_t, C.size_t)
fn C.SDL_RWclose(&C.SDL_RWops)
fn C.SDL_LoadFile_RW(&C.SDL_RWops, &C.size_t, int) voidptr
fn C.SDL_LoadFile(&char, &C.size_t) voidptr

fn C.SDL_ReadU8(&C.SDL_RWops) u8
fn C.SDL_ReadLE16(&C.SDL_RWops) u16
fn C.SDL_ReadBE16(&C.SDL_RWops) u16
fn C.SDL_ReadLE32(&C.SDL_RWops) u32
fn C.SDL_ReadBE32(&C.SDL_RWops) u32
fn C.SDL_ReadLE64(&C.SDL_RWops) u64
fn C.SDL_ReadBE64(&C.SDL_RWops) u64

fn C.SDL_WriteU8(&C.SDL_RWops, u8)
fn C.SDL_WriteLE16(&C.SDL_RWops, u16)
fn C.SDL_WriteBE16(&C.SDL_RWops, u16)
fn C.SDL_WriteLE32(&C.SDL_RWops, u32)
fn C.SDL_WriteBE32(&C.SDL_RWops, u32)
fn C.SDL_WriteLE64(&C.SDL_RWops, u64)
fn C.SDL_WriteBE64(&C.SDL_RWops, u64)
