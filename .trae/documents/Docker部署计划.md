# Docker 部署计划

## 项目概述
- **项目名称**: ciyo-itasset (西柚资产管理系统)
- **技术栈**: Java 17 + Spring Boot 3.4.1 (后端) / Vue 3 + Vite + TypeScript (前端)
- **构建工具**: Maven (后端) / pnpm (前端)
- **数据库**: MySQL + H2

## 当前状态分析

### 项目结构
```
leixi-manage/
├── ciyo-admin/          # Spring Boot 主应用 (打包后包含前端dist)
├── ciyo-asset/          # 资产管理模块
├── ciyo-common/         # 公共模块
├── ciyo-file/           # 文件模块
├── ciyo-generator/      # 代码生成模块
├── ciyo-job/            # 定时任务模块
├── ciyo-message/        # 消息模块
├── ciyo-system/         # 系统模块
├── itasset-front/       # Vue 前端项目
└── sql/                 # SQL 初始化脚本
    ├── ciyo-itam.sql    # 主初始化脚本
    └── update_0.2.sql   # 更新脚本
```

### 关键配置
- 后端端口: 8088
- MySQL 数据库连接在 application-prod.yml 中配置
- 前端使用 pnpm，Node >= 20.19.0

## 计划生成的文件

### 1. `.env` 文件
**位置**: `e:\shop\leixi-manage\.env`

包含 Docker 和应用运行所需的环境变量配置。

### 2. `Dockerfile`
**位置**: `e:\shop\leixi-manage\Dockerfile`

多阶段构建：
- **阶段一**: Node 环境构建前端
- **阶段二**: Maven 环境构建后端 JAR
- **阶段三**: 运行最小 JRE + MySQL 客户端

### 3. `docker-compose.yml`
**位置**: `e:\shop\leixi-manage\docker-compose.yml`

包含：
- MySQL 服务（自动初始化 SQL）
- 后端应用服务

### 4. `package.json` (根目录)
**位置**: `e:\shop\leixi-manage\package.json`

快捷指令（带中文备注）：
- `docker:up` - 启动 Docker 环境
- `docker:down` - 停止 Docker 环境
- `docker:build` - 构建 Docker 镜像
- `docker:logs` - 查看 Docker 日志
- `dev` - 本地开发启动后端
- `dev:front` - 本地开发启动前端
- `build:front` - 构建前端
- `build:jar` - 构建后端 JAR

## 实现细节

### .env 文件内容
```env
# MySQL 配置
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_DATABASE=ciyo_itam
MYSQL_ROOT_PASSWORD=root123456
MYSQL_USER=ciyo
MYSQL_PASSWORD=ciyo123456

# 应用配置
APP_HOST=0.0.0.0
APP_PORT=8088

# 前端配置
VITE_APP_BASE_API=/api
```

### Dockerfile 策略
- 前端构建阶段使用 node:20-alpine
- 后端构建阶段使用 maven:3.9-eclipse-temurin-17
- 运行阶段使用 eclipse-temurin:17-jre-alpine
- 安装 mysql-client 用于数据库初始化

### docker-compose.yml 策略
- 使用 `mysql:8.0` 镜像
- 通过 volume 挂载 SQL 文件到 `/docker-entrypoint-initdb.d/`
- MySQL 容器首次启动时自动执行初始化脚本
- 应用容器通过 `depends_on` 确保 MySQL 就绪后启动

### SQL 初始化
MySQL 容器会自动执行 `/docker-entrypoint-initdb.d/` 目录下的 .sql 文件：
- `sql/ciyo-itam.sql` - 主初始化脚本
- `sql/update_0.2.sql` - 更新脚本

## 验证步骤
1. 确认 `.env` 文件包含所有必要配置
2. 确认 `Dockerfile` 语法正确
3. 确认 `docker-compose.yml` 配置完整
4. 确认 `package.json` 脚本可执行
