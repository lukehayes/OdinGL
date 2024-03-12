package fw

import gl "vendor:OpenGL"
import "core:os"
import "core:fmt"


Shader :: struct
{
    program : u32
}


create_shader :: proc(vsh_path: string, fsh_path: string) -> Shader {

    shader := Shader {
        gl.CreateProgram()
    }

    // CREATE SHADER PROGRAM
    //shader.program := gl.CreateProgram()

    //Shader* program = malloc(sizeof(Shader));

    //shader.program := shaderProgram;

    /*printf("Shader program: %s \n", vsh);*/

    vertex_shader, fragment_shader := load_shader_source(vsh_path, fsh_path)

    //gl.AttachShader(shader.program, vertex_shader)

    //glAttachShader(program->program, vertexObject);
    //glAttachShader(program->program, fragmentObject);

    //GLint success;

    //glLinkProgram(program->program);

    ///*printf("Shader Linking Error. \n");*/
    //CheckCompileErrors(program->program, GL_LINK_STATUS, 0);

    //printf("Shader Validating. \n");
    //glValidateProgram(program->program);

    //free((char*)vertexSource);
    //free((char*)fragmentSource);

    //return shader;


}

load_shader_source :: proc(vertex_shader_path: string, fragment_shader_path: string) -> (vertex_shader: u32, fragment_shader: u32)
{
    //---------- VERTEX SHADER
    vertex_shader_object := gl.CreateShader(gl.VERTEX_SHADER)

    vertex_shader_source, vsh_ok := os.read_entire_file(vertex_shader_path)


    // TODO READ VERTEX SHADER FILE

    gl.ShaderSource(vertex_shader_object, 1, vertex_shader_source, nil )
    gl.CompileShader(vertex_shader_object)

    //---------- FRAMGMENT SHADER
    fragment_shader_object := gl.CreateShader(gl.FRAGMENT_SHADER)
    fragment_shader_source, fsh_ok := os.read_entire_file(fragment_shader_path)

    // TODO READ FRAGMENT SHADER FILE

    gl.ShaderSource(fragment_shader_object, 1, cast([^]cstring)fragment_shader_source, nil )
    gl.CompileShader(fragment_shader_object)

    return vertex_shader_object, fragment_shader_object
}
