-- 更新系统配置为雷犀品牌
UPDATE sys_env_config
SET env_value = '{"logo": "", "name": "雷犀IT资产管理系统", "logoImg": "", "copyright": "<p>Copyright © 2018-2026 雷犀 All Rights Reserved.</p>", "webBaseUrl": "http://localhost", "backgroundImage": "", "allowThirdPartyLogin": false, "thirdPartyLoginTypeList": []}'
WHERE env_key = 'systemInfoConfig';
