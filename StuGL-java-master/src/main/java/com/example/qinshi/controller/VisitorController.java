package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.bean.QueryInfo;
import com.example.qinshi.bean.Visitor;
import com.example.qinshi.dao.VisitorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/11/13 16:44
 */
@RestController
public class VisitorController {
    @Autowired
    private VisitorDao visitorDao;

    @RequestMapping("/allvisitor")
    public  String getVisitorList(QueryInfo queryInfo){
        //获取最大列表数和当前编号
        //System.out.println("实体"+queryInfo);
        int numbers=visitorDao.getVisitorCounts("%"+queryInfo.getUsername()+"%","%"+queryInfo.getTime());
       // int numbers2=visitorDao.getVisitorCounts2("%"+queryInfo.getQueryTime()+"%");
        //System.out.println("计数"+numbers);
        int pageStart=(queryInfo.getPageNum()-1)*queryInfo.getPageSize();
        //int pageStart2=(queryInfo.getPageNum2()-1)*queryInfo.getPageSize2();
        List<Visitor> users=visitorDao.getAllVisitor("%"+queryInfo.getUsername()+"%","%"+queryInfo.getTime()+"%",pageStart,queryInfo.getPageSize());
        //List<Visitor> users2=visitorDao.getAllVisitor2("%"+queryInfo.getQueryTime()+"%",pageStart2,queryInfo.getPageSize2());
        //System.out.println("数据"+users);
        HashMap<String,Object> res=new HashMap<>();
        res.put("numbers",numbers);  //对应UserList.vue里的numbers
        //res.put("numbers2",numbers2);  //对应UserList.vue里的numbers
        res.put("data",users);
       // res.put("data2",users2);
        String res_string= JSON.toJSONString(res);
        return res_string;
    }

    @RequestMapping("/deleteVisitor")
    public String deleteVisitor(String time){
        int i=visitorDao.deleteVisitor(time);
        return i>0?"success":"error";
    }
}
