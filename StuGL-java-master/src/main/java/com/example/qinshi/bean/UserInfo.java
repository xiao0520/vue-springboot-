package com.example.qinshi.bean;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/30 14:56
 */

import lombok.Data;

@Data
public class UserInfo {
    private int id;
    private String trueName;
    private String username;
    private String sex;
    private String birth;
    private String address;
    private String phone;
    private String idcard;
}
