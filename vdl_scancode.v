module vdl

pub enum ScanCode { // C.SDL_Scancode
    unknown = C.SDL_SCANCODE_UNKNOWN // 0

    a = C.SDL_SCANCODE_A // 4
    b = C.SDL_SCANCODE_B // 5
    c = C.SDL_SCANCODE_C // 6
    d = C.SDL_SCANCODE_D // 7
    e = C.SDL_SCANCODE_E // 8
    f = C.SDL_SCANCODE_F // 9
    g = C.SDL_SCANCODE_G // 10
    h = C.SDL_SCANCODE_H // 11
    i = C.SDL_SCANCODE_I // 12
    j = C.SDL_SCANCODE_J // 13
    k = C.SDL_SCANCODE_K // 14
    l = C.SDL_SCANCODE_L // 15
    m = C.SDL_SCANCODE_M // 16
    n = C.SDL_SCANCODE_N // 17
    o = C.SDL_SCANCODE_O // 18
    p = C.SDL_SCANCODE_P // 19
    q = C.SDL_SCANCODE_Q // 20
    r = C.SDL_SCANCODE_R // 21
    s = C.SDL_SCANCODE_S // 22
    t = C.SDL_SCANCODE_T // 23
    u = C.SDL_SCANCODE_U // 24
    v = C.SDL_SCANCODE_V // 25
    w = C.SDL_SCANCODE_W // 26
    x = C.SDL_SCANCODE_X // 27
    y = C.SDL_SCANCODE_Y // 28
    z = C.SDL_SCANCODE_Z // 29

    num_1 = C.SDL_SCANCODE_1 // 30
    num_2 = C.SDL_SCANCODE_2 // 31
    num_3 = C.SDL_SCANCODE_3 // 32
    num_4 = C.SDL_SCANCODE_4 // 33
    num_5 = C.SDL_SCANCODE_5 // 34
    num_6 = C.SDL_SCANCODE_6 // 35
    num_7 = C.SDL_SCANCODE_7 // 36
    num_8 = C.SDL_SCANCODE_8 // 37
    num_9 = C.SDL_SCANCODE_9 // 38
    num_0 = C.SDL_SCANCODE_0 // 39

    @return   = C.SDL_SCANCODE_RETURN // 40
    escape    = C.SDL_SCANCODE_ESCAPE // 41
    backspace = C.SDL_SCANCODE_BACKSPACE // 42
    tab       = C.SDL_SCANCODE_TAB // 43
    space     = C.SDL_SCANCODE_SPACE // 44

    minus         = C.SDL_SCANCODE_MINUS // 45
    equals        = C.SDL_SCANCODE_EQUALS // 46
    left_bracket  = C.SDL_SCANCODE_LEFTBRACKET // 47
    right_bracket = C.SDL_SCANCODE_RIGHTBRACKET // 48
    backslash     = C.SDL_SCANCODE_BACKSLASH // 49 
    nonushash     = C.SDL_SCANCODE_NONUSHASH // 50 
	
    semicolon  = C.SDL_SCANCODE_SEMICOLON // 51
    apostrophe = C.SDL_SCANCODE_APOSTROPHE // 52
    grave      = C.SDL_SCANCODE_GRAVE // 53 
    comma      = C.SDL_SCANCODE_COMMA // 54
    period     = C.SDL_SCANCODE_PERIOD // 55
    slash      = C.SDL_SCANCODE_SLASH // 56

    capslock   = C.SDL_SCANCODE_CAPSLOCK // 57

    f1  = C.SDL_SCANCODE_F1 // 58
    f2  = C.SDL_SCANCODE_F2 // 59
    f3  = C.SDL_SCANCODE_F3 // 60
    f4  = C.SDL_SCANCODE_F4 // 61
    f5  = C.SDL_SCANCODE_F5 // 62
    f6  = C.SDL_SCANCODE_F6 // 63
    f7  = C.SDL_SCANCODE_F7 // 64
    f8  = C.SDL_SCANCODE_F8 // 65
    f9  = C.SDL_SCANCODE_F9 // 66
    f10 = C.SDL_SCANCODE_F10 // 67
    f11 = C.SDL_SCANCODE_F11 // 68
    f12 = C.SDL_SCANCODE_F12 // 69

    printscreen = C.SDL_SCANCODE_PRINTSCREEN // 70
    scroll_lock = C.SDL_SCANCODE_SCROLLLOCK // 71
    pause       = C.SDL_SCANCODE_PAUSE // 72
    insert      = C.SDL_SCANCODE_INSERT // 73 
	
    home      = C.SDL_SCANCODE_HOME // 74
    page_up   = C.SDL_SCANCODE_PAGEUP // 75
    delete    = C.SDL_SCANCODE_DELETE // 76
    end       = C.SDL_SCANCODE_END // 77
    page_down = C.SDL_SCANCODE_PAGEDOWN // 78
    right     = C.SDL_SCANCODE_RIGHT // 79
    left      = C.SDL_SCANCODE_LEFT // 80
    down      = C.SDL_SCANCODE_DOWN // 81
    up        = C.SDL_SCANCODE_UP // 82

    num_lock_clear = C.SDL_SCANCODE_NUMLOCKCLEAR // 83
	
    kp_divide   = C.SDL_SCANCODE_KP_DIVIDE // 84
    kp_multiple = C.SDL_SCANCODE_KP_MULTIPLY // 85
    kp_minus    = C.SDL_SCANCODE_KP_MINUS // 86
    kp_plus     = C.SDL_SCANCODE_KP_PLUS // 87
    kp_enter    = C.SDL_SCANCODE_KP_ENTER // 88

    kp_1 = C.SDL_SCANCODE_KP_1 // 89
    kp_2 = C.SDL_SCANCODE_KP_2 // 90
    kp_3 = C.SDL_SCANCODE_KP_3 // 91
    kp_4 = C.SDL_SCANCODE_KP_4 // 92
    kp_5 = C.SDL_SCANCODE_KP_5 // 93
    kp_6 = C.SDL_SCANCODE_KP_6 // 94
    kp_7 = C.SDL_SCANCODE_KP_7 // 95
    kp_8 = C.SDL_SCANCODE_KP_8 // 96
    kp_9 = C.SDL_SCANCODE_KP_9 // 97
    kp_0 = C.SDL_SCANCODE_KP_0 // 98
    
	kp_period      = C.SDL_SCANCODE_KP_PERIOD // 99

    nonusbackslash = C.SDL_SCANCODE_NONUSBACKSLASH // 100
	
    application = C.SDL_SCANCODE_APPLICATION // 101
    power       = C.SDL_SCANCODE_POWER // 102
	
    kp_equals = C.SDL_SCANCODE_KP_EQUALS // 103
    kp_f13 = C.SDL_SCANCODE_F13 // 104
    kp_f14 = C.SDL_SCANCODE_F14 // 105
    kp_f15 = C.SDL_SCANCODE_F15 // 106
    kp_f16 = C.SDL_SCANCODE_F16 // 107
    kp_f17 = C.SDL_SCANCODE_F17 // 108
    kp_f18 = C.SDL_SCANCODE_F18 // 109
    kp_f19 = C.SDL_SCANCODE_F19 // 110
    kp_f20 = C.SDL_SCANCODE_F20 // 111
    kp_f21 = C.SDL_SCANCODE_F21 // 112
    kp_f22 = C.SDL_SCANCODE_F22 // 113
    kp_f23 = C.SDL_SCANCODE_F23 // 114
    kp_f24 = C.SDL_SCANCODE_F24 // 115

    execute     = C.SDL_SCANCODE_EXECUTE // 116
    help        = C.SDL_SCANCODE_HELP // 117
    menu        = C.SDL_SCANCODE_MENU // 118
    @select     = C.SDL_SCANCODE_SELECT // 119
    stop        = C.SDL_SCANCODE_STOP // 120
    again       = C.SDL_SCANCODE_AGAIN // 121
    undo        = C.SDL_SCANCODE_UNDO // 122
    cut         = C.SDL_SCANCODE_CUT // 123
    copy        = C.SDL_SCANCODE_COPY // 124
    paste       = C.SDL_SCANCODE_PASTE // 125
    find        = C.SDL_SCANCODE_FIND // 126
    mute        = C.SDL_SCANCODE_MUTE // 127
    volume_up   = C.SDL_SCANCODE_VOLUMEUP // 128
    volume_down = C.SDL_SCANCODE_VOLUMEDOWN // 129

    kp_comma     = C.SDL_SCANCODE_KP_COMMA // 133
    kp_equals400 = C.SDL_SCANCODE_KP_EQUALSAS400 // 134

    international_1 = C.SDL_SCANCODE_INTERNATIONAL1 // 135
    international_2 = C.SDL_SCANCODE_INTERNATIONAL2 // 136
    international_3 = C.SDL_SCANCODE_INTERNATIONAL3 // 137
    international_4 = C.SDL_SCANCODE_INTERNATIONAL4 // 138
    international_5 = C.SDL_SCANCODE_INTERNATIONAL5 // 139
    international_6 = C.SDL_SCANCODE_INTERNATIONAL6 // 140
    international_7 = C.SDL_SCANCODE_INTERNATIONAL7 // 141
    international_8 = C.SDL_SCANCODE_INTERNATIONAL8 // 142
    international_9 = C.SDL_SCANCODE_INTERNATIONAL9 // 143

    lang1 = C.SDL_SCANCODE_LANG1 // 144 
    lang2 = C.SDL_SCANCODE_LANG2 // 145 
    lang3 = C.SDL_SCANCODE_LANG3 // 146 
    lang4 = C.SDL_SCANCODE_LANG4 // 147 
    lang5 = C.SDL_SCANCODE_LANG5 // 148
    lang6 = C.SDL_SCANCODE_LANG6 // 149 
    lang7 = C.SDL_SCANCODE_LANG7 // 150
    lang8 = C.SDL_SCANCODE_LANG8 // 151 
    lang9 = C.SDL_SCANCODE_LANG9 // 152

    alt_erase   = C.SDL_SCANCODE_ALTERASE // 153 
    sys_req     = C.SDL_SCANCODE_SYSREQ // 154
    cancel      = C.SDL_SCANCODE_CANCEL // 155
    clear       = C.SDL_SCANCODE_CLEAR // 156
    prior       = C.SDL_SCANCODE_PRIOR // 157
    return2     = C.SDL_SCANCODE_RETURN2 // 158
    separator   = C.SDL_SCANCODE_SEPARATOR // 159
    out         = C.SDL_SCANCODE_OUT // 160
    oper        = C.SDL_SCANCODE_OPER // 161
    clear_again = C.SDL_SCANCODE_CLEARAGAIN // 162
    crsel       = C.SDL_SCANCODE_CRSEL // 163
    excel       = C.SDL_SCANCODE_EXSEL // 164

    kp_00               = C.SDL_SCANCODE_KP_00 // 176
    kp_000              = C.SDL_SCANCODE_KP_000 // 177
    thousands_separator = C.SDL_SCANCODE_THOUSANDSSEPARATOR // 178
    decimal_separator   = C.SDL_SCANCODE_DECIMALSEPARATOR // 179
    current_unit        = C.SDL_SCANCODE_CURRENCYUNIT // 180
    current_subunit     = C.SDL_SCANCODE_CURRENCYSUBUNIT // 181
    kp_left_paren       = C.SDL_SCANCODE_KP_LEFTPAREN // 182
    kp_right_paren      = C.SDL_SCANCODE_KP_RIGHTPAREN // 183
    kp_left_brace       = C.SDL_SCANCODE_KP_LEFTBRACE // 184
    kp_right_brace      = C.SDL_SCANCODE_KP_RIGHTBRACE // 185
    kp_tab              = C.SDL_SCANCODE_KP_TAB // 186
    kp_backspace        = C.SDL_SCANCODE_KP_BACKSPACE // 187

    kp_a = C.SDL_SCANCODE_KP_A // 188
    kp_b = C.SDL_SCANCODE_KP_B // 189
    kp_c = C.SDL_SCANCODE_KP_C // 190
    kp_d = C.SDL_SCANCODE_KP_D // 191
    kp_e = C.SDL_SCANCODE_KP_E // 192
    kp_f = C.SDL_SCANCODE_KP_F // 193
    
	kp_xor                 = C.SDL_SCANCODE_KP_XOR // 194
    kp_power               = C.SDL_SCANCODE_KP_POWER // 195
    kp_percent             = C.SDL_SCANCODE_KP_PERCENT // 196
    kp_less                = C.SDL_SCANCODE_KP_LESS // 197
    kp_greater             = C.SDL_SCANCODE_KP_GREATER // 198
    kp_ampersand           = C.SDL_SCANCODE_KP_AMPERSAND // 199
    kp_double_ampersand    = C.SDL_SCANCODE_KP_DBLAMPERSAND // 200
    kp_vertical_bar        = C.SDL_SCANCODE_KP_VERTICALBAR // 201
    kp_vertical_double_bar = C.SDL_SCANCODE_KP_DBLVERTICALBAR // 202
    kp_colon               = C.SDL_SCANCODE_KP_COLON // 203
    kp_hash                = C.SDL_SCANCODE_KP_HASH // 204
    kp_space               = C.SDL_SCANCODE_KP_SPACE // 205
    kp_at                  = C.SDL_SCANCODE_KP_AT // 206
    kp_exlam               = C.SDL_SCANCODE_KP_EXCLAM // 207
    kp_mem_store           = C.SDL_SCANCODE_KP_MEMSTORE // 208
    kp_mem_call            = C.SDL_SCANCODE_KP_MEMRECALL // 209
    kp_mem_clear           = C.SDL_SCANCODE_KP_MEMCLEAR // 210
    kp_mem_add             = C.SDL_SCANCODE_KP_MEMADD // 211
    kp_mem_subtract        = C.SDL_SCANCODE_KP_MEMSUBTRACT // 212
    kp_mem_multiple        = C.SDL_SCANCODE_KP_MEMMULTIPLY // 213
    kp_mem_divide          = C.SDL_SCANCODE_KP_MEMDIVIDE // 214
    kp_plus_minus          = C.SDL_SCANCODE_KP_PLUSMINUS // 215
    kp_clear               = C.SDL_SCANCODE_KP_CLEAR // 216
    kp_clear_entry         = C.SDL_SCANCODE_KP_CLEARENTRY // 217
    kp_binary              = C.SDL_SCANCODE_KP_BINARY // 218
    kp_octal               = C.SDL_SCANCODE_KP_OCTAL // 219
    kp_decimal             = C.SDL_SCANCODE_KP_DECIMAL // 220
    kp_hexadecimal         = C.SDL_SCANCODE_KP_HEXADECIMAL // 221

    left_ctrl   = C.SDL_SCANCODE_LCTRL // 224
    left_shift  = C.SDL_SCANCODE_LSHIFT // 225
    left_alt    = C.SDL_SCANCODE_LALT // 226
    left_gui    = C.SDL_SCANCODE_LGUI // 227 
    right_ctrl  = C.SDL_SCANCODE_RCTRL // 228
    right_shift = C.SDL_SCANCODE_RSHIFT // 229
    right_alt   = C.SDL_SCANCODE_RALT // 230
    right_gui   = C.SDL_SCANCODE_RGUI // 231 

    mode = C.SDL_SCANCODE_MODE // 257
	
    audio_next     = C.SDL_SCANCODE_AUDIONEXT // 258
    audio_previous = C.SDL_SCANCODE_AUDIOPREV // 259
    audio_stop     = C.SDL_SCANCODE_AUDIOSTOP // 260
    audio_play     = C.SDL_SCANCODE_AUDIOPLAY // 261
    audio_mute     = C.SDL_SCANCODE_AUDIOMUTE // 262
    media_select   = C.SDL_SCANCODE_MEDIASELECT // 263
    www            = C.SDL_SCANCODE_WWW // 264
    mail           = C.SDL_SCANCODE_MAIL // 265
    calculator     = C.SDL_SCANCODE_CALCULATOR // 266
    computer       = C.SDL_SCANCODE_COMPUTER // 267

    ac_search   = C.SDL_SCANCODE_AC_SEARCH // 268
    ac_home     = C.SDL_SCANCODE_AC_HOME // 269
    ac_back     = C.SDL_SCANCODE_AC_BACK // 270
    ac_forward  = C.SDL_SCANCODE_AC_FORWARD // 271
    ac_stop     = C.SDL_SCANCODE_AC_STOP // 272
    ac_refresh  = C.SDL_SCANCODE_AC_REFRESH // 273
    ac_bookmark = C.SDL_SCANCODE_AC_BOOKMARKS // 274

    brightness_down = C.SDL_SCANCODE_BRIGHTNESSDOWN // 275
    brightness_up   = C.SDL_SCANCODE_BRIGHTNESSUP // 276
    
	display_switch  = C.SDL_SCANCODE_DISPLAYSWITCH // 277
	
    kb_illum_down = C.SDL_SCANCODE_KBDILLUMDOWN // 279
    kb_illum_up   = C.SDL_SCANCODE_KBDILLUMUP // 280
    
	eject = C.SDL_SCANCODE_EJECT // 281
    sleep = C.SDL_SCANCODE_SLEEP // 282

    app1 = C.SDL_SCANCODE_APP1 // 283
    app2 = C.SDL_SCANCODE_APP2 // 284
	
    audio_rewind       = C.SDL_SCANCODE_AUDIOREWIND // 285
    audio_fast_forward = C.SDL_SCANCODE_AUDIOFASTFORWARD // 286

    num_scancodes = C.SDL_NUM_SCANCODES // 512
}

pub fn (this ScanCode)value() int {
    return int(this)
}

pub fn (mut this ScanCode)code(scan_code int) ScanCode{
    this = ScanCode(scan_code)
    return this
}