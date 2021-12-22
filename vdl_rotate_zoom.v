// Copyright(C) 2021 Erdet Nasufi. All rights reserved.

module vdl

pub enum Smoothing {
	on = 1
	off = 0
}

fn C.rotozoomSurface(src &C.SDL_Surface, angle f64, zoom f64, smooth int) &C.SDL_Surface
pub fn (this Surface) rotate_zoom(angle f64, zoom f64, smooth Smoothing) Surface {
	return Surface{
		ptr: C.rotozoomSurface(this.ptr, angle, zoom, int(smooth))
	}
}

fn C.rotozoomSurfaceXY(src &C.SDL_Surface, angle f64, zoomx f64, zoomy f64, smooth f64) &C.SDL_Surface
pub fn (this Surface) rotate_zoom_xy(angle f64, zoom_x f64, zoom_y f64, smooth Smoothing) Surface {
	return Surface{
		ptr: C.rotozoomSurfaceXY(this.ptr, angle, zoom_x, zoom_y, int(smooth))
	}
}

fn C.zoomSurface(src &C.SDL_Surface, zoomx f64, zoomy f64, smooth f64) &C.SDL_Surface
pub fn (this Surface) zoom(zoom_x f64, zoom_y f64, smooth Smoothing) Surface {
	return Surface{
		ptr: C.zoomSurface(this.ptr, zoom_x, zoom_y, int(smooth))
	}
}

fn C.shrinkSurface(src &C.SDL_Surface, factorx int, factory int) &C.SDL_Surface
pub fn (this Surface) shrink(factor_x int, factor_y int) Surface {
	return Surface{
		ptr: C.shrinkSurface(this.ptr, factor_x, factor_y)
	}
}

fn C.rotateSurface90Degrees(src &C.SDL_Surface, num_clockwise_turns int) &C.SDL_Surface
pub fn (this Surface) spin(num_clockwise_turns int) Surface {
	return Surface{
		ptr: C.rotateSurface90Degrees(this.ptr, num_clockwise_turns)
	}
}
