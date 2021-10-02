package com.example.qinshi.bean;

import lombok.Data;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/30 15:03
 */
@Data
public class PswForm {
    private String username;
    private String oldPsw;
    private String newPsw;
    private String surePsw;

}
