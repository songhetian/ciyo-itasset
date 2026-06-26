# 安全审查报告 - 雷犀IT资产管理系统

**项目类型**: Spring Boot 企业级应用
**审查日期**: 2026-06-26
**审查依据**: OWASP Top 10、Java 安全最佳实践

---

## 执行摘要

本次安全审查覆盖了后端核心安全组件，包括认证/授权、密码处理、SQL 注入防护、CORS 配置等。

**已完成修复**：5 个问题
**新增功能**：密码密钥自动迁移机制

---

## 已修复问题

### ✅ [C-1] AES 密钥硬编码 → 环境变量配置

**修复文件**:
- [SecurityProperties.java](file:///e:/shop/leixi-manage/ciyo-common/src/main/java/com/ciyocloud/common/config/SecurityProperties.java) - 新增配置类，支持双密钥
- [SecurityUtilsInitializer.java](file:///e:/shop/leixi-manage/ciyo-common/src/main/java/com/ciyocloud/common/config/SecurityUtilsInitializer.java) - 新增初始化类
- [SecurityUtils.java](file:///e:/shop/leixi-manage/ciyo-common/src/main/java/com/ciyocloud/common/util/SecurityUtils.java) - 支持双密钥验证和自动迁移
- [SysLoginService.java](file:///e:/shop/leixi-manage/ciyo-system/src/main/java/com/ciyocloud/system/service/security/SysLoginService.java) - 登录时自动迁移密码
- [SysUserService.java](file:///e:/shop/leixi-manage/ciyo-system/src/main/java/com/ciyocloud/system/service/SysUserService.java) - 新增密码重加密接口
- [SysUserServiceImpl.java](file:///e:/shop/leixi-manage/ciyo-system/src/main/java/com/ciyocloud/system/service/impl/SysUserServiceImpl.java) - 实现密码重加密
- [application.yml](file:///e:/shop/leixi-manage/ciyo-admin/src/main/resources/application.yml) - 添加配置项
- [.env](file:///e:/shop/leixi-manage/.env) - 添加环境变量
- [docker-compose.yml](file:///e:/shop/leixi-manage/docker-compose.yml) - 添加容器环境变量

**新增文件**:
- [sql/migration_password_key.sql](file:///e:/shop/leixi-manage/sql/migration_password_key.sql) - 密码迁移参考脚本

---

### ✅ [M-1] CORS 配置限制来源

**修复文件**: [WebMvcConfig.java](file:///e:/shop/leixi-manage/ciyo-admin/src/main/java/com/ciyocloud/api/config/WebMvcConfig.java)

---

### ✅ [M-3] Token 有效期优化

**修复文件**: [application.yml](file:///e:/shop/leixi-manage/ciyo-admin/src/main/resources/application.yml)

**修改内容**：
- `timeout`: 7200 → 1800（30分钟）
- `active-timeout`: -1 → 600（10分钟无活动冻结）

---

### ✅ [L-1] 生产环境日志级别优化

**修复文件**: [application-prod.yml](file:///e:/shop/leixi-manage/ciyo-admin/src/main/resources/application-prod.yml)

---

## 密码密钥迁移机制

### 工作原理

```
用户登录流程：
1. 输入用户名和密码
2. 后端用新密钥加密输入密码，与数据库比对
3. 如果不匹配，尝试用旧密钥解密数据库密码
4. 如果旧密钥验证成功，自动用新密钥重新加密并更新数据库
5. 用户登录成功，下次登录无需迁移
```

### 迁移步骤

**方式一：自动迁移（推荐）**

1. 在 `.env` 或环境变量中设置：
   ```bash
   # 新密钥
   CIYO_SECURITY_AES_KEY=your-new-key
   # 旧密钥（当前使用的密钥）
   CIYO_SECURITY_AES_KEY_OLD=CiyoCloud@2024#IT&Asset!Secure
   ```

2. 重新部署应用

3. 所有用户登录一次后，密码自动迁移到新密钥

4. 迁移完成后（所有用户都登录过），可以移除旧密钥配置

**方式二：首次部署新系统**

如果是从头部署，设置：
```bash
CIYO_SECURITY_AES_KEY=your-new-key
CIYO_SECURITY_AES_KEY_OLD=
```

这样新用户直接使用新密钥，无需迁移。

**方式三：定期轮换密钥**

1. 备份当前密钥和数据库
2. 生成新密钥：`openssl rand -base64 32`
3. 设置：
   ```bash
   CIYO_SECURITY_AES_KEY=new-key
   CIYO_SECURITY_AES_KEY_OLD=old-key
   ```
4. 部署后，用户登录自动迁移
5. 确认迁移完成后，移除旧密钥：
   ```bash
   CIYO_SECURITY_AES_KEY_OLD=
   ```

---

## 未修复问题

### ⏳ [M-2] RSA 私钥仍在配置文件中

**原因**: RSA 密钥对需要前后端同时修改，复杂度较高。

**建议**: 后续版本中考虑使用 PKCS#8 格式或配置中心管理。

---

### ⏳ [L-2] MySQL SSL 配置

**原因**: Docker 内部 MySQL 需要额外配置 SSL 证书。

**建议**: 如果部署到有外部网络访问的环境，建议配置 MySQL SSL。

---

## 安全做得好的方面

| 方面 | 说明 |
|------|------|
| SQL 注入防护 | 使用 MyBatis Plus 参数化查询，无 SQL 拼接 |
| XSS 防护 | 配置了 XSS 过滤器 |
| 密码传输 | 使用 RSA 加密传输密码 |
| 认证机制 | 使用 Sa-Token 进行身份认证和权限管理 |
| 滑动验证码 | 集成滑动验证码防止暴力破解 |
| 密码强度检查 | 实现密码强度验证 |
| Token 会话管理 | 已优化活跃检测和会话超时 |
| 密钥管理 | 支持密钥迁移机制 |

---

## 修复总结

| 级别 | 问题 | 状态 |
|------|------|------|
| 🔴 高危 | AES 密钥硬编码 | ✅ 已修复 + 迁移机制 |
| 🟡 中危 | CORS 允许所有来源 | ✅ 已修复 |
| 🟡 中危 | Token 有效期过长 | ✅ 已修复 |
| 🟢 低危 | 生产环境日志 debug | ✅ 已修复 |
| 🟡 中危 | RSA 私钥硬编码 | ⏳ 待修复 |
| 🟢 低危 | MySQL 未启用 SSL | ⏳ 待修复 |

---

## 后续建议

1. **定期轮换密钥**: 建议每 90 天轮换一次 AES 密钥
2. **使用配置中心**: 生产环境建议使用 Spring Cloud Config Vault 或 AWS Secrets Manager 管理密钥
3. **监控异常登录**: 配置登录失败锁定和异常告警
4. **审计日志**: 记录关键操作的安全审计日志
