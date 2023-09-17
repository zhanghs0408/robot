package com.itheima.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itheima.domain.Book;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDao extends BaseMapper<Book> {
}
