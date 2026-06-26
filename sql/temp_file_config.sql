SET NAMES utf8mb4;
USE ciyo_itam;

INSERT INTO sys_env_config (env_key, env_value, create_time, update_time) VALUES (
  'fileEnvConfig',
  '{"ossType":"LOCAL","uploadFolder":"/data/upload","accessPathPattern":"/u/**","domain":""}',
  NOW(),
  NOW()
)
ON DUPLICATE KEY UPDATE env_value = VALUES(env_value), update_time = NOW();

SELECT env_key, env_value FROM sys_env_config WHERE env_key = 'fileEnvConfig';
