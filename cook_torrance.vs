#version 330 core

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat3 normal_matrix;
uniform    vec3 eye;        // eye position
uniform vec3 lightPos;

layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 normal;

out vec3  n;
out vec3  v;
out vec3  l;

void main(void)
{
    vec4     p =  model * vec4(pos, 1.0);

    gl_Position  = projection * view * p;
    n            = normalize ( normal_matrix * normal );
    v            = normalize ( eye - p.xyz );                    // vector to the eye
    l            = normalize ( lightPos - (p).xyz );
}
