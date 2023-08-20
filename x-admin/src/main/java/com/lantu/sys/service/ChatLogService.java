package com.lantu.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.lantu.sys.entity.ChatLog;

import java.util.List;

public interface ChatLogService extends IService<ChatLog> {
    List<ChatLog> getAllChatLogs();

    List<ChatLog> getChatLogs(int page, int size, String username, String startDate, String endDate);
}
