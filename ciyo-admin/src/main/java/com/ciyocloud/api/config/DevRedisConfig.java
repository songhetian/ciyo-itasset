package com.ciyocloud.api.config;

import com.github.fppt.jedismock.RedisServer;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import java.io.IOException;

/**
 * 开发环境专用内嵌 Redis Mock 配置
 * 仅在 dev profile 激活时启动，本地开发无需额外部署 Redis
 */
@Configuration
@Profile("dev")
public class DevRedisConfig {

    private RedisServer redisServer;

    @PostConstruct
    public void startRedisMock() {
        try {
            redisServer = new RedisServer(6389);
            redisServer.start();
            System.out.println("=============================================== >>> 内嵌 Redis Mock 已启动 (端口: 6389) >>>");
        } catch (IOException e) {
            System.err.println("=============================================== >>> 内嵌 Redis Mock 启动失败: " + e.getMessage() + " >>>");
            throw new RuntimeException("内嵌 Redis Mock 启动失败", e);
        }
    }

    @PreDestroy
    public void stopRedisMock() {
        if (redisServer != null) {
            try {
                redisServer.stop();
                System.out.println("=============================================== >>> 内嵌 Redis Mock 已停止 >>>");
            } catch (IOException e) {
                System.err.println("=============================================== >>> 内嵌 Redis Mock 停止失败: " + e.getMessage() + " >>>");
            }
        }
    }
}
