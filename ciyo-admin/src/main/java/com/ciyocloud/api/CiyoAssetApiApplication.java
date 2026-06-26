package com.ciyocloud.api;

import com.ciyocloud.common.constant.CommonConstants;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author codeck
 */
@SpringBootApplication
@EnableAsync
@EnableScheduling
@ComponentScan("com.ciyocloud.**")
public class CiyoAssetApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CiyoAssetApiApplication.class, args);
        System.out.printf("=============================================== >>> CIYO ASSET v%s 启动成功 >>>%n", CommonConstants.SYSTEM_VERSION);
    }

}
