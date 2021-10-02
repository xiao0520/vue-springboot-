package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.bean.*;
import com.example.qinshi.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserDao udao;

    @RequestMapping("/alluser")
    public  String getUserList(QueryInfo queryInfo){
        //获取最大列表数和当前编号
        //System.out.println(queryInfo);
        int numbers=udao.getUserCounts("%"+queryInfo.getQuery()+"%");
        int pageStart=(queryInfo.getPageNum()-1)*queryInfo.getPageSize();
        List<User> users=udao.getAllUser("%"+queryInfo.getQuery()+"%",pageStart,queryInfo.getPageSize());
        HashMap<String,Object> res=new HashMap<>();
        res.put("numbers",numbers);  //对应UserList.vue里的numbers
        res.put("data",users);
        String res_string= JSON.toJSONString(res);
        return res_string;
    }

    @RequestMapping("/userState")  //userState对应vue里面的
    public String updateUserState(@RequestParam("id") Integer  id,
                                  @RequestParam("state") Boolean state){
        System.out.println("用户编号:"+id);
        System.out.println("用户状态:"+state);
        int i = udao.updateState(id, state);
        return  i >0?"success":"error";
        //return str;
    }

    @RequestMapping("/addUser")  //对应vue里面的
    public String addUser(@RequestBody User user){
        user.setRoleId(3);
        user.setState(false);
        int num=udao.getUserCounts(user.getUsername());
        if(num>0){
            return "exist";
        }
        int i =udao.addUser(user);
        return  i >0?"success":"error";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(int id){
        int i=udao.deleteUser(id);
        return i>0?"success":"error";
    }

    @RequestMapping("/getUpdate")
    public String getUpdateUser(int id){
        //System.out.println("编号:"+id);
        User updateUser = udao.getUpdateUser(id);
        String users_json = JSON.toJSONString(updateUser);
        return users_json;
    }

    @RequestMapping("/editUser")
    public String editUser(@RequestBody User user){
        //System.out.println(user);
        int i = udao.editUser(user);
        return i >0?"success":"error";
       //String str = i >0?"success":"error";
        //return str;
    }

    @GetMapping("/getList")
    public List<User> getList(){
        List<User> list =udao.getList();
        return list;
    }

    @RequestMapping("/editRole")
    public String editRole(@RequestBody User user){
        System.out.println(user.getUsername());
        System.out.println(user.getRoleId());
        String username =user.getUsername();
        int roleId =user.getRoleId();
        int i =udao.editRole(username,roleId);
        return i>0?"success":"error";
    }

    @RequestMapping("/queryUserInfo")
    public String queryUserInfo(String username){
        UserInfo userInfo =udao.queryUserInfo(username);
        if (userInfo==null){
            UserInfo userInfo1=new UserInfo();
            userInfo1.setUsername(username);
            String str = JSON.toJSONString(userInfo1);
            return str;
        }
        String str = JSON.toJSONString(userInfo);
        return str;
    }
    @PostMapping("/updateUserInfo")
    public String updateUserInfo(@RequestBody UserInfo userInfo) {
        /*if(userInfo.getBirth()!=null){
            DateFormat fmt =new  SimpleDateFormat("yyyy-MM-dd");
            Date date = fmt.parse(userInfo.getBirth());
            userInfo.setBirth(date+"");
        }*/
        int num =udao.queryNum(userInfo.getUsername());
        if(num==1){
            int i= udao.updateUserInfo(userInfo);
            return i>0?"success":"error";
        }
        int j=udao.addUserInfo(userInfo);
        return j>0?"success":"error";
    }
    @PostMapping("/editPsw")
    public String editPsw(@RequestBody PswForm pswForm) {
        if (!pswForm.getOldPsw().equals(pswForm.getNewPsw()) ) {
            if (pswForm.getNewPsw() .equals( pswForm.getSurePsw())) {
                if (pswForm.getOldPsw() .equals(udao.selectByName(pswForm.getUsername()).getPassword())) {
                    int i = udao.editPsw(pswForm);
                    return i > 0 ? "success" : "error3";
                }
                return "erro2";
            }
            return "erro1";
        }
        return "erro4";
    }
}
