-- =============================================
-- 密码重置脚本
-- 用法：
--   1. 先运行 Java 生成 AES 加密密码
--   2. 替换下面的 ENCRYPTED_PASSWORD 为生成的值
--   3. 执行 SQL
-- =============================================

-- 重置 admin 用户密码为 123456
-- 注意：password 字段的值需要先用 SecurityUtils.encryptPassword("123456") 生成
-- 生成方法：在本地运行 ciyo-common 模块下的 SecurityUtils.main() 方法

-- UPDATE sys_user SET password = 'ENCRYPTED_PASSWORD' WHERE user_name = 'admin';

-- =============================================
-- 检查 RSA 密钥配置（可选）
-- 如果 sys_config 表中没有 RSA 密钥配置，会使用 application.yml 中的配置
-- =============================================

-- 查看当前系统配置中的密码相关配置
-- SELECT * FROM sys_config WHERE config_key LIKE 'sys.user.password%';
