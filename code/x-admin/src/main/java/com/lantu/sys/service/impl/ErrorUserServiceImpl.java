package com.lantu.sys.service.impl;

import com.lantu.sys.entity.ErrorUser;
import com.lantu.sys.mapper.ErrorUserMapper;
import com.lantu.sys.service.IErrorUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhanghongshuai
 * @since 2023-09-17
 */
@Service
public class ErrorUserServiceImpl extends ServiceImpl<ErrorUserMapper, ErrorUser> implements IErrorUserService {
    @Autowired
    private ErrorUserMapper errorUserMapper;

    public ErrorUser getById(Long id) {
        return errorUserMapper.selectById(id);
    }

    public List<ErrorUser> getAll() {
        return errorUserMapper.selectList(null);
    }

    public void create(ErrorUser errorUser) {
        errorUserMapper.insert(errorUser);
    }

    public void update(ErrorUser errorUser) {
        errorUserMapper.updateById(errorUser);
    }

    public void delete(Long id) {
        errorUserMapper.deleteById(id);
    }
}
