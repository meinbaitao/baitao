/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

/**
 * 甲方合同拆成楼栋Entity
 * @author lky
 * @version 2015-12-21
 */
public class BtgConJiaContractDetail extends ContractDetail<BtgConJiaContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String contractId;		// 合同id
	private String subprojectId;		// 二级项目id
	private String startDate;		// 开工日期
	private String endDate;		// 竣工日期
	private String costPrice;		// 造价

	private String buildingDisplayName; //楼栋展示名
	
	public BtgConJiaContractDetail() {
		super();
	}

	public BtgConJiaContractDetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="合同id长度必须介于 0 和 64 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=0, max=64, message="二级项目id长度必须介于 0 和 64 之间")
	public String getSubprojectId() {
		return subprojectId;
	}

	public void setSubprojectId(String subprojectId) {
		this.subprojectId = subprojectId;
	}
	
	@Length(min=0, max=64, message="开工日期长度必须介于 0 和 64 之间")
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	@Length(min=0, max=64, message="竣工日期长度必须介于 0 和 64 之间")
	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(String costPrice) {
		this.costPrice = costPrice;
	}


	public String getBuildingDisplayName() {
		return buildingDisplayName;
	}

	public void setBuildingDisplayName(String buildingDisplayName) {
		this.buildingDisplayName = buildingDisplayName;
	}


}