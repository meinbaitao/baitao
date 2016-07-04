package com.bt.modules.report.common;

import java.util.Calendar;
import java.util.Date;

/**
 * author fanjinyuan.
 */
public class WeeklyReportHelper {


    /**
     * 本周六 ~ 下周五 为一个工作周
     * 获取当前周的序号
     * @return
     */
    public static int getCurrentlyWeekSerial(){
        Date today = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        int weekSerial = calendar.get(Calendar.WEEK_OF_YEAR);
        if(calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
            weekSerial += 1;
        }
        return weekSerial;
    }


    /**
     * 获取上周的序号
     * @return
     */
    public static int getLastWeekSerial(){
        Date today = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(today);
        int lastWeekSerial =  calendar.get(Calendar.WEEK_OF_YEAR) -1;
        if(calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
            lastWeekSerial += 1;
        }
        return lastWeekSerial;
    }



}
