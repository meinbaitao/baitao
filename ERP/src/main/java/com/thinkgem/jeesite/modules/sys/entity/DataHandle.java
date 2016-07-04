/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 数据操作记录Entity
 * @author yhh
 * @version 2016-03-11
 */
public class DataHandle extends DataEntity<DataHandle> {
	
	private static final long serialVersionUID = 1L;
	private String menu;		// 操作菜单
	private String remoteAddr;		// 操作IP地址
	private String requestUri;		// 请求URI
	private String method;		// 操作方式
	private String params;		// 操作提交的数据
	private String exception;		// 异常信息
	
	private Date beginDate;		// 开始日期
	private Date endDate;		// 结束日期
	
	private String userName;	//操作者
	
	public DataHandle() {
		super();
	}

	public DataHandle(String id){
		super(id);
	}

	@Length(min=0, max=64, message="操作菜单长度必须介于 0 和 64 之间")
	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}
	
	@Length(min=0, max=255, message="操作IP地址长度必须介于 0 和 255 之间")
	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	
	@Length(min=0, max=255, message="请求URI长度必须介于 0 和 255 之间")
	public String getRequestUri() {
		return requestUri;
	}

	public void setRequestUri(String requestUri) {
		this.requestUri = requestUri;
	}
	
	@Length(min=0, max=32, message="操作方式长度必须介于 0 和 32 之间")
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	@Length(min=0, max=32, message="操作提交的数据长度必须介于 0 和 32 之间")
	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}
	
	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 设置请求参数
	 * @param paramMap
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
//	public void setParams(Map paramMap){
//		if (paramMap == null){
//			return;
//		}
//		StringBuilder params = new StringBuilder();
//		for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()){
//			params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
//			String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
//			params.append(StringUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
//		}
//		this.params = params.toString();
//	}
	public void setParams(Map paramMap){
		if (paramMap == null){
			return;
		}
		StringBuilder params = new StringBuilder();
		for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()){
			if(param.getKey().equals("id") || param.getKey().equals("name")){
				params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
				String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
				params.append(StringUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
			}
			
		}
		this.params = params.toString();
	}
	
	@Override
	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
	
}