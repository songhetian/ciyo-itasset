package com.ciyocloud.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 安全配置属性
 *
 * @author codeck
 */
@Data
@Component
@ConfigurationProperties(prefix = "ciyo.security")
public class SecurityProperties {

    /**
     * 当前 AES 加密密钥（32位，256bit强度）
     * 生产环境必须通过环境变量或配置中心设置，禁止硬编码
     */
    private String aesKey;

    /**
     * 旧 AES 加密密钥（用于密码迁移）
     * 当更换密钥后，旧的加密密码需要用此密钥解密验证
     * 验证成功后会自动用新密钥重新加密存储
     */
    private String aesKeyOld;

    /**
     * 获取当前 AES 密钥
     * 如果未配置，抛出异常（防止生产环境使用默认值）
     */
    public String getAesKey() {
        if (aesKey == null || aesKey.isBlank()) {
            throw new IllegalStateException(
                "AES 密钥未配置！请通过环境变量 CIYO_SECURITY_AES_KEY 或配置项 ciyo.security.aes-key 设置密钥。"
            );
        }
        return aesKey;
    }

    /**
     * 获取旧 AES 密钥（用于密码迁移）
     */
    public String getAesKeyOld() {
        return aesKeyOld;
    }

    /**
     * 是否启用了密钥迁移模式（旧密钥存在且不等于当前密钥）
     */
    public boolean isMigrationMode() {
        return aesKeyOld != null && !aesKeyOld.isBlank() && !aesKeyOld.equals(aesKey);
    }
}
