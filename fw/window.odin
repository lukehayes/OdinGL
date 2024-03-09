package fw

import "core:c"
import "core:fmt"
import "vendor:glfw"
import gl "vendor:OpenGL"

@(private)
PROGRAMNAME :: "Program"

WIDTH :: 800
HEIGHT :: 600

GL_MAJOR_VERSION : c.int : 4
GL_MINOR_VERSION :: 6


initialize :: proc() -> glfw.WindowHandle
{

	glfw.WindowHint(glfw.RESIZABLE, 1)
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR,GL_MAJOR_VERSION) 
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR,GL_MINOR_VERSION)
	glfw.WindowHint(glfw.OPENGL_PROFILE,glfw.OPENGL_CORE_PROFILE)
	
	if(!glfw.Init()){
		fmt.println("Failed to initialize GLFW")
		return nil
	}
	

	window := glfw.CreateWindow(WIDTH, HEIGHT, PROGRAMNAME, nil, nil)
	
	if window == nil {
		fmt.println("Unable to create window")
		return nil
	}
	
	glfw.MakeContextCurrent(window)
	glfw.SwapInterval(1)
	//glfw.SetKeyCallback(window, key_callback)
	//glfw.SetFramebufferSizeCallback(window, size_callback)

	gl.load_up_to(int(GL_MAJOR_VERSION), GL_MINOR_VERSION, glfw.gl_set_proc_address) 

	return window
}

initialize_everything:: proc() -> glfw.WindowHandle
{
	initialize_window()

	window := create_window()

	set_context(&window)

	return window
}

initialize_window :: proc()
{
	glfw.WindowHint(glfw.RESIZABLE, 1)
	glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR,GL_MAJOR_VERSION) 
	glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR,GL_MINOR_VERSION)
	glfw.WindowHint(glfw.OPENGL_PROFILE,glfw.OPENGL_CORE_PROFILE)
	
	if(!glfw.Init()){
		fmt.println("Failed to initialize GLFW")
		return
	}
	
	defer glfw.Terminate()

}

create_window :: proc() -> glfw.WindowHandle
{
	window := glfw.CreateWindow(WIDTH, HEIGHT, PROGRAMNAME, nil, nil)
	
	defer glfw.DestroyWindow(window)
	
	if window == nil {
		fmt.println("Unable to create window")
		return window	
	}

	return window
}

set_context :: proc(window: ^glfw.WindowHandle)
{
	glfw.MakeContextCurrent(window^)
	glfw.SwapInterval(1)
	//glfw.SetKeyCallback(window^, key_callback)
	//glfw.SetFramebufferSizeCallback(window^, size_callback)

	gl.load_up_to(int(GL_MAJOR_VERSION), GL_MINOR_VERSION, glfw.gl_set_proc_address) 
}

