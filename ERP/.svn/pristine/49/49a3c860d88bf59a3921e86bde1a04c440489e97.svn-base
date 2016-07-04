/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.factory.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 加工厂人员Entity
 * @author yhh
 * @version 2015-11-11
 */
public class ManufPerson extends DataEntity<ManufPerson> {
	
	private static final long serialVersionUID = 1L;
	private String factory;		// 加工厂
	private String area;		// 区域
	private String manager;		// 经理
	private String principal;		// 负责人
	private String principalTel;		// 负责人联系方式
	private String tracer;		// 跟单员
	private String tracerTel;		// 跟单员联系方式
	
	public ManufPerson() {
		super();
	}

	public ManufPerson(String id){
		super(id);
	}

	@Length(min=0, max=64, message="加工厂长度必须介于 0 和 64 之间")
	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}
	
	@Length(min=0, max=64, message="区域长度必须介于 0 和 64 之间")
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
	@Length(min=0, max=63, message="经理长度必须介于 0 和 63 之间")
	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
	
	@Length(min=0, max=64, message="负责人长度必须介于 0 和 64 之间")
	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	
	@Length(min=0, max=32, message="负责人联系方式长度必须介于 0 和 32 之间")
	public String getPrincipalTel() {
		return principalTel;
	}

	public void setPrincipalTel(String principalTel) {
		this.principalTel = principalTel;
	}
	
	@Length(min=0, max=64, message="跟单员长度必须介于 0 和 64 之间")
	public String getTracer() {
		return tracer;
	}

	public void setTracer(String tracer) {
		this.tracer = tracer;
	}
	
	@Length(min=0, max=32, message="跟单员联系方式长度必须介于 0 和 32 之间")
	public String getTracerTel() {
		return tracerTel;
	}

	public void setTracerTel(String tracerTel) {
		this.tracerTel = tracerTel;
	}
	
}