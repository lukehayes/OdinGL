#version 330 core

layout (location = 0) in vec3 vtx_position;
layout (location = 1) in vec4 model_color;
layout (location = 2) in mat4 model_matrix;
  
out vec4 vertexColor;
uniform mat4 projection;

void main()
{
    gl_Position = projection * model_matrix * vec4(vtx_position, 1.0);
    vertexColor = vec4(1.0f);
}
