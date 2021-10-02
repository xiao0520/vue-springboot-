package com.example.qinshi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.example.qinshi.dao")  //扫描dao
@SpringBootApplication
public class QinshiApplication {

    public static void main(String[] args) {
        SpringApplication.run(QinshiApplication.class, args);
    }

}
