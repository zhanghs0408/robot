package com.itheima.dto;

import com.itheima.domain.Book;
import lombok.Data;

@Data
public class BookDto extends Book {
    private String categoryName;
}
