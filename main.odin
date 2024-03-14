package main

import "core:fmt"
import "core:time"
import gl "vendor:OpenGL"
import SDL "vendor:sdl2"

import "engine"
import "engine/gfx"

running : b32 = true

main :: proc() {

    window := engine.create_window("Hello", 1920, 1080)

	// -- OPENGL START

	gfx_context := gfx.GLContext {}

	gfx.init_vertex_array(&gfx_context)
	gfx.init_vertex_buffer(&gfx_context)
	gfx.set_buffer_data(&gfx_context)

	shader := gfx.create_shader(
		"assets/shaders/passthru-vsh.glsl",
		"assets/shaders/passthru-fsh.glsl",
	)

	// -- OPENGL END

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

				case .SPACE:
					fmt.println("Pressed")
				}
			case .QUIT:
				// labelled control flow
				break loop
			}
		}
		
		
		draw()

		gl.UseProgram(shader.program)
		gl.DrawArrays(gl.LINES, 0, #config(VERTEX_COUNT, 2))

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
