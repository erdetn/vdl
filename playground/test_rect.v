module main 

import time
import os
import vdl

fn main() {
	r1 := vdl.new_rectangle(10, 10, 40, 40)
	r2 := vdl.new_rectangle(0, 20, 60, 60)

	if r1.has_point(vdl.Point{20, 20}) {
		println('r1 has point 20, 20')
	} else {
		println('point 20, 20 is out of r1')
	}

	if r1.has_point(vdl.Point{200, 200}) {
		println('r1 has point 200, 200')
	} else {
		println('point 200, 200 is out of r1')
	}

	println(r1.str())
	println(r2.str())

	//r3 := vdl.new_rectangle(0, 0, 0, 0)
	r3 := vdl.new_rectangle(0, 0, 10, 10)
	if r3.is_empty() {
		println('r3 is empty')
	} else {
		println('r3 is not empty')
	}

	r4 := vdl.new_rectangle(0, 20, 60, 60)

	if r2 == r4 {
		println('${r2} == ${r4}')
	}

	r5 := vdl.Rectangle{0, 0, 50, 50}
	if r1.has_intersection(r5) {
		println('${r1} intersects with ${r5}')
	} else {
		println('${r1} doesn\'t intersects with ${r5}')
	}

	r6 := r1 % r5
	println('r6 = ${r6}')

	r7 := r1 + r5
	println('r7 = ${r7}')
}