/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.utils;

import java.math.BigDecimal;

import com.bt.common.exceptions.BusinessException;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * double类型数据计算工具类
 * @author pc
 * @version 2013-12-05
 */
public class MathUtil {

	/** 
     * Double 相加 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static Double sum(Double d1,Double d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.add(bd2).doubleValue(); 
    } 
    /** 
     * Double 相加 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static Double sum(String d1,String d2){ 
        BigDecimal bd1 = new BigDecimal(d1); 
        BigDecimal bd2 = new BigDecimal(d2); 
        return bd1.add(bd2).doubleValue(); 
    } 
    /** 
     * Double 相加 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static Double sum(Double d1,String d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(d2); 
        return bd1.add(bd2).doubleValue(); 
    } 


    /** 
     * Double 相减 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static Double sub(Double d1,Double d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.subtract(bd2).doubleValue(); 
    } 

    /** 
     * Double 乘法 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static Double mul(Double d1,Double d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.multiply(bd2).doubleValue(); 
    } 


    /** 
     * Double 除法 (结果四舍五入)
     * @param d1 
     * @param d2 
     * @param scale 小数点位数 
     * @return 
     */ 
    public static Double div(Double d1,Double d2,int scale){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.divide  
               (bd2,scale,BigDecimal.ROUND_HALF_UP).doubleValue(); 
    } 
    
//    public static void main(String[] args) {
//		Double a = 198720.05;
//		Double b = 92001.03;
//		b = sum(a,b);
//		System.out.println(b);
//	}
    /**   
     * 对Double数据进行取精度.   
     * @param value  double数据.   
     * @param scale  精度位数(保留的小数位数).   
     * @param roundingMode  精度取值方式.   
     * @return 精度计算后的数据.   
     */   
    public static Double round(Double value, int scale,  
             int roundingMode) {    
        BigDecimal bd = new BigDecimal(value);    
        bd = bd.setScale(scale, roundingMode);    
        Double d = bd.doubleValue();    
        bd = null;    
        return d;    
    }    

    /**
     * String相加,保留两位小数
     * @param num1
     * @param num2
     * @return
     */
    public static String sumString(String num1, String num2){
    	if(null == num1){
    		num1 = "0";
    	}
    	if(null == num2){
    		num2 = "0";
    	}
    	BigDecimal bd1 = new BigDecimal(num1); 
         BigDecimal bd2 = new BigDecimal(num2); 
         return bd1.add(bd2).setScale(2, BigDecimal.ROUND_HALF_UP).toString(); 
    }
    
    /**
     * String减法,保留两位小数
     * @param num1
     * @param num2
     * @return
     */
    public static String subString(String num1, String num2){
    	if(null == num1){
    		num1 = "0";
    	}
    	if(null == num2){
    		num2 = "0";
    	}
    	BigDecimal bd1 = new BigDecimal(num1); 
        BigDecimal bd2 = new BigDecimal(num2); 
        return bd1.subtract(bd2).setScale(2, BigDecimal.ROUND_HALF_UP).toString();
    }
    
    /**
     * 两字符型数字相乘
     * @param num1
     * @param num2
     * @return
     */
    public static String mul(String num1, String num2){
    	if(null == num1){
    		num1 = "0";
    	}
    	if(null == num2){
    		num2 = "0";
    	}
    	BigDecimal bd1 = new BigDecimal(num1); 
        BigDecimal bd2 = new BigDecimal(num2); 
        return bd1.multiply(bd2).setScale(2, BigDecimal.ROUND_HALF_UP) .toString(); 
    } 
    
    /**
     * 字符串数字round
     * @param num 字符串数字
     * @param scale 保留位数
     * @return
     */
    public static String scaleString(String num, int scale){
    	BigDecimal value = new BigDecimal(num);
    	return value.setScale(scale, BigDecimal.ROUND_HALF_UP).toString();
    }
    
    /**
     * double型round
     * @param num 字符串数字
     * @param scale 保留位数
     * @return
     */
    public static double scaleDouble(double num, int scale){
    	BigDecimal value = new BigDecimal(num);
    	return value.setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }
    
    /**
     * string 转 int
     * @param number
     * @return
     * @throws BusinessException
     */
    public static int intUtils(String number) throws BusinessException{
    	if(StringUtils.isBlank(number)){
    		throw new BusinessException("order.bombase.file.data.empty");
    	}
    	int res=0;
    	try {
    		res = Integer.valueOf(number).intValue();
		} catch (Exception e) {
			throw new BusinessException("order.bombase.file.data.notintnumber");
		}
    	return res;
    }
    
    /**
     * string 转 double
     * @param number
     * @return
     * @throws BusinessException
     */
    public static double doubleUtils(String number) throws BusinessException{
    	if(StringUtils.isBlank(number)){
    		throw new BusinessException("order.bombase.file.data.empty");
    	}
    	double res=0;
    	try {
    		res = (new Double(number)).doubleValue(); 
		} catch (Exception e) {
			throw new BusinessException("order.bombase.file.data.notnumber");
		}
    	return res;
    }
}
