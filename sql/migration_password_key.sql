-- =============================================
-- 密码密钥迁移脚本
-- =============================================
-- 说明：
-- 1. 当更换 AES 密钥后，需要将 CIYO_SECURITY_AES_KEY 设置为新密钥
-- 2. 将 CIYO_SECURITY_AES_KEY_OLD 设置为旧密钥（用于验证现有密码）
-- 3. 用户登录时会自动验证并迁移密码
-- 4. 所有用户登录一次后，密码会自动迁移到新密钥
-- =============================================

-- 查看当前用户密码（用于调试）
-- SELECT id, user_name, password FROM sys_user WHERE del_flag = '0';

-- 迁移完成后，可以清理旧的密钥配置
-- UPDATE sys_config SET config_value = NULL WHERE config_key = 'CIYO_SECURITY_AES_KEY_OLD';

-- =============================================
-- 手动强制重置所有用户密码（谨慎使用！）
-- =============================================
-- 此操作会将所有用户的密码重置为指定密码
-- 使用前请确保已备份数据库！
-- =============================================

-- 示例：将所有用户密码重置为 '123456'
-- 需要配合后端的默认密码配置或手动设置
-- UPDATE sys_user
-- SET password = '用新密钥加密后的123456'
-- WHERE del_flag = '0';

-- =============================================
-- 检查迁移进度
-- =============================================
-- 查看密码已迁移的用户数量
-- SELECT COUNT(*) as migrated_count FROM sys_user WHERE password IS NOT NULL;

-- 查看密码未迁移的用户（理论上应该为0）
-- 如果不为0，可能需要检查用户是否已登录过
-- SELECT COUNT(*) as unmigrated_count FROM sys_user
-- WHERE password IS NOT NULL
-- AND user_name != 'admin';
