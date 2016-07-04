/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 事故单Entity
 * @author xjp
 * @version 2015-08-14
 */
public class Accident extends DataEntity<Accident> {
	
	private static final long serialVersionUID = 1L;
	private String projectId;		// 项目名称
	private String problemType;		// 事故类型
	private String problemComment;		// 问题描述
	private String punishManagerBid;		// 罚款负责人
	private String supplyPrice;		// 补料金额
	private String punishPrice;		// 罚款金额
	private String companyType;		// 负责人所在公司类型，内部、外部供应商
	private String status;		// 状态：0草稿，1生效
	private String attchUrl;		// 附件地址
	private String isInfluenct;		// 是否影响施工
	private String isSupply;		// 是否补料
	private String isPunish;		// 是否罚款
	
	public Accident() {
		super();
	}

	public Accident(String id){
		super(id);
	}

	@Length(min=0, max=64, message="项目名称长度必须介于 0 和 64 之间")
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	@Length(min=0, max=64, message="事故类型长度必须介于 0 和 64 之间")
	public String getProblemType() {
		return problemType;
	}

	public void setProblemType(String problemType) {
		this.problemType = problemType;
	}
	
	@Length(min=0, max=500, message="问题描述长度必须介于 0 和 500 之间")
	public String getProblemComment() {
		return problemComment;
	}

	public void setProblemComment(String problemComment) {
		this.problemComment = problemComment;
	}
	
	public String getPunishManagerBid() {
		return punishManagerBid;
	}

	public void setPunishManagerBid(String punishManagerBid) {
		this.punishManagerBid = punishManagerBid;
	}
	
	public String getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(String supplyPrice) {
		this.supplyPrice = supplyPrice;
	}
	
	public String getPunishPrice() {
		return punishPrice;
	}

	public void setPunishPrice(String punishPrice) {
		this.punishPrice = punishPrice;
	}
	
	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
	
	@Length(min=0, max=1, message="状态：0草稿，1生效长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="附件地址长度必须介于 0 和 64 之间")
	public String getAttchUrl() {
		return attchUrl;
	}

	public void setAttchUrl(String attchUrl) {
		this.attchUrl = attchUrl;
	}
	
	@Length(min=0, max=1, message="是否影响施工长度必须介于 0 和 1 之间")
	public String getIsInfluenct() {
		return isInfluenct;
	}

	public void setIsInfluenct(String isInfluenct) {
		this.isInfluenct = isInfluenct;
	}
	
	@Length(min=0, max=1, message="是否补料长度必须介于 0 和 1 之间")
	public String getIsSupply() {
		return isSupply;
	}

	public void setIsSupply(String isSupply) {
		this.isSupply = isSupply;
	}
	
	@Length(min=0, max=1, message="是否罚款长度必须介于 0 和 1 之间")
	public String getIsPunish() {
		return isPunish;
	}

	public void setIsPunish(String isPunish) {
		this.isPunish = isPunish;
	}
	
}