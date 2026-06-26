package com.ciyocloud.api.listener;

import com.ciyocloud.common.constant.ConfigConstants;
import com.ciyocloud.common.util.JsonUtils;
import com.ciyocloud.envconfig.entity.event.EnvConfigRefreshEvent;
import com.ciyocloud.message.thirdparty.email.MailConfiguration;
import com.ciyocloud.message.thirdparty.sms.SmsConfiguration;
import com.ciyocloud.storage.cloud.OssStorageFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EnvConfigRefreshListener {

    @EventListener
    public void envConfigRefreshEvent(EnvConfigRefreshEvent event) {
        log.debug("配置更新:{}", JsonUtils.objToJson(event.getConfig()));
        switch (event.getConfig().getEnvKey().trim()) {
            case ConfigConstants.FILE_ENV_CONFIG:
                OssStorageFactory.build();
                log.info("文件存储配置已更新");
                break;
            case ConfigConstants.SMS_ENV_CONFIG:
                SmsConfiguration.buildMsgSender();
                log.info("短信配置已更新");
                break;
            case ConfigConstants.EMAIL_ENV_CONFIG:
                MailConfiguration.buildMailSender();
                log.info("邮件配置已更新");
                break;
            default:
                break;
        }
    }
}
