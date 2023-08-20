package com.lantu.sys.entity;

import java.time.LocalDateTime;

public class ChatLog {
    private Long id;
    private Long userId;
    private String username;
    private String userInput;
    private String robotReply;
    private LocalDateTime replyTime;
    private boolean resolved;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserInput() {
        return userInput;
    }

    public void setUserInput(String userInput) {
        this.userInput = userInput;
    }

    public String getRobotReply() {
        return robotReply;
    }

    public void setRobotReply(String robotReply) {
        this.robotReply = robotReply;
    }

    public LocalDateTime getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(LocalDateTime replyTime) {
        this.replyTime = replyTime;
    }

    public boolean isResolved() {
        return resolved;
    }

    public ChatLog(Long id, Long userId, String username, String userInput, String robotReply, LocalDateTime replyTime, boolean resolved) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.userInput = userInput;
        this.robotReply = robotReply;
        this.replyTime = replyTime;
        this.resolved = resolved;
    }

    public void setResolved(boolean resolved) {
        this.resolved = resolved;
    }

    // 省略构造函数、getter和setter方法
}
