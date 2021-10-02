package com.example.qinshi.controller;

import com.alibaba.fastjson.JSON;
import com.example.qinshi.bean.ChooseForm;
import com.example.qinshi.bean.Course;
import com.example.qinshi.bean.User;
import com.example.qinshi.bean.WeekDay;
import com.example.qinshi.dao.CourseDao;
import com.example.qinshi.dao.UserDao;
import com.example.qinshi.service.impl.ChooseCourseSevice;
import org.jetbrains.annotations.Nullable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/30 22:08
 */
@RestController
public class CourseController {
    private Lock lock = new ReentrantLock(); // ReentrantLock是Lock的子类
    @Resource
    ChooseCourseSevice chooseCourseSevice;
    @Resource
    UserDao userDao;
    @Resource
    CourseDao courseDao;
    public volatile boolean exit = false;

    @RequestMapping("/courseManage")
    public String courseManage(@RequestBody Course course){
        User user =userDao.selectByName(course.getUsername());
        course.setUid(user.getId());
        course.setCname("%"+course.getCname()+"%");
        List<Course> list =courseDao.getList(course);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        String s= JSON.toJSONString(data);
        return s;
    }

    @Nullable
    @RequestMapping("/addCourse")
    public String add(@RequestBody Course course){

        System.out.println(course.getUsername());
        System.out.println(userDao.selectByName(course.getUsername()));

        course.setUid(userDao.selectByName(course.getUsername()).getId());
        course.setStatus(false);
        int i=courseDao.check(course);//统计同一天同一时间间段，并且状态为真，的课程有几个；如果没有为0个才能添加课程
        //System.out.println(userDao.selectByName(course.getUsername()).getId());
        if(i==0&&courseDao.checkCourse(course)==0) {
            courseDao.addCourse(course);
            return  JSON.toJSONString("Success");
        }
        return   JSON.toJSONString("erro");
    }

    @RequestMapping("/vertify")
    public String vertify(@RequestBody Course course){
        String username ="%"+course.getUsername()+"%";
        /*List list =userDao.getIdByName(username);*/
        List<Course> courseList =courseDao.vertifyCourse("%"+course.getCname()+"%",username);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",courseList);
        String s= JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("editCourse")
    public String editCourse(@RequestBody Course course){
        course.setUid(userDao.selectByName(course.getUsername()).getId());
        int i=courseDao.editCheck(course);
        System.out.println(i);
        if(i==0) {
            int j= courseDao.editCourse(course);
            return j>0?"Success":"erro";
        }
        return   JSON.toJSONString("erro");
    }

    @RequestMapping("deleteCourse")
    public String deleteCourse(int cid){
        int i =courseDao.deleteCourse(cid);
        return i>0?"Success":"erro";
    }

    @RequestMapping("/view")
    public String view(@RequestBody Course course){
        String username ="%"+course.getUsername()+"%";
        List<Course> courseList =courseDao.view("%"+course.getCname()+"%",username);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",courseList);
        String s= JSON.toJSONString(data);
        return s;
    }

    @Transactional
    @RequestMapping("chooseCourse")
    public synchronized String chooseCourse(@RequestBody ChooseForm chooseForm){
        if (courseDao.beforeChoose(chooseForm)>0||courseDao.checkCouseNum(chooseForm.getCid())<1){   //检查时间是否冲突，课余量是否大于1

            return "erro";
        }
        int i=courseDao.chooseCourse(chooseForm);    //选课
        courseDao.editCourseNum(chooseForm.getCid());  //课余量减一

        return i>0?"Success":"erro";
     /*   Thread t =new Thread(chooseCourseSevice);
        t.start();
      String s=  chooseCourseSevice.chooseCourse(chooseForm);
        t.stop();
        return s;*/
    }

    @RequestMapping("myCourse")
    public String myCourse(@RequestBody ChooseForm chooseForm){
        System.out.println("==============================");
        chooseForm.setCname("%"+chooseForm.getCname()+"%");
        chooseForm.setUsername("%"+chooseForm.getUsername()+"%");
        List<Course> list =courseDao.myCourse(chooseForm);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        String s= JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("dropCourse")
    @Transactional
    public String dropCourse(@RequestBody ChooseForm chooseForm){
        int i= courseDao.dropCourse(chooseForm);
        int j=  courseDao.addCourseNum(chooseForm.getCid());
        return i>0||j>0?"Success":"erro";
    }

    @RequestMapping("sourceList")
    public  String sourceList(int cid){
        List<User> list =courseDao.sourceList(cid);
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        String s= JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("mysourceList")
    public  String mysourceList(String username){
        // String name ="fangling";
        List<WeekDay> list =new ArrayList<>();
        String [] strings ={"08:10-09:50","10:30-12:10","14:10-15:50","16:30-18:10","19:00-20:40"};
        for(int i=0;i<5;i++){
            String time =strings[i];
            WeekDay weekDay =new WeekDay();
            weekDay.setTime(time);
            weekDay.setDay1(reflash(courseDao.mysourceList(username,"星期一",time)));
            weekDay.setDay2(reflash(courseDao.mysourceList(username,"星期二",time)));
            weekDay.setDay3(reflash(courseDao.mysourceList(username,"星期三",time)));
            weekDay.setDay4(reflash(courseDao.mysourceList(username,"星期四",time)));
            weekDay.setDay5(reflash(courseDao.mysourceList(username,"星期五",time)));
            weekDay.setDay6(reflash(courseDao.mysourceList(username,"星期六",time)));
            weekDay.setDay7(reflash(courseDao.mysourceList(username,"星期天",time)));
            list.add(weekDay);
        }
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        String s= JSON.toJSONString(data);
        return s;
    }

    @RequestMapping("mycourceList")
    public  String mycourceList(String username){
        // String name ="fangling";
        List<WeekDay> list =new ArrayList<>();
        String [] strings ={"08:10-09:50","10:30-12:10","14:10-15:50","16:30-18:10","19:00-20:40"};
        for(int i=0;i<5;i++){
            String time =strings[i];
            WeekDay weekDay =new WeekDay();
            weekDay.setTime(time);
            weekDay.setDay1(reflash(courseDao.mycourceList(username,"星期一",time)));
            weekDay.setDay2(reflash(courseDao.mycourceList(username,"星期二",time)));
            weekDay.setDay3(reflash(courseDao.mycourceList(username,"星期三",time)));
            weekDay.setDay4(reflash(courseDao.mycourceList(username,"星期四",time)));
            weekDay.setDay5(reflash(courseDao.mycourceList(username,"星期五",time)));
            weekDay.setDay6(reflash(courseDao.mycourceList(username,"星期六",time)));
            weekDay.setDay7(reflash(courseDao.mycourceList(username,"星期天",time)));
            list.add(weekDay);
        }
        HashMap<String,Object> data =new HashMap<>();
        data.put("list",list);
        String s= JSON.toJSONString(data);
        return s;
    }

    public static String reflash(String s){
        if (s==null){
            return "";
        }
        return s;
    }
}
