/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.attachment.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 附件信息存放表Entity
 * @author xjp
 * @version 2015-08-17
 */
//Fixme 必须重写 equals 和 hashcode 方法
public class Attachment extends DataEntity<Attachment> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 附件名称
	private String attachType;		// 附件类型
	private String attachAddress;		// 附件地址(服务器地址)
	private String attachUrl;		// 附件URL(下载URL)
	private String type;		// 需要查询附件的模块类型
	private String processChartType;//加工图类型
	
	public Attachment() {
		super();
	}

	public Attachment(String id){
		super(id);
	}

	@Length(min=1, max=100, message="附件名称长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="附件类型长度必须介于 0 和 64 之间")
	public String getAttachType() {
		return attachType;
	}

	public void setAttachType(String attachType) {
		this.attachType = attachType;
	}
	
	@Length(min=0, max=255, message="附件地址(服务器地址)长度必须介于 0 和 255 之间")
	public String getAttachAddress() {
		return attachAddress;
	}

	public void setAttachAddress(String attachAddress) {
		this.attachAddress = attachAddress;
	}
	
	@Length(min=0, max=255, message="附件URL(下载URL)长度必须介于 0 和 255 之间")
	public String getAttachUrl() {
		return attachUrl;
	}

	public void setAttachUrl(String attachUrl) {
		this.attachUrl = attachUrl;
	}
	
	@Length(min=0, max=64, message="需要查询附件的模块类型长度必须介于 0 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getProcessChartType() {
		return processChartType;
	}
	
	public void setProcessChartType(String processChartType) {
		this.processChartType = processChartType;
	}
}