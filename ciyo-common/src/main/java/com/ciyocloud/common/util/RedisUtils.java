package com.ciyocloud.common.util;

import cn.hutool.core.convert.Convert;
import com.fasterxml.jackson.core.type.TypeReference;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * Redis 工具类
 * 所有操作均有异常保护，Redis 故障时不影响主业务流程
 *
 * @author codeck
 * @since 23/09/2018
 */
@Slf4j
@Component
@ConditionalOnBean(RedisTemplate.class)
public class RedisUtils {

    /**
     * 默认过期时长，单位：秒 一天
     */
    public final static long DEFAULT_EXPIRE = 60 * 60 * 24;
    /**
     * 不设置过期时长
     */
    public final static long NOT_EXPIRE = -1;
    @Getter
    private final RedisTemplate<String, Object> redisTemplate;


    public RedisUtils(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    /**
     * 写入缓存
     *
     * @param key   键
     * @param value 值
     * @return 是否成功
     */
    public boolean set(final String key, Object value) {
        boolean result = false;
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value);
            result = true;
        } catch (Exception e) {
            log.error("Redis set error, key: {}", key, e);
        }
        return result;
    }

    /**
     * 写入缓存设置时效时间
     *
     * @param key        键
     * @param value      值
     * @param expireTime 过期时间 秒
     * @return 是否成功
     */
    public boolean set(final String key, Object value, Long expireTime) {
        boolean result = false;
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value, expireTime, TimeUnit.SECONDS);
            result = true;
        } catch (Exception e) {
            log.error("Redis set error, key: {}, expireTime: {}s", key, expireTime, e);
        }
        return result;
    }

    /**
     * 写入缓存设置时效时间
     *
     * @param key        键
     * @param value      值
     * @param expireTime 过期时间
     * @param timeUnit   时间单位
     * @return 是否成功
     */
    public boolean set(final String key, Object value, Long expireTime, TimeUnit timeUnit) {
        boolean result = false;
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            operations.set(key, value, expireTime, timeUnit);
            result = true;
        } catch (Exception e) {
            log.error("Redis set error, key: {}, expireTime: {} {}", key, expireTime, timeUnit, e);
        }
        return result;
    }

    /**
     * 写入缓存设置时效时间（原子操作）
     *
     * @param key        键
     * @param value      值
     * @param expireTime 过期时间
     * @param timeUnit   时间单位
     * @return 是否成功
     */
    public boolean setNx(final String key, Object value, Long expireTime, TimeUnit timeUnit) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            Boolean result = operations.setIfAbsent(key, value, expireTime, timeUnit);
            return Boolean.TRUE.equals(result);
        } catch (Exception e) {
            log.error("Redis setNx error, key: {}", key, e);
            return false;
        }
    }


    /**
     * 批量删除key
     *
     * @param pattern 键模式
     */
    public void removePattern(final String pattern) {
        try {
            Set<String> keys = redisTemplate.keys(pattern);
            if (keys != null && !keys.isEmpty()) {
                redisTemplate.delete(keys);
            }
        } catch (Exception e) {
            log.error("Redis removePattern error, pattern: {}", pattern, e);
        }
    }

    /**
     * 删除对应的value
     *
     * @param key 键
     */
    public void remove(final String key) {
        try {
            if (exists(key)) {
                redisTemplate.delete(key);
            }
        } catch (Exception e) {
            log.error("Redis remove error, key: {}", key, e);
        }
    }

    /**
     * 判断缓存中是否有对应的value
     *
     * @param key 键
     * @return 是否存在
     */
    public boolean exists(final String key) {
        try {
            Boolean result = redisTemplate.hasKey(key);
            return Boolean.TRUE.equals(result);
        } catch (Exception e) {
            log.error("Redis exists error, key: {}", key, e);
            return false;
        }
    }

    /**
     * 根据key 设置过期时间
     *
     * @param key        键
     * @param expireTime 过期时间
     * @param timeUnit   时间单位
     * @return 是否成功
     */
    public boolean setExpire(String key, long expireTime, TimeUnit timeUnit) {
        try {
            Boolean result = redisTemplate.expire(key, expireTime, timeUnit);
            return Boolean.TRUE.equals(result);
        } catch (Exception e) {
            log.error("Redis setExpire error, key: {}", key, e);
            return false;
        }
    }


    /**
     * 根据key 获取过期时间
     *
     * @param key 键
     * @return 时间(秒) 返回0代表为永久有效，返回-1代表查询失败
     */
    public long getExpire(String key) {
        try {
            Long result = redisTemplate.getExpire(key, TimeUnit.SECONDS);
            return result != null ? result : -1;
        } catch (Exception e) {
            log.error("Redis getExpire error, key: {}", key, e);
            return -1;
        }
    }

    /**
     * 递增
     *
     * @param key   键
     * @param delta 要增加几(大于0)
     * @return 递增后的值，失败返回-1
     */
    public long incr(String key, long delta) {
        if (delta < 0) {
            throw new RuntimeException("递增因子必须大于0");
        }
        try {
            Long result = redisTemplate.opsForValue().increment(key, delta);
            return result != null ? result : -1;
        } catch (Exception e) {
            log.error("Redis incr error, key: {}, delta: {}", key, delta, e);
            return -1;
        }
    }

    /**
     * 递减
     *
     * @param key   键
     * @param delta 要减少几(小于0)
     * @return 递减后的值，失败返回-1
     */
    public long decr(String key, long delta) {
        if (delta < 0) {
            throw new RuntimeException("递减因子必须大于0");
        }
        try {
            Long result = redisTemplate.opsForValue().increment(key, -delta);
            return result != null ? result : -1;
        } catch (Exception e) {
            log.error("Redis decr error, key: {}, delta: {}", key, delta, e);
            return -1;
        }
    }


    /**
     * 读取缓存
     *
     * @param key 键
     * @return 值，失败返回null
     */
    public Object get(final String key) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            return operations.get(key);
        } catch (Exception e) {
            log.error("Redis get error, key: {}", key, e);
            return null;
        }
    }


    /**
     * 读取缓存并转换为指定类型
     *
     * @param key 键
     * @param clz 类型
     * @param <T> 泛型
     * @return 值，失败返回null
     */
    public <T> T get(String key, Class<T> clz) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            Object result = operations.get(key);
            if (null != result) {
                return Convert.convert(clz, result);
            }
            return null;
        } catch (Exception e) {
            log.error("Redis get error, key: {}, type: {}", key, clz.getName(), e);
            return null;
        }
    }

    /**
     * 读取缓存，失败返回默认值
     *
     * @param key          键
     * @param clz          类型
     * @param defaultValue 默认值
     * @param <T>          泛型
     * @return 值或默认值
     */
    public <T> T getOrDefault(String key, Class<T> clz, T defaultValue) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            Object result = operations.get(key);
            if (null != result) {
                return Convert.convert(clz, result, defaultValue);
            }
        } catch (Exception e) {
            log.error("Redis getOrDefault error, key: {}", key, e);
        }
        return defaultValue;
    }


    /**
     * 读取缓存并将JSON字符串转为对象
     *
     * @param key 键
     * @param clz 类型
     * @param <T> 泛型
     * @return 对象，失败返回null
     */
    public <T> T getJsonStr2Obj(String key, Class<T> clz) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            Object result = operations.get(key);
            if (null != result) {
                return JsonUtils.jsonToObj(Convert.toStr(result), clz);
            }
            return null;
        } catch (Exception e) {
            log.error("Redis getJsonStr2Obj error, key: {}", key, e);
            return null;
        }
    }

    /**
     * 读取数组并转成成复杂对象 比如Map或者List
     *
     * @param key   键
     * @param clazz 类型引用
     * @param <T>   泛型
     * @return 对象，失败返回null
     */
    public <T> T getJsonStr2Obj(String key, TypeReference<T> clazz) {
        try {
            ValueOperations<String, Object> operations = redisTemplate.opsForValue();
            Object result = operations.get(key);
            if (null != result) {
                return JsonUtils.objToObj(Convert.toStr(result), clazz);
            }
            return null;
        } catch (Exception e) {
            log.error("Redis getJsonStr2Obj error, key: {}", key, e);
            return null;
        }
    }


    /**
     * 哈希 添加
     *
     * @param key     键
     * @param hashKey 哈希键
     * @param value   值
     */
    public void hmSet(String key, Object hashKey, Object value) {
        try {
            HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
            hash.put(key, hashKey, value);
        } catch (Exception e) {
            log.error("Redis hmSet error, key: {}, hashKey: {}", key, hashKey, e);
        }
    }

    /**
     * 哈希获取数据
     *
     * @param key     键
     * @param hashKey 哈希键
     * @return 值，失败返回null
     */
    public Object hmGet(String key, Object hashKey) {
        try {
            HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
            return hash.get(key, hashKey);
        } catch (Exception e) {
            log.error("Redis hmGet error, key: {}, hashKey: {}", key, hashKey, e);
            return null;
        }
    }

    /**
     * 哈希 长度
     *
     * @param key 键
     * @return 长度，失败返回0
     */
    public Long hmSize(String key) {
        try {
            HashOperations<String, Object, Object> hash = redisTemplate.opsForHash();
            return hash.size(key);
        } catch (Exception e) {
            log.error("Redis hmSize error, key: {}", key, e);
            return 0L;
        }
    }

    /**
     * 列表添加（右侧入队）
     *
     * @param k 键
     * @param v 值
     */
    public void lPush(String k, Object v) {
        try {
            ListOperations<String, Object> list = redisTemplate.opsForList();
            list.rightPush(k, v);
        } catch (Exception e) {
            log.error("Redis lPush error, key: {}", k, e);
        }
    }

    /**
     * 列表获取
     *
     * @param k  键
     * @param l  起始索引
     * @param l1 结束索引
     * @return 列表，失败返回空列表
     */
    public List<Object> lRange(String k, long l, long l1) {
        try {
            ListOperations<String, Object> list = redisTemplate.opsForList();
            return list.range(k, l, l1);
        } catch (Exception e) {
            log.error("Redis lRange error, key: {}", k, e);
            return Collections.emptyList();
        }
    }

    /**
     * 集合添加
     *
     * @param key   键
     * @param value 值
     */
    public void add(String key, Object value) {
        try {
            SetOperations<String, Object> set = redisTemplate.opsForSet();
            set.add(key, value);
        } catch (Exception e) {
            log.error("Redis add error, key: {}", key, e);
        }
    }

    /**
     * 集合获取
     *
     * @param key 键
     * @return 集合，失败返回空集合
     */
    public Set<Object> setMembers(String key) {
        try {
            SetOperations<String, Object> set = redisTemplate.opsForSet();
            return set.members(key);
        } catch (Exception e) {
            log.error("Redis setMembers error, key: {}", key, e);
            return Collections.emptySet();
        }
    }

    /**
     * 集合删除
     *
     * @param key   键
     * @param value 值
     * @return 删除数量，失败返回0
     */
    public Long setRemove(String key, String value) {
        try {
            SetOperations<String, Object> set = redisTemplate.opsForSet();
            return set.remove(key, value);
        } catch (Exception e) {
            log.error("Redis setRemove error, key: {}", key, e);
            return 0L;
        }
    }

    /**
     * 有序集合添加
     *
     * @param key   键
     * @param value 值
     * @param score 分数
     */
    public void zAdd(String key, Object value, double score) {
        try {
            ZSetOperations<String, Object> zset = redisTemplate.opsForZSet();
            zset.add(key, value, score);
        } catch (Exception e) {
            log.error("Redis zAdd error, key: {}", key, e);
        }
    }


    /**
     * 有序集合获取（按分数范围）
     *
     * @param key 键
     * @param min 最小分数
     * @param max 最大分数
     * @return 集合，失败返回空集合
     */
    public Set<Object> rangeByScore(String key, double min, double max) {
        try {
            ZSetOperations<String, Object> zset = redisTemplate.opsForZSet();
            return zset.rangeByScore(key, min, max);
        } catch (Exception e) {
            log.error("Redis rangeByScore error, key: {}", key, e);
            return Collections.emptySet();
        }
    }

    /**
     * 按模式获取所有key
     *
     * @param pattern 键模式
     * @return key集合，失败返回空集合
     */
    public Collection<String> keys(final String pattern) {
        try {
            return redisTemplate.keys(pattern);
        } catch (Exception e) {
            log.error("Redis keys error, pattern: {}", pattern, e);
            return Collections.emptySet();
        }
    }


}
