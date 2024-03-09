package fw

import gl "vendor:OpenGL"
import "core:math/rand"

GLContext :: struct 
{
	vertex_array : u32,
	vertex_buffer : u32,
	shader : int,
}

init_vertex_array ::proc(glcontext: ^GLContext)
{
	vao : u32
	gl.GenVertexArrays(1, &vao)
	gl.BindVertexArray(vao)

	glcontext.vertex_array = vao;
}

init_vertex_buffer ::proc(glcontext: ^GLContext)
{
	vbo : u32
	gl.GenVertexArrays(1, &vbo)
	gl.BindVertexArray(vbo)

	glcontext.vertex_buffer = vbo;
}

set_buffer_data :: proc(glcontext: ^GLContext)
{
	gl.EnableVertexArrayAttrib(glcontext.vertex_array, 0)

	vertices : [9]f32

	for i in 0..<8
	{
		v := rand.float32_range(0,1)
		vertices[i] = v
	}

	gl.BufferData(gl.ARRAY_BUFFER, len(vertices)*size_of(vertices[0]), raw_data(&vertices), gl.STATIC_DRAW)

	//gl.BufferData(
		//gl.ARRAY_BUFFER,
		//9,
		//&vertices,
		//)
}
