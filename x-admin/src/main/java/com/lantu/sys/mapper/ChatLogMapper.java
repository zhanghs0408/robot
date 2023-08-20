package com.lantu.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lantu.sys.entity.ChatLog;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatLogMapper extends BaseMapper<ChatLog> {
    // 可根据需要添加自定义的查询方法
}
