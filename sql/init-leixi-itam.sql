-- =============================================
-- 雷犀IT资产管理系统 - 初始化数据库脚本
-- 版本: 1.0.0
-- 说明: 包含所有表结构和基础配置数据
-- =============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------

-- ----------------------------
-- Records of gen_table (空表)
-- ----------------------------

DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------

-- ----------------------------
-- Records of gen_table_column (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_accessories`;
CREATE TABLE `itam_accessories` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '配件名称',
  `asset_number` varchar(255) DEFAULT NULL COMMENT '资产编号',
  `category_id` bigint NOT NULL COMMENT '分类 ID',
  `supplier_id` bigint DEFAULT NULL COMMENT '供应商 ID',
  `manufacturer_id` bigint DEFAULT NULL COMMENT '厂商 ID',
  `specifications` varchar(255) DEFAULT NULL COMMENT '规格',
  `location_id` bigint DEFAULT NULL COMMENT '存放位置 ID',
  `depreciation_id` bigint DEFAULT NULL COMMENT '关联折旧规则 ID',
  `quantity` int NOT NULL COMMENT '数量',
  `min_quantity` int DEFAULT NULL COMMENT '最小库存预警',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `warranty_expiration_date` date DEFAULT NULL COMMENT '过保日期',
  `purchase_cost` decimal(18,2) DEFAULT NULL COMMENT '购买成本',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `serial_number` varchar(255) DEFAULT NULL COMMENT '配件序列号',
  `description` text COMMENT '描述',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category` (`category_id`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_manufacturer` (`manufacturer_id`),
  KEY `idx_location` (`location_id`),
  KEY `idx_depreciation` (`depreciation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配件表';

-- ----------------------------

-- ----------------------------
-- Records of itam_accessories (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_allocations`;
CREATE TABLE `itam_allocations` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `item_type` varchar(50) NOT NULL COMMENT '资源类型 (asset, license, accessory)',
  `item_id` bigint NOT NULL COMMENT '资源 ID (对应 itam_assets.id, itam_licenses.id 等)',
  `owner_type` varchar(50) NOT NULL COMMENT '归属者类型 (user:员工, location:地点/部门, asset:设备)',
  `owner_id` bigint NOT NULL COMMENT '归属者 ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '数量 (资产固定为 1，软件/配件可 > 1)',
  `status` varchar(50) NOT NULL DEFAULT 'active' COMMENT '状态 (reserved:预约/规划, active:占用中, returned:已归还)',
  `assign_date` datetime NOT NULL COMMENT '分配/预计领用时间',
  `expected_return_date` datetime DEFAULT NULL COMMENT '预计归还时间',
  `return_date` datetime DEFAULT NULL COMMENT '实际归还时间 (当状态变更为 returned 时填入)',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_item` (`item_type`,`item_id`),
  KEY `idx_owner` (`owner_type`,`owner_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资源分配/领用明细表';

-- ----------------------------

-- ----------------------------
-- Records of itam_allocations (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_asset_requests`;
CREATE TABLE `itam_asset_requests` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `request_no` varchar(64) DEFAULT NULL COMMENT '申请单号',
  `user_id` bigint NOT NULL COMMENT '申请人 ID',
  `item_type` varchar(32) NOT NULL COMMENT '资产类型 (device, license, accessory)',
  `category_id` bigint DEFAULT NULL COMMENT '申请分类 ID',
  `item_id` bigint DEFAULT NULL COMMENT '具体资产 ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '数量',
  `reason` varchar(500) DEFAULT NULL COMMENT '申请原因',
  `status` varchar(32) DEFAULT NULL COMMENT '状态 (pending, approved, rejected, canceled)',
  `approver_id` bigint DEFAULT NULL COMMENT '审批人 ID',
  `approval_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approval_note` varchar(500) DEFAULT NULL COMMENT '审批意见',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '逻辑删除 0:未删除 1:已删除',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_long_term` tinyint(1) DEFAULT '1' COMMENT '是否长期使用 1-是 0-否',
  `expected_return_time` datetime DEFAULT NULL COMMENT '预计归还时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_request_no` (`request_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产申请表';

-- ----------------------------

-- ----------------------------
-- Records of itam_asset_requests (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_categories`;
CREATE TABLE `itam_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `code` varchar(50) NOT NULL COMMENT '分类编码',
  `parent_id` bigint DEFAULT NULL COMMENT '父级 ID',
  `category_type` varchar(50) NOT NULL COMMENT '分类大类',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_code` (`code`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_type` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分类表';

-- ----------------------------

-- ----------------------------
-- Records of itam_categories
-- ----------------------------
BEGIN;
INSERT INTO `itam_categories` (`id`, `name`, `code`, `parent_id`, `category_type`, `deleted`, `create_time`, `create_by`) VALUES
-- 设备分类（category_type: DEVICE）
(1, '台式电脑', 'PC', NULL, 'DEVICE', 0, NOW(), 1),
(2, '笔记本电脑', 'LAPTOP', NULL, 'DEVICE', 0, NOW(), 1),
(3, '服务器', 'SERVER', NULL, 'DEVICE', 0, NOW(), 1),
(4, '显示器', 'MONITOR', NULL, 'DEVICE', 0, NOW(), 1),
(5, '打印机', 'PRINTER', NULL, 'DEVICE', 0, NOW(), 1),
(6, '扫描仪', 'SCANNER', NULL, 'DEVICE', 0, NOW(), 1),
(7, '投影仪', 'PROJECTOR', NULL, 'DEVICE', 0, NOW(), 1),
(8, '交换机', 'SWITCH', NULL, 'DEVICE', 0, NOW(), 1),
(9, '路由器', 'ROUTER', NULL, 'DEVICE', 0, NOW(), 1),
(10, '防火墙', 'FIREWALL', NULL, 'DEVICE', 0, NOW(), 1),
(11, '存储设备', 'STORAGE', NULL, 'DEVICE', 0, NOW(), 1),
(12, '其他设备', 'OTHER', NULL, 'DEVICE', 0, NOW(), 1),

-- 配件分类（category_type: ACCESSORY）
(20, '键盘', 'KB', NULL, 'ACCESSORY', 0, NOW(), 1),
(21, '鼠标', 'MOUSE', NULL, 'ACCESSORY', 0, NOW(), 1),
(22, '耳机', 'HEADSET', NULL, 'ACCESSORY', 0, NOW(), 1),
(23, '摄像头', 'CAM', NULL, 'ACCESSORY', 0, NOW(), 1),
(24, '麦克风', 'MIC', NULL, 'ACCESSORY', 0, NOW(), 1),
(25, '网线', 'CABLE', NULL, 'ACCESSORY', 0, NOW(), 1),
(26, '电源线', 'POWER', NULL, 'ACCESSORY', 0, NOW(), 1),
(27, 'USB转接头', 'USB', NULL, 'ACCESSORY', 0, NOW(), 1),
(28, '内存条', 'RAM', NULL, 'ACCESSORY', 0, NOW(), 1),
(29, '硬盘', 'HDD', NULL, 'ACCESSORY', 0, NOW(), 1),
(30, '其他配件', 'ACC_OTHER', NULL, 'ACCESSORY', 0, NOW(), 1),

-- 耗材分类（category_type: CONSUMABLE）
(40, '打印纸', 'PAPER', NULL, 'CONSUMABLE', 0, NOW(), 1),
(41, '墨盒', 'INK', NULL, 'CONSUMABLE', 0, NOW(), 1),
(42, '硒鼓', 'TONER', NULL, 'CONSUMABLE', 0, NOW(), 1),
(43, '色带', 'RIBBON', NULL, 'CONSUMABLE', 0, NOW(), 1),
(44, 'U盘', 'UDRIVE', NULL, 'CONSUMABLE', 0, NOW(), 1),
(45, '移动硬盘', 'MOBILE_HDD', NULL, 'CONSUMABLE', 0, NOW(), 1),
(46, '光盘', 'CD', NULL, 'CONSUMABLE', 0, NOW(), 1),
(47, '其他耗材', 'CON_OTHER', NULL, 'CONSUMABLE', 0, NOW(), 1);
COMMIT;

DROP TABLE IF EXISTS `itam_consumable_transactions`;
CREATE TABLE `itam_consumable_transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `consumable_id` bigint NOT NULL COMMENT '关联耗材 ID',
  `operator_id` bigint NOT NULL COMMENT '操作人 ID',
  `action_type` varchar(50) NOT NULL COMMENT '变动类型',
  `quantity` int NOT NULL COMMENT '变动数量',
  `remaining_quantity` int NOT NULL COMMENT '变动后结存',
  `target_type` varchar(50) DEFAULT NULL COMMENT '关联对象类型',
  `target_id` bigint DEFAULT NULL COMMENT '关联对象 ID',
  `note` text COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_consumable` (`consumable_id`),
  KEY `idx_operator` (`operator_id`),
  KEY `idx_target` (`target_type`,`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='耗材出入库明细表';

-- ----------------------------

-- ----------------------------
-- Records of itam_consumable_transactions (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_consumables`;
CREATE TABLE `itam_consumables` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '耗材名称',
  `category_id` bigint NOT NULL COMMENT '分类 ID',
  `manufacturer_id` bigint DEFAULT NULL COMMENT '厂商 ID',
  `item_no` varchar(255) DEFAULT NULL COMMENT '物品编号/型号',
  `order_number` varchar(255) DEFAULT NULL COMMENT '采购单号',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `purchase_cost` decimal(18,2) DEFAULT NULL COMMENT '购买成本',
  `quantity` int NOT NULL COMMENT '当前库存数量',
  `min_quantity` int DEFAULT NULL COMMENT '最小库存预警',
  `location_id` bigint DEFAULT NULL COMMENT '存放位置 ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category` (`category_id`),
  KEY `idx_manufacturer` (`manufacturer_id`),
  KEY `idx_item_no` (`item_no`),
  KEY `idx_location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='耗材表';

-- ----------------------------

-- ----------------------------
-- Records of itam_consumables (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_depreciations`;
CREATE TABLE `itam_depreciations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `name` varchar(255) NOT NULL COMMENT '折旧规则名称',
  `status` tinyint DEFAULT '1' COMMENT '1启用 0停用',
  `months` int NOT NULL COMMENT '总折旧月数（展示/校验/索引）',
  `floor_type` varchar(20) NOT NULL DEFAULT 'amount' COMMENT 'amount / percent',
  `floor_val` decimal(18,2) NOT NULL COMMENT '最低残值',
  `stages` json DEFAULT NULL COMMENT '分阶段折旧规则（核心）',
  `remark` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='折旧规则';

-- ----------------------------

-- ----------------------------
-- Records of itam_depreciations (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_device`;
CREATE TABLE `itam_device` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `model_id` bigint NOT NULL COMMENT '关联型号 ID',
  `assets_status` bigint NOT NULL COMMENT '状态',
  `device_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '设备编号',
  `category_id` bigint NOT NULL COMMENT '分类 ID',
  `serial` varchar(255) DEFAULT NULL COMMENT '序列号',
  `name` varchar(255) DEFAULT NULL COMMENT '资产名称',
  `image_url` varchar(500) DEFAULT NULL COMMENT '资产图片',
  `purchase_date` date DEFAULT NULL COMMENT '购买日期',
  `purchase_cost` decimal(18,2) DEFAULT NULL COMMENT '购买成本',
  `warranty_date` date DEFAULT NULL COMMENT '过保日期',
  `assigned_to` bigint DEFAULT NULL COMMENT '分配给谁 (User ID)',
  `location_id` bigint DEFAULT NULL COMMENT '物理位置 ID',
  `supplier_id` bigint DEFAULT NULL COMMENT '供应商 ID',
  `depreciation_id` bigint DEFAULT NULL COMMENT '关联折旧规则 ID',
  `description` text COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_serial` (`serial`),
  KEY `idx_model` (`model_id`),
  KEY `idx_status` (`assets_status`),
  KEY `idx_assigned` (`assigned_to`),
  KEY `idx_location` (`location_id`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_depreciation` (`depreciation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='设备';

-- ----------------------------

-- ----------------------------
-- Records of itam_device (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_device_monthly_stats`;
CREATE TABLE `itam_device_monthly_stats` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assets_type` varchar(32) DEFAULT NULL COMMENT '资产类型 (DEVICES, SOFTWARE, ACCESSORIES, SERVICES, CONSUMABLES等)',
  `assets_id` bigint DEFAULT NULL COMMENT '资产ID',
  `category_id` bigint DEFAULT NULL COMMENT '分类ID',
  `initial_value` decimal(20,4) DEFAULT '0.0000' COMMENT '初始价值(原值)',
  `current_value` decimal(20,4) DEFAULT '0.0000' COMMENT '当前价值',
  `accumulated_depreciation` decimal(20,4) DEFAULT '0.0000' COMMENT '累计折旧',
  `stats_month` varchar(7) DEFAULT NULL COMMENT '统计月份 (YYYY-MM)',
  `stats_date` date DEFAULT NULL COMMENT '统计日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stats_month_type` (`stats_month`,`assets_type`),
  KEY `idx_assets_id_type` (`assets_id`,`assets_type`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_stats_date` (`stats_date`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产月度价值统计表';

-- ----------------------------

-- ----------------------------
-- Records of itam_device_monthly_stats (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_failures`;
CREATE TABLE `itam_failures` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `target_type` varchar(20) NOT NULL COMMENT '关联类型 (offering, asset, accessory, other)',
  `target_id` bigint DEFAULT NULL COMMENT '关联目标 ID',
  `failure_name` varchar(255) DEFAULT NULL COMMENT '故障名称',
  `failure_description` text COMMENT '故障描述',
  `failure_date` datetime DEFAULT NULL COMMENT '故障发生时间',
  `status` varchar(20) DEFAULT 'pending' COMMENT '故障状态',
  `reported_by` bigint DEFAULT NULL COMMENT '报告人 ID',
  `resolved_by` bigint DEFAULT NULL COMMENT '修复人 ID',
  `resolved_date` datetime DEFAULT NULL COMMENT '修复日期',
  `notes` text COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_target` (`target_type`,`target_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='故障表';

-- ----------------------------

-- ----------------------------
-- Records of itam_failures (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_licenses`;
CREATE TABLE `itam_licenses` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `name` varchar(255) NOT NULL COMMENT '软件名称',
  `license_key` text NOT NULL COMMENT '序列号/密钥',
  `total_seats` int NOT NULL COMMENT '总授权数',
  `manufacturer_id` bigint NOT NULL COMMENT '厂商 ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `category_id` bigint DEFAULT NULL COMMENT '分类 ID',
  `min_qty` bigint DEFAULT NULL COMMENT '最少数量',
  `licensed_to_name` varchar(255) DEFAULT NULL COMMENT '许可人名字',
  `licensed_to_email` varchar(255) DEFAULT NULL COMMENT '许可人电子邮件',
  `supplier_id` bigint DEFAULT NULL COMMENT '供应商 ID',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `purchase_cost` decimal(10,2) DEFAULT NULL COMMENT '采购价格',
  `purchase_date` datetime DEFAULT NULL COMMENT '购买日期',
  `expiration_date` datetime DEFAULT NULL COMMENT '到期日期',
  `termination_date` datetime DEFAULT NULL COMMENT '终止日期',
  `purchase_order_number` varchar(255) DEFAULT NULL COMMENT '采购订单号码',
  `notes` text COMMENT '备注',
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  `location_id` bigint DEFAULT NULL COMMENT '存放位置ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_manufacturer` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='软件授权表';

-- ----------------------------

-- ----------------------------
-- Records of itam_licenses (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_location_dept`;
CREATE TABLE `itam_location_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `location_id` bigint NOT NULL COMMENT '位置ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物理位置和部门关联表';

-- ----------------------------

-- ----------------------------
-- Records of itam_location_dept (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_locations`;
CREATE TABLE `itam_locations` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `name` varchar(255) NOT NULL COMMENT '位置名称',
  `parent_id` bigint DEFAULT NULL COMMENT '父级 ID',
  `manager_id` bigint DEFAULT NULL COMMENT '该处负责人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_manager` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物理位置表';

-- ----------------------------

-- ----------------------------
-- Records of itam_locations (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_manufacturers`;
CREATE TABLE `itam_manufacturers` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `name` varchar(255) NOT NULL COMMENT '厂商名称',
  `official_url` varchar(255) DEFAULT NULL COMMENT '官网 URL',
  `support_url` varchar(255) DEFAULT NULL COMMENT '网站客服支持',
  `warranty_url` varchar(255) DEFAULT NULL COMMENT '保修查询 URL',
  `support_phone` varchar(50) DEFAULT NULL COMMENT '电话客服支持',
  `support_email` varchar(100) DEFAULT NULL COMMENT '邮件客服支持',
  `logo_url` varchar(255) DEFAULT NULL COMMENT '厂商 Logo',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='厂商表';

-- ----------------------------

-- ----------------------------
-- Records of itam_manufacturers (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_models`;
CREATE TABLE `itam_models` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '型号名称',
  `image_url` varchar(500) DEFAULT NULL COMMENT '型号图片',
  `manufacturer_id` bigint NOT NULL COMMENT '厂商 ID',
  `category_id` bigint NOT NULL COMMENT '分类 ID',
  `depreciation_id` bigint DEFAULT NULL COMMENT '关联折旧规则 ID',
  `model_number` varchar(255) DEFAULT NULL COMMENT '型号编码',
  `eol` int DEFAULT NULL COMMENT '报废年限 (月)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_manufacturer` (`manufacturer_id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_depreciation` (`depreciation_id`),
  KEY `idx_model_no` (`model_number`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='型号表';

-- ----------------------------

-- ----------------------------
-- Records of itam_models (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_offering`;
CREATE TABLE `itam_offering` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '服务名称',
  `supplier_id` bigint DEFAULT NULL COMMENT '服务商/供应商 ID',
  `service_number` varchar(255) DEFAULT NULL COMMENT '服务单号/合同号',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `cost` decimal(18,2) DEFAULT NULL COMMENT '费用',
  `notes` text COMMENT '备注',
  `offering_status` varchar(10) NOT NULL COMMENT '服务状态',
  `target_type` varchar(50) DEFAULT NULL COMMENT '关联类型',
  `target_id` bigint DEFAULT NULL COMMENT '关联目标 ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `exception_start_date` datetime DEFAULT NULL COMMENT '服务异常开始时间',
  `exception_end_date` datetime DEFAULT NULL COMMENT '服务异常结束时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  `location_id` bigint DEFAULT NULL COMMENT '所属位置ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_supplier` (`supplier_id`),
  KEY `idx_target` (`target_type`,`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务表';

-- ----------------------------

-- ----------------------------
-- Records of itam_offering (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_stocktake_items`;
CREATE TABLE `itam_stocktake_items` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `stocktake_id` bigint NOT NULL COMMENT '关联盘点任务 ID',
  `asset_id` bigint NOT NULL COMMENT '关联资产 ID',
  `status` varchar(50) NOT NULL COMMENT '盘点结果',
  `scanned_by` bigint NOT NULL COMMENT '执行盘点的人员',
  `scanned_at` datetime NOT NULL COMMENT '盘点/扫描时间',
  `expected_location_id` bigint DEFAULT NULL COMMENT '系统记录位置 ID',
  `actual_location_id` bigint DEFAULT NULL COMMENT '实际发现位置 ID',
  `note` text COMMENT '说明/异常备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_stocktake` (`stocktake_id`),
  KEY `idx_asset` (`asset_id`),
  KEY `idx_status` (`status`),
  KEY `idx_scanned_by` (`scanned_by`),
  KEY `idx_expected_loc` (`expected_location_id`),
  KEY `idx_actual_loc` (`actual_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='盘点明细表';

-- ----------------------------

-- ----------------------------
-- Records of itam_stocktake_items (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_stocktakes`;
CREATE TABLE `itam_stocktakes` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `name` varchar(255) NOT NULL COMMENT '盘点任务名称',
  `location_id` bigint DEFAULT NULL COMMENT '盘点位置范围 ID',
  `category_id` bigint DEFAULT NULL COMMENT '盘点分类范围 ID',
  `status` varchar(50) NOT NULL COMMENT '状态',
  `manager_id` bigint NOT NULL COMMENT '负责人 ID',
  `start_date` date DEFAULT NULL COMMENT '计划开始日期',
  `end_date` date DEFAULT NULL COMMENT '计划/实际结束日期',
  `note` text COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_location` (`location_id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_manager` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='盘点任务表';

-- ----------------------------

-- ----------------------------
-- Records of itam_stocktakes (空表)
-- ----------------------------

DROP TABLE IF EXISTS `itam_suppliers`;
CREATE TABLE `itam_suppliers` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `name` varchar(255) NOT NULL COMMENT '供应商名称',
  `contact_name` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者ID',
  `update_by` bigint DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='供应商表';

-- ----------------------------

-- ----------------------------
-- Records of itam_suppliers (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `msg_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '内容',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `sender` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发布人',
  `priority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '优先级（L低，M中，H高）',
  `msg_category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '2' COMMENT '消息类型1:通知公告2:系统消息',
  `msg_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `del_flag` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '删除状态（0，正常，1已删除）',
  `bus_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '业务类型(email:邮件 bpm:流程)',
  `bus_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '业务id',
  `open_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '打开方式(组件：component 路由：url)',
  `open_page` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '组件/路由 地址',
  `user_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '指定用户',
  `msg_abstract` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '摘要',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统通告表';

-- ----------------------------

-- ----------------------------
-- Records of sys_announcement (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_announcement_send`;
CREATE TABLE `sys_announcement_send` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annt_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '通告ID',
  `user_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户id',
  `read_flag` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `annt_id` (`annt_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户通告阅读标记表';

-- ----------------------------

-- ----------------------------
-- Records of sys_announcement_send (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `config_key` (`config_key`) USING BTREE,
  KEY `config_type` (`config_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------

-- ----------------------------
-- Records of sys_config
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', NULL, '2026-01-03 15:17:31', NULL, '2026-01-03 15:17:31', '初始化密码 123456');
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '开启注册账号', 'sys.account.register', 'Y', 'Y', NULL, '2026-01-03 15:17:31', NULL, '2026-01-03 15:17:31', '是否开启注册注册账号 Y（是）N（否）');
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '注册账号默认角色', 'sys.account.register.roleId', '15', 'Y', NULL, '2026-01-03 15:17:31', NULL, '2026-01-03 15:17:31', '注册账号默认角色Id 角色管理角色编号字段');
COMMIT;
-- ----------------------------
-- Table structure for sys_custom_field
-- ----------------------------

DROP TABLE IF EXISTS `sys_custom_field`;
CREATE TABLE `sys_custom_field` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字段主键ID',
  `form_id` bigint NOT NULL COMMENT '所属表单ID',
  `field_key` varchar(50) NOT NULL COMMENT '字段唯一键标识(如 cpu_model)',
  `field_label` varchar(100) NOT NULL COMMENT '字段显示标签名称',
  `field_type` varchar(30) NOT NULL COMMENT '字段组件类型(如 input, select, date 等)',
  `field_props` text COMMENT '字段额外属性配置(JSON格式，如下拉选项、校验规则等)',
  `system_field` tinyint DEFAULT '0' COMMENT '是否系统内置字段（0否 1是）',
  `required` tinyint DEFAULT '0' COMMENT '是否必填（0否 1是）',
  `sort_order` int DEFAULT '0' COMMENT '显示排序(数字越小越靠前)',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_field_form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义字段定义表';

-- ----------------------------

-- ----------------------------
-- Records of sys_custom_field
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (386, 9, 'name', '型号名称', 'input', '{\"id\":\"w_model_name\",\"type\":\"input\",\"label\":\"型号名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入型号名称\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-01 09:20:23', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (387, 9, 'modelNumber', '型号编码', 'input', '{\"id\":\"w_model_modelNumber\",\"type\":\"input\",\"label\":\"型号编码\",\"fieldKey\":\"modelNumber\",\"systemField\":true,\"placeholder\":\"请输入型号编码\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 2, '1', '2026-05-01 09:20:23', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (388, 9, 'manufacturerId', '厂商', 'manufacturer-select', '{\"id\":\"w_model_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"disabled\":false,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 3, '1', '2026-05-01 09:20:24', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (389, 9, 'depreciationId', '折旧规则', 'depreciation-select', '{\"id\":\"w_model_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 4, '1', '2026-05-01 09:20:24', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (390, 9, 'eol', '报废年限 (月)', 'number', '{\"id\":\"w_model_eol\",\"type\":\"number\",\"label\":\"报废年限 (月)\",\"fieldKey\":\"eol\",\"systemField\":true,\"placeholder\":\"请输入报废年限\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 5, '1', '2026-05-01 09:20:24', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (391, 9, 'imageUrl', '型号图片', 'image-upload', '{\"id\":\"w_model_imageUrl\",\"type\":\"image-upload\",\"label\":\"型号图片\",\"fieldKey\":\"imageUrl\",\"systemField\":true,\"placeholder\":null,\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"limit\":1},\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-01 09:20:24', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (460, 3, 'name', '服务名称', 'input', '{\"id\":\"w_name\",\"type\":\"input\",\"label\":\"服务名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入服务名称\",\"required\":true,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-11 14:46:25', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (461, 3, 'supplierId', '供应商', 'supplier-select', '{\"id\":\"w_supplier\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":true,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 2, '1', '2026-05-11 14:46:25', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (462, 3, 'serviceNumber', '服务单号', 'input', '{\"id\":\"w_number\",\"type\":\"input\",\"label\":\"服务单号\",\"fieldKey\":\"serviceNumber\",\"systemField\":true,\"placeholder\":\"请输入服务单号\",\"required\":true,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 3, '1', '2026-05-11 14:46:25', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (463, 3, 'startDate', '购入日期', 'datetime', '{\"id\":\"w_start\",\"type\":\"datetime\",\"label\":\"购入日期\",\"fieldKey\":\"startDate\",\"systemField\":true,\"placeholder\":\"请选择购入日期\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"valueFormat\":\"YYYY-MM-DD HH:mm:ss\"},\"title\":null,\"children\":null}', 1, 0, 4, '1', '2026-05-11 14:46:25', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (464, 3, 'endDate', '过保日期', 'datetime', '{\"id\":\"w_end\",\"type\":\"datetime\",\"label\":\"过保日期\",\"fieldKey\":\"endDate\",\"systemField\":true,\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"valueFormat\":\"YYYY-MM-DD HH:mm:ss\"},\"title\":null,\"children\":null}', 1, 0, 5, '1', '2026-05-11 14:46:26', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (465, 3, 'cost', '价格', 'number', '{\"id\":\"w_cost\",\"type\":\"number\",\"label\":\"价格\",\"fieldKey\":\"cost\",\"systemField\":true,\"placeholder\":\"请输入价格\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"precision\":2,\"prefix\":\"￥\"},\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-11 14:46:26', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (466, 3, 'locationId', '物理位置', 'location-select', '{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"span\":null,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 7, '1', '2026-05-11 14:46:26', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (467, 3, 'notes', '备注', 'textarea', '{\"id\":\"w_notes\",\"type\":\"textarea\",\"label\":\"备注\",\"fieldKey\":\"notes\",\"systemField\":true,\"placeholder\":\"请输入内容\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 8, '1', '2026-05-11 14:46:26', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (511, 10, 'name', '配件名称', 'input', '{\"id\":\"w_acc_name\",\"type\":\"input\",\"label\":\"配件名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入配件名称\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-19 11:04:42', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (512, 10, 'assetNumber', '资产编号', 'input', '{\"id\":\"w_acc_assetNumber\",\"type\":\"input\",\"label\":\"资产编号\",\"fieldKey\":\"assetNumber\",\"systemField\":true,\"placeholder\":\"请输入资产编号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 2, '1', '2026-05-19 11:04:42', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (513, 10, 'categoryId', '分类', 'category-select', '{\"id\":\"w_acc_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":{\"assetType\":\"accessory\"},\"title\":null,\"children\":null}', 1, 1, 3, '1', '2026-05-19 11:04:43', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (514, 10, 'quantity', '数量', 'number', '{\"id\":\"w_acc_quantity\",\"type\":\"number\",\"label\":\"数量\",\"fieldKey\":\"quantity\",\"systemField\":true,\"placeholder\":\"请输入数量\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 1, 4, '1', '2026-05-19 11:04:43', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (515, 10, 'specifications', '规格', 'input', '{\"id\":\"w_acc_specifications\",\"type\":\"input\",\"label\":\"规格\",\"fieldKey\":\"specifications\",\"systemField\":true,\"placeholder\":\"请输入规格\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 5, '1', '2026-05-19 11:04:43', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (516, 10, 'serialNumber', '配件序列号', 'input', '{\"id\":\"w_acc_serialNumber\",\"type\":\"input\",\"label\":\"配件序列号\",\"fieldKey\":\"serialNumber\",\"systemField\":true,\"placeholder\":\"请输入配件序列号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-19 11:04:43', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (517, 10, 'supplierId', '供应商', 'supplier-select', '{\"id\":\"w_acc_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 7, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (518, 10, 'manufacturerId', '制造商', 'manufacturer-select', '{\"id\":\"w_acc_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"制造商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择制造商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 8, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (519, 10, 'locationId', '物理位置', 'location-select', '{\"id\":\"w_acc_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择存放位置\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 9, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (520, 10, 'minQuantity', '最小库存预警', 'number', '{\"id\":\"w_acc_minQuantity\",\"type\":\"number\",\"label\":\"最小库存预警\",\"fieldKey\":\"minQuantity\",\"systemField\":true,\"placeholder\":\"请输入最小库存预警\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 10, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (521, 10, 'purchaseDate', '购买日期', 'datetime', '{\"id\":\"w_acc_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 11, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (522, 10, 'warrantyExpirationDate', '过保日期', 'datetime', '{\"id\":\"w_acc_warrantyDate\",\"type\":\"datetime\",\"label\":\"过保日期\",\"fieldKey\":\"warrantyExpirationDate\",\"systemField\":true,\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 12, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (523, 10, 'purchaseCost', '购买成本', 'input', '{\"id\":\"w_acc_purchaseCost\",\"type\":\"input\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 13, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (524, 10, 'orderNumber', '订单号', 'input', '{\"id\":\"w_acc_orderNumber\",\"type\":\"input\",\"label\":\"订单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入订单号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 14, '1', '2026-05-19 11:04:44', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (525, 10, 'depreciationId', '折旧规则', 'depreciation-select', '{\"id\":\"w_acc_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 15, '1', '2026-05-19 11:04:45', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (526, 10, 'description', '描述', 'textarea', '{\"id\":\"w_acc_description\",\"type\":\"textarea\",\"label\":\"描述\",\"fieldKey\":\"description\",\"systemField\":true,\"placeholder\":\"请输入描述\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 16, '1', '2026-05-19 11:04:45', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (527, 8, 'name', '设备名称', 'input', '{\"id\":\"sys_name\",\"type\":\"input\",\"label\":\"设备名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入设备名称\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":{\"suffixIcon\":\"\",\"maxlength\":null,\"prefixIcon\":\"\"},\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-19 11:04:51', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (528, 8, 'serial', '序列号', 'input', '{\"id\":\"sys_serial\",\"type\":\"input\",\"label\":\"序列号\",\"fieldKey\":\"serial\",\"systemField\":true,\"placeholder\":\"请输入序列号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 2, '1', '2026-05-19 11:04:52', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (529, 8, 'categoryId', '设备分类', 'category-select', '{\"id\":\"sys_categoryId\",\"type\":\"category-select\",\"label\":\"设备分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择设备分类\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":{\"assetType\":\"device\"},\"title\":null,\"children\":null}', 1, 1, 3, '1', '2026-05-19 11:04:53', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (530, 8, 'deviceNo', '设备编号', 'input', '{\"id\":\"sys_deviceNo\",\"type\":\"input\",\"label\":\"设备编号\",\"fieldKey\":\"deviceNo\",\"systemField\":true,\"placeholder\":\"请输入设备编号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 4, '1', '2026-05-19 11:04:54', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (531, 8, 'modelId', '关联型号', 'model-select', '{\"id\":\"sys_modelId\",\"type\":\"model-select\",\"label\":\"关联型号\",\"fieldKey\":\"modelId\",\"systemField\":true,\"placeholder\":\"请选择型号\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 5, '1', '2026-05-19 11:04:54', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (532, 8, 'imageUrl', '设备图片', 'image-upload', '{\"id\":\"sys_imageUrl\",\"type\":\"image-upload\",\"label\":\"设备图片\",\"fieldKey\":\"imageUrl\",\"systemField\":true,\"placeholder\":null,\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-19 11:04:55', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (533, 8, 'locationId', '物理位置', 'location-select', '{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 7, '1', '2026-05-19 11:04:55', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (534, 8, 'supplierId', '供应商', 'supplier-select', '{\"id\":\"sys_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 8, '1', '2026-05-19 11:04:55', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (535, 8, 'depreciationId', '折旧规则', 'depreciation-select', '{\"id\":\"sys_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 9, '1', '2026-05-19 11:04:55', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (536, 8, 'purchaseDate', '购买日期', 'date', '{\"id\":\"sys_purchaseDate\",\"type\":\"date\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 10, '1', '2026-05-19 11:04:55', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (537, 8, 'purchaseCost', '购买成本', 'number', '{\"id\":\"sys_purchaseCost\",\"type\":\"number\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0,\"precision\":2},\"title\":null,\"children\":null}', 1, 0, 11, '1', '2026-05-19 11:04:56', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (538, 8, 'warrantyDate', '过保日期', 'date', '{\"id\":\"sys_warrantyDate\",\"type\":\"date\",\"label\":\"过保日期\",\"fieldKey\":\"warrantyDate\",\"systemField\":true,\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 12, '1', '2026-05-19 11:04:56', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (539, 8, 'description', '描述', 'textarea', '{\"id\":\"sys_description\",\"type\":\"textarea\",\"label\":\"描述\",\"fieldKey\":\"description\",\"systemField\":true,\"placeholder\":\"请输入内容\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 13, '1', '2026-05-19 11:04:56', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (540, 12, 'name', '耗材名称', 'input', '{\"id\":\"w_con_name\",\"type\":\"input\",\"label\":\"耗材名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入耗材名称\",\"required\":true,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-19 11:05:03', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (541, 12, 'categoryId', '分类', 'category-select', '{\"id\":\"w_con_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":{\"assetType\":\"consumable\"},\"title\":null,\"children\":null}', 1, 0, 2, '1', '2026-05-19 11:05:03', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (542, 12, 'manufacturerId', '厂商', 'manufacturer-select', '{\"id\":\"w_con_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 3, '1', '2026-05-19 11:05:04', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (543, 12, 'itemNo', '物品编号/型号', 'input', '{\"id\":\"w_con_itemNo\",\"type\":\"input\",\"label\":\"物品编号/型号\",\"fieldKey\":\"itemNo\",\"systemField\":true,\"placeholder\":\"请输入物品编号/型号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 4, '1', '2026-05-19 11:05:04', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (544, 12, 'orderNumber', '采购单号', 'input', '{\"id\":\"w_con_orderNumber\",\"type\":\"input\",\"label\":\"采购单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入采购单号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 5, '1', '2026-05-19 11:05:04', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (545, 12, 'purchaseDate', '购买日期', 'datetime', '{\"id\":\"w_con_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-19 11:05:04', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (546, 12, 'purchaseCost', '购买成本', 'input', '{\"id\":\"w_con_purchaseCost\",\"type\":\"input\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 7, '1', '2026-05-19 11:05:04', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (547, 12, 'quantity', '当前库存数量', 'number', '{\"id\":\"w_con_quantity\",\"type\":\"number\",\"label\":\"当前库存数量\",\"fieldKey\":\"quantity\",\"systemField\":true,\"placeholder\":\"请输入当前库存数量\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 8, '1', '2026-05-19 11:05:05', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (548, 12, 'minQuantity', '最小库存预警', 'number', '{\"id\":\"w_con_minQuantity\",\"type\":\"number\",\"label\":\"最小库存预警\",\"fieldKey\":\"minQuantity\",\"systemField\":true,\"placeholder\":\"请输入最小库存预警\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 9, '1', '2026-05-19 11:05:05', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (549, 12, 'locationId', '存放位置', 'location-select', '{\"id\":\"w_con_locationId\",\"type\":\"location-select\",\"label\":\"存放位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择存放位置\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 10, '1', '2026-05-19 11:05:05', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (550, 13, 'name', '软件名称', 'input', '{\"id\":\"w_lic_name\",\"type\":\"input\",\"label\":\"软件名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入软件名称\",\"required\":true,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 1, '1', '2026-05-19 11:05:20', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (551, 13, 'licenseKey', '序列号/密钥', 'textarea', '{\"id\":\"w_lic_licenseKey\",\"type\":\"textarea\",\"label\":\"序列号/密钥\",\"fieldKey\":\"licenseKey\",\"systemField\":true,\"placeholder\":\"请输入序列号或密钥\",\"required\":true,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 1, 2, '1', '2026-05-19 11:05:20', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (552, 13, 'categoryId', '分类', 'category-select', '{\"id\":\"w_lic_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":{\"assetType\":\"license\"},\"title\":null,\"children\":null}', 1, 0, 3, '1', '2026-05-19 11:05:20', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (553, 13, 'totalSeats', '总许可数', 'number', '{\"id\":\"w_lic_totalSeats\",\"type\":\"number\",\"label\":\"总许可数\",\"fieldKey\":\"totalSeats\",\"systemField\":true,\"placeholder\":\"请输入总许可数\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 4, '1', '2026-05-19 11:05:20', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (554, 13, 'manufacturerId', '厂商', 'manufacturer-select', '{\"id\":\"w_lic_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 5, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (555, 13, 'locationId', '物理位置', 'location-select', '{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 6, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (556, 13, 'licensedToName', '许可人名字', 'input', '{\"id\":\"w_lic_licensedToName\",\"type\":\"input\",\"label\":\"许可人名字\",\"fieldKey\":\"licensedToName\",\"systemField\":true,\"placeholder\":\"请输入许可人名字\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 7, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (557, 13, 'licensedToEmail', '许可人邮箱', 'input', '{\"id\":\"w_lic_licensedToEmail\",\"type\":\"input\",\"label\":\"许可人邮箱\",\"fieldKey\":\"licensedToEmail\",\"systemField\":true,\"placeholder\":\"请输入许可人电子邮件\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 8, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (558, 13, 'supplierId', '供应商', 'supplier-select', '{\"id\":\"w_lic_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 9, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (559, 13, 'minQty', '最少数量', 'number', '{\"id\":\"w_lic_minQty\",\"type\":\"number\",\"label\":\"最少数量\",\"fieldKey\":\"minQty\",\"systemField\":true,\"placeholder\":\"请输入最少数量\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":{\"min\":0},\"title\":null,\"children\":null}', 1, 0, 10, '1', '2026-05-19 11:05:21', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (560, 13, 'orderNumber', '订单号', 'input', '{\"id\":\"w_lic_orderNumber\",\"type\":\"input\",\"label\":\"订单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入订单号\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 11, '1', '2026-05-19 11:05:22', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (561, 13, 'purchaseOrderNumber', '采购订单号', 'input', '{\"id\":\"w_lic_purchaseOrderNumber\",\"type\":\"input\",\"label\":\"采购订单号\",\"fieldKey\":\"purchaseOrderNumber\",\"systemField\":true,\"placeholder\":\"请输入采购订单号码\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 12, '1', '2026-05-19 11:05:22', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (562, 13, 'purchaseCost', '采购价格', 'input', '{\"id\":\"w_lic_purchaseCost\",\"type\":\"input\",\"label\":\"采购价格\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入采购价格\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 13, '1', '2026-05-19 11:05:22', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (563, 13, 'purchaseDate', '购买日期', 'datetime', '{\"id\":\"w_lic_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 14, '1', '2026-05-19 11:05:22', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (564, 13, 'expirationDate', '到期日期', 'datetime', '{\"id\":\"w_lic_expirationDate\",\"type\":\"datetime\",\"label\":\"到期日期\",\"fieldKey\":\"expirationDate\",\"systemField\":true,\"placeholder\":\"请选择到期日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 15, '1', '2026-05-19 11:05:22', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (565, 13, 'terminationDate', '终止日期', 'datetime', '{\"id\":\"w_lic_terminationDate\",\"type\":\"datetime\",\"label\":\"终止日期\",\"fieldKey\":\"terminationDate\",\"systemField\":true,\"placeholder\":\"请选择终止日期\",\"required\":false,\"span\":12,\"disabled\":null,\"readonly\":null,\"clearable\":true,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 16, '1', '2026-05-19 11:05:24', NULL, NULL);
INSERT INTO `sys_custom_field` (`id`, `form_id`, `field_key`, `field_label`, `field_type`, `field_props`, `system_field`, `required`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (566, 13, 'notes', '备注', 'textarea', '{\"id\":\"w_lic_notes\",\"type\":\"textarea\",\"label\":\"备注\",\"fieldKey\":\"notes\",\"systemField\":true,\"placeholder\":\"请输入备注\",\"required\":false,\"span\":24,\"disabled\":null,\"readonly\":null,\"clearable\":null,\"props\":null,\"title\":null,\"children\":null}', 1, 0, 17, '1', '2026-05-19 11:05:24', NULL, NULL);
COMMIT;
-- ----------------------------
-- Table structure for sys_custom_field_value
-- ----------------------------

DROP TABLE IF EXISTS `sys_custom_field_value`;
CREATE TABLE `sys_custom_field_value` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '值主键ID',
  `entity_id` bigint NOT NULL COMMENT '关联实体业务主键ID(如设备ID)',
  `form_key` varchar(50) NOT NULL COMMENT '表单唯一键标识(冗余字段，便于查询)',
  `field_key` varchar(50) NOT NULL COMMENT '字段唯一键标识',
  `field_value` text COMMENT '字段存储值',
  PRIMARY KEY (`id`),
  KEY `idx_value_entity_form` (`entity_id`,`form_key`),
  KEY `idx_value_field_key` (`field_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义字段值存储表';

-- ----------------------------

-- ----------------------------
-- Records of sys_custom_field_value (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_custom_form`;
CREATE TABLE `sys_custom_form` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '表单主键ID',
  `form_key` varchar(50) NOT NULL COMMENT '表单唯一键标识(如 equipment_form)',
  `form_name` varchar(100) NOT NULL COMMENT '表单名称',
  `component_config` text COMMENT '表单组件及整体配置(JSON格式)',
  `status` int DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_form_key` (`form_key`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义表单定义表';

-- ----------------------------

-- ----------------------------
-- Records of sys_custom_form
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'device_form', '设备', '{\"size\":\"default\",\"columns\":1,\"labelPosition\":\"top\",\"labelWidth\":\"100px\",\"gutter\":20,\"widgets\":[{\"type\":\"input\",\"label\":\"单行文本\",\"fieldKey\":\"field_ZfxR\",\"placeholder\":\"请输入\",\"required\":false,\"span\":12,\"clearable\":true,\"id\":\"tr6DEn6V\"},{\"type\":\"input\",\"label\":\"单行文本\",\"fieldKey\":\"field_09qZ\",\"placeholder\":\"请输入\",\"required\":false,\"span\":12,\"clearable\":true,\"id\":\"MM9_EKgo\"}]}', 0, '1', '2026-04-27 17:36:54', '1', '2026-04-27 17:37:00', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'accessory_form', '配件', '{\"formKey\":\"\",\"formName\":\"自定义表单\",\"size\":\"default\",\"columns\":1,\"labelPosition\":\"top\",\"labelWidth\":\"100px\",\"gutter\":20,\"widgets\":[{\"type\":\"input\",\"label\":\"单行文本\",\"fieldKey\":\"field_ebnf\",\"placeholder\":\"请输入\",\"required\":false,\"span\":12,\"clearable\":true,\"id\":\"eVdLQ4PE\"},{\"type\":\"number\",\"label\":\"数字\",\"fieldKey\":\"field_-rdE\",\"placeholder\":\"请输入数字\",\"required\":false,\"span\":12,\"props\":{\"min\":0,\"precision\":0},\"id\":\"jca8T0Yg\"}]}', 0, '1', '2026-04-27 18:19:06', NULL, NULL, NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'offering', '服务表单', '{\"formKey\":\"offering\",\"formName\":\"服务表单\",\"size\":\"default\",\"columns\":1,\"labelPosition\":\"left\",\"labelWidth\":\"100px\",\"gutter\":20,\"widgets\":[{\"id\":\"w_name\",\"type\":\"input\",\"label\":\"服务名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入服务名称\",\"required\":true,\"span\":24,\"clearable\":true},{\"id\":\"w_supplier\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"systemField\":true,\"fieldKey\":\"supplierId\",\"placeholder\":\"请选择供应商\",\"required\":true,\"span\":24,\"clearable\":true},{\"id\":\"w_number\",\"type\":\"input\",\"label\":\"服务单号\",\"systemField\":true,\"fieldKey\":\"serviceNumber\",\"placeholder\":\"请输入服务单号\",\"required\":true,\"span\":24,\"clearable\":true},{\"id\":\"w_start\",\"type\":\"datetime\",\"label\":\"购入日期\",\"systemField\":true,\"fieldKey\":\"startDate\",\"placeholder\":\"请选择购入日期\",\"required\":false,\"span\":24,\"props\":{\"valueFormat\":\"YYYY-MM-DD HH:mm:ss\"}},{\"id\":\"w_end\",\"type\":\"datetime\",\"label\":\"过保日期\",\"systemField\":true,\"fieldKey\":\"endDate\",\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":24,\"props\":{\"valueFormat\":\"YYYY-MM-DD HH:mm:ss\"}},{\"id\":\"w_cost\",\"type\":\"number\",\"systemField\":true,\"label\":\"价格\",\"fieldKey\":\"cost\",\"placeholder\":\"请输入价格\",\"required\":false,\"span\":24,\"props\":{\"precision\":2,\"prefix\":\"￥\"}},{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"clearable\":true},{\"id\":\"w_notes\",\"systemField\":true,\"type\":\"textarea\",\"label\":\"备注\",\"fieldKey\":\"notes\",\"placeholder\":\"请输入内容\",\"required\":false,\"span\":24}]}', 0, '1', '2026-04-27 21:25:59', '1', '2026-05-11 14:46:25', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 'device', '设备表单', '{\"formKey\":\"device\",\"formName\":\"设备表单\",\"size\":\"default\",\"columns\":2,\"labelPosition\":\"right\",\"labelWidth\":\"100px\",\"gutter\":65,\"widgets\":[{\"id\":\"div_base\",\"type\":\"divider\",\"label\":\"基本信息\",\"systemField\":true,\"fieldKey\":\"div_base\",\"title\":\"基本信息\",\"required\":false,\"span\":24},{\"id\":\"sys_name\",\"type\":\"input\",\"label\":\"设备名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入设备名称\",\"required\":true,\"span\":12,\"clearable\":true,\"props\":{\"suffixIcon\":\"\",\"maxlength\":null,\"prefixIcon\":\"\"}},{\"id\":\"sys_serial\",\"type\":\"input\",\"label\":\"序列号\",\"fieldKey\":\"serial\",\"systemField\":true,\"placeholder\":\"请输入序列号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_categoryId\",\"type\":\"category-select\",\"label\":\"设备分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择设备分类\",\"required\":true,\"span\":12,\"clearable\":true,\"props\":{\"assetType\":\"device\"}},{\"id\":\"sys_deviceNo\",\"type\":\"input\",\"label\":\"设备编号\",\"fieldKey\":\"deviceNo\",\"systemField\":true,\"placeholder\":\"请输入设备编号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_modelId\",\"type\":\"model-select\",\"label\":\"关联型号\",\"fieldKey\":\"modelId\",\"systemField\":true,\"placeholder\":\"请选择型号\",\"required\":true,\"span\":12,\"clearable\":true},{\"id\":\"sys_imageUrl\",\"type\":\"image-upload\",\"label\":\"设备图片\",\"fieldKey\":\"imageUrl\",\"systemField\":true,\"required\":false,\"span\":24},{\"id\":\"div_more\",\"type\":\"divider\",\"label\":\"更多信息\",\"fieldKey\":\"div_more\",\"title\":\"更多信息\",\"required\":false,\"span\":24},{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_purchaseDate\",\"type\":\"date\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_purchaseCost\",\"type\":\"number\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"props\":{\"min\":0,\"precision\":2}},{\"id\":\"sys_warrantyDate\",\"type\":\"date\",\"label\":\"过保日期\",\"fieldKey\":\"warrantyDate\",\"systemField\":true,\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_description\",\"type\":\"textarea\",\"label\":\"描述\",\"fieldKey\":\"description\",\"systemField\":true,\"placeholder\":\"请输入内容\",\"required\":false,\"span\":24}]}', 0, '1', '2026-04-28 14:35:02', '1', '2026-05-19 11:04:51', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 'model', '型号管理表单', '{\"formKey\":\"model\",\"formName\":\"型号管理表单\",\"size\":\"default\",\"columns\":2,\"labelPosition\":\"left\",\"labelWidth\":\"120px\",\"gutter\":20,\"widgets\":[{\"id\":\"w_model_div_01\",\"type\":\"divider\",\"label\":\" 分割线\",\"fieldKey\":\"desc1\",\"systemField\":true,\"title\":\"基本信息\",\"required\":false,\"span\":24},{\"id\":\"w_model_name\",\"type\":\"input\",\"label\":\"型号名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入型号名称\",\"required\":true,\"span\":12,\"clearable\":true},{\"id\":\"w_model_modelNumber\",\"type\":\"input\",\"label\":\"型号编码\",\"fieldKey\":\"modelNumber\",\"systemField\":true,\"placeholder\":\"请输入型号编码\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_model_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"clearable\":true,\"disabled\":false},{\"id\":\"w_model_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_model_eol\",\"type\":\"number\",\"label\":\"报废年限 (月)\",\"fieldKey\":\"eol\",\"systemField\":true,\"placeholder\":\"请输入报废年限\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_model_div_02\",\"type\":\"divider\",\"label\":\"\",\"fieldKey\":\"divider2\",\"systemField\":true,\"title\":\"图片信息\",\"required\":false,\"span\":24},{\"id\":\"w_model_imageUrl\",\"type\":\"image-upload\",\"label\":\"型号图片\",\"fieldKey\":\"imageUrl\",\"systemField\":true,\"required\":false,\"span\":24,\"props\":{\"limit\":1}}]}', 0, '1', '2026-04-30 15:53:22', '1', '2026-05-01 09:20:23', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 'accessory', '配件管理表单', '{\"formKey\":\"accessory\",\"formName\":\"配件管理表单\",\"size\":\"default\",\"columns\":2,\"labelPosition\":\"right\",\"labelWidth\":\"110px\",\"gutter\":9,\"widgets\":[{\"id\":\"w_acc_div1\",\"type\":\"divider\",\"label\":\"\",\"fieldKey\":\"divider1\",\"title\":\"基本信息\",\"required\":false,\"span\":24,\"systemField\":true},{\"id\":\"w_acc_name\",\"type\":\"input\",\"label\":\"配件名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入配件名称\",\"required\":true,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_assetNumber\",\"type\":\"input\",\"label\":\"资产编号\",\"fieldKey\":\"assetNumber\",\"systemField\":true,\"placeholder\":\"请输入资产编号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":true,\"span\":12,\"clearable\":true,\"props\":{\"assetType\":\"accessory\"}},{\"id\":\"w_acc_quantity\",\"type\":\"number\",\"label\":\"数量\",\"fieldKey\":\"quantity\",\"systemField\":true,\"placeholder\":\"请输入数量\",\"required\":true,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_acc_specifications\",\"type\":\"input\",\"label\":\"规格\",\"fieldKey\":\"specifications\",\"systemField\":true,\"placeholder\":\"请输入规格\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_serialNumber\",\"type\":\"input\",\"label\":\"配件序列号\",\"fieldKey\":\"serialNumber\",\"systemField\":true,\"placeholder\":\"请输入配件序列号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_div2\",\"type\":\"divider\",\"label\":\"\",\"fieldKey\":\"\",\"title\":\"更多信息\",\"required\":false,\"span\":24,\"systemField\":true},{\"id\":\"w_acc_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"制造商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择制造商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择存放位置\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_minQuantity\",\"type\":\"number\",\"label\":\"最小库存预警\",\"fieldKey\":\"minQuantity\",\"systemField\":true,\"placeholder\":\"请输入最小库存预警\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_acc_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_warrantyDate\",\"type\":\"datetime\",\"label\":\"过保日期\",\"fieldKey\":\"warrantyExpirationDate\",\"systemField\":true,\"placeholder\":\"请选择过保日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_purchaseCost\",\"type\":\"input\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_orderNumber\",\"type\":\"input\",\"label\":\"订单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入订单号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_depreciationId\",\"type\":\"depreciation-select\",\"label\":\"折旧规则\",\"fieldKey\":\"depreciationId\",\"systemField\":true,\"placeholder\":\"请选择折旧规则\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_acc_description\",\"type\":\"textarea\",\"label\":\"描述\",\"fieldKey\":\"description\",\"systemField\":true,\"placeholder\":\"请输入描述\",\"required\":false,\"span\":24}]}', 0, '1', '2026-04-30 16:11:36', '1', '2026-05-19 11:04:42', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 'consumable', '耗材管理表单', '{\"formKey\":\"consumable\",\"formName\":\"耗材管理表单\",\"size\":\"default\",\"columns\":1,\"labelPosition\":\"right\",\"labelWidth\":\"120px\",\"gutter\":20,\"widgets\":[{\"id\":\"w_con_name\",\"type\":\"input\",\"label\":\"耗材名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入耗材名称\",\"required\":true,\"span\":12,\"clearable\":true},{\"id\":\"w_con_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":false,\"span\":12,\"clearable\":true,\"props\":{\"assetType\":\"consumable\"}},{\"id\":\"w_con_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_con_itemNo\",\"type\":\"input\",\"label\":\"物品编号/型号\",\"fieldKey\":\"itemNo\",\"systemField\":true,\"placeholder\":\"请输入物品编号/型号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_con_orderNumber\",\"type\":\"input\",\"label\":\"采购单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入采购单号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_con_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_con_purchaseCost\",\"type\":\"input\",\"label\":\"购买成本\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入购买成本\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_con_quantity\",\"type\":\"number\",\"label\":\"当前库存数量\",\"fieldKey\":\"quantity\",\"systemField\":true,\"placeholder\":\"请输入当前库存数量\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_con_minQuantity\",\"type\":\"number\",\"label\":\"最小库存预警\",\"fieldKey\":\"minQuantity\",\"systemField\":true,\"placeholder\":\"请输入最小库存预警\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_con_locationId\",\"type\":\"location-select\",\"label\":\"存放位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择存放位置\",\"required\":false,\"span\":12,\"clearable\":true}]}', 0, '1', '2026-04-30 16:17:44', '1', '2026-05-19 11:05:03', NULL);
INSERT INTO `sys_custom_form` (`id`, `form_key`, `form_name`, `component_config`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 'license', '软件管理表单', '{\"formKey\":\"license\",\"formName\":\"软件管理表单\",\"size\":\"default\",\"columns\":2,\"labelPosition\":\"left\",\"labelWidth\":\"110px\",\"gutter\":20,\"widgets\":[{\"id\":\"w_lic_div1\",\"type\":\"divider\",\"fieldKey\":\"name\",\"systemField\":true,\"label\":\"\",\"title\":\"关键信息\",\"required\":false,\"span\":24},{\"id\":\"w_lic_name\",\"type\":\"input\",\"label\":\"软件名称\",\"fieldKey\":\"name\",\"systemField\":true,\"placeholder\":\"请输入软件名称\",\"required\":true,\"span\":24,\"clearable\":true},{\"id\":\"w_lic_licenseKey\",\"type\":\"textarea\",\"label\":\"序列号/密钥\",\"fieldKey\":\"licenseKey\",\"systemField\":true,\"placeholder\":\"请输入序列号或密钥\",\"required\":true,\"span\":24,\"rows\":3},{\"id\":\"w_lic_categoryId\",\"type\":\"category-select\",\"label\":\"分类\",\"fieldKey\":\"categoryId\",\"systemField\":true,\"placeholder\":\"请选择分类\",\"required\":false,\"span\":12,\"clearable\":true,\"props\":{\"assetType\":\"license\"}},{\"id\":\"w_lic_totalSeats\",\"type\":\"number\",\"label\":\"总许可数\",\"fieldKey\":\"totalSeats\",\"systemField\":true,\"placeholder\":\"请输入总许可数\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_lic_manufacturerId\",\"type\":\"manufacturer-select\",\"label\":\"厂商\",\"fieldKey\":\"manufacturerId\",\"systemField\":true,\"placeholder\":\"请选择厂商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"sys_locationId\",\"type\":\"location-select\",\"label\":\"物理位置\",\"fieldKey\":\"locationId\",\"systemField\":true,\"placeholder\":\"请选择位置\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_div2\",\"type\":\"divider\",\"fieldKey\":\"\",\"label\":\"\",\"title\":\"更多信息\",\"required\":false,\"span\":24,\"systemField\":true},{\"id\":\"w_lic_licensedToName\",\"type\":\"input\",\"label\":\"许可人名字\",\"fieldKey\":\"licensedToName\",\"systemField\":true,\"placeholder\":\"请输入许可人名字\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_licensedToEmail\",\"type\":\"input\",\"label\":\"许可人邮箱\",\"fieldKey\":\"licensedToEmail\",\"systemField\":true,\"placeholder\":\"请输入许可人电子邮件\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_supplierId\",\"type\":\"supplier-select\",\"label\":\"供应商\",\"fieldKey\":\"supplierId\",\"systemField\":true,\"placeholder\":\"请选择供应商\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_minQty\",\"type\":\"number\",\"label\":\"最少数量\",\"fieldKey\":\"minQty\",\"systemField\":true,\"placeholder\":\"请输入最少数量\",\"required\":false,\"span\":12,\"props\":{\"min\":0}},{\"id\":\"w_lic_orderNumber\",\"type\":\"input\",\"label\":\"订单号\",\"fieldKey\":\"orderNumber\",\"systemField\":true,\"placeholder\":\"请输入订单号\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_purchaseOrderNumber\",\"type\":\"input\",\"label\":\"采购订单号\",\"fieldKey\":\"purchaseOrderNumber\",\"systemField\":true,\"placeholder\":\"请输入采购订单号码\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_purchaseCost\",\"type\":\"input\",\"label\":\"采购价格\",\"fieldKey\":\"purchaseCost\",\"systemField\":true,\"placeholder\":\"请输入采购价格\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_purchaseDate\",\"type\":\"datetime\",\"label\":\"购买日期\",\"fieldKey\":\"purchaseDate\",\"systemField\":true,\"placeholder\":\"请选择购买日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_expirationDate\",\"type\":\"datetime\",\"label\":\"到期日期\",\"fieldKey\":\"expirationDate\",\"systemField\":true,\"placeholder\":\"请选择到期日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_terminationDate\",\"type\":\"datetime\",\"label\":\"终止日期\",\"fieldKey\":\"terminationDate\",\"systemField\":true,\"placeholder\":\"请选择终止日期\",\"required\":false,\"span\":12,\"clearable\":true},{\"id\":\"w_lic_notes\",\"type\":\"textarea\",\"label\":\"备注\",\"fieldKey\":\"notes\",\"systemField\":true,\"placeholder\":\"请输入备注\",\"required\":false,\"span\":24,\"rows\":3}]}', 0, '1', '2026-04-30 16:55:04', '1', '2026-05-19 11:05:19', NULL);
COMMIT;
-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------

DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '雷犀IT资产', 0, 'admin', '15666666667', 'admin@qq.com', '0', '0', 1, '2021-07-02 14:22:31', NULL, NULL);
COMMIT;
-- ----------------------------
-- Table structure for sys_dept_post
-- ----------------------------

DROP TABLE IF EXISTS `sys_dept_post`;
CREATE TABLE `sys_dept_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `dept_id` bigint NOT NULL COMMENT '部门Id',
  `post_id` bigint NOT NULL COMMENT '岗位Id',
  `post_show_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '部门岗位显示名称',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dept_id` (`dept_id`,`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='部门岗位关系表';

-- ----------------------------

-- ----------------------------
-- Records of sys_dept_post
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_post` (`id`, `dept_id`, `post_id`, `post_show_name`, `update_time`, `create_time`) VALUES (1, 100, 4, '普通员工', '2021-07-02 14:22:31', '2021-07-02 14:22:31');
COMMIT;
-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------

DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3032 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, '2023-10-10 19:47:59', '性别男');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, '2023-10-10 19:47:59', '性别女');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, '2023-10-10 19:47:59', '性别未知');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '默认分组');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '系统分组');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (45, 10, '登录', '10', 'sys_oper_type', NULL, 'info', 'N', '0', NULL, '2025-03-17 14:01:10', NULL, '2025-03-17 14:04:25', NULL);
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (46, 1, '开启', '0', 'common_status', '', 'primary', 'N', '0', NULL, '2021-01-05 17:03:48', NULL, '2022-02-16 08:00:39', '开启状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (47, 2, '关闭', '1', 'common_status', '', 'info', 'N', '0', NULL, '2021-01-05 17:03:48', NULL, '2022-02-16 08:00:44', '关闭状态');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 1, '💻 设备 (电脑/显示器等)', 'device', 'asset_type', '', 'primary', 'N', '0', NULL, '2026-01-16 21:00:58', 1, '2026-05-11 16:48:06', 'IT 设备类资产');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, 2, '⌨️ 配件 (键盘/鼠标等)', 'accessory', 'asset_type', '', 'success', 'N', '0', NULL, '2026-01-16 21:00:58', 1, '2026-05-11 16:48:06', '设备配件类资产');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, 3, '🖨️ 耗材 (墨盒/纸张等)', 'consumable', 'asset_type', '', 'warning', 'N', '0', NULL, '2026-01-16 21:00:58', 1, '2026-05-11 16:48:06', '日常消耗类资产');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, 4, '🔑 软件授权', 'license', 'asset_type', '', 'info', 'N', '0', NULL, '2026-01-16 21:00:58', 1, '2026-05-11 16:48:06', '软件与授权资产');
INSERT INTO `sys_dict_data` (`id`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, 5, '🛠️ 服务', 'service', 'asset_type', '', 'default', 'N', '0', NULL, '2026-01-16 21:00:58', 1, '2026-05-11 16:48:06', 'IT 服务类资产');
COMMIT;
-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------

DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', NULL, '2021-07-02 14:22:32', NULL, '2023-10-10 19:47:59', '用户性别列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', NULL, '2021-07-02 14:22:32', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, '资产类型', 'asset_type', '0', NULL, '2026-01-16 20:51:18', 1, '2026-05-11 16:48:06', 'IT资产类型字典');
COMMIT;
-- ----------------------------
-- Table structure for sys_env_config
-- ----------------------------

DROP TABLE IF EXISTS `sys_env_config`;
CREATE TABLE `sys_env_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `env_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `env_value` json NOT NULL COMMENT '参数键值',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `env_key` (`env_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='系统环境配置表';

-- ----------------------------

-- ----------------------------
-- Records of sys_env_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_env_config` (`id`, `env_key`, `env_value`, `update_time`, `create_time`) VALUES
(1, 'systemInfoConfig', '{"logo":"","name":"雷犀IT资产管理系统","description":"专业的企业资产管理系统","logoImg":"","favicon":"","copyright":"<p>Copyright © 2018-2026 雷犀 All Rights Reserved.</p>","webBaseUrl":"http://localhost","backgroundImage":"","allowThirdPartyLogin":false,"thirdPartyLoginTypeList":[]}', NULL, '2021-07-02 14:22:31'),
(2, 'fileEnvConfig', '{"ossType":"LOCAL","uploadFolder":"/data/upload","accessPathPattern":"/u/**","domain":""}', NULL, '2021-07-02 14:22:31');
COMMIT;

DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `origin_name` varchar(255) DEFAULT NULL COMMENT '原始文件名',
  `file_name` varchar(255) DEFAULT NULL COMMENT '存储文件名（uuid）',
  `file_ext` varchar(20) DEFAULT NULL COMMENT '文件扩展名',
  `content_type` varchar(100) DEFAULT NULL COMMENT 'MIME 类型',
  `file_size` bigint DEFAULT NULL COMMENT '文件大小（字节）',
  `file_path` varchar(500) DEFAULT NULL COMMENT '物理存储路径（用于删除）',
  `file_url` varchar(500) DEFAULT NULL COMMENT '访问 URL',
  `biz_type` varchar(50) DEFAULT NULL COMMENT '业务类型，如 ASSET / MANUFACTURER',
  `biz_id` varchar(50) DEFAULT NULL COMMENT '业务ID',
  `biz_field` varchar(50) DEFAULT NULL COMMENT '业务字段，如 logo / attachment',
  `is_temp` tinyint DEFAULT '0' COMMENT '是否临时文件 1是 0否',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `status` tinyint DEFAULT '1' COMMENT '状态 1正常 2待删除 3已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_biz_type_id` (`biz_type`,`biz_id`) USING BTREE COMMENT '业务关联索引',
  KEY `idx_file_name` (`file_name`) USING BTREE COMMENT '文件名索引'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统文件表';

-- ----------------------------

-- ----------------------------
-- Records of sys_file (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` tinyint(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间\r\n',
  `end_time` datetime DEFAULT NULL COMMENT '开始时间\r\n',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------

-- ----------------------------
-- Records of sys_job (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------

-- ----------------------------
-- Records of sys_job_log (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `lang_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '多语言key',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '组件路径',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1353 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 'menu.menuName.systemManagement', 0, 6, 'sys', '/index/index', 1, 0, 'M', '0', '0', '', 'ri:settings-3-line', NULL, '2021-07-02 14:22:31', NULL, '2023-10-13 17:36:19', '系统管理目录');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 'menu.menuName.otherTools', 0, 8, 'tool', '/index/index', 1, 0, 'M', '0', '0', '', 'ri:tools-line', NULL, '2021-07-02 14:22:31', NULL, '2023-08-07 16:45:13', '系统工具目录');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 'menu.menuName.userList', 1, 1, 'user/list', '/system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'ri:user-line', NULL, '2021-07-02 14:22:31', NULL, '2023-03-02 12:00:44', '用户管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 'menu.menuName.roleManagement', 1, 2, 'user/role', '/system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'ri:shield-user-line', NULL, '2021-07-02 14:22:31', NULL, '2023-03-02 11:43:01', '角色管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 'menu.menuName.menuManagement', 1, 3, 'sys/menu', '/system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'ri:menu-line', NULL, '2021-07-02 14:22:31', NULL, '2023-03-28 17:30:12', '菜单管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 'menu.menuName.departmentManagement', 1, 4, 'user/dept', '/system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'ri:organization-chart', NULL, '2021-07-02 14:22:31', NULL, '2023-03-02 11:43:14', '部门管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 'menu.menuName.positionManagement', 1, 5, 'user/post', '/system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'ri:briefcase-line', NULL, '2021-07-02 14:22:31', NULL, '2023-03-02 11:43:19', '岗位管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 'menu.menuName.dictionaryManagement', 1, 6, 'sys/dict', '/system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'ri:book-read-line', NULL, '2021-07-02 14:22:31', NULL, '2021-11-12 18:05:46', '字典管理菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数配置', 'menu.menuName.initialParameters', 1, 7, 'sys/config', '/system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'ri:settings-line', NULL, '2021-07-02 14:22:31', NULL, '2022-12-06 17:14:48', '参数设置菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 'menu.menuName.announcement', 1100, 8, 'sys/notice', '/system/announcement/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'ri:notification-3-line', NULL, '2021-07-02 14:22:32', NULL, '2022-12-06 17:16:39', '通知公告菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '代码生成', 'menu.menuName.codeGeneration', 3, 2, 'tool/gen', '/tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'ri:code-box-line', NULL, '2021-07-02 14:22:32', NULL, '2025-12-29 09:50:53', '代码生成菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 'menu.menuName.operationLog', 1, 8, 'monitor/operlog', '/system/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'ri:file-list-3-line', NULL, '2021-07-02 14:22:32', 1, '2026-06-26 10:00:00', '操作日志菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户查询', NULL, 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户新增', NULL, 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户修改', NULL, 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户删除', NULL, 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导出', NULL, 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '用户导入', NULL, 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '重置密码', NULL, 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色查询', NULL, 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色新增', NULL, 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色修改', NULL, 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色删除', NULL, 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '角色导出', NULL, 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单查询', NULL, 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单新增', NULL, 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单修改', NULL, 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '菜单删除', NULL, 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门查询', NULL, 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门新增', NULL, 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门修改', NULL, 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '部门删除', NULL, 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位查询', NULL, 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位新增', NULL, 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位修改', NULL, 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位删除', NULL, 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '岗位导出', NULL, 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典查询', NULL, 105, 1, NULL, '', 1, 0, 'F', '0', '0', 'system:dict:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典新增', NULL, 105, 2, NULL, '', 1, 0, 'F', '0', '0', 'system:dict:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典修改', NULL, 105, 3, NULL, '', 1, 0, 'F', '0', '0', 'system:dict:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典删除', NULL, 105, 4, NULL, '', 1, 0, 'F', '0', '0', 'system:dict:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '字典导出', NULL, 105, 5, NULL, '', 1, 0, 'F', '0', '0', 'system:dict:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数查询', NULL, 106, 1, NULL, '', 1, 0, 'F', '0', '0', 'system:config:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数新增', NULL, 106, 2, NULL, '', 1, 0, 'F', '0', '0', 'system:config:add', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数修改', NULL, 106, 3, NULL, '', 1, 0, 'F', '0', '0', 'system:config:edit', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数删除', NULL, 106, 4, NULL, '', 1, 0, 'F', '0', '0', 'system:config:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '参数导出', NULL, 106, 5, NULL, '', 1, 0, 'F', '0', '0', 'system:config:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '通知查询', NULL, 107, 1, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '通知新增', NULL, 107, 2, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:save', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '通知修改', NULL, 107, 3, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:update', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '通知删除', NULL, 107, 4, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:delete', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作查询', NULL, 500, 1, NULL, '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '操作删除', NULL, 500, 2, NULL, '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '日志导出', NULL, 500, 4, NULL, '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1097, '通知发布', NULL, 107, 4, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:release', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1098, '通知撤回', NULL, 107, 4, NULL, '', 1, 0, 'F', '0', '0', 'sys:announcement:revoke', NULL, NULL, '2021-07-02 14:22:32', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1099, '我的消息', 'menu.menuName.myMessages', 1100, 9, 'msg/my', '/message/my', 1, 0, 'C', '0', '0', 'sys:mymessage:list', 'ri:message-3-line', NULL, '2021-12-24 16:16:03', NULL, '2021-12-28 15:02:23', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1100, '消息中心', 'menu.menuName.messageCenter', 0, 5, 'msg', '/index/index', 1, 0, 'M', '0', '0', '', 'ri:mail-line', NULL, '2021-12-27 17:30:12', NULL, '2023-10-18 10:39:15', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1101, '消息日志', 'menu.menuName.messageLog', 1100, 4, 'msg/log', '/message/log', 1, 0, 'C', '0', '0', 'sys:msglog:list', 'ri:chat-history-line', NULL, '2021-12-27 18:15:28', NULL, '2021-12-28 15:02:10', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1102, '通知配置', 'menu.menuName.notificationConfiguration', 1100, 1, 'msg/template', '/message/template', 1, 0, 'C', '0', '0', 'sys:msgtemplate:list', 'ri:notification-badge-line', NULL, '2021-12-28 10:25:00', NULL, '2023-03-02 11:43:39', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1103, '消息模板查询', NULL, 1102, 1, '', '', 1, 0, 'F', '0', '0', 'sys:msgtemplate:query', NULL, NULL, '2021-12-28 14:58:37', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1104, '消息模板新增', NULL, 1102, 2, '', '', 1, 0, 'F', '0', '0', 'sys:msgtemplate:save', NULL, NULL, '2021-12-28 14:58:37', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1105, '消息模板修改', NULL, 1102, 3, '', '', 1, 0, 'F', '0', '0', 'sys:msgtemplate:update', NULL, NULL, '2021-12-28 14:58:37', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1106, '消息模板删除', NULL, 1102, 4, '', '', 1, 0, 'F', '0', '0', 'sys:msgtemplate:delete', NULL, NULL, '2021-12-28 14:58:37', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1107, '消息查询', NULL, 1101, 1, '', '', 1, 0, 'F', '0', '0', 'sys:msg:page', NULL, NULL, '2021-12-28 15:00:14', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1108, '消息删除', NULL, 1101, 4, '', '', 1, 0, 'F', '0', '0', 'sys:msg:delete', NULL, NULL, '2021-12-28 15:00:14', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1109, '系统配置', 'menu.menuName.systemConfiguration', 1, 0, 'sys/evnconfig', '/system/envconfig/index', 1, 0, 'C', '0', '0', 'sys:evnconfig:list', 'ri:settings-3-line', NULL, '2021-12-28 15:55:10', NULL, '2023-03-28 17:30:04', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1110, '保存配置', NULL, 1109, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:envconfig:save', NULL, NULL, '2021-12-28 15:57:08', NULL, '2021-12-28 15:57:08', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1135, '定时任务', 'menu.menuName.scheduledTasks', 3, 23, 'tool/job', '/tool/job/index', 1, 0, 'C', '0', '0', 'system:job:list', 'ri:timer-line', NULL, '2023-06-04 13:10:32', NULL, '2023-08-10 12:13:51', '定时任务菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1136, '任务查询', NULL, 1135, 1, '#', '', 0, 0, 'F', '0', '0', 'system:job:query', 'ri:search-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1137, '任务新增', NULL, 1135, 2, '#', '', 0, 0, 'F', '0', '0', 'system:job:add', 'ri:add-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1138, '任务修改', NULL, 1135, 3, '#', '', 0, 0, 'F', '0', '0', 'system:job:update', 'ri:edit-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1139, '任务删除', NULL, 1135, 4, '#', '', 0, 0, 'F', '0', '0', 'system:job:remove', 'ri:delete-bin-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1140, '状态修改', NULL, 1135, 5, '#', '', 0, 0, 'F', '0', '0', 'system:job:changeStatus', 'ri:toggle-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1141, '任务导出', NULL, 1135, 6, '#', '', 0, 0, 'F', '0', '0', 'system:job:export', 'ri:download-line', NULL, '2023-06-04 13:14:19', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1245, '基础数据', '', 0, 4, '/info', '/index/index', 1, 0, 'M', '0', '0', '', 'ri:archive-2-line', NULL, '2025-12-29 12:23:29', 410, '2026-01-21 17:34:42', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1246, '制造商', NULL, 1245, 1, 'manufacturers', '/itam/manufacturers/index', 1, 0, 'C', '0', '0', 'itam:manufacturers:page', 'ri:building-2-line', NULL, '2025-12-29 12:24:41', NULL, NULL, '制造商菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1247, '制造商查询', NULL, 1246, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:query', '#', NULL, '2025-12-29 12:24:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1248, '制造商新增', NULL, 1246, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:add', '#', NULL, '2025-12-29 12:24:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1249, '制造商修改', NULL, 1246, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:update', '#', NULL, '2025-12-29 12:24:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1250, '制造商删除', NULL, 1246, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:delete', '#', NULL, '2025-12-29 12:24:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1251, '制造商导出', NULL, 1246, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:export', '#', NULL, '2025-12-29 12:24:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1252, '供应商', NULL, 1245, 1, 'suppliers', '/itam/suppliers/index', 1, 0, 'C', '0', '0', 'itam:suppliers:page', 'ri:truck-line', NULL, '2025-12-29 17:50:51', NULL, NULL, '供应商菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1253, '供应商查询', NULL, 1252, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:query', '#', NULL, '2025-12-29 17:50:52', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1254, '供应商新增', NULL, 1252, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:add', '#', NULL, '2025-12-29 17:50:52', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1255, '供应商修改', NULL, 1252, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:update', '#', NULL, '2025-12-29 17:50:52', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1256, '供应商删除', NULL, 1252, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:delete', '#', NULL, '2025-12-29 17:50:52', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1257, '供应商导出', NULL, 1252, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:export', '#', NULL, '2025-12-29 17:50:52', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1264, '物理位置', NULL, 1245, 1, 'locations', '/itam/locations/index', 1, 0, 'C', '0', '0', 'itam:locations:page', 'ri:map-pin-line', NULL, '2025-12-29 17:51:38', NULL, NULL, '物理位置菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1265, '物理位置查询', NULL, 1264, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:query', '#', NULL, '2025-12-29 17:51:38', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1266, '物理位置新增', NULL, 1264, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:add', '#', NULL, '2025-12-29 17:51:38', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1267, '物理位置修改', NULL, 1264, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:update', '#', NULL, '2025-12-29 17:51:38', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1268, '物理位置删除', NULL, 1264, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:delete', '#', NULL, '2025-12-29 17:51:38', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1269, '物理位置导出', NULL, 1264, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:export', '#', NULL, '2025-12-29 17:51:38', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1270, '折旧规则', NULL, 1245, 1, 'depreciations', '/itam/depreciations/index', 1, 0, 'C', '0', '0', 'itam:depreciations:page', 'ri:line-chart-line', NULL, '2025-12-29 19:55:58', NULL, NULL, '折旧规则菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1271, '折旧规则查询', NULL, 1270, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:depreciations:query', '#', NULL, '2025-12-29 19:55:58', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1272, '折旧规则新增', NULL, 1270, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:depreciations:add', '#', NULL, '2025-12-29 19:55:58', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1273, '折旧规则修改', NULL, 1270, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:depreciations:update', '#', NULL, '2025-12-29 19:55:58', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1274, '折旧规则删除', NULL, 1270, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:depreciations:delete', '#', NULL, '2025-12-29 19:55:58', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1275, '折旧规则导出', NULL, 1270, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:depreciations:export', '#', NULL, '2025-12-29 19:55:58', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1276, '资产管理', '', 0, 1, '/itam', '/index/index', 1, 0, 'M', '0', '0', '', 'ri:stack-line', NULL, '2025-12-29 20:11:22', 410, '2026-01-21 17:34:34', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1277, '设备', NULL, 1276, 1, 'assets', '/itam/device/index', 1, 0, 'C', '0', '0', 'itam:device:page', 'ri:computer-line', NULL, '2025-12-29 20:13:31', NULL, NULL, '设备菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1278, '设备查询', NULL, 1277, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:device:query', '#', NULL, '2025-12-29 20:13:31', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1279, '设备新增', NULL, 1277, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:device:add', '#', NULL, '2025-12-29 20:13:31', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1280, '设备修改', NULL, 1277, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:device:update', '#', NULL, '2025-12-29 20:13:31', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1281, '设备删除', NULL, 1277, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:device:delete', '#', NULL, '2025-12-29 20:13:31', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1282, '设备导出', NULL, 1277, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:devic:export', '#', NULL, '2025-12-29 20:13:31', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1283, '配件', NULL, 1276, 3, 'accessories', '/itam/accessories/index', 1, 0, 'C', '0', '0', 'itam:accessories:page', 'ri:usb-line', NULL, '2025-12-29 20:13:41', 1, '2026-05-11 21:50:19', '配件菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1284, '配件查询', NULL, 1283, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:query', '#', NULL, '2025-12-29 20:13:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1285, '配件新增', NULL, 1283, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:add', '#', NULL, '2025-12-29 20:13:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1286, '配件修改', NULL, 1283, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:update', '#', NULL, '2025-12-29 20:13:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1287, '配件删除', NULL, 1283, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:delete', '#', NULL, '2025-12-29 20:13:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1288, '配件导出', NULL, 1283, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:export', '#', NULL, '2025-12-29 20:13:41', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1289, '耗材', NULL, 1276, 4, 'consumables', '/itam/consumables/index', 1, 0, 'C', '0', '0', 'itam:consumables:page', 'ri:archive-line', NULL, '2025-12-29 20:14:00', 1, '2026-05-11 21:50:40', '耗材菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1290, '耗材查询', NULL, 1289, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:query', '#', NULL, '2025-12-29 20:14:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1291, '耗材新增', NULL, 1289, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:add', '#', NULL, '2025-12-29 20:14:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1292, '耗材修改', NULL, 1289, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:update', '#', NULL, '2025-12-29 20:14:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1293, '耗材删除', NULL, 1289, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:delete', '#', NULL, '2025-12-29 20:14:01', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1294, '耗材导出', NULL, 1289, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:export', '#', NULL, '2025-12-29 20:14:01', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1295, '软件', NULL, 1276, 1, 'licenses', '/itam/licenses/index', 1, 0, 'C', '0', '0', 'itam:licenses:page', 'ri:window-line', NULL, '2025-12-29 20:14:21', NULL, NULL, '软件授权菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1296, '软件授权查询', NULL, 1295, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:query', '#', NULL, '2025-12-29 20:14:21', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1297, '软件授权新增', NULL, 1295, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:add', '#', NULL, '2025-12-29 20:14:21', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1298, '软件授权修改', NULL, 1295, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:update', '#', NULL, '2025-12-29 20:14:21', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1299, '软件授权删除', NULL, 1295, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:delete', '#', NULL, '2025-12-29 20:14:22', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1300, '软件授权导出', NULL, 1295, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:export', '#', NULL, '2025-12-29 20:14:22', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1301, '服务', NULL, 1276, 7, 'offering', '/itam/offering/index', 1, 0, 'C', '0', '0', 'itam:offering:page', 'ri:customer-service-2-line', NULL, '2025-12-29 20:14:30', 1, '2026-05-11 21:50:28', '服务菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1302, '服务查询', NULL, 1301, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:query', '#', NULL, '2025-12-29 20:14:30', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1303, '服务新增', NULL, 1301, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:add', '#', NULL, '2025-12-29 20:14:30', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1304, '服务修改', NULL, 1301, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:update', '#', NULL, '2025-12-29 20:14:30', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1305, '服务删除', NULL, 1301, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:delete', '#', NULL, '2025-12-29 20:14:30', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1306, '服务导出', NULL, 1301, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:export', '#', NULL, '2025-12-29 20:14:30', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1307, '故障管理', NULL, 0, 2, 'failures', '/itam/failures/index', 1, 0, 'C', '0', '0', 'itam:failures:page', 'ri:alert-line', NULL, '2026-01-02 22:13:17', 1, '2026-05-11 21:49:54', '故障菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1308, '故障查询', NULL, 1307, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:failures:query', '#', NULL, '2026-01-02 22:13:17', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1309, '故障新增', NULL, 1307, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:failures:add', '#', NULL, '2026-01-02 22:13:17', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1310, '故障修改', NULL, 1307, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:failures:update', '#', NULL, '2026-01-02 22:13:17', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1311, '故障删除', NULL, 1307, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:failures:delete', '#', NULL, '2026-01-02 22:13:17', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1312, '故障导出', NULL, 1307, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:failures:export', '#', NULL, '2026-01-02 22:13:17', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1313, '盘点管理', NULL, 0, 3, 'stocktakes', '/itam/stocktakes/index', 1, 0, 'C', '0', '0', 'itam:stocktakes:page', 'ri:checkbox-multiple-line', NULL, '2026-01-02 22:14:05', 1, '2026-01-21 19:52:19', '盘点任务菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1314, '盘点任务查询', NULL, 1313, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakes:query', '#', NULL, '2026-01-02 22:14:05', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1315, '盘点任务新增', NULL, 1313, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakes:add', '#', NULL, '2026-01-02 22:14:05', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1316, '盘点任务修改', NULL, 1313, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakes:update', '#', NULL, '2026-01-02 22:14:05', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1317, '盘点任务删除', NULL, 1313, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakes:delete', '#', NULL, '2026-01-02 22:14:05', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1318, '盘点任务导出', NULL, 1313, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakes:export', '#', NULL, '2026-01-02 22:14:05', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1319, '型号', NULL, 1276, 1, 'models', '/itam/models/index', 1, 0, 'C', '0', '0', 'itam:models:page', 'ri:cpu-line', 1, '2026-01-08 15:19:57', 1, '2026-01-17 21:17:14', '型号菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1320, '型号查询', NULL, 1319, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:models:query', '#', 1, '2026-01-08 15:19:57', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1321, '型号新增', NULL, 1319, 2, '#', '', 1, 0, 'F', '0', '0', 'itam:models:add', '#', 1, '2026-01-08 15:19:57', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1322, '型号修改', NULL, 1319, 3, '#', '', 1, 0, 'F', '0', '0', 'itam:models:update', '#', 1, '2026-01-08 15:19:57', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1323, '型号删除', NULL, 1319, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:models:delete', '#', 1, '2026-01-08 15:19:57', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1324, '型号导出', NULL, 1319, 5, '#', '', 1, 0, 'F', '0', '0', 'itam:models:export', '#', 1, '2026-01-08 15:19:57', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1325, '申请审批', NULL, 0, 2, 'requests', '/itam/requests/index', 1, 0, 'C', '0', '0', 'itam:requests:page', 'ri:clipboard-line', 1, '2026-01-16 15:15:57', 410, '2026-01-21 17:34:53', '申请审批菜单');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1330, '数据中控', NULL, 0, 1, 'dashboard', '/itam/dashboard/index', 1, 0, 'C', '0', '0', 'itam:reports:query', 'ri:dashboard-3-line', 1, '2026-01-17 21:18:43', 1, '2026-05-11 16:46:23', 'IT资产数据中控台');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1331, '查询盘点明细列表', NULL, 1313, 1, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakeItems:page', '#', NULL, '2026-01-21 19:39:49', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1332, '更新盘点明细状态', NULL, 1313, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:stocktakeItems:edit', '#', NULL, '2026-01-21 19:39:49', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1333, '审批', NULL, 1325, 4, '#', '', 1, 0, 'F', '0', '0', 'itam:requests:approve', '#', NULL, '2026-01-21 19:39:49', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1340, '制造商导入', NULL, 1246, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:manufacturers:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1341, '供应商导入', NULL, 1252, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:suppliers:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1342, '物理位置导入', NULL, 1264, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:locations:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1343, '设备导入', NULL, 1277, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:device:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1345, '配件导入', NULL, 1283, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:accessories:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1346, '耗材导入', NULL, 1289, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:consumables:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1347, '软件导入', NULL, 1295, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:licenses:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1348, '服务导入', NULL, 1301, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:offering:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1350, '型号导入', NULL, 1319, 6, '#', '', 1, 0, 'F', '0', '0', 'itam:models:import', '#', 1, '2026-01-31 22:45:00', NULL, NULL, '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1351, '设备扫描', '', 1277, 3, '', NULL, 1, 0, 'F', '0', '0', 'itam:device:scan', '#', 1, '2026-02-05 17:47:09', 1, '2026-02-05 17:47:15', '');
INSERT INTO `sys_menu` (`id`, `menu_name`, `lang_key`, `parent_id`, `order_num`, `path`, `component`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1352, '表单设置', NULL, 1245, 99, 'form-setting', '/itam/form-setting/index', 1, 0, 'C', '0', '0', 'itam:formSetting:page', 'ri:apps-fill', 1, '2026-04-27 14:28:17', 1, '2026-04-27 14:40:39', '自定义表单配置页面');
COMMIT;
-- ----------------------------
-- Table structure for sys_msg
-- ----------------------------

DROP TABLE IF EXISTS `sys_msg`;
CREATE TABLE `sys_msg` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `msg_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息Id',
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息标题',
  `type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `receiver` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '接收人',
  `msg_params` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发送所需参数Json格式',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '推送内容',
  `send_time` datetime NOT NULL COMMENT '推送时间',
  `send_status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `send_num` int NOT NULL COMMENT '发送次数 超过5次不再发送',
  `result` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '推送失败原因',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `send_detail_id` bigint NOT NULL DEFAULT '0' COMMENT '发送id 如果是通过界面批量发送的',
  `ext_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '扩展状态 可以用来记录消息是否打开等',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE,
  KEY `index_receiver` (`receiver`) USING BTREE,
  KEY `index_sendtime` (`send_time`) USING BTREE,
  KEY `index_status` (`send_status`) USING BTREE,
  KEY `idx_ss_es_type` (`type`) USING BTREE,
  KEY `idx_ss_es_receiver` (`receiver`) USING BTREE,
  KEY `idx_ss_es_send_time` (`send_time`) USING BTREE,
  KEY `idx_ss_es_send_status` (`send_status`) USING BTREE,
  KEY `msg_id` (`msg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------

-- ----------------------------
-- Records of sys_msg (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_msg_send_detail`;
CREATE TABLE `sys_msg_send_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `source_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '来源类型',
  `source_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '来源Id',
  `template_id` bigint NOT NULL COMMENT '消息iD',
  `send_count` int NOT NULL COMMENT '发送条数',
  `msg_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息类型',
  `msg_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息内容',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `source_type` (`source_type`,`source_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='发送操作记录';

-- ----------------------------

-- ----------------------------
-- Records of sys_msg_send_detail (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_msg_template`;
CREATE TABLE `sys_msg_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板标题',
  `template_code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板CODE',
  `template_type` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `template_content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '模板内容',
  `third_template_id` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '三方模板',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_templatecode` (`template_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------

-- ----------------------------
-- Records of sys_msg_template (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------

-- ----------------------------
-- Records of sys_oper_log (空表)
-- ----------------------------

DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `status` tinyint(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `leader_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领导岗位',
  `level` int NOT NULL COMMENT '岗位层级，数值越小级别越高',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------

-- ----------------------------
-- Records of sys_post
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`id`, `post_code`, `post_name`, `status`, `leader_post`, `level`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 0, 0, 0, NULL, '2021-07-02 14:22:31', NULL, '2022-07-15 10:52:37', '');
COMMIT;
-- ----------------------------
-- Table structure for sys_rbac_functionality
-- ----------------------------

DROP TABLE IF EXISTS `sys_rbac_functionality`;
CREATE TABLE `sys_rbac_functionality` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `func_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '功能类型Id',
  `func_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '关联功能id',
  `rbac_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'rbac类型',
  `rbac_id` bigint NOT NULL COMMENT '用户 岗位等id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `func_type` (`func_type`) USING BTREE,
  KEY `rbac_type` (`rbac_type`) USING BTREE,
  KEY `rbac_id` (`rbac_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='功能和rbac映射';

-- ----------------------------

-- ----------------------------
-- Records of sys_rbac_functionality
-- ----------------------------
-- ----------------------------
BEGIN;
COMMIT;
-- ----------------------------
-- Table structure for sys_role
-- ----------------------------

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------

-- ----------------------------
-- Records of sys_role
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', NULL, '2021-07-02 14:22:31', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (35, '体验用户', 'rolez2CgG', 0, '4', 1, 1, '0', '0', 1, '2026-01-14 15:43:34', 1, '2026-05-11 16:46:47', NULL);
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (36, '系统管理员', 'roleUAVr8', 1, '4', 1, 1, '0', '0', 1, '2026-01-21 17:26:25', 1, '2026-05-11 22:34:50', NULL);
INSERT INTO `sys_role` (`id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (38, '数据管理员', 'roleHUDQr', 0, '5', 1, 1, '0', '0', 1, '2026-05-11 22:34:33', NULL, NULL, NULL);
COMMIT;
-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------

DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
-- ----------------------------
BEGIN;
COMMIT;
-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (522, 35, 1, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (523, 35, 100, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (524, 35, 101, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (525, 35, 102, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (526, 35, 103, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (527, 35, 104, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (528, 35, 105, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (529, 35, 106, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (530, 35, 3, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (531, 35, 1135, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (532, 35, 1276, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (533, 35, 1277, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (534, 35, 1278, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (535, 35, 1279, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (536, 35, 1280, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (537, 35, 1281, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (538, 35, 1282, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (539, 35, 1283, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (540, 35, 1284, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (541, 35, 1285, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (542, 35, 1286, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (543, 35, 1287, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (544, 35, 1288, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (545, 35, 1289, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (546, 35, 1290, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (547, 35, 1291, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (548, 35, 1292, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (549, 35, 1293, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (550, 35, 1294, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (551, 35, 1295, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (552, 35, 1296, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (553, 35, 1297, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (554, 35, 1298, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (555, 35, 1299, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (556, 35, 1300, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (557, 35, 1301, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (558, 35, 1302, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (559, 35, 1303, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (560, 35, 1304, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (561, 35, 1305, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (562, 35, 1306, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (563, 35, 1319, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (564, 35, 1320, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (565, 35, 1321, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (566, 35, 1322, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (567, 35, 1323, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (568, 35, 1324, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (569, 35, 1307, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (570, 35, 1308, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (571, 35, 1309, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (572, 35, 1310, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (573, 35, 1311, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (574, 35, 1312, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (575, 35, 1313, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (576, 35, 1314, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (577, 35, 1315, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (578, 35, 1316, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (579, 35, 1317, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (580, 35, 1318, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (581, 35, 1325, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (582, 35, 1330, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (583, 35, 1245, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (584, 35, 1246, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (585, 35, 1247, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (586, 35, 1248, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (587, 35, 1249, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (588, 35, 1250, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (589, 35, 1251, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (590, 35, 1252, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (591, 35, 1253, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (592, 35, 1254, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (593, 35, 1255, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (594, 35, 1256, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (595, 35, 1257, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (596, 35, 1264, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (597, 35, 1265, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (598, 35, 1266, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (599, 35, 1267, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (600, 35, 1268, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (601, 35, 1269, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (602, 35, 1270, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (603, 35, 1271, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (604, 35, 1272, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (605, 35, 1273, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (606, 35, 1274, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (607, 35, 1275, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (608, 35, 1001, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (609, 35, 1002, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (610, 35, 1005, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (611, 35, 1006, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (612, 35, 1008, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (613, 35, 1012, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (614, 35, 1013, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (615, 35, 1017, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (616, 35, 1018, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (617, 35, 1021, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (618, 35, 1022, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (619, 35, 1025, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (620, 35, 1026, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (621, 35, 1027, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (622, 35, 1030, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (623, 35, 1031, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (624, 35, 1035, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (625, 35, 1100, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (626, 35, 1102, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (627, 35, 1103, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (628, 35, 1104, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (629, 35, 1105, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (630, 35, 1106, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (631, 35, 1101, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (632, 35, 1107, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (633, 35, 1108, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (634, 35, 107, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (635, 35, 1036, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (636, 35, 1037, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (637, 35, 1038, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (638, 35, 1039, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (639, 35, 1097, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (640, 35, 1098, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (641, 35, 1099, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (642, 35, 115, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (643, 35, 1055, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (644, 35, 1056, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (645, 35, 1058, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (646, 35, 1057, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (647, 35, 1059, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (648, 35, 500, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (649, 35, 1040, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (650, 35, 1041, NULL, '2026-01-19 11:33:32');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (651, 35, 1042, NULL, '2026-01-19 11:33:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (652, 35, 1136, NULL, '2026-01-19 11:33:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (653, 35, 1141, NULL, '2026-01-19 11:33:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (968, 36, 1307, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (969, 36, 1308, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (970, 36, 1309, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (971, 36, 1310, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (972, 36, 1311, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (973, 36, 1312, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (974, 36, 1313, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (975, 36, 1314, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (976, 36, 1331, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (977, 36, 1315, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (978, 36, 1316, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (979, 36, 1317, NULL, '2026-01-21 19:46:05');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (980, 36, 1332, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (981, 36, 1318, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (982, 36, 1330, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (983, 36, 1325, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (984, 36, 1276, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (985, 36, 1277, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (986, 36, 1278, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (987, 36, 1279, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (988, 36, 1280, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (989, 36, 1281, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (990, 36, 1282, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (991, 36, 1283, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (992, 36, 1284, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (993, 36, 1285, NULL, '2026-01-21 19:46:06');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (994, 36, 1286, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (995, 36, 1287, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (996, 36, 1288, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (997, 36, 1289, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (998, 36, 1290, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (999, 36, 1291, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1000, 36, 1292, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1001, 36, 1293, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1002, 36, 1294, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1003, 36, 1295, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1004, 36, 1296, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1005, 36, 1297, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1006, 36, 1298, NULL, '2026-01-21 19:46:07');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1007, 36, 1299, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1008, 36, 1300, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1009, 36, 1301, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1010, 36, 1302, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1011, 36, 1303, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1012, 36, 1304, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1013, 36, 1305, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1014, 36, 1306, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1015, 36, 1319, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1016, 36, 1320, NULL, '2026-01-21 19:46:08');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1017, 36, 1321, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1018, 36, 1322, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1019, 36, 1323, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1020, 36, 1324, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1021, 36, 1245, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1022, 36, 1246, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1023, 36, 1247, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1024, 36, 1248, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1025, 36, 1249, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1026, 36, 1250, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1027, 36, 1251, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1028, 36, 1252, NULL, '2026-01-21 19:46:09');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1029, 36, 1253, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1030, 36, 1254, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1031, 36, 1255, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1032, 36, 1256, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1033, 36, 1257, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1034, 36, 1264, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1035, 36, 1265, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1036, 36, 1266, NULL, '2026-01-21 19:46:10');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1037, 36, 1267, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1038, 36, 1268, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1039, 36, 1269, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1040, 36, 1270, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1041, 36, 1271, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1042, 36, 1272, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1043, 36, 1273, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1044, 36, 1274, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1045, 36, 1275, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1046, 36, 1, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1047, 36, 1109, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1048, 36, 1110, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1049, 36, 100, NULL, '2026-01-21 19:46:11');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1050, 36, 1001, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1051, 36, 1002, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1052, 36, 1003, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1053, 36, 1004, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1054, 36, 1005, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1055, 36, 1006, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1056, 36, 1007, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1057, 36, 101, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1058, 36, 1008, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1059, 36, 1009, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1060, 36, 1010, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1061, 36, 1011, NULL, '2026-01-21 19:46:12');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1062, 36, 1012, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1063, 36, 102, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1064, 36, 1013, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1065, 36, 1014, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1066, 36, 1015, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1067, 36, 1016, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1068, 36, 103, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1069, 36, 1017, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1070, 36, 1018, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1071, 36, 1019, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1072, 36, 1020, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1073, 36, 104, NULL, '2026-01-21 19:46:13');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1074, 36, 1021, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1075, 36, 1022, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1076, 36, 1023, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1077, 36, 1024, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1078, 36, 1025, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1079, 36, 105, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1080, 36, 1026, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1081, 36, 1027, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1082, 36, 1028, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1083, 36, 1029, NULL, '2026-01-21 19:46:14');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1084, 36, 1030, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1085, 36, 106, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1086, 36, 1031, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1087, 36, 1032, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1088, 36, 1033, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1089, 36, 1034, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1090, 36, 1035, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1091, 36, 1100, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1092, 36, 1102, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1093, 36, 1103, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1094, 36, 1104, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1095, 36, 1105, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1096, 36, 1106, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1097, 36, 1101, NULL, '2026-01-21 19:46:15');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1098, 36, 1107, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1099, 36, 1108, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1100, 36, 107, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1101, 36, 1036, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1102, 36, 1037, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1103, 36, 1038, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1104, 36, 1039, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1105, 36, 1097, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1106, 36, 1098, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1107, 36, 1099, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1108, 36, 3, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1109, 36, 115, NULL, '2026-01-21 19:46:16');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1110, 36, 1055, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1111, 36, 1056, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1112, 36, 1058, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1113, 36, 1057, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1114, 36, 1059, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1115, 36, 500, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1116, 36, 1040, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1117, 36, 1041, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1118, 36, 1042, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1119, 36, 1135, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1120, 36, 1136, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1121, 36, 1137, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1122, 36, 1138, NULL, '2026-01-21 19:46:17');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1123, 36, 1139, NULL, '2026-01-21 19:46:18');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1124, 36, 1140, NULL, '2026-01-21 19:46:18');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1125, 36, 1141, NULL, '2026-01-21 19:46:18');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1127, 38, 1330, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1128, 38, 1325, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1129, 38, 1333, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1130, 38, 1307, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1131, 38, 1308, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1132, 38, 1309, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1133, 38, 1310, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1134, 38, 1311, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1135, 38, 1312, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1136, 38, 1313, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1137, 38, 1314, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1138, 38, 1331, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1139, 38, 1315, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1140, 38, 1316, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1141, 38, 1317, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1142, 38, 1332, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1143, 38, 1318, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1144, 38, 1276, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1145, 38, 1277, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1146, 38, 1278, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1147, 38, 1279, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1148, 38, 1280, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1149, 38, 1351, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1150, 38, 1281, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1151, 38, 1282, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1152, 38, 1343, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1153, 38, 1295, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1154, 38, 1296, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1155, 38, 1297, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1156, 38, 1298, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1157, 38, 1299, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1158, 38, 1300, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1159, 38, 1347, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1160, 38, 1319, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1161, 38, 1320, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1162, 38, 1321, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1163, 38, 1322, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1164, 38, 1323, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1165, 38, 1324, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1166, 38, 1350, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1167, 38, 1283, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1168, 38, 1284, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1169, 38, 1285, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1170, 38, 1286, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1171, 38, 1287, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1172, 38, 1288, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1173, 38, 1345, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1174, 38, 1289, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1175, 38, 1290, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1176, 38, 1291, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1177, 38, 1292, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1178, 38, 1293, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1179, 38, 1294, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1180, 38, 1346, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1181, 38, 1301, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1182, 38, 1302, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1183, 38, 1303, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1184, 38, 1304, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1185, 38, 1305, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1186, 38, 1306, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1187, 38, 1348, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1188, 38, 1245, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1189, 38, 1246, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1190, 38, 1247, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1191, 38, 1248, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1192, 38, 1249, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1193, 38, 1250, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1194, 38, 1251, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1195, 38, 1340, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1196, 38, 1252, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1197, 38, 1253, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1198, 38, 1254, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1199, 38, 1255, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1200, 38, 1256, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1201, 38, 1257, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1202, 38, 1341, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1203, 38, 1264, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1204, 38, 1265, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1205, 38, 1266, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1206, 38, 1267, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1207, 38, 1268, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1208, 38, 1269, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1209, 38, 1342, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1210, 38, 1270, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1211, 38, 1271, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1212, 38, 1272, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1213, 38, 1273, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1214, 38, 1274, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1215, 38, 1275, NULL, '2026-05-11 22:34:33');
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `update_time`, `create_time`) VALUES (1216, 38, 1352, NULL, '2026-05-11 22:34:33');
COMMIT;
-- ----------------------------
-- Table structure for sys_user
-- ----------------------------

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `extra_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  KEY `dept_id` (`dept_id`) USING BTREE,
  KEY `phonenumber` (`phonenumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `extra_info`) VALUES (1, 100, 'admin', '超级管理员', '00', 'admin@qq.com', '15666666667', '0', '', 'qvksIdJGxuK/UlAOftqTmA==', '0', '0', '127.0.0.1', NULL, NULL, '2021-07-02 14:22:31', NULL, NULL, '管理员', '{"modifyAccount":null,"changedPassword":true}');
COMMIT;

DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
COMMIT;

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`role_id`,`user_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`) VALUES (1, 1, 23, '2025-12-22 11:54:09', '2025-12-22 11:54:09');
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`) VALUES (2, 1, 35, '2026-01-14 15:43:45', NULL);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`) VALUES (5, 1, 36, '2026-01-21 17:26:26', NULL);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_time`, `update_time`) VALUES (11, 1, 38, '2026-05-11 22:34:33', NULL);
COMMIT;

DROP TABLE IF EXISTS `wx_mp_user`;
CREATE TABLE `wx_mp_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公众号AppId',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `head_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `union_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `open_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '国家',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `is_subscribe` tinyint(1) DEFAULT '1' COMMENT '是否关注',
  `user_id` bigint DEFAULT NULL COMMENT '用户Id',
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wx_union_id` (`head_img_url`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='微信公众号用户 ';

-- ----------------------------

-- ----------------------------
-- Records of wx_mp_user (空表)
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;