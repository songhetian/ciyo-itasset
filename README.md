# 西柚（若依）资产设备管理系统

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4+-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Vue](https://img.shields.io/badge/Vue-3.5+-4fc08d.svg)](https://vuejs.org/)
[![License](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](LICENSE)

**西柚 (Ciyo ITAM)** —— 重新定义企业级 IT 资产治理。基于 **Spring Boot 3** + **Vue 3** 顶级架构，打造全生命周期数字化管理利器。

> ** 基于若依 极致对标 Snipe-IT · 深度适配中国企业级流程 · 让每一件资产都有迹可循**

告别传统资产管理的低效与混乱。本系统不仅深度吸纳了 Snipe-IT 的全球化管理逻辑，更针对国内复杂的 **动态审批流**、**多维盘点策略** 及 **精细化权限隔离** 进行了底层重构。为企业提供一套从入库到报废、从财务到运维的 360° 全链路资产数字化治理方案。

> **📢 最新动态：0.4 版本正式发布，支持自定义表单和数据权限，[点击跳转](#交流群)领取最新版本。**

## 🔗 在线演示

- **地址**: [https://itam.ciyocloud.cn/](https://itam.ciyocloud.cn/)
- **账号**: `test`
- **密码**: `123456`

## 📚 部署文档

- **发布包部署（新手强烈推荐）**: [点击查看详细文档](https://gitee.com/sanbox/ciyo-itasset/wikis/%E5%8F%91%E5%B8%83%E5%8C%85%E9%83%A8%E7%BD%B2)

## ✨ 核心功能

- **🚀 资产全生命周期闭环管理**：覆盖入库、领用、借用、调拨、盘点、维修到报废的 100% 流程节点，实现“账、物、人”三位一体的精准追踪。
- **🎨 智联表单与元数据引擎**：首创 **零代码自定义表单**，支持动态扩展字段，无论办公、生产还是授权资产，皆能完美适配，无需二次开发。
- **🛡️ 金融级权限与数据隔离**：基于 RBAC + **多层级审批数据权限** 模型，支持集团化组织架构，确保跨部门、跨区域数据的高度安全与流转合规。
- **📊 智能盘点专家系统**：移动端扫码秒级盘点，云端自动实时比对，一键生成差异审计报告，让资产盘点效率提升 200%。
- **📈 深度财务折旧建模**：内置线性、余额递减等多种主流折旧算法，自动计算资产净值与财务分摊，为企业决策提供实时数据支撑。
- **☁️ 云原生全场景集成**：原生兼容主流 OSS（阿里云、腾讯云、Minio）及多通道 SMS，轻松应对高并发、大容量业务场景。

## 🛠️ 技术架构

### 后端 (Backend)

- **核心框架**: Spring Boot 3.4
- **持久层**: MyBatis Plus 3.5.16
- **数据库**: MySQL 9.5+, H2 (用于单元测试)
- **文档方案**: Knife4j + OpenAPI 3
- **加密鉴权**: JJWT, BCrypt
- **工具链**: Hutool, Lombok, MapStruct, EasyExcel
- **消息与任务**: Quartz (Job), WebSocket

### 前端 (Frontend)

- **核心框架**: Vue 3.5 (Composition API)
- **构建工具**: Vite 7.1
- **UI 组件库**: Element Plus
- **样式引擎**: UnoCSS (Atomic CSS)
- **状态管理**: Pinia
- **协作开发**: TypeScript, ESLint, Prettier

## 📂 项目模块

```text
ciyo-itasset
├── ciyo-admin        # 管理后台入口，包含 API 控制层与安全配置
├── ciyo-asset        # 资产管理业务逻辑核心
├── ciyo-common       # 通用工具类、常量、基础组件
├── ciyo-file         # 文件存储服务，集成多种 OSS
├── ciyo-generator    # 快速开发代码生成器
├── ciyo-job          # 分布式定时任务处理
├── ciyo-message      # 消息中心，支持邮件、短信、站内信
├── ciyo-system       # 系统基础管理（用户、角色、字典、日志）
└── itasset-front     # Vue3 前端工程
```

## 🚀 快速开始

### 1. 环境准备

- JDK 17+
- MySQL 8.0+
- Redis (可选，用于缓存)
- Node.js 20+ & pnpm 8+

### 2. 后端运行

1. 克隆项目：`git clone https://gitee.com/your-repo/ciyo-itasset.git`
2. 创建数据库 `ciyo_itasset` 并导入 `sql/ciyo-itam.sql` 脚本。
3. 修改 `ciyo-admin/src/main/resources/application-prod.yml` 中的数据库配置。
4. 运行 `com.ciyocloud.api.CiyoAssetApiApplication` 即可。

### 3. 前端运行

```bash
cd itasset-front
pnpm install
pnpm dev
```

## 📅 战略规划

- **🔄 AI 智能审批引擎**：引入决策模型，实现低风险流程自动流转，进一步压缩管理成本。
- **📈 资产全景看板 (BI)**：基于大数据的多维透视分析，助力企业实现从“管理资产”到“治理资产”的质变。
- **🔗 企业生态集成**：深度打通企业微信、钉钉及主流 ERP 系统，实现资产数据的无缝流动。

## 鸣谢

- [RuoYi](https://gitee.com/y_project/RuoYi)：优秀的开源后台管理系统框架。
- [Snipe-IT](https://github.com/snipe/snipe-it)：功能强大的开源资产管理系统，本项目业务逻辑参考对象。
- [Art Design Pro](https://github.com/Daymychen/art-design-pro)：极具视觉美感的 Vue3 管理后台模板，本项目前端脚手架。

## 交流群

<img src="readmeimg/微信图片_20260309094638_106_20.jpg" width="500" height="400" alt="交流群">

## 📄 许可证

本项目遵循 [GPL-3.0 License](LICENSE) 协议。
