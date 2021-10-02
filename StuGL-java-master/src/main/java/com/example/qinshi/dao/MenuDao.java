package com.example.qinshi.dao;

import com.example.qinshi.bean.MainMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {
    public List<MainMenu> getMenus(String username);
    public List<MainMenu> getMainMenus();
    List<MainMenu> getAll();
    List<MainMenu> menuList();
    List<MainMenu> menu();
    void delete(int roleId);
    void add(@Param("roleId")int roleId, @Param("menuId")int menuId);
    List<Integer>  selectMenuByRoleId(@Param("roleId")Integer roleId);
}
