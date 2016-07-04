/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.person.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 常用联系人表Entity
 * @author pc
 * @version 2015-08-11
 */
public class CommonPerson extends DataEntity<CommonPerson> {
	
	private static final long serialVersionUID = 1L;
	private String address;		// 联系人地址
	private String name;		// 联系人姓名（取用户表）
	private String phone;		// 联系人电话
	
	public CommonPerson() {
		super();
	}

	public CommonPerson(String id){
		super(id);
	}

	@Length(min=1, max=60, message="联系人地址长度必须介于 1 和 60 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=1, max=60, message="联系人姓名（取用户表）长度必须介于 1 和 60 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=60, message="联系人电话长度必须介于 1 和 60 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}