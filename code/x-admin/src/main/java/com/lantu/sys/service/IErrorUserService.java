package com.lantu.sys.service;

import com.lantu.sys.entity.ErrorUser;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhanghongshuai
 * @since 2023-09-17
 */
public interface IErrorUserService extends IService<ErrorUser> {
    public ErrorUser getById(Long id);
    public List<ErrorUser> getAll();
    public void create(ErrorUser errorUser);
    public void update(ErrorUser errorUser);
    public void delete(Long id);
}
