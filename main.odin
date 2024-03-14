package main

import "core:fmt"
import "core:time"
import gl "vendor:OpenGL"
import SDL "vendor:sdl2"

import "engine"
import "engine/gfx"

running : b32 = true

main :: proc() {

    window := engine.create_window("Hello", 10,100)

    start_tick := time.tick_now()

	loop: for {

		duration := time.tick_since(start_tick)
		t := f32(time.duration_seconds(duration))
		
		// event polling
		event: SDL.Event
		for SDL.PollEvent(&event) != false {
			// #partial switch tells the compiler not to error if every case is not present
			#partial switch event.type {
			case .KEYDOWN:
				#partial switch event.key.keysym.sym {
				case .ESCAPE:
					// labelled control flow
					break loop
				}
			case .QUIT:
				// labelled control flow
				break loop
			}
		}
		
		
        //draw()
		SDL.GL_SwapWindow(window)		
	}

	defer SDL.DestroyWindow(window)


}


init :: proc(){
}

update :: proc(){
}

draw :: proc(){
    gl.ClearColor(0.3, 0.3, 0.7, 1.0)
    gl.Clear(gl.COLOR_BUFFER_BIT)
}
