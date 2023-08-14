class PhongMaterial extends Material {
    /**
    * Creates an instance of PhongMaterial.
    * @param {vec3f} color The material color
    * @param {Texture} colorMap The texture object of the material
    * @param {vec3f} specular The material specular coefficient
    * @param {float} intensity The light intensity
    * @memberof PhongMaterial
    */
    constructor(color, colorMap, specular, intensity) {
        let textureSample = 0;
        
        // 如果有采样的texture 则传递texture
        if (colorMap != null) {
            textureSample = 1;
            super({
                uTextureSample: { type: "1i", value: textureSample }, // 采样纹理还是灯光颜色
                uSampler: { type: "texture", value: colorMap },       // 采样纹理
                uKd: { type: "3fv", value: color },                   // 光源颜色
                uKs: { type: "3fv", value: specular },                // 高光项
                uLightIntensity: { type: "1f", value: intensity },    // 光照强度
            }, [], PhongVertexShader, PhongFragmentShader);
        }
        else {
            super({
                uTextureSample: { type: "1i", value: textureSample }, // 采样灯光颜色
                uKd: { type: "3fv", value: color },                   // 光源颜色
                uKs: { type: "3fv", value: specular },                // 高光项
                uLightIntensity: { type: "1f", value: intensity },    // 光照强度
            }, [], PhongVertexShader, PhongFragmentShader);
        }
    }
}