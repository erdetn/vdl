// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

fn C.SDL_QuitRequested()

pub fn quit_requested() {
    C.SDL_QuitRequested()
}

