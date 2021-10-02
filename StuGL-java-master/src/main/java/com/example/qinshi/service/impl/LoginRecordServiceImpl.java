package com.example.qinshi.service.impl;

import com.example.qinshi.util.TimeUtil;
import com.example.qinshi.dao.UserDao;
import com.example.qinshi.service.LoginRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/29 17:50
 */
@Service
public class LoginRecordServiceImpl implements LoginRecordService {
    @Resource
    UserDao userDao;
    @Override
    public Map countLoginRecord() {
        Map map =new HashMap();
        List<String> timeList =new ArrayList<>();
        List<String> timeList2 =new ArrayList<>();
        for(int i=-6;i<1;i++){
            timeList.add(TimeUtil.getTimeNow("yyyy-MM-dd",i));
        }
        map.put("timeList",timeList);
        List countList =new ArrayList();
        List countNum =new ArrayList();
        for(int j=0;j<timeList.size();j++){
            countList.add(userDao.countLoginRecord(timeList.get(j)));
            countNum.add(userDao.countPerNum(timeList.get(j)));
        }
        map.put("countList",countList);
        map.put("countNum",countNum);
        return map;
    }
}
