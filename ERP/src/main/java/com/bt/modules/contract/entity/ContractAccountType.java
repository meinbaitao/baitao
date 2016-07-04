/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 台账类别Entity
 * @author yhh
 * @version 2016-01-21
 */
public class ContractAccountType extends DataEntity<ContractAccountType> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 分类名
	private String code;		// 简称
	private String url;		// 链接URL
	private String level;		//层级
	private String parentId;		// 上级id
	private String viewFlag;		// 是否显示
	
	public ContractAccountType() {
		super();
	}

	public ContractAccountType(String id){
		super(id);
	}

	@Length(min=0, max=64, message="分类名长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="简称长度必须介于 0 和 64 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=0, max=256, message="链接URL长度必须介于 0 和 256 之间")
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@Length(min=0, max=64, message="上级id长度必须介于 0 和 64 之间")
	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getViewFlag() {
		return viewFlag;
	}

	public void setViewFlag(String viewFlag) {
		this.viewFlag = viewFlag;
	}
	
}