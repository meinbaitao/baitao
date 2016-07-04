/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.utils;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.bt.common.exceptions.BusinessException;


/**
 * 客户端向服务器发出请求
 * 参数工具类
 * @author xiaocai
 * @version 2016-4-7
 */
public class RequestUtils {

	/**
	 * 防止中文乱码
	 * @param request
	 * @param name
	 * @return
	 * @throws BusinessException 
	 */
	public static String getParameter(HttpServletRequest request,String name) throws BusinessException {
		String nameStr = "";
		try {
			nameStr = request.getParameter(name);
			if(StringUtils.isNotBlank(nameStr)&&isMessyCodes(nameStr)){
				nameStr = new String(nameStr.getBytes("ISO-8859-1"), "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			throw new BusinessException("request.utils.utf8");
		}
		return nameStr;
	}
	/**
	 * 将界面传过来的数组转成集合
	 * @param request
	 * @param name
	 * @return
	 */
	public static List<String> getParameterValuesToList(HttpServletRequest request,String name) {
		String[] cBox = request.getParameterValues(name);
		return CommonUtils.stringsToList(cBox);
	}
	/**
	 * 获取界面以逗号分隔的字符串转成List<String>
	 * @param request
	 * @param name
	 * @return
	 */
	public static List<String> getParameterStringsToList(HttpServletRequest request,String name) {
		return CommonUtils.stringToList(request.getParameter(name));
	}
	/**
	 * 将界面传过来的数据转成Int类型
	 * @param request
	 * @param name
	 * @return
	 * @throws BusinessException 
	 */
	public static int getInt(HttpServletRequest request,String name) throws BusinessException {
		String val = request.getParameter(name);
		if(StringUtils.isNotBlank(val)){
			try {
				return Integer.parseInt(val);
			} catch (Exception e) {
				throw new BusinessException("request.utils.int");
			}
		}
		return 0;
	}
	/**
	 * 判断送进来的字符串是否是乱码
	 * @param strName
	 * @return
	 * @throws BusinessException 
	 */
	private static boolean isMessyCodes(String strName) throws BusinessException {
        try {
            Pattern p = Pattern.compile("\\s*|\t*|\r*|\n*");
            Matcher m = p.matcher(strName);
            String after = m.replaceAll("");
            String temp = after.replaceAll("\\p{P}", "");
            char[] ch = temp.trim().toCharArray();

            int length = (ch != null) ? ch.length : 0;
            for (int i = 0; i < length; i++) {
                char c = ch[i];
                if (!Character.isLetterOrDigit(c)) {
                    String str = "" + ch[i];
                    if (!str.matches("[\u4e00-\u9fa5]+")) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
        	throw new BusinessException("request.utils.utf8");
        }
        return false;
    }
	
	
	public static void main(String[] args) {
		try {
			System.out.println(isMessyCodes("张三"));
			System.out.println(isMessyCodes("æäº¤æå"));
		} catch (BusinessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
