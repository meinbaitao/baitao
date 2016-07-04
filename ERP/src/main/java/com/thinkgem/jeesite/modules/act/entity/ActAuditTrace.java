/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 流程轨迹跟踪Entity
 * @author fjy
 * @version 2016-04-18
 */
public class ActAuditTrace extends DataEntity<ActAuditTrace> {
	
	private static final long serialVersionUID = 1L;
	private String proinstid;		// 流程实例ID
	private String submitnode;		// 审核节点
	private String submitpeople;		// 审核人, 用户表主键
	private String auditresult;		// 审批结果，0：驳回，1：通过
	private String auditproposal;		// 审批意见
	private Date audittime;		// 审批时间
	private String auditType; //审核类型，0：审核，1：签收
	private String nextNode; //下一个审核节点
	private String nextAuditPeople; //下一个节点审核人

	//display properties
	private String submitPeopleName;
	private String nextAuditPeopleName;
	private String auditResultName;
	private String auditTypeName;
	
	public ActAuditTrace() {
		super();
	}

	public ActAuditTrace(String id){
		super(id);
	}

	@Length(min=1, max=64, message="流程实例ID长度必须介于 1 和 64 之间")
	public String getProinstid() {
		return proinstid;
	}

	public void setProinstid(String proinstid) {
		this.proinstid = proinstid;
	}
	
	@Length(min=1, max=64, message="提交节点长度必须介于 1 和 64 之间")
	public String getSubmitnode() {
		return submitnode;
	}

	public void setSubmitnode(String submitnode) {
		this.submitnode = submitnode;
	}
	

	@Length(min=1, max=64, message="提交人, 用户表主键长度必须介于 1 和 64 之间")
	public String getSubmitpeople() {
		return submitpeople;
	}

	public void setSubmitpeople(String submitpeople) {
		this.submitpeople = submitpeople;
	}
	
	@Length(min=1, max=11, message="审批结果，0：驳回，1：通过长度必须介于 1 和 11 之间")
	public String getAuditresult() {
		return auditresult;
	}

	public void setAuditresult(String auditresult) {
		this.auditresult = auditresult;
	}
	
	@Length(min=0, max=256, message="审批意见长度必须介于 0 和 256 之间")
	public String getAuditproposal() {
		return auditproposal;
	}

	public void setAuditproposal(String auditproposal) {
		this.auditproposal = auditproposal;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="审批时间不能为空")
	public Date getAudittime() {
		return audittime;
	}

	public void setAudittime(Date audittime) {
		this.audittime = audittime;
	}

	public String getAuditType() {
		return auditType;
	}

	public void setAuditType(String auditType) {
		this.auditType = auditType;
	}

	public String getNextNode() {
		return nextNode;
	}

	public void setNextNode(String nextNode) {
		this.nextNode = nextNode;
	}

	public String getNextAuditPeople() {
		return nextAuditPeople;
	}

	public void setNextAuditPeople(String nextAuditPeople) {
		this.nextAuditPeople = nextAuditPeople;
	}

	public String getSubmitPeopleName() {
		return submitPeopleName;
	}

	public void setSubmitPeopleName(String submitPeopleName) {
		this.submitPeopleName = submitPeopleName;
	}

	public String getNextAuditPeopleName() {
		return nextAuditPeopleName;
	}

	public void setNextAuditPeopleName(String nextAuditPeopleName) {
		this.nextAuditPeopleName = nextAuditPeopleName;
	}

	public String getAuditResultName() {
		return auditResultName;
	}

	public void setAuditResultName(String auditResultName) {
		this.auditResultName = auditResultName;
	}

	public String getAuditTypeName() {
		return auditTypeName;
	}

	public void setAuditTypeName(String auditTypeName) {
		this.auditTypeName = auditTypeName;
	}

}