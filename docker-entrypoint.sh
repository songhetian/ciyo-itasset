#!/bin/bash
set -e

# =============================================
# Docker 容器启动脚本
# 功能:
#   1. 等待 MySQL 就绪
#   2. 启动 Spring Boot 应用
#
# 注意:
#   - 数据库初始化由 MySQL 容器自动完成（/docker-entrypoint-initdb.d/）
# =============================================

# 数据库配置
MYSQL_HOST="${MYSQL_HOST:-mysql}"
MYSQL_PORT="${MYSQL_PORT:-3306}"
MYSQL_DATABASE="${MYSQL_DATABASE:-ciyo_itam}"
MYSQL_USER="${MYSQL_USER:-ciyo}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-ciyo123456}"

echo "============================================="
echo "西柚IT资产管理系统 启动中..."
echo "MySQL: ${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}"
echo "============================================="

# 等待 MySQL 就绪（使用 bash TCP 检测）
wait_for_mysql() {
    local max_attempts=30
    local attempt=1
    local wait_interval=3

    echo "等待 MySQL 服务就绪..."

    while [ $attempt -le $max_attempts ]; do
        # 检查 TCP 端口是否开放
        if timeout 5 bash -c "echo > /dev/tcp/${MYSQL_HOST}/${MYSQL_PORT}" 2>/dev/null; then
            echo "MySQL 端口已开放，等待服务完全启动..."
            # 多等几秒确保 MySQL 完全就绪
            sleep 5
            echo "MySQL 已就绪!"
            return 0
        fi

        echo "尝试 ${attempt}/${max_attempts} - MySQL 还未就绪，等待 ${wait_interval} 秒..."
        sleep $wait_interval
        attempt=$((attempt + 1))
    done

    echo "警告: MySQL 连接超时，尝试继续启动..."
    return 1
}

# 等待 MySQL
wait_for_mysql

# 启动 Spring Boot 应用
echo "启动 Spring Boot 应用..."
echo "============================================="

java -jar /app/app.jar
