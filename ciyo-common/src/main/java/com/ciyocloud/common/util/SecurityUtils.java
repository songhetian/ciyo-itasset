package com.ciyocloud.common.util;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.StpUtil;
import com.ciyocloud.common.config.SecurityProperties;
import com.ciyocloud.common.entity.security.LoginUserEntity;
import com.ciyocloud.common.exception.AuthorizationException;
import org.springframework.http.HttpStatus;

/**
 * 安全服务工具类
 *
 * @author codeck
 */
public class SecurityUtils {

    private static final String DEFAULT_AES_KEY = "CiyoCloud@2024#IT&Asset!Secure";

    private static SecurityProperties securityProperties;

    private static SecurityProperties getSecurityProperties() {
        if (securityProperties == null) {
            try {
                securityProperties = SpringContextUtils.getBean(SecurityProperties.class);
            } catch (Exception e) {
                // Spring 上下文不可用时返回 null，后续使用默认值兜底
            }
        }
        return securityProperties;
    }

    private static String getAesKey() {
        SecurityProperties props = getSecurityProperties();
        if (props != null && props.getAesKey() != null && !props.getAesKey().isBlank()) {
            return props.getAesKey();
        }
        return DEFAULT_AES_KEY;
    }

    private static boolean isMigrationMode() {
        SecurityProperties props = getSecurityProperties();
        return props != null && props.isMigrationMode();
    }

    private static String getAesKeyOld() {
        SecurityProperties props = getSecurityProperties();
        if (props != null && props.getAesKeyOld() != null && !props.getAesKeyOld().isBlank()) {
            return props.getAesKeyOld();
        }
        return DEFAULT_AES_KEY;
    }

    /**
     * 获取用户账户
     **/
    public static String getUsername() {
        try {
            return getLoginUser().getUsername();
        } catch (Exception e) {
            throw new AuthorizationException("获取用户账户异常" + HttpStatus.UNAUTHORIZED);
        }
    }

    /**
     * 获取用户账户
     **/
    public static Long getUserId() {
        try {
            return getLoginUser().getUser().getId();
        } catch (Exception e) {
            throw new AuthorizationException("获取用户ID异常" + HttpStatus.UNAUTHORIZED);
        }
    }

    /**
     * 获取用户
     **/
    public static LoginUserEntity getLoginUser() {
        try {
            return (LoginUserEntity) StpUtil.getSession().get("loginUser");
        } catch (Exception e) {
            throw new AuthorizationException("获取用户信息异常" + HttpStatus.UNAUTHORIZED);
        }
    }

    /**
     * 获取用户
     * 不会抛出异常 用于可登录可不登录时使用获取信息
     **/
    public static LoginUserEntity getLoginUserNotEx() {
        try {
            if (!StpUtil.isLogin()) {
                return null;
            }
            return (LoginUserEntity) StpUtil.getSession().get("loginUser");
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 更新登录用户信息到Session
     *
     * @param loginUser 登录用户信息
     */
    public static void setLoginUser(LoginUserEntity loginUser) {
        StpUtil.getSession().set("loginUser", loginUser);
    }


    /**
     * 生成密码（使用 AES 加密）
     *
     * @param password 密码
     * @return 加密字符串
     */
    public static String encryptPassword(String password) {
        return SaSecureUtil.aesEncrypt(getAesKey(), password);
    }


    /**
     * 判断密码是否相同
     *
     * @param rawPassword     真实密码
     * @param encodedPassword 加密后字符
     * @return 结果
     */
    public static boolean matchesPassword(String rawPassword, String encodedPassword) {
        try {
            String newEncrypt = SaSecureUtil.aesEncrypt(getAesKey(), rawPassword);
            if (newEncrypt.equals(encodedPassword)) {
                return true;
            }
            if (isMigrationMode()) {
                String oldDecrypt = SaSecureUtil.aesDecrypt(getAesKeyOld(), encodedPassword);
                if (rawPassword.equals(oldDecrypt)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 判断密码是否相同，并返回是否需要重新加密
     * 用于登录成功后自动迁移密码到新密钥
     *
     * @param rawPassword     真实密码
     * @param encodedPassword 加密后字符
     * @return PasswordMatchResult 包含匹配结果和是否需要重新加密
     */
    public static PasswordMatchResult matchesPasswordWithReencrypt(String rawPassword, String encodedPassword) {
        boolean matched = false;
        boolean needsReencrypt = false;
        try {
            String newEncrypt = SaSecureUtil.aesEncrypt(getAesKey(), rawPassword);
            if (newEncrypt.equals(encodedPassword)) {
                matched = true;
            }
            else if (isMigrationMode()) {
                String oldDecrypt = SaSecureUtil.aesDecrypt(getAesKeyOld(), encodedPassword);
                if (rawPassword.equals(oldDecrypt)) {
                    matched = true;
                    needsReencrypt = true;
                }
            }
        } catch (Exception e) {
            matched = false;
        }
        return new PasswordMatchResult(matched, needsReencrypt);
    }

    /**
     * 密码匹配结果
     */
    public record PasswordMatchResult(boolean matched, boolean needsReencrypt) {
    }

    /**
     * 是否为管理员
     *
     * @param userId 用户ID
     * @return 结果
     */
    public static boolean isAdmin(Long userId) {
        return userId != null && 1L == userId;
    }

    /**
     * 是否为管理员
     *
     * @return 结果
     */
    public static boolean isAdmin() {
        return isAdmin(getUserId());
    }

    /**
     * 检查当前用户是否拥有指定权限
     *
     * @param permission 权限标识
     * @return 是否拥有权限
     */
    public static boolean hasPermission(String permission) {
        return StpUtil.hasPermission(permission);
    }

    /**
     * 检查当前用户是否拥有指定角色
     *
     * @param role 角色标识
     * @return 是否拥有角色
     */
    public static boolean hasRole(String role) {
        return StpUtil.hasRole(role);
    }

    /**
     * 检查当前用户是否拥有指定权限（任意一个）
     *
     * @param permissions 权限标识数组
     * @return 是否拥有权限
     */
    public static boolean hasAnyPermission(String... permissions) {
        if (permissions == null || permissions.length == 0) {
            return false;
        }
        for (String permission : permissions) {
            if (hasPermission(permission)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 检查当前用户是否拥有指定角色（任意一个）
     *
     * @param roles 角色标识数组
     * @return 是否拥有角色
     */
    public static boolean hasAnyRole(String... roles) {
        if (roles == null || roles.length == 0) {
            return false;
        }
        for (String role : roles) {
            if (hasRole(role)) {
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        SecurityProperties props = new SecurityProperties();
        props.setAesKey("CiyoCloud@2024#IT&Asset!Secure");
        securityProperties = props;
        System.out.println(encryptPassword("123456"));
    }
}
