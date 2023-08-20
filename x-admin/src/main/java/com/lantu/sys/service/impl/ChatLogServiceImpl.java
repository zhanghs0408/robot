package com.lantu.sys.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lantu.sys.entity.ChatLog;
import com.lantu.sys.mapper.ChatLogMapper;
import com.lantu.sys.mapper.MenuMapper;
import com.lantu.sys.service.ChatLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ChatLogServiceImpl extends ServiceImpl<ChatLogMapper, ChatLog> implements ChatLogService  {
    @Autowired
    private  ChatLogMapper chatLogMapper;

    @Override
    public List<ChatLog> getAllChatLogs() {
        return chatLogMapper.selectList(null);
    }

    @Override
    public List<ChatLog> getChatLogs(int page, int size, String username, String startDate, String endDate) {
        QueryWrapper<ChatLog> queryWrapper = new QueryWrapper<>();
        // 构建查询条件
        if (!username.isEmpty()) {
            queryWrapper.like("username", username);
        }
        // 处理日期范围查询
        if (!startDate.isEmpty() && !endDate.isEmpty()) {
            queryWrapper.between("reply_time", startDate, endDate);
        }
        // 构建分页对象
        Page<ChatLog> pagination = new Page<>(page, size);
        // 执行查询
        return chatLogMapper.selectPage(pagination, queryWrapper).getRecords();
    }
}
