package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.service.LoginRecordService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/29 17:59
 */
@RestController
public class LoginRecordController {
    @Resource
    LoginRecordService loginRecordService;
    @GetMapping("/loginRecord")
    public  String loginRecord(){
        Map map =loginRecordService.countLoginRecord();
        String s= JSON.toJSONString(map);
        return s;
    }
}
