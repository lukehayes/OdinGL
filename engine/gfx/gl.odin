package gfx

import gl "vendor:OpenGL"
import "core:math/rand"
import "core:fmt"

VERTEX_COUNT :: 100

GLContext :: struct
{
    vertex_array : u32,
    vertex_buffer : u32,
    shader : int,
}

Vertex :: struct
{
    position : []f32,
    colors : []f32,
}

init_vertex_array ::proc(glcontext: ^GLContext)
{
    gl.GenVertexArrays(1, &glcontext.vertex_array)
    gl.BindVertexArray(glcontext.vertex_array)
}

init_vertex_buffer ::proc(glcontext: ^GLContext)
{
    gl.GenBuffers(1, &glcontext.vertex_buffer)
    gl.BindBuffer(gl.ARRAY_BUFFER, glcontext.vertex_buffer)

    //glcontext.vertex_buffer = vbo;
}

set_buffer_data :: proc(glcontext: ^GLContext)
{
    gl.EnableVertexAttribArray(0)

    vertices : [dynamic]f32

    for i in 0..< VERTEX_COUNT
    {
        v := rand.float32_range(-1.0, +1.0)
        append(&vertices, v)
    }

    fmt.println(vertices)

    gl.BufferData(gl.ARRAY_BUFFER,
        len(vertices) * size_of(vertices[0]), 
        raw_data(vertices),
        gl.STATIC_DRAW,
    )

    //gl.BufferData(
    //gl.ARRAY_BUFFER,
    //9,
    //&vertices,
    //)
}
