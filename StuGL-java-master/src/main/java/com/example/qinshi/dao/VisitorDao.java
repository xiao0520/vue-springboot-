package com.example.qinshi.dao;

import com.example.qinshi.bean.Visitor;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/11/13 16:45
 */
@Repository
public interface VisitorDao {
    public List<Visitor> getAllVisitor(@Param("username") String username, @Param("time") String time,@Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
    //public List<Visitor> getAllVisitor2(@Param("time") String time, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
    public int getVisitorCounts(@Param("username") String username,@Param("time") String time);
    //public int getVisitorCounts2(@Param("time") String time);
    public int deleteVisitor(String time);
}
