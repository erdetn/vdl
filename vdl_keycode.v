// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum KeyCode {
	unknown = C.SDLK_UNKNOWN
	@return = C.SDLK_RETURN // '\r //
	escape = C.SDLK_ESCAPE // '\033 //
	backspace = C.SDLK_BACKSPACE // '\b //
	tab = C.SDLK_TAB // '\t //
	space = C.SDLK_SPACE // '  //
	excaim = C.SDLK_EXCLAIM // '! //
	quote_double = C.SDLK_QUOTEDBL // '" //
	hash = C.SDLK_HASH // '# //
	percent = C.SDLK_PERCENT // '% //
	dollar = C.SDLK_DOLLAR // '$ //
	ampersand = C.SDLK_AMPERSAND // '& //
	quote = C.SDLK_QUOTE // '\' //
	left_parenthesis = C.SDLK_LEFTPAREN // '( //
	right_parenthesis = C.SDLK_RIGHTPAREN // ') //
	asterisk = C.SDLK_ASTERISK // '* //
	plus = C.SDLK_PLUS // '+ //
	comma = C.SDLK_COMMA //  // //
	minus = C.SDLK_MINUS // '- //
	period = C.SDLK_PERIOD // '. //
	slash = C.SDLK_SLASH // '/ //
	num_0 = C.SDLK_0 // '0 //
	num_1 = C.SDLK_1 // '1 //
	num_2 = C.SDLK_2 // '2 //
	num_3 = C.SDLK_3 // '3 //
	num_4 = C.SDLK_4 // 4 //
	num_5 = C.SDLK_5 // 5 //
	num_6 = C.SDLK_6 // 6 //
	num_7 = C.SDLK_7 // 7 //
	num_8 = C.SDLK_8 // 8 //
	num_9 = C.SDLK_9 // 9 //
	colon = C.SDLK_COLON // : //
	semicolon = C.SDLK_SEMICOLON // ; //
	less = C.SDLK_LESS // < //
	equal = C.SDLK_EQUALS // = //
	greater = C.SDLK_GREATER // > //
	question = C.SDLK_QUESTION // ? //
	at = C.SDLK_AT // @ //
	left_bracket = C.SDLK_LEFTBRACKET // [ //
	backslash = C.SDLK_BACKSLASH // \\ //
	right_brackte = C.SDLK_RIGHTBRACKET // ] //
	caret = C.SDLK_CARET // ^ //
	underscore = C.SDLK_UNDERSCORE // _ //
	backquote = C.SDLK_BACKQUOTE // ` //
	a = C.SDLK_a // a //
	b = C.SDLK_b // b //
	c = C.SDLK_c // c //
	d = C.SDLK_d // d //
	e = C.SDLK_e // e //
	f = C.SDLK_f // f //
	g = C.SDLK_g // g //
	h = C.SDLK_h // h //
	i = C.SDLK_i // i //
	j = C.SDLK_j // j //
	k = C.SDLK_k // k //
	l = C.SDLK_l // l //
	m = C.SDLK_m // m //
	n = C.SDLK_n // n //
	o = C.SDLK_o // o //
	p = C.SDLK_p // p //
	q = C.SDLK_q // q //
	r = C.SDLK_r // r //
	s = C.SDLK_s // s //
	t = C.SDLK_t // t //
	u = C.SDLK_u // u //
	v = C.SDLK_v // v //
	w = C.SDLK_w // w //
	x = C.SDLK_x // x //
	y = C.SDLK_y // y //
	z = C.SDLK_z // z //
	capslock = C.SDLK_CAPSLOCK
	f1 = C.SDLK_F1
	f2 = C.SDLK_F2
	f3 = C.SDLK_F3
	f4 = C.SDLK_F4
	f5 = C.SDLK_F5
	f6 = C.SDLK_F6
	f7 = C.SDLK_F7
	f8 = C.SDLK_F8
	f9 = C.SDLK_F9
	f10 = C.SDLK_F10
	f11 = C.SDLK_F11
	f12 = C.SDLK_F12
	printscreen = C.SDLK_PRINTSCREEN
	scroll_lock = C.SDLK_SCROLLLOCK
	pause = C.SDLK_PAUSE
	insert = C.SDLK_INSERT
	home = C.SDLK_HOME
	pageup = C.SDLK_PAGEUP
	delete = C.SDLK_DELETE
	end = C.SDLK_END
	pagedown = C.SDLK_PAGEDOWN
	right = C.SDLK_RIGHT
	left = C.SDLK_LEFT
	down = C.SDLK_DOWN
	up = C.SDLK_UP
	num_lock_clear = C.SDLK_NUMLOCKCLEAR
	kp_divide = C.SDLK_KP_DIVIDE
	kp_multiply = C.SDLK_KP_MULTIPLY
	kp_minus = C.SDLK_KP_MINUS
	kp_plus = C.SDLK_KP_PLUS
	kp_enter = C.SDLK_KP_ENTER
	kp_1 = C.SDLK_KP_1
	kp_2 = C.SDLK_KP_2
	kp_3 = C.SDLK_KP_3
	kp_4 = C.SDLK_KP_4
	kp_5 = C.SDLK_KP_5
	kp_6 = C.SDLK_KP_6
	kp_7 = C.SDLK_KP_7
	kp_8 = C.SDLK_KP_8
	kp_9 = C.SDLK_KP_9
	kp_0 = C.SDLK_KP_0
	kp_period = C.SDLK_KP_PERIOD
	application = C.SDLK_APPLICATION
	power = C.SDLK_POWER
	kp_equals = C.SDLK_KP_EQUALS
	f13 = C.SDLK_F13
	f14 = C.SDLK_F14
	f15 = C.SDLK_F15
	f16 = C.SDLK_F16
	f17 = C.SDLK_F17
	f18 = C.SDLK_F18
	f19 = C.SDLK_F19
	f20 = C.SDLK_F20
	f21 = C.SDLK_F21
	f22 = C.SDLK_F22
	f23 = C.SDLK_F23
	f24 = C.SDLK_F24
	execute = C.SDLK_EXECUTE
	help = C.SDLK_HELP
	menu = C.SDLK_MENU
	@select = C.SDLK_SELECT
	stop = C.SDLK_STOP
	again = C.SDLK_AGAIN
	undo = C.SDLK_UNDO
	cut = C.SDLK_CUT
	copy = C.SDLK_COPY
	paste = C.SDLK_PASTE
	find = C.SDLK_FIND
	mute = C.SDLK_MUTE
	volume_up = C.SDLK_VOLUMEUP
	volume_down = C.SDLK_VOLUMEDOWN
	kp_comma = C.SDLK_KP_COMMA
	kp_equals400 = C.SDLK_KP_EQUALSAS400
	alt_erase = C.SDLK_ALTERASE
	sys_req = C.SDLK_SYSREQ
	cancel = C.SDLK_CANCEL
	clear = C.SDLK_CLEAR
	prior = C.SDLK_PRIOR
	return2 = C.SDLK_RETURN2
	separator = C.SDLK_SEPARATOR
	out = C.SDLK_OUT
	oper = C.SDLK_OPER
	clear_again = C.SDLK_CLEARAGAIN
	crsel = C.SDLK_CRSEL
	excel = C.SDLK_EXSEL
	kp_00 = C.SDLK_KP_00
	kp_000 = C.SDLK_KP_000
	thousands_separator = C.SDLK_THOUSANDSSEPARATOR
	decimal_separator = C.SDLK_DECIMALSEPARATOR
	currency_unit = C.SDLK_CURRENCYUNIT
	currency_subunit = C.SDLK_CURRENCYSUBUNIT
	kp_left_paren = C.SDLK_KP_LEFTPAREN
	lp_right_paren = C.SDLK_KP_RIGHTPAREN
	kp_left_brace = C.SDLK_KP_LEFTBRACE
	kp_right_brac = C.SDLK_KP_RIGHTBRACE
	kp_tab = C.SDLK_KP_TAB
	kp_backspace = C.SDLK_KP_BACKSPACE
	kp_a = C.SDLK_KP_A
	kp_b = C.SDLK_KP_B
	kp_c = C.SDLK_KP_C
	kp_d = C.SDLK_KP_D
	kp_e = C.SDLK_KP_E
	kp_f = C.SDLK_KP_F
	kp_xor = C.SDLK_KP_XOR
	kp_power = C.SDLK_KP_POWER
	kp_percent = C.SDLK_KP_PERCENT
	kp_less = C.SDLK_KP_LESS
	kp_greater = C.SDLK_KP_GREATER
	kp_ampersand = C.SDLK_KP_AMPERSAND
	kp_double_ampersand = C.SDLK_KP_DBLAMPERSAND
	kp_vertical_bar = C.SDLK_KP_VERTICALBAR
	kp_double_vertical_bar = C.SDLK_KP_DBLVERTICALBAR
	kp_colon = C.SDLK_KP_COLON
	kp_hash = C.SDLK_KP_HASH
	kp_space = C.SDLK_KP_SPACE
	kp_at = C.SDLK_KP_AT
	kp_exclamation = C.SDLK_KP_EXCLAM
	kp_mem_store = C.SDLK_KP_MEMSTORE
	kp_mem_recall = C.SDLK_KP_MEMRECALL
	kp_mem_clear = C.SDLK_KP_MEMCLEAR
	kp_mem_add = C.SDLK_KP_MEMADD
	kp_mem_substract = C.SDLK_KP_MEMSUBTRACT
	kp_mem_multiply = C.SDLK_KP_MEMMULTIPLY
	kp_mem_divide = C.SDLK_KP_MEMDIVIDE
	kp_plus_minu = C.SDLK_KP_PLUSMINUS
	kp_clear = C.SDLK_KP_CLEAR
	kp_clear_entry = C.SDLK_KP_CLEARENTRY
	kp_binary = C.SDLK_KP_BINARY
	kp_octal = C.SDLK_KP_OCTAL
	kp_decimal = C.SDLK_KP_DECIMAL
	kp_hexadecimal = C.SDLK_KP_HEXADECIMAL
	left_ctrl = C.SDLK_LCTRL
	left_shift = C.SDLK_LSHIFT
	left_alt = C.SDLK_LALT
	left_gui = C.SDLK_LGUI
	right_ctrl = C.SDLK_RCTRL
	right_shift = C.SDLK_RSHIFT
	right_alt = C.SDLK_RALT
	right_gui = C.SDLK_RGUI
	mode = C.SDLK_MODE
	audio_next = C.SDLK_AUDIONEXT
	audio_previous = C.SDLK_AUDIOPREV
	audio_stop = C.SDLK_AUDIOSTOP
	audio_play = C.SDLK_AUDIOPLAY
	audio_mute = C.SDLK_AUDIOMUTE
	media_select = C.SDLK_MEDIASELECT
	audio_rewind = C.SDLK_AUDIOREWIND
	audio_fast_forwrd = C.SDLK_AUDIOFASTFORWARD
	www = C.SDLK_WWW
	mail = C.SDLK_MAIL
	calculator = C.SDLK_CALCULATOR
	computer = C.SDLK_COMPUTER
	ac_search = C.SDLK_AC_SEARCH
	ac_home = C.SDLK_AC_HOME
	ac_back = C.SDLK_AC_BACK
	ac_forward = C.SDLK_AC_FORWARD
	ac_stop = C.SDLK_AC_STOP
	ac_refresh = C.SDLK_AC_REFRESH
	ac_bookmarks = C.SDLK_AC_BOOKMARKS
	brightness_down = C.SDLK_BRIGHTNESSDOWN
	brightness_up = C.SDLK_BRIGHTNESSUP
	display_switch = C.SDLK_DISPLAYSWITCH
	kb_illum_toggle = C.SDLK_KBDILLUMTOGGLE
	kb_illum_down = C.SDLK_KBDILLUMDOWN
	kb_illum_up = C.SDLK_KBDILLUMUP
	eject = C.SDLK_EJECT
	sleep = C.SDLK_SLEEP
	app1 = C.SDLK_APP1
	app2 = C.SDLK_APP2
}

pub fn (this KeyCode) value() int {
	return int(this)
}

pub fn (mut this KeyCode) code(key_code int) KeyCode {
	this = KeyCode(key_code)
	return this
}

pub enum KeyModifier { // SDL_Keymod
	@none = C.KMOD_NONE // 0x0000
	left_shift = C.KMOD_LSHIFT // 0x0001
	right_shift = C.KMOD_RSHIFT // 0x0002
	left_ctrl = C.KMOD_LCTRL // 0x0040
	right_ctrl = C.KMOD_RCTRL // 0x0080
	left_alt = C.KMOD_LALT // 0x0100
	right_lat = C.KMOD_RALT // 0x0200
	left_gui = C.KMOD_LGUI // 0x0400
	right_gui = C.KMOD_RGUI // 0x0800
	num = C.KMOD_NUM // 0x1000
	caps = C.KMOD_CAPS // 0x2000
	mode = C.KMOD_MODE // 0x4000
	reserved = C.KMOD_RESERVED // 0x8000
}

pub fn (this KeyModifier) value() int {
	return int(this)
}

pub const keymode_ctr = int(C.KMOD_CTRL)

// (KMOD_LCTRL|KMOD_RCTRL)
pub const keymode_shift = int(C.KMOD_SHIFT)

// (KMOD_LSHIFT|KMOD_RSHIFT)
pub const keymode_laft = int(C.KMOD_ALT)

// (KMOD_LALT|KMOD_RALT)
pub const keymod_gui = int(C.KMOD_GUI)

// (KMOD_LGUI|KMOD_RGUI)
