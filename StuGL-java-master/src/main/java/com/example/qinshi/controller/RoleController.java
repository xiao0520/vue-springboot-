package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.bean.*;
import com.example.qinshi.dao.MenuDao;
import com.example.qinshi.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class RoleController {
    @Autowired
    RoleDao roleDao;
    @Autowired
    MenuDao menuDao;

    @RequestMapping("/role")
    public String getRole(String rolename){
        HashMap<String,Object> data =new HashMap<>();

        String rolename1 ="%"+rolename+"%";
        List<Role> role =roleDao.getRole(rolename1);
        if(role!=null){
            data.put("role",role);
            data.put("flag",1);
        }
        else {data.put("flag",0);}
        String s= JSON.toJSONString(data);

        return s;
    }

    @RequestMapping("/addRole")
    public String addRole(@RequestBody Role role){
        List<Role> roleList =roleDao.getAllRole();
        List<Integer> roleId =new ArrayList<>();
        List<String> roleName =new ArrayList<>();
        for (int i=0;i<roleList.size();i++){
            roleId.add(roleList.get(i).getRoleId());
            roleName.add(roleList.get(i).getRoleName());
        }
        if (roleId.contains(role.getRoleId())||roleName.contains(role.getRoleName())){
            return "exist";
        }
        else {
            role.setStatus(false);
            int i =roleDao.addRole(role);
            return i>0?"success":"error";
        }
    }

    @RequestMapping("/delete")
    public String delete(int roleId){
        int i =roleDao.delete(roleId);
        return i>0?"success":"error";
    }
    @RequestMapping("getAllRole")
    public String getAll(){
        HashMap<String,Object> data =new HashMap<>();
        List<Role> role =roleDao.getAllRole();
        if(role!=null){
            data.put("role",role);
            data.put("flag",1);
        }
        else {data.put("flag",0);}
        String s= JSON.toJSONString(data);

        return s;
    }

    @RequestMapping("editRoleMenu")
    public String editRoleMenu(@RequestBody RoleMenu roleMenu){
        String[] list =roleMenu.getList();
        List<String> stringList =new ArrayList<>();
        List<Integer> integerList =new ArrayList<>();
        for(int i=0;i<list.length;i++){
            stringList.add(list[i]);       //把前台选中的菜单名添加到集合里面
        }
        List<MainMenu> menuList=menuDao.menu();    //获取所有菜单集合
        for (int j=0;j<menuList.size();j++){
            if(stringList.contains(menuList.get(j).getTitle())){
                integerList.add(menuList.get(j).getId());
            }
        }

        menuDao.delete(roleMenu.getRoleId());
        for (int m=0;m<integerList.size();m++){
            menuDao.add(roleMenu.getRoleId(),integerList.get(m));
        }
        return null;
    }

    @RequestMapping("selectRoleMenu")
    public String selectRoleMenu(@RequestParam Integer roleId){
        List<Integer> list=  menuDao.selectMenuByRoleId(roleId);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        return  JSON.toJSONString(data);
    }

    @RequestMapping("changeRoleMenu")
    @Transactional(rollbackFor = {RuntimeException.class, Error.class})   //开启事务
    public void editRoleMenu(@RequestBody ChangeForm changeForm){
        List<Integer> list =changeForm.getList();
        int roleId =changeForm.getRoleId();
        List<MainMenu> menuList=menuDao.menuList();
        List<Integer> integerList =new ArrayList<>();
        for(int j=0;j<menuList.size();j++){
            integerList.add(menuList.get(j).getId());
        }
        menuDao.delete(roleId);
        for (int i =0;i<list.size();i++){
            int menuId =list.get(i);
            if(!integerList.contains(menuId)){
                menuDao.add(roleId,menuId);
            }
        }
    }

    @RequestMapping("/changeStatus")
    public String changeStatus(int roleId){
        int i= roleDao.changeStatus(roleId);
        return i>0?"success":"error";
    }

    @RequestMapping("/editUser2")
    public String editUser(@RequestBody Role role){
        //System.out.println(user);
        int i = roleDao.editUser(role);
        return i >0?"success":"error";
        //String str = i >0?"success":"error";
        //return str;
    }

    @RequestMapping("/getUpdateRole")
    public String getUpdateRole(int roleId){
        //System.out.println("编号:"+id);
        Role updateRole = roleDao.getUpdateRole(roleId);
        String role_json = JSON.toJSONString(updateRole);
        return role_json;
    }
}
