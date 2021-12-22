# vdl
V wrapper/binder for SDL2

WRAPPED:

- [ ] `begin_code.h`
- [ ] `close_code.h`
- [x] ~~`SDL2_framerate.h`~~ requires DLL on Windows only. 
- [ ] `SDL2_gfxPrimitives.h`
- [ ] `SDL2_imageFilter.h`
- [x] `SDL2_rotozoom.h`. This requires to install `libsdl-gfx*` and `libsdl2-gfx*`.
- [ ] `SDL_assert.h`
- [ ] `SDL_atomic.h`
- [ ] `SDL_audio.h`
- [ ] `SDL_bits.h`
- [x] `SDL_blendmode.h` translated to `vdl_blendmod.v`.
- [x] `SDL_clipboard.h` translated to `vdl_clipboard.v`.
- [ ] `SDL_config.h`
- [x] `SDL_cpuinfo.h` translated to `vdl_cpuinfo.v`.
- [ ] `SDL_egl.h`
- [ ] `SDL_endian.h`
- [x] `SDL_error.h` translated to `vdl_error.v`.
- [x] `SDL_events.h` translated to `vdl_event.v`.
- [ ] `SDL_filesystem.h`
- [ ] `SDL_gamecontroller.h`
- [ ] `SDL_gesture.h`
- [ ] `SDL.h`
- [ ] `SDL_haptic.h`
- [ ] `SDL_hints.h`
- [x] `SDL_image.h` make sure to install `libsdl-image1.2`, `libsdl-image1.2-dev`, `libsdl2-image-2.0-0` and `libsdl2-image-dev`.
- [ ] `SDL_joystick.h`
- [x] `SDL_keyboard.h` translated to `vdl_keyboard.v`.
- [x] `SDL_keycode.h` translated to `vdl_keycode.v`.
- [ ] `SDL_loadso.h`
- [ ] `SDL_log.h`
- [ ] `SDL_main.h`
- [ ] `SDL_messagebox.h`
- [ ] `SDL_mixer.h`
- [ ] `SDL_mouse.h`
- [ ] `SDL_mutex.h`
- [ ] `SDL_name.h`
- [ ] `SDL_net.h`
- [ ] `SDL_opengles2_gl2ext.h`
- [ ] `SDL_opengles2_gl2.h`
- [ ] `SDL_opengles2_gl2platform.h`
- [ ] `SDL_opengles2.h`
- [ ] `SDL_opengles2_khrplatform.h`
- [ ] `SDL_opengles.h`
- [ ] `SDL_opengl_glext.h`
- [ ] `SDL_opengl.h`
- [x] `SDL_pixels.h` translated to `vdl_pixels.v`.
- [ ] `SDL_platform.h`
- [x] `SDL_power.h` translated to `vdl_power.v`.
- [ ] `SDL_quit.h`
- [x] `SDL_rect.h` translated to `vdl_rect.v`.
- [x] `SDL_render.h` translated to `vdl_render.v`.
- [ ] `SDL_revision.h`
- [x] `SDL_rwops.h` translated to `vdl_rwops.v`.
- [x] `SDL_scancode.h` translated to `vdl_scancode.v`.
- [x] `SDL_sensor.h`
- [ ] `SDL_shape.h`
- [ ] ~~`SDL_stdinc.h`~~. No need to translate for now. It contains macros and helper functions.
- [x] `SDL_surface.h` translated to `vdl_surface.v`.
- [ ] `SDL_system.h`
- [ ] `SDL_syswm.h`
- [ ] ~~`SDL_test_assert.h`~~
- [ ] ~~`SDL_test_common.h`~~
- [ ] ~~`SDL_test_compare.h`~~
- [ ] ~~`SDL_test_crc32.h`~~
- [ ] ~~`SDL_test_font.h`~~
- [ ] ~~`SDL_test_fuzzer.h`~~
- [ ] ~~`SDL_test.h`~~
- [ ] ~~`SDL_test_harness.h`~~
- [ ] ~~`SDL_test_images.h`~~
- [ ] ~~`SDL_test_log.h`~~
- [ ] ~~`SDL_test_md5.h`~~
- [ ] ~~`SDL_test_memory.h`~~
- [ ] ~~`SDL_test_random.h`~~
- [ ] ~~`SDL_thread.h`~~ for now, VDL will not support SDL's threads API, but we will use threads from V.
- [x] `SDL_timer.h` translated to `vdl_timer.v`.
- [x] `SDL_touch.h`
- [ ] `SDL_ttf.h`
- [ ] ~~`SDL_types.h`~~ no need for translation. Only `SDL_stdinc.h` is included.
- [x] `SDL_version.h`
- [x] `SDL_video.h` translated to `vdl_video.v`. 
- [ ] `SDL_vulkan.h`

