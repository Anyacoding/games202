#include "denoiser.h"
#include "util/mathutil.h"
#include <math.h>

Denoiser::Denoiser() : m_useTemportal(false) {}

void Denoiser::Reprojection(const FrameInfo &frameInfo) {
    int height = m_accColor.m_height;
    int width = m_accColor.m_width;
    Matrix4x4 preWorldToScreen =
        m_preFrameInfo.m_matrix[m_preFrameInfo.m_matrix.size() - 1];
    Matrix4x4 preWorldToCamera =
        m_preFrameInfo.m_matrix[m_preFrameInfo.m_matrix.size() - 2];
#pragma omp parallel for
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // TODO: Reproject
            m_valid(x, y) = false;
            m_misc(x, y) = Float3(0.f);

            auto worldPosition = frameInfo.m_position(x, y);
            int id = (int)frameInfo.m_id(x, y);

            if (id == -1) continue;

            auto transform = preWorldToScreen * m_preFrameInfo.m_matrix[id] * Inverse(frameInfo.m_matrix[id]);
            auto preScreenPosition = transform(worldPosition, Float3::EType::Point);

            int preX = (int)preScreenPosition.x, preY = (int)preScreenPosition.y;

            if (preX < 0 || preX >= width || preY < 0 || preY >= height) {
                continue;
            }
            else {
                if (frameInfo.m_id(x, y) == m_preFrameInfo.m_id(preX, preY)) {
                    // 合法性通过
                    m_valid(x, y) = true;
                    // 将上一帧的结果投影到当前帧
                    m_misc(x, y) = m_accColor(preX, preY);
                }
            }
        }
    }
    std::swap(m_misc, m_accColor);
}

void Denoiser::TemporalAccumulation(const Buffer2D<Float3> &curFilteredColor) {
    int height = m_accColor.m_height;
    int width = m_accColor.m_width;
    int kernelRadius = 3;
#pragma omp parallel for
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // TODO: Temporal clamp
            Float3 color = m_accColor(x, y);
            // TODO: Exponential moving average
            float alpha = 1;



            if (m_valid(x, y)) {
                alpha = m_alpha;

                int x_start = std::max(0, x - kernelRadius);
                int x_end   = std::min(width - 1, x + kernelRadius);
                int y_start = std::max(0, y - kernelRadius);
                int y_end   = std::min(height - 1, y + kernelRadius);

                Float3 mu = 0.0f;
                Float3 sigma = 0.0f;

                for (int m = y_start; m <= y_end; ++m) {
                    for (int n = x_start; n <= x_end; ++n) {
                        mu += curFilteredColor(n, m);
                        sigma += Sqr(curFilteredColor(n, m) - curFilteredColor(x, y));
                    }
                }

                auto n = (2.0f * kernelRadius + 1) * (2.0f * kernelRadius + 1);
                mu /= n;
                sigma = SafeSqrt(sigma / n);
                color = Clamp(color, mu - sigma * m_colorBoxK, mu + sigma * m_colorBoxK);

                Clamp(color, mu - sigma * m_colorBoxK, mu + sigma * m_colorBoxK);
            }

            m_misc(x, y) = Lerp(color, curFilteredColor(x, y), alpha);
        }
    }
    std::swap(m_misc, m_accColor);
}

Buffer2D<Float3> Denoiser::Filter(const FrameInfo &frameInfo) {
    int height = frameInfo.m_beauty.m_height;
    int width = frameInfo.m_beauty.m_width;
    Buffer2D<Float3> filteredImage = CreateBuffer2D<Float3>(width, height);
    int kernelRadius = 16;
#pragma omp parallel for
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            // TODO: Joint bilateral filter

            int x_start = std::max(0, x - kernelRadius);
            int x_end   = std::min(width - 1, x + kernelRadius);
            int y_start = std::max(0, y - kernelRadius);
            int y_end   = std::min(height - 1, y + kernelRadius);

            auto center_position = frameInfo.m_position(x, y);
            auto center_normal = frameInfo.m_normal(x, y);
            auto center_color = frameInfo.m_beauty(x, y);

            float total_weight = 0.0f;
            Float3 final_color;

            for (int m = y_start; m <= y_end; ++m) {
                for (int n = x_start; n <= x_end; ++n) {
                    auto position = frameInfo.m_position(n, m);
                    auto color = frameInfo.m_beauty(n, m);
                    auto normal = frameInfo.m_normal(n, m);

                    auto position_part = SqrDistance(position, center_position) / (2.0f * m_sigmaCoord * m_sigmaCoord);
                    auto color_part = SqrDistance(color, center_color) / (2.0f * m_sigmaColor * m_sigmaColor);


                    auto normal_part = SafeAcos(Dot(center_normal, normal));
                    normal_part = normal_part * normal_part / (2.0f * m_sigmaNormal * m_sigmaNormal);

                    auto plane_part = 0.0f;
                    if (position_part > 0.0f) {
                        plane_part = Dot(center_normal, Normalize(position - center_position));
                    }
                    plane_part = plane_part * plane_part / (2.0f * m_sigmaPlane * m_sigmaPlane);

                    auto weight = std::exp(-position_part - color_part - normal_part - plane_part);
                    total_weight += weight;
                    final_color += color * weight;
                }
            }

            if (total_weight != 0.0f) {
                filteredImage(x, y) = final_color / total_weight;
            }
            else {
                filteredImage(x, y) = frameInfo.m_beauty(x, y);
            }
        }
    }

    return filteredImage;
}

void Denoiser::Init(const FrameInfo &frameInfo, const Buffer2D<Float3> &filteredColor) {
    m_accColor.Copy(filteredColor);
    int height = m_accColor.m_height;
    int width = m_accColor.m_width;
    m_misc = CreateBuffer2D<Float3>(width, height);
    m_valid = CreateBuffer2D<bool>(width, height);
}

void Denoiser::Maintain(const FrameInfo &frameInfo) { m_preFrameInfo = frameInfo; }

Buffer2D<Float3> Denoiser::ProcessFrame(const FrameInfo &frameInfo) {
    // Filter current frame
    Buffer2D<Float3> filteredColor;
    filteredColor = Filter(frameInfo);

    // Reproject previous frame color to current
    if (m_useTemportal) {
        Reprojection(frameInfo);
        TemporalAccumulation(filteredColor);
    } else {
        Init(frameInfo, filteredColor);
    }

    // Maintain
    Maintain(frameInfo);
    if (!m_useTemportal) {
        m_useTemportal = true;
    }
    return m_accColor;
}
