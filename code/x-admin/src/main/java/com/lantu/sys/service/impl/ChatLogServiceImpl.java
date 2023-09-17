package com.lantu.sys.service.impl;




import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lantu.sys.entity.ChatInfo;
import com.lantu.sys.mapper.ChatLogMapper;
import com.lantu.sys.service.IChatLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatLogServiceImpl extends ServiceImpl<ChatLogMapper, ChatInfo> implements IChatLogService {
    @Autowired
    private  ChatLogMapper chatLogMapper;

    @Override
    public List<ChatInfo> getAllChatLogs() {
        return chatLogMapper.selectList(null);
    }

    @Override
    public List<ChatInfo> getChatLogs(int page, int size, String username, String startDate, String endDate) {
        QueryWrapper<ChatInfo> queryWrapper = new QueryWrapper<>();
        // 构建查询条件
        if (!username.isEmpty()) {
            queryWrapper.like("user_id", username);
        }
        // 处理日期范围查询
        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            queryWrapper.between("request_time", startDate, endDate);
        }
        // 构建分页对象
        Page<ChatInfo> pagination = new Page<>(page, size);
        // 执行查询
        return chatLogMapper.selectPage(pagination, queryWrapper).getRecords();
    }
}
