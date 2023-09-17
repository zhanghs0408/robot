package com.itheima.exception;

/**
 * 业务异常类
 */
public class BusinessException extends RuntimeException{
    // 将非法操作转换自定义异常，不包含原始异常
    public BusinessException(String message) {
        super(message);
    }

    // 将非法操作转换自定义异常，包含原始异常
    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }

}
