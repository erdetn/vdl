// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum BlendMode { // SDL_BlendMode
	@none = C.SDL_BLENDMODE_NONE
	blend = C.SDL_BLENDMODE_BLEND
	add = C.SDL_BLENDMODE_ADD
	mod = C.SDL_BLENDMODE_MOD
	invalid = C.SDL_BLENDMODE_INVALID
}

pub enum BlendOperation { // SDL_BlendOperation
	add = C.SDL_BLENDOPERATION_ADD
	subtract = C.SDL_BLENDOPERATION_SUBTRACT
	rev_subtract = C.SDL_BLENDOPERATION_REV_SUBTRACT
	minimum = C.SDL_BLENDOPERATION_MINIMUM
	maximum = C.SDL_BLENDOPERATION_MAXIMUM
}

pub enum BlendFactor { // SDL_BlendFactor
	zero = C.SDL_BLENDFACTOR_ZERO
	one = C.SDL_BLENDFACTOR_ONE
	src_color = C.SDL_BLENDFACTOR_SRC_COLOR
	one_minus_src_color = C.SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR
	src_alpha = C.SDL_BLENDFACTOR_SRC_ALPHA
	one_min_src_alpa = C.SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA
	dts_color = C.SDL_BLENDFACTOR_DST_COLOR
	one_minus_dst_color = C.SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR
	dst_alpha = C.SDL_BLENDFACTOR_DST_ALPHA
	one_minus_dst_alpha = C.SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA
}

fn C.SDL_ComposeCustomBlendMode(C.SDL_BlendFactor, C.SDL_BlendFactor, C.SDL_BlendOperation, C.SDL_BlendFactor, C.SDL_BlendFactor, C.SDL_BlendOperation) C.SDL_BlendMode
pub fn compose_custom_blend_mode(src_color_factor BlendFactor, dst_color_factor BlendFactor, color_operation BlendOperation, src_alpha_factor BlendFactor, dst_alpha_factor BlendFactor, alpha_oper BlendOperation) BlendFactor {
	return BlendFactor(C.SDL_ComposeCustomBlendMode(C.SDL_BlendFactor(src_color_factor),
		C.SDL_BlendFactor(dst_color_factor), C.SDL_BlendOperation(color_operation), C.SDL_BlendFactor(src_alpha_factor),
		C.SDL_BlendFactor(dst_alpha_factor), C.SDL_BlendOperation(alpha_oper)))
}
