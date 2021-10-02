package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.bean.MainMenu;
import com.example.qinshi.dao.MenuDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class MenuController {

    @Autowired
    MenuDao menuDao;

    @RequestMapping("/menus")
    public String getAllMenus(String username){
        System.out.println("访问成功");
        HashMap<String,Object> data=new HashMap<>();
        List<MainMenu> menus=menuDao.getMenus(username);       //根据不同角色获取不同菜单
        //List<MainMenu> menus=menuDao.getMainMenus();  //获取所有菜单，没有条件
        int status =404; //错误 404,成功 200
        if(menus!=null){
            data.put("menus",menus);
            data.put("flag",200);
        }else{
            data.put("flag",404);
        }
        String s= JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("/allmenus")
    public String getMenu(){
        HashMap<String,Object> data =new HashMap<>();
        List<MainMenu> menus =menuDao.getAll();
        System.out.println(menus);
        if(menus!=null){
            data.put("menus",menus);
            data.put("flag",200);
        }
        else {
            data.put("flag",404);
        }
        String s= JSON.toJSONString(data);

        return s;
    }

    @RequestMapping("/menuList")
    public String menuList(){
        HashMap<String,Object> data =new HashMap<>();
        List<MainMenu> menuList =menuDao.menuList();
        data.put("menuList",menuList);
        String s= JSON.toJSONString(data);
        return s;
    }
}
