# =============================================
# 多阶段构建 Dockerfile - 后端服务
# 阶段一: 构建后端 (Maven)
# 阶段二: 运行镜像 (JRE + MySQL Client)
# =============================================

# 阶段一: 后端构建 (Maven)
FROM maven:3.9-eclipse-temurin-17 AS back-builder

WORKDIR /app

# 复制后端源码
COPY pom.xml ./
COPY ciyo-admin/pom.xml ciyo-admin/
COPY ciyo-asset/pom.xml ciyo-asset/
COPY ciyo-common/pom.xml ciyo-common/
COPY ciyo-file/pom.xml ciyo-file/
COPY ciyo-generator/pom.xml ciyo-generator/
COPY ciyo-job/pom.xml ciyo-job/
COPY ciyo-message/pom.xml ciyo-message/
COPY ciyo-system/pom.xml ciyo-system/

# 复制后端源码
COPY ciyo-admin/src ciyo-admin/src
COPY ciyo-asset/src ciyo-asset/src
COPY ciyo-common/src ciyo-common/src
COPY ciyo-file/src ciyo-file/src
COPY ciyo-generator/src ciyo-generator/src
COPY ciyo-job/src ciyo-job/src
COPY ciyo-message/src ciyo-message/src
COPY ciyo-system/src ciyo-system/src

# 复制 SQL 文件（用于容器内初始化）
COPY sql/ /app/sql/

# 构建后端 JAR（跳过测试）
RUN mvn clean package -DskipTests

# =============================================

# 阶段二: 运行镜像
FROM eclipse-temurin:17-jre

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

# 从阶段一复制后端 JAR
COPY --from=back-builder /app/ciyo-admin/target/ciyo-admin.jar ./app.jar

# 复制 SQL 文件（挂载到容器内用于手动初始化）
COPY --from=back-builder /app/sql/ ./sql/

# 复制 entrypoint 脚本
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# 暴露端口
EXPOSE 8088

# 使用 entrypoint 脚本启动
ENTRYPOINT ["/docker-entrypoint.sh"]
