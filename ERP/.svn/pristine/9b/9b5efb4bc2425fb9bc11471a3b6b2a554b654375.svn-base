package com.bt.modules.utils;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;

import com.thinkgem.jeesite.common.config.Global;


/**
 * httpUtils工具类
 * @author xujianpeng
 *
 */
public class HttpUtils {
	
	/**
	 * 获取上下文路径 如果:http://www.xxxx.com 或    http://localhost:8080/xxx
	 * 需要拦截登录的 /a
	 * @param request
	 * @return
	 */
	public static String httpAdminPath(HttpServletRequest request) {
		//获取上下文
		String contextPath = request.getContextPath();
		//获取完整URL
		StringBuffer url = request.getRequestURL();
		String host = "";
		//判断有没有上下文，如果有上下文则拼接上下文，如果没有上下文则直接获取域名(域名没有上下文)
		if(StringUtils.isNotBlank(contextPath)){
			host = url.substring(0,url.indexOf(contextPath))+contextPath+Global.getAdminPath();
		}else{
			host = url.delete(url.length() - request.getRequestURI().length(), url.length()).toString()+Global.getAdminPath();
		}
		return host;
	}
}
