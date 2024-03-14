#version 330 core
layout (location = 0) in vec3 attr_position;
  
out vec4 vertexColor;

void main()
{
    gl_Position = vec4(attr_position, 1.0);
    vertexColor = vec4(1.0, 1.0, 1.0, 1.0);
}
