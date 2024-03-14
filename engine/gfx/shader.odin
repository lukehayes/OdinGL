package gfx

import gl "vendor:OpenGL"
import "core:os"
import "core:fmt"


Shader :: struct
{
    program : u32
}


create_shader :: proc(vsh_path: string, fsh_path: string) -> Shader {

    shader := Shader {}
    shader.program = gl.CreateProgram()

    vertex_shader_object   : u32
    fragment_shader_object : u32

    load_shader(vsh_path, gl.VERTEX_SHADER, &vertex_shader_object)
    load_shader(fsh_path, gl.FRAGMENT_SHADER, &fragment_shader_object)

    gl.AttachShader(shader.program, vertex_shader_object)
    gl.AttachShader(shader.program, fragment_shader_object)

    gl.LinkProgram(shader.program)
    
    return shader
}

load_shader :: proc(shader_path: string, shader_type: u32, shader_object: ^u32)
{
    shader_object^ = gl.CreateShader(shader_type)
    shader_source, ok := os.read_entire_file(shader_path)
    
    if(!ok) {
        fmt.println("Error loading VERTEX SHADER source")
    }

    length :i32 = i32(len(shader_source))
    data := cstring(raw_data(shader_source))

    gl.ShaderSource(shader_object^, 1, &data, &length)
    gl.CompileShader(shader_object^)
}


load_vertex_source :: proc(vertex_shader_object: ^u32, shader_path:string, shader: ^Shader) {
    vertex_shader_object := gl.CreateShader(gl.VERTEX_SHADER)
    vertex_source, ok := os.read_entire_file(shader_path)
    
    if(!ok) {
        fmt.println("Error loading VERTEX SHADER source")
    }

    length :i32 = i32(len(vertex_source))
    vertex_data := cstring(raw_data(vertex_source))

    gl.ShaderSource(vertex_shader_object, 1, &vertex_data, &length)
    gl.CompileShader(vertex_shader_object)
}

load_fragment_source :: proc(fragment_shader_object: ^u32, shader_path:string, shader: ^Shader) {
    fragment_shader_object := gl.CreateShader(gl.FRAGMENT_SHADER)
    fragment_source, ok := os.read_entire_file(shader_path)

    if(!ok) {
        fmt.println("Error loading FRAGMENT SHADER source")
    }

    length :i32 = i32(len(fragment_source))
    fragment_data := cstring(raw_data(fragment_source))
    gl.ShaderSource(fragment_shader_object, 1, &fragment_data, &length)
    gl.CompileShader(fragment_shader_object)
}
