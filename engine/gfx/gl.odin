package gfx

import gl "vendor:OpenGL"
import "core:math/rand"
import "core:fmt"

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

    //vertices := [9]f32 {
    //-0.5, -0.5, 0.0,
     //0.5, -0.5, 0.0,
     //0.0,  0.5, 0.0,
    //}

    vertices : [dynamic]f32

    for i in 0..< #config(VERTEX_COUNT, 2)
    {
        v := rand.float32_range(-1.0, +1.0)
        append(&vertices, v)
    }

    gl.BufferData(
        gl.ARRAY_BUFFER,
        len(vertices) * size_of(vertices[0]), 
        raw_data(vertices),
        gl.STATIC_DRAW,
    )

    gl.VertexAttribPointer(
        0,
        2,
        gl.FLOAT,
        false,
        size_of(vertices),
        0,
    )
}
