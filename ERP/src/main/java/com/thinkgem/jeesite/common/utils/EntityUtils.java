/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;

import com.bt.common.exceptions.BusinessException;


/**
 * 实体 工具类
 * @author xiaocai
 * @version 2016-5-9
 */
public class EntityUtils {

	/**
	 * 验证两个实体的字段值是否完全一样
	 * @param originObj	源对象
	 * @param obj		需要对比的对象
	 * @throws BusinessException
	 */
	public static boolean verificationEntityField(Object originObj,Object obj) {
		if(originObj==null || obj==null){
			return false;
//			throw new BusinessException("verification.entity.null");
		}
		Field[] field = originObj.getClass().getDeclaredFields();	//获取全部	属性
		for(int j=0 ; j<field.length ; j++){ //循环判断 源数据 是否被修改
			if(verificationField(field[j], originObj, obj)){
				return true;
			}
		}
		return false;
	}
	/**
	 * 验证字段
	 * @param field
	 * @param originObj
	 * @param obj
	 * @return
	 * @throws BusinessException
	 */
	public static boolean verificationField(Field field,Object originObj,Object obj){
		String name = field.getName();
		name = name.substring(0,1).toUpperCase()+name.substring(1); //将属性的首字符大写，方便构造get，set方法
		String type = field.getGenericType().toString();    //获取属性的类型
		try {
			Method originMethod = originObj.getClass().getMethod("get"+name);
	        Method objMethod = obj.getClass().getMethod("get"+name);
	        
	        if(type.indexOf("String")>=0){   //如果type是类类型，则前面包含""，后面跟类名
	        	String originValue = (String) originMethod.invoke(originObj);    //调用getter方法获取属性值
		        String value = (String) objMethod.invoke(obj);    //调用getter方法获取属性值
	        	if(StringUtils.isNotBlank(originValue)&&!originValue.equals(value)){	//源值≠空&&源值≠新值
	        	   return true;
	        	}else if(StringUtils.isNotBlank(value)&&!value.equals(originValue)){	//新值≠空&&新值≠源值
	        	   return true;
	        	}else{
	        	   return false;
	        	}
	        }else if(type.indexOf("int")>=0||type.indexOf("Integer")>=0){
	        	Integer originValue = (Integer) originMethod.invoke(originObj);    //调用getter方法获取属性值
	        	Integer value = (Integer) objMethod.invoke(obj);    //调用getter方法获取属性值
	        	if(originValue != value){
	        		return true;
	        	}else{
	        		return false;
	        	}
	        }else if(type.indexOf("short")>=0){     
	        	Short originValue = (Short) originMethod.invoke(originObj);    //调用getter方法获取属性值
	        	Short value = (Short) objMethod.invoke(obj);    //调用getter方法获取属性值
	        	if(originValue != value){
	        		return true;
	        	}else{
	        		return false;
	        	}                  
            }else if(type.indexOf("double")>=0||type.indexOf("Double")>=0){     
            	Double originValue = (Double) originMethod.invoke(originObj);    //调用getter方法获取属性值
            	Double value = (Double) objMethod.invoke(obj);    //调用getter方法获取属性值
	        	if(originValue != value){
	        		return true;
	        	}else{
	        		return false;
	        	}   
            }else if(type.indexOf("boolean")>=0||type.indexOf("Boolean")>=0){
            	Boolean originValue = (Boolean) originMethod.invoke(originObj);    //调用getter方法获取属性值
            	Boolean value = (Boolean) objMethod.invoke(obj);    //调用getter方法获取属性值
	        	if(originValue != value){
	        		return true;
	        	}else{
	        		return false;
	        	}   
            }else if(type.indexOf("Date")>=0){
            	String originValue = DateUtils.formatDateForPatterns((Date) originMethod.invoke(originObj),DateUtils.YMD);    //调用getter方法获取属性值
            	String value = DateUtils.formatDateForPatterns((Date) objMethod.invoke(obj), DateUtils.YMD);    //调用getter方法获取属性值
            	if(StringUtils.isNotBlank(originValue)&&!originValue.equals(value)){	//源值≠空&&源值≠新值
 	        	   return true;
 	        	}else if(StringUtils.isNotBlank(value)&&!value.equals(originValue)){	//新值≠空&&新值≠源值
 	        	   return true;
 	        	}else{
 	        	   return false;
 	        	}
            }         
		} catch (Exception e) {
			return false;
//			e.printStackTrace();
//			throw new BusinessException("verification.entity.get");
		} /*catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}*/
		return false;
	}
	
}
