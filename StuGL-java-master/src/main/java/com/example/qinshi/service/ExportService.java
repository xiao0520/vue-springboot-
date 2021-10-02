package com.example.qinshi.service;

import com.example.qinshi.bean.User;
import com.example.qinshi.dao.UserDao;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Service
public class ExportService {
    public String exportExcelBook(HttpServletResponse response, UserDao userDao) throws IOException {
       /* Response response1 =new Response();
        HttpServletResponse response =new ResponseFacade(response1);*/response.setHeader("Access-Control-Allow-Origin", "*"); //  这里最好明确的写允许的域名
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE, PUT");
        response.setHeader("Access-Control-Max-Age", "3600");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type,Access-Token,Authorization,ybg");

        String fileName = "用户信息";
        //创建Excel工作薄对象
        OutputStream os =response.getOutputStream();
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建Excel工作表对象
        HSSFSheet sheet = workbook.createSheet();
        sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(1, 5000);
        sheet.setColumnWidth(2, 4000);
        sheet.setColumnWidth(3, 2500);
        sheet.setColumnWidth(4, 3000);
        sheet.setColumnWidth(5, 6000);

        // 设置表头字体样式
        HSSFFont columnHeadFont = workbook.createFont();
        columnHeadFont.setFontName("宋体");
        columnHeadFont.setFontHeightInPoints((short) 10);
        /*   columnHeadFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
         */
        // 列头的样式
        HSSFCellStyle columnHeadStyle = workbook.createCellStyle();
        columnHeadStyle.setFont(columnHeadFont);
        // 左右居中
        columnHeadStyle.setLocked(true);
        columnHeadStyle.setWrapText(true);
        HSSFFont font = workbook.createFont();
        font.setFontName("宋体");
        font.setFontHeightInPoints((short) 10);

        //创建Excel工作表第一行
        HSSFRow row0 = sheet.createRow(0);
        // 设置行高
        row0.setHeight((short) 750);
        HSSFCell cell = row0.createCell(0);
        //设置单元格内容
        cell.setCellStyle(columnHeadStyle);
        cell = row0.createCell(0);
        cell.setCellValue(new HSSFRichTextString("序号"));
        cell.setCellStyle(columnHeadStyle);
        cell = row0.createCell(1);
        cell.setCellValue(new HSSFRichTextString("姓名"));
        cell.setCellStyle(columnHeadStyle);
        cell = row0.createCell(2);
        cell.setCellValue(new HSSFRichTextString("邮箱"));
        cell.setCellStyle(columnHeadStyle);
        cell = row0.createCell(3);
        cell.setCellValue(new HSSFRichTextString("角色"));
        cell.setCellStyle(columnHeadStyle);
        cell = row0.createCell(4);
        cell.setCellValue(new HSSFRichTextString("状态"));
        cell.setCellStyle(columnHeadStyle);
        List<User> list =userDao.getList();
        System.out.print(list.size());
        for (int i = 0; i < list.size(); i++) {
            User user =list.get(i);
            HSSFRow row = sheet.createRow(i + 1);
            cell = row.createCell(0);
            cell.setCellValue(new HSSFRichTextString(String.valueOf(i+1)));
            cell = row.createCell(1);
            cell.setCellValue(new HSSFRichTextString(String.valueOf(user.getUsername())));
            cell.setCellStyle(columnHeadStyle);
            cell = row.createCell(2);
            cell.setCellValue(new HSSFRichTextString(String.valueOf(user.getEmail())));
            cell.setCellStyle(columnHeadStyle);
            cell = row.createCell(3);
            cell.setCellValue(new HSSFRichTextString(String.valueOf(user.getRole())));
            cell.setCellStyle(columnHeadStyle);
            cell = row.createCell(4);
            if(user.getState()){
                cell.setCellValue(new HSSFRichTextString(String.valueOf("启用")));
                cell.setCellStyle(columnHeadStyle);
            }else {
                cell.setCellValue(new HSSFRichTextString(String.valueOf("停用")));
                cell.setCellStyle(columnHeadStyle);
            }
        }
        response.reset();
        // 设定输出文件头
        response.setHeader("Content-disposition",
                "attachment; filename=" + new String(fileName.getBytes("GB2312"), "8859_1") + ".xls");
        // 定义输出类型
        response.setContentType("application/msexcel");
        /*workbook.write(os);*/
        workbook.write(os);
        os.close();
        String s= "success";
        return s;
    }
}
