package com.itheima.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.domain.Category;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryDao extends BaseMapper<Category> {
}
