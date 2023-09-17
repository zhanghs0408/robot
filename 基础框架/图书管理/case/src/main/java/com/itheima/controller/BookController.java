package com.itheima.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.controller.comm.R;
import com.itheima.domain.Book;
import com.itheima.domain.Category;
import com.itheima.domain.QueryPageBean;
import com.itheima.dto.BookDto;
import com.itheima.service.BookService;
import com.itheima.service.CategoryService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

    /**
     * 分页查询
     * @param queryPageBean
     * @return
     */
    @PostMapping("/page")
    public R<IPage<BookDto>> page(@RequestBody QueryPageBean queryPageBean){
        // 创建分页构造器，设置分页条件
        IPage<Book> page = new Page<>(queryPageBean.getCurrentPage(), queryPageBean.getPageSize());
        // 创建条件构造器，设置查询条件
        LambdaQueryWrapper<Book> lqw = new LambdaQueryWrapper<>();
        lqw.like(queryPageBean.getQueryString() != null,Book::getName,queryPageBean.getQueryString());
        // 调用service的分页方法
        bookService.page(page,lqw);

        // 创建一个IPage<BookDto>对象
        IPage<BookDto> dtoPage = new Page<>();
        // 将page对象中的同名属性拷贝到dtoPage中
        BeanUtils.copyProperties(page, dtoPage,"records");
        // 将List<Book>转换成List<BookDto>
        List<BookDto> dtoRecords = page.getRecords().stream().map(book -> {
            // 创建一个BookDto(内部没有任何属性)
            BookDto bookDto = new BookDto();
            // 将book对象中的属性拷贝到bookDto中(目前bookDto中仍然没有categoryName)
            BeanUtils.copyProperties(book, bookDto);
            // 根据categoryId查询Category对象
            Category category = categoryService.getById(bookDto.getCategoryId());
            if (category != null){
                // 将categoryName设置到bookDto中
                bookDto.setCategoryName(category.getName());
            }
            // 返回一个数据完整的bookDto对象
            return bookDto;
        }).collect(Collectors.toList());
        // 将List<BookDto>设置到dtoPage中
        dtoPage.setRecords(dtoRecords);
        // 返回响应结果
        return R.success(dtoPage);
    }

    /**
     * 新增图书
     */
    @PostMapping
    public R<String> save(@RequestBody Book book){
        // 调用service的save方法
        boolean flag = bookService.save(book);
        // 返回响应数据
        return flag?R.success("新增成功"):R.error("新增失败");
    }

    @DeleteMapping("/{id}")
    public R<String> deleteById(@PathVariable("id") Long id){
        // 调用业务层的removeById方法
        boolean flag = bookService.removeById(id);
        // 返回响应数据
        return flag?R.success("图书删除成功"):R.error("图书删除失败");
    }
}
