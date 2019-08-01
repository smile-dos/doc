-- 用户和权限
-- 用户表
CREATE TABLE IF NOT EXISTS `hd_user` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `username` VARCHAR(50) NOT NULL COMMENT '用户名',
    `password` VARCHAR(200) NOT NULL COMMENT '密码',
    `is_superuser` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否是超级用户',
    `is_active` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否激活',
    `email` VARCHAR(300) DEFAULT NULL COMMENT '邮箱地址',
    `phone` VARCHAR(30) DEFAULT NULL COMMENT '联系方式',
    `contactor` VARCHAR(50) DEFAULT NULL COMMENT '联系人',
    `realname` VARCHAR(50) DEFAULT NULL COMMENT '真实姓名',
    `avatar` VARCHAR(200) DEFAULT NULL COMMENT '头像文件路径',
    `service_serial` VARCHAR(200) DEFAULT NULL COMMENT '服务员的服务号码',
    `is_modify_username` TINYINT(1) DEFAULT 0 COMMENT '是否允许更改用户名',
    `is_vip` TINYINT(1) DEFAULT 0 COMMENT '是否是VIP',
    `vip_id` INT(11) UNSIGNED DEFAULT NULL COMMENT 'vip信息', 
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_username` (`username`),
    UNIQUE KEY `unique_email` (`email`),
    UNIQUE KEY `unique_phone` (`phone`),
    UNIQUE KEY `unique_service_serial` (`service_serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 角色表
CREATE TABLE IF NOT EXISTS `hd_role` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(50) NOT NULL COMMENT '角色名称',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEy `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 权限表
CREATE TABLE IF NOT EXISTS `hd_perm` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(50) NOT NULL COMMENT '角色名称',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- 用户角色关系表
CREATE TABLE IF NOT EXISTS `hd_user_role_relation` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` INT(11) UNSIGNED NOT NULL COMMENT '用户ID',
    `role_id` INT(11) UNSIGNED NOT NULL COMMENT '角色ID',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 角色权限关系表
CREATE TABLE IF NOT EXISTS `hd_role_perm_relation` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id` INT(11) UNSIGNED NOT NULL COMMENT '角色ID',
    `perm_id` INT(11) UNSIGNED NOT NULL COMMENT '权限ID',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 配置表
-- 桌号配置
CREATE TABLE IF NOT EXISTS `hd_table_no` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `serial` VARCHAR(100) NOT NULL COMMENT '序列号',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 设备配置表
CREATE TABLE IF NOT EXISTS `hd_device` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `serial` VARCHAR(100) NOT NULL COMMENT '序列号',
    `device_id` VARCHAR(100) NOT NULL COMMENT '序列号',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_serial` (`serial`),
    UNIQUE KEY `unique_device_id` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 仓库的配置
-- 物品配置表
CREATE TABLE IF NOT EXISTS `hd_goods` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT '物品名称',
    `number` SMALLINT(4) NOT NULL DEFAULT 0 COMMENT '物品个数',
    `type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '物品类型, 0:餐具，1:清洁用品, 2:电子设备, 3, 食材',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 用餐方式配置表 - 店内用餐，外卖，打包
CREATE TABLE IF NOT EXISTS `hd_dining_style` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT '物品名称',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- VIP等级配置
CREATE TABLE IF NOT EXISTS `hd_vip_level` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT 'VIP名称',
    `level` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '等级',
    `pic` VARCHAR(200) DEFAULT NULL COMMENT '等级对应的图片',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 商品和订单
-- 商品类型
CREATE TABLE IF NOT EXISTS `hd_commodity_category` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT '类型名称',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 商品
CREATE TABLE IF NOT EXISTS `hd_commodity` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT '商品名称',
    `serial` VARCHAR(200) NOT NULL COMMENT '商品序列号',
    `commodity_category_id` INT(11) UNSIGNED NOT NULL COMMENT '商品分类ID',
    `origin_price` DECIMAL(10, 2) DEFAULT 0 NOT NULL COMMENT '原始价格',
    `is_promote` TINYINT(1) DEFAULT 0 NOT NULL COMMENT '是否促销',
    `is_hot` TINYINT(1) DEFAULT 0 NOT NULL COMMENT '是否热卖',
    `is_recomend` TINYINT(1) DEFAULT 0 NOT NULL COMMENT '是否推荐',
    `avatar` VARCHAR(200) NOT NULL COMMENT '封面图片',
    `is_delete`  TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `detail` LONGTEXT NOT NULL COMMENT '详情',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 商品相册
CREATE TABLE IF NOT EXISTS `hd_commodity_album` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `commodity_id` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
    `pic` VARCHAR(200) NOT NULL COMMENT '图片路径',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 活动
CREATE TABLE IF NOT EXISTS `hd_activity` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` VARCHAR(100) NOT NULL COMMENT '活动标题',
    `type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '活动类型：0，商品活动; 1, 会员活动',
    `promote_type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '促销方式: 0, 减钱; 1, 折扣',
    `start_time` DATETIME(6) DEFAULT NULL COMMENT '活动开始时间',
    `end_time` DATETIME(6) DEFAULT NULL COMMENT '活动结束时间',
    `detail` VARCHAR(300) DEFAULT NULL COMMENT '活动描述信息',
    `value` INT(11) UNSIGNED DEFAULT 0 COMMENT '促销金钱，如果是折扣，代表百分比，如果是减钱，就是面值',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `commodity_id` int(11) UNSIGNED DEFAULT NULL COMMENT '商品ID',
    `vip_id` int(11) UNSIGNED DEFAULT NULL COMMENT '商品ID',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 优惠券（暂时不用）
CREATE TABLE IF NOT EXISTS `hd_coupon` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` VARCHAR(100) NOT NULL COMMENT '名称',
    `coupon` TINYINT(4) DEFAULT 0 NOT NULL COMMENT '优惠方式:  0, 减钱; 1, 折扣',
    `value` INT(11) UNSIGNED DEFAULT 0 COMMENT '优惠金钱，如果是折扣，代表百分比，如果是减钱，就是面值',
    `start_time` DATETIME(6) DEFAULT NULL COMMENT '活动开始时间',
    `end_time` DATETIME(6) DEFAULT NULL COMMENT '活动结束时间',
    `is_delete` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `unqiue_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 优惠券购买激励（暂时不用）
CREATE TABLE IF NOT EXISTS `hd_coupon_purchase_record` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` INT(11) UNSIGNED NOT NULL COMMENT '用户ID',
    `coupon_id` INT(11) UNSIGNED NOT NULL COMMENT '优惠券ID',
    `message` VARCHAR(200) DEFAULT NULL COMMENT '消息',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 订单
CREATE TABLE IF NOT EXISTS `hd_order` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `serial` VARCHAR(200) NOT NULL COMMENT '订单序列号',
    `user_id` INT(11) UNSIGNED DEFAULT NULL COMMENT '用户ID',
    `service_id` INT(11) UNSIGNED DEFAULT NULL COMMENT '服务员ID',
    `origin_total_price` DECIMAL(10, 2) DEFAULT 0 NOT NULL COMMENT '优惠之前的价格',
    `after_total_price` DECIMAL(10, 2) DEFAULT 0 NOT NULL COMMENT '优惠之后的价格',
    `status` TINYINT(4) DEFAULT 0 NOT NULL COMMENT '状态: 0, 未支付; 1, 支付完成;',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 订单和商品的关系
CREATE TABLE IF NOT EXISTS `hd_order_commodity` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_id` INT(11) UNSIGNED NOT NULL COMMENT '订单ID',
    `commodity_id` INT(11) UNSIGNED NOT NULL COMMENT '商品ID',
    `commodity_number` INT(11) UNSIGNED DEFAULT 1 NOT NULL COMMENT '商品个数',
    `commodity_price` DECIMAL(10, 2) DEFAULT 0 COMMENT '商品价格',
    `is_promote` TINYINT(1) DEFAULT 0 NOT NULL COMMENT '是否促销',
    `promote_type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '促销方式: 0, 减钱; 1, 折扣，采用activity表中的promote_type的字段',
    `promote_value` INT(11) UNSIGNED DEFAULT 0 COMMENT '促销金钱，如果是折扣，代表百分比，如果是减钱，就是面值，采用activity表中的value值',
    `is_vip` TINYINT(1) DEFAULT 0 NOT NULL COMMENT 'VIP会员是否优惠',
    `vip_promote_type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '促销方式: 0, 减钱; 1, 折扣，采用activity表中的promote_type的字段',
    `vip_promote_value` INT(11) UNSIGNED DEFAULT 0 COMMENT '促销金钱，如果是折扣，代表百分比，如果是减钱，就是面值，采用activity表中的value值',
    `promote_choice` TINYINT(4) DEFAULT 0 NOT NULL COMMENT '优惠方式，0: 商品促销优惠和VIP优惠二选一; 1.商品促销优惠和VIP优惠两个共存',
    `promote_price` DECIMAL(10, 2) DEFAULT 0 COMMENT '优惠价格',
    `commodity_after_promote_price` DECIMAL(10, 2) DEFAULT 0 COMMENT '商品优惠后的价格',
    `status` TINYINT(4) DEFAULT 0 NOT NULL COMMENT '状态: 0, 准备中; 1, 制作完成; 2, 已上菜',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 反馈信息
CREATE TABLE IF NOT EXISTS `hd_feedback` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id` INT(11) UNSIGNED DEFAULT NULL COMMENT '用户ID，预留字段',
    `type`  TINYINT(4) NOT NULL DEFAULT 0 COMMENT '0: 服务; 1: 食品; 2: 卫生',
    `description` VARCHAR(200) DEFAULT NULL COMMENT '描述信息',
    `stars` TINYINT(4) DEFAULT 1 COMMENT '星星个数',
    `create_at` DATETIME(6) DEFAULT NULL COMMENT '创建时间',
    `update_at` DATETIME(6) DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
