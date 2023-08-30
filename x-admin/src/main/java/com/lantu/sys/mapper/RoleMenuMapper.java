package com.lantu.sys.mapper;

import com.lantu.sys.entity.RoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author laocai
 * @since 2023-02-07
 */
@Mapper
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
    public List<Integer> getMenuIdListByRoleId(Integer roleId);
}
