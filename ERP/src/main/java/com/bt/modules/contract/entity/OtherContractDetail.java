/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 其他类合同明细Entity
 * @author yhh
 * @version 2016-01-28
 */
public class OtherContractDetail extends DataEntity<OtherContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String contractId;		// 合同id
	private String payStage;		// 付款阶段
	private String payClause;		// 付款条款
	private String payRatio;		// 付款比例
	private String price;		// 付款金额
	private String remark;		// 备注
	
	public OtherContractDetail() {
		super();
	}

	public OtherContractDetail(String id){
		super(id);
	}

	@Length(min=1, max=64, message="合同id长度必须介于 1 和 64 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=0, max=64, message="付款阶段长度必须介于 0 和 64 之间")
	public String getPayStage() {
		return payStage;
	}

	public void setPayStage(String payStage) {
		this.payStage = payStage;
	}
	
	@Length(min=0, max=255, message="付款条款长度必须介于 0 和 255 之间")
	public String getPayClause() {
		return payClause;
	}

	public void setPayClause(String payClause) {
		this.payClause = payClause;
	}
	
	public String getPayRatio() {
		return payRatio;
	}

	public void setPayRatio(String payRatio) {
		this.payRatio = payRatio;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=0, max=255, message="备注长度必须介于 0 和 255 之间")
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}