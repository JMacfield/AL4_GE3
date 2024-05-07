#include "Object2D.hlsli"

struct Material {
	float32_t4 color;
	float32_t4x4 uvTransform;
};
ConstantBuffer<Material> gMaterial : register(b0);
Texture2D<float32_t4> gTexture : register(t0);
SamplerState gSampler : register(s0);
struct PixelShaderOutput {
	float32_t4 color : SV_TARGET0;
};
PixelShaderOutput main(VertexShaderOutput input) {
	PixelShaderOutput output;
	//float4 transformedUV = mul(float32_t4(input.texcoord, 0.0f, 1.0f), gMaterial.uvTransform);
	//float32_t4 textureColor = gTexture.Sample(gSampler,input.texcoord);

    output.color = gTexture.Sample(gSampler, input.texcoord);
    float32_t value = dot(output.color.rgb, float32_t3(0.2125f, 0.7154f, 0.0721f));
    output.color.rgb = float32_t3(value, value, value);

	//output.color = gMaterial.color * textureColor;
	return output;
}

