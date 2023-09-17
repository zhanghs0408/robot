package com.lantu.sys.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.lantu.sys.entity.ChatInfo;

import java.util.List;

public interface IChatLogService extends IService<ChatInfo> {
    List<ChatInfo> getAllChatLogs();

    List<ChatInfo> getChatLogs(int page, int size, String username, String startDate, String endDate);
}
