package com.itheima.controller.comm;

import lombok.Data;

@Data
public class R<T> {
    // 状态码
    private Integer code;   // 0:失败，1：成功
    // 核心数据
    private T data;
    // 描述
    private String msg;

    // 用于创建成功响应对象的方法
    public static <T> R<T> success(T data){
        R<T> r = new R<>();
        r.setCode(1);
        r.setData(data);
        return r;
    }

    // 用于创建失败响应对象的方法
    public static <T> R<T> error(String msg){
        R<T> r = new R<>();
        r.setCode(0);
        r.setMsg(msg);
        return r;
    }
}
