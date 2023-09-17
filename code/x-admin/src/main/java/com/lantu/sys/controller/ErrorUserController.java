package com.lantu.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lantu.common.vo.Result;
import com.lantu.sys.entity.ErrorUser;
import com.lantu.sys.entity.Role;
import com.lantu.sys.service.IErrorUserService;
import com.lantu.sys.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhanghongshuai
 * @since 2023-09-17
 */
@RestController
@RequestMapping("/errorUser")
public class ErrorUserController {
    @Autowired
    private IErrorUserService iErrorUserService;

    @GetMapping("/list")
    public Result<Map<String, Object>> getErrorUserList(
            @RequestParam(value = "pageNo", required = true) Long pageNo,
            @RequestParam(value = "pageSize", required = true) Long pageSize
    ) {
        LambdaQueryWrapper<ErrorUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.orderByDesc(ErrorUser::getId); // 按 id 降序排列

        Page<ErrorUser> page = new Page<>(pageNo, pageSize);
        iErrorUserService.page(page, wrapper);

        Map<String, Object> data = new HashMap<>();
        data.put("total", page.getTotal());
        data.put("rows", page.getRecords());

        return Result.success(data);
    }

    @PostMapping
    public Result<?> addRole(@RequestBody ErrorUser errorUser){
        iErrorUserService.create(errorUser);
        return Result.success("错误信息添加成功");
    }

    @PutMapping
    public Result<?> updateRole(@RequestBody ErrorUser errorUser){
        iErrorUserService.update(errorUser);
        return Result.success("错误信息修改成功");
    }

    @GetMapping("/{id}")
    public Result<ErrorUser> getRoleById(@PathVariable("id") Integer id){
        ErrorUser errorUser = iErrorUserService.getById(id);
        return Result.success(errorUser);
    }

    @DeleteMapping("/{id}")
    public Result<ErrorUser> deleteRoleById(@PathVariable("id") Long id){
        iErrorUserService.delete(id);
        return Result.success("错误信息删除成功");
    }

    @GetMapping("/all")
    public Result<List<ErrorUser>> getAllRole(){
        List<ErrorUser> list = iErrorUserService.list();
        return Result.success(list);
    }
}
