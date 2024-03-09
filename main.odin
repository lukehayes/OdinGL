package main

import "core:fmt"
import "core:c"

import gl "vendor:OpenGL"
import "vendor:glfw"
import "fw"

PROGRAMNAME :: "Program"

WIDTH :: 800
HEIGHT :: 600

GL_MAJOR_VERSION : c.int : 4
GL_MINOR_VERSION :: 6

running : b32 = true

main :: proc() {

	window := fw.initialize()


	glfw.SetKeyCallback(window, key_callback)

	//init()

	ctx := fw.GLContext {}
	fw.init_vertex_array(&ctx)
	fw.init_vertex_buffer(&ctx)
	fw.set_buffer_data(&ctx)

	for (!glfw.WindowShouldClose(window) && running) {
		
		glfw.PollEvents()
		
		update()
		draw()
		
		glfw.SwapBuffers((window))
	}

	defer glfw.Terminate()
	defer glfw.DestroyWindow(window)

	exit()
}


init :: proc(){
}

update :: proc(){
}

draw :: proc(){
	gl.ClearColor(0.2, 0.3, 0.7, 1.0)
	gl.Clear(gl.COLOR_BUFFER_BIT)
}

exit :: proc(){
	
}

key_callback :: proc "c" (window: glfw.WindowHandle, key, scancode, action, mods: i32) {
	if key == glfw.KEY_SPACE {
		running = false
	}
}


size_callback :: proc "c" (window: glfw.WindowHandle, width, height: i32) {
	gl.Viewport(0, 0, width, height)
}
