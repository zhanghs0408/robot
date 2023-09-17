package com.itheima.controller;

import com.itheima.controller.comm.R;
import com.itheima.domain.Category;
import com.itheima.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查询所有的分类
     * @return
     */
    @GetMapping
    public R<List<Category>> getAll(){
        // 调用service的查询所有的方法
        List<Category> list = categoryService.list();
        // 返回响应数据
        return R.success(list);
    }
}
