/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.labour.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 劳务标准价格库Entity
 * @author xiaocai
 * @version 2015-07-31
 */
public class LabStaPrice extends DataEntity<LabStaPrice> {
	
	private static final long serialVersionUID = 1L;
	private String labStaPriceId;		// 劳务标准价库ID
	private String type;		// 省内省外类型
	private double process1;		// 工序1
	private double process2;		// 工序2
	private double process3;		// 工序3
	private double process4;		// 工序4
	private String isdeleted;		// 删除标识
	private Date createts;		// 创建时间
	private Date updatets;		// 更新时间
	private String updateby;		// 更新人
	public String getLabStaPriceId() {
		return labStaPriceId;
	}
	public void setLabStaPriceId(String labStaPriceId) {
		this.labStaPriceId = labStaPriceId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getProcess1() {
		return process1;
	}
	public void setProcess1(double process1) {
		this.process1 = process1;
	}
	public double getProcess2() {
		return process2;
	}
	public void setProcess2(double process2) {
		this.process2 = process2;
	}
	public double getProcess3() {
		return process3;
	}
	public void setProcess3(double process3) {
		this.process3 = process3;
	}
	public double getProcess4() {
		return process4;
	}
	public void setProcess4(double process4) {
		this.process4 = process4;
	}
	public String getIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(String isdeleted) {
		this.isdeleted = isdeleted;
	}
	public Date getCreatets() {
		return createts;
	}
	public void setCreatets(Date createts) {
		this.createts = createts;
	}
	public Date getUpdatets() {
		return updatets;
	}
	public void setUpdatets(Date updatets) {
		this.updatets = updatets;
	}
	public String getUpdateby() {
		return updateby;
	}
	public void setUpdateby(String updateby) {
		this.updateby = updateby;
	}
	
	
}