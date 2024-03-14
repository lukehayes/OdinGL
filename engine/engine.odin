package engine

import "core:c"
import "core:fmt"
import gl "vendor:OpenGL"
import SDL "vendor:/sdl2"

PROGRAMNAME   :: "Program"
WINDOW_WIDTH  :: 800
WINDOW_HEIGHT :: 600

GL_MAJOR_VsERSION : c.int : 4
GL_MINOR_VERSION :: 6


create_window :: proc(title: string, width: i32, height: i32) -> ^SDL.Window {

	window := SDL.CreateWindow(PROGRAMNAME, SDL.WINDOWPOS_UNDEFINED, SDL.WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, {.OPENGL})

	if window == nil {
		fmt.eprintln("Failed to create window")
	}

	set_context(window)

	return window
}

set_context :: proc(window: ^SDL.Window)
{
    gl_context := SDL.GL_CreateContext(window)
    SDL.GL_MakeCurrent(window, gl_context)
	gl.load_up_to(3, 3, SDL.gl_set_proc_address)
}
