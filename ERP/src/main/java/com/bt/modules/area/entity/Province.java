/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.area.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 省市区基础表Entity
 * @author xjp
 * @version 2015-08-18
 */
//Fixme 必须重写 equals 和 hashcode 方法
public class Province extends DataEntity<Province> {
	
	private static final long serialVersionUID = 1L;
	private String provinceid;		// 省-市-区ID
	private String provincename;		// 省-市-区名称
	private String parentid;		// 上级父子
	private Date datecreated;		// 创建时间
	private Date dateupdated;		// 修改时间
	private String code;//简称
	
	public Province() {
		super();
	}

	public Province(String id){
		super(id);
	}

	@Length(min=1, max=50, message="省-市-区ID长度必须介于 1 和 50 之间")
	public String getProvinceid() {
		return provinceid;
	}

	public void setProvinceid(String provinceid) {
		this.provinceid = provinceid;
	}
	
	@Length(min=0, max=50, message="省-市-区名称长度必须介于 0 和 50 之间")
	public String getProvincename() {
		return provincename;
	}

	public void setProvincename(String provincename) {
		this.provincename = provincename;
	}
	
	@Length(min=0, max=50, message="上级父子长度必须介于 0 和 50 之间")
	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDatecreated() {
		return datecreated;
	}

	public void setDatecreated(Date datecreated) {
		this.datecreated = datecreated;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDateupdated() {
		return dateupdated;
	}

	public void setDateupdated(Date dateupdated) {
		this.dateupdated = dateupdated;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}