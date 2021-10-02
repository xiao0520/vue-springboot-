package com.example.qinshi.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author 篱琴
 * @version 1.0
 * @date 2020/10/29 18:08
 */
public class TimeUtil {
    public static String getTimeNow(String pattern,int num) {
        final LocalDateTime localDate = LocalDateTime.now().plusDays(num);
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
        return localDate.format(dateTimeFormatter);
    }
}
