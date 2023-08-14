const LightCubeVertexShader = `
attribute vec3 aVertexPosition;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;


void main(void) {

  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aVertexPosition, 1.0);

}
`;

const LightCubeFragmentShader = `
#ifdef GL_ES
precision mediump float;
#endif

uniform float uLigIntensity;
uniform vec3 uLightColor;

void main(void) {
    
  //gl_FragColor = vec4(1,1,1, 1.0);
  gl_FragColor = vec4(uLightColor, 1.0);
}
`;

const VertexShader = `
attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute vec2 aTextureCoord;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

varying highp vec3 vFragPos;
varying highp vec3 vNormal;
varying highp vec2 vTextureCoord;

void main(void) {

  vFragPos = aVertexPosition;
  vNormal = aNormalPosition;

  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aVertexPosition, 1.0);

  vTextureCoord = aTextureCoord;

}
`;

const FragmentShader = `
#ifdef GL_ES
precision mediump float;
#endif

uniform int uTextureSample;
uniform vec3 uKd;
uniform sampler2D uSampler;
uniform vec3 uLightPos;
uniform vec3 uCameraPos;

varying highp vec3 vFragPos;
varying highp vec3 vNormal;
varying highp vec2 vTextureCoord;

void main(void) {
  
  if (uTextureSample == 1) {
    gl_FragColor = texture2D(uSampler, vTextureCoord);
  } 
  else {
    gl_FragColor = vec4(uKd,1);
  }

}
`;

const PhongVertexShader = `
attribute vec3 aVertexPosition;
attribute vec3 aNormalPosition;
attribute vec2 aTextureCoord;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;

varying highp vec2 vTextureCoord;
varying highp vec3 vFragPos;
varying highp vec3 vNormal;

void main(void) {
  // 将模型空间下的顶点位置和法线向量传递给片元着色器进行插值
  vFragPos = aVertexPosition;
  vNormal = aNormalPosition;

  // 将输入的模型空间的顶点进行MVP变换
  gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(aVertexPosition , 1.0);

  // 传递UV坐标给片元着色器进行插值
  vTextureCoord = aTextureCoord;
}
`;

// 片元着色器 在模型空间下计算光照并返回光照计算后的颜色
const PhongFragmentShader = `
#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D uSampler;
//binn
uniform vec3 uKd;
uniform vec3 uKs;
uniform vec3 uLightPos;
uniform vec3 uCameraPos;
uniform float uLightIntensity;
uniform int uTextureSample;

varying highp vec2 vTextureCoord;
varying highp vec3 vFragPos;
varying highp vec3 vNormal;

void main(void) {
  vec3 color;

  // 如果有贴图则对贴图采样 否则使用光照颜色
  if (uTextureSample == 1) {
    color = pow(texture2D(uSampler , vTextureCoord).rgb, vec3(2.2));
  } 
  else {
    color = uKd;
  }

  // 环境光照
  vec3 ambient = 0.05 * color;

  // 计算方向向量
  vec3 lightDir = normalize(uLightPos - vFragPos);   // （模型空间）光照方向
  vec3 normal = normalize(vNormal);                  // （模型空间）法线方向
  vec3 viewDir = normalize(uCameraPos - vFragPos);   // （模型空间）观察向量
  vec3 reflectDir = reflect(-lightDir , normal);     // （模型空间）反射向量 注意方向向量的定义都是朝外

  // 漫反射（衰减前）
  float diff = max(dot(lightDir , normal), 0.0);

  // 计算光照的线性衰减
  float light_atten_coff = uLightIntensity / length(uLightPos - vFragPos);

  // 漫反射（衰减后）
  vec3 diffuse = diff * light_atten_coff * color;

  // 高光反射（衰减前）
  float spec = 0.0;
  spec = pow (max(dot(viewDir , reflectDir), 0.0), 35.0);

  // 高光反射（衰减后）
  vec3 specular = uKs * light_atten_coff * spec;

  // 输出片元颜色 各种光照计算结果的线性叠加
  gl_FragColor = vec4(pow((ambient + diffuse + specular), vec3(1.0 / 2.2)), 1.0);
}
`;