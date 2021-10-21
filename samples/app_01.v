module main 

import vdl

struct Application {
mut:
	is_running bool
	window vdl.Window
	renderer vdl.Renderer
	event vdl.Event
}

fn new_application() Application {
	mut this := Application{}

	vdl.init(vdl.InitializeMode.everything)

	this.window = vdl.new_window('App1', 10, 10, 400, 400, vdl.WindowFlags.fullscreen_desktop)

	this.renderer = this.window.create_renderer(-1, vdl.RendererFlags.accelerated)

	this.event = vdl.Event{@type: 0}

	return this
}

fn (mut this Application)run() {
	this.is_running = true
	this.loop()
}

fn (mut this Application)loop() {
	for {
		if this.is_running == false {
			return
		}
		this.on_event()
		this.update()
		this.render()
		this.renderer.clear()

		vdl.delay(10) // delay 10 [ms]
	}
}

fn (mut this Application)render() {
	this.renderer.set_draw_color(vdl.Color{50, 50, 50, 0})

	win_w, win_h := this.window.size()

	center_x, center_y := int(win_w/2), int(win_h/2)

	this.renderer.fill_rectangle(vdl.Rectangle{0, 0, win_w, win_h})

	box := vdl.Rectangle{center_x, center_y, 200, 200}
	this.renderer.set_draw_color(vdl.Color{200, 200, 200, 0})
	this.renderer.fill_rectangle(box)

	this.renderer.update()
}

fn (mut this Application)update() {
	// no update
}

fn (mut this Application)on_event() {
	if this.event.poll() {
		println('type = ${this.event.@type}')
		match this.event.@type {
			u32(vdl.EventType.keyup) {
				this.is_running = false
				println('any key is pressed.')
				return
			}
			u32(vdl.EventType.keydown) {
				this.is_running = false
				println('any key is pressed.')
				return
			}
			u32(vdl.EventType.quit) {
				this.is_running = false
				println('any key is pressed.')
				return			
			}
			else {
				return
			}
		}
	}
}

fn (mut this Application)free(){
	this.renderer.free()
	this.window.free()
}

fn main() {
	mut app := new_application()

	app.run()
	app.free()

	vdl.quit()
}
