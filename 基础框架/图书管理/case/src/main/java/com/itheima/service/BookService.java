package com.itheima.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.domain.Book;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface BookService extends IService<Book> {
}
