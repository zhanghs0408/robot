package com.lantu.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lantu.sys.entity.ChatInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatLogMapper extends BaseMapper<ChatInfo> {
    // 可根据需要添加自定义的查询方法
}
