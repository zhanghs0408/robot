package com.itheima.controller.comm;

import com.itheima.exception.BusinessException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

// 标识当前类是一个异常处理类
@RestControllerAdvice
public class ProjectExceptionAdvice {
    /**
     * 处理自定义的业务异常
     */
    @ExceptionHandler(BusinessException.class)
    public R<String> doBusinessException(BusinessException e){
        // 记录日志
        e.printStackTrace();
        // 发送消息给开发人员
        // 给用户响应友好提示
        return R.error(e.getMessage());
    }

    /**
     * 处理其它异常
     */
    @ExceptionHandler(Exception.class)
    public R<String> doException(Exception e){
        // 记录日志
        e.printStackTrace();
        // 发送消息给开发人员
        // 给用户响应友好提示
        return R.error("服务器正忙，请稍后再试~");
    }
}
