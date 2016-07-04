/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 运营指派采购需求量Entity
 * @author xiaocai
 * @version 2015-11-05
 */
public class PurchaseDemandAssign extends DataEntity<PurchaseDemandAssign> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		// 指派编号
	private String purchaseDemandId;		// 主需求单
	private int count;		// 指派数量
	private String status;		// 状态
	private Date assignDate;		// 指派时间
	private Date requireDate;		// 要求到货时间
	
	private int sumCount;	//统计数量
	private int idCount;	//条数
	
	private String originStatus;		// 源状态（修改条件使用）
	private List<String> demandIDs;		//需求ids集合
	private String gbStr;				//分组条件
	
	public PurchaseDemandAssign() {
		super();
	}

	public PurchaseDemandAssign(String id){
		super(id);
	}

	@Length(min=0, max=50, message="指派编号长度必须介于 0 和 50 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=64, message="主需求单长度必须介于 0 和 64 之间")
	public String getPurchaseDemandId() {
		return purchaseDemandId;
	}

	public void setPurchaseDemandId(String purchaseDemandId) {
		this.purchaseDemandId = purchaseDemandId;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRequireDate() {
		return requireDate;
	}

	public void setRequireDate(Date requireDate) {
		this.requireDate = requireDate;
	}

	public List<String> getDemandIDs() {
		return demandIDs;
	}

	public void setDemandIDs(List<String> demandIDs) {
		this.demandIDs = demandIDs;
	}

	public int getSumCount() {
		return sumCount;
	}

	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
	}

	public int getIdCount() {
		return idCount;
	}

	public void setIdCount(int idCount) {
		this.idCount = idCount;
	}

	public String getGbStr() {
		return gbStr;
	}

	public void setGbStr(String gbStr) {
		this.gbStr = gbStr;
	}

	public String getOriginStatus() {
		return originStatus;
	}

	public void setOriginStatus(String originStatus) {
		this.originStatus = originStatus;
	}
	
	
}