package com.lantu.sys.controller;

import com.lantu.sys.entity.ChatLog;
import com.lantu.sys.service.ChatLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin   //跨域处理
public class ChatLogController {


    @Autowired
    private  ChatLogService chatLogService;




    @GetMapping("/chat-logs")
    public List<ChatLog> getChatLogs(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "") String username,
            @RequestParam(defaultValue = "") String startDate,
            @RequestParam(defaultValue = "") String endDate
    ) {
        return chatLogService.getChatLogs(page, size, username, startDate, endDate);
    }
}
