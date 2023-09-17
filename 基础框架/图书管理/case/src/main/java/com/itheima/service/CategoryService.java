package com.itheima.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.domain.Category;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface CategoryService extends IService<Category> {
}
