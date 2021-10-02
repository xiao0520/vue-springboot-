package com.example.qinshi.controller;

import com.example.qinshi.dao.UserDao;
import com.example.qinshi.service.ExportService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import sun.net.www.http.HttpClient;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@RestController
public class ExportController {
    @Autowired
    UserDao userDao;
    @Resource
    ExportService exportService;

    /* private HttpServletResponse response;*/

    @GetMapping("/exportUser")
    public void export(HttpServletResponse response) throws IOException {
        String s= exportService.exportExcelBook(response,userDao);
    }
}
