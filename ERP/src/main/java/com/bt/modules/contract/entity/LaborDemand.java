/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 劳务需求Entity
 * @author yhh
 * @version 2015-09-08
 */
public class LaborDemand extends DataEntity<LaborDemand> {
	
	private static final long serialVersionUID = 1L;
	
	private String contractJiafang;		// 甲方
	private String proName;		// 工程名称
	private String laborcontract;		// 施工合同
	private String address;		// 项目地址
	private String exetype;		// 班组类别
	private String subsidy;		// 住宿补贴
	private String ctype;		// 乙方施工班组
	private String house;		// 户型
	private String buildings;		// 楼栋号
	private String buildingsName;		// 楼栋名称 许俊雄 20160406
	private String hurrybuildings;		// 需赶工楼栋号
	private String isHurry;		// 是否赶工
	private String startdate;		// 工程开工日期
	private String enddate;		// 工程竣工日期
	private String duration;		// 工程总工期
	private String projectleadBid;		// 乙方驻地项目管理人
	private String projectleadBidtel;		// 乙方驻地项目管理人联系方式
	private String projectmanagerAid;		// 甲方驻地项目经理
	private String projectmanagerAidtel;		// 甲方驻地项目经理联系方式
	private String mfloatratio;		// 批量浮动比例
	private String contractscopeadjust;		// 施工承包范围补充或调整
	private String rightrespadjust;		// 甲乙方权利责任的补充调整
	private String qualityreqadjust;		// 质量要求的补充调整
	private String warrantyadjust;		// 保修要求的补充调整
	private String settletermadjust;		// 工程验收请款结算的补充调整
	private String settleterm;			//工程验收请款结算
	private String laborprice;			//劳务价款
	private String partyBCode;			//乙方简称
	private String partyBName;			//乙方名称
	private String projectId;		//项目id
	
	private String search;		//搜索关键字
	
	
	public String getContractJiafang() {
		return contractJiafang;
	}

	public void setContractJiafang(String contractJiafang) {
		this.contractJiafang = contractJiafang;
	}
	
	public LaborDemand() {
		super();
	}

	public LaborDemand(String id){
		super(id);
	}

	@Length(min=0, max=64, message="工程名称长度必须介于 0 和 64 之间")
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}
	
	@Length(min=0, max=100, message="施工合同长度必须介于 0 和 100 之间")
	public String getLaborcontract() {
		return laborcontract;
	}

	public void setLaborcontract(String laborcontract) {
		this.laborcontract = laborcontract;
	}
	
	@Length(min=0, max=200, message="项目地址长度必须介于 0 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=20, message="班组类别长度必须介于 0 和 20 之间")
	public String getExetype() {
		return exetype;
	}

	public void setExetype(String exetype) {
		this.exetype = exetype;
	}
	
	@Length(min=0, max=20, message="住宿补贴长度必须介于 0 和 20 之间")
	public String getSubsidy() {
		return subsidy;
	}

	public void setSubsidy(String subsidy) {
		this.subsidy = subsidy;
	}
	
	@Length(min=0, max=50, message="乙方施工班组长度必须介于 0 和 50 之间")
	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	
	@Length(min=0, max=50, message="户型长度必须介于 0 和 50 之间")
	public String getHouse() {
		return house;
	}

	public void setHouse(String house) {
		this.house = house;
	}
	
	@Length(min=0, max=50, message="楼栋号长度必须介于 0 和 50 之间")
	public String getBuildings() {
		return buildings;
	}

	public void setBuildings(String buildings) {
		this.buildings = buildings;
	}
	
	public String getBuildingsName() {
		return buildingsName;
	}
	public void setBuildingsName(String buildingsName) {
		this.buildingsName = buildingsName;
	}

	@Length(min=0, max=50, message="需赶工楼栋号长度必须介于 0 和 50 之间")
	public String getHurrybuildings() {
		return hurrybuildings;
	}

	public void setHurrybuildings(String hurrybuildings) {
		this.hurrybuildings = hurrybuildings;
	}
	
	@Length(min=0, max=20, message="工程开工日期长度必须介于 0 和 20 之间")
	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	
	@Length(min=0, max=20, message="工程竣工日期长度必须介于 0 和 20 之间")
	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	@Length(min=0, max=18, message="工程总工期长度必须介于 0 和 18 之间")
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	@Length(min=0, max=50, message="乙方驻地项目管理人长度必须介于 0 和 50 之间")
	public String getProjectleadBid() {
		return projectleadBid;
	}

	public void setProjectleadBid(String projectleadBid) {
		this.projectleadBid = projectleadBid;
	}
	
	@Length(min=0, max=50, message="乙方驻地项目管理人联系方式长度必须介于 0 和 50 之间")
	public String getProjectleadBidtel() {
		return projectleadBidtel;
	}

	public void setProjectleadBidtel(String projectleadBidtel) {
		this.projectleadBidtel = projectleadBidtel;
	}
	
	@Length(min=0, max=50, message="甲方驻地项目经理长度必须介于 0 和 50 之间")
	public String getProjectmanagerAid() {
		return projectmanagerAid;
	}

	public void setProjectmanagerAid(String projectmanagerAid) {
		this.projectmanagerAid = projectmanagerAid;
	}
	
	@Length(min=0, max=50, message="甲方驻地项目经理联系方式长度必须介于 0 和 50 之间")
	public String getProjectmanagerAidtel() {
		return projectmanagerAidtel;
	}

	public void setProjectmanagerAidtel(String projectmanagerAidtel) {
		this.projectmanagerAidtel = projectmanagerAidtel;
	}
	
	@Length(min=0, max=20, message="批量浮动比例长度必须介于 0 和 20 之间")
	public String getMfloatratio() {
		return mfloatratio;
	}

	public void setMfloatratio(String mfloatratio) {
		this.mfloatratio = mfloatratio;
	}
	
	@Length(min=0, max=200, message="施工承包范围补充或调整长度必须介于 0 和 200 之间")
	public String getContractscopeadjust() {
		return contractscopeadjust;
	}

	public void setContractscopeadjust(String contractscopeadjust) {
		this.contractscopeadjust = contractscopeadjust;
	}
	
	@Length(min=0, max=200, message="甲乙方权利责任的补充调整长度必须介于 0 和 200 之间")
	public String getRightrespadjust() {
		return rightrespadjust;
	}

	public void setRightrespadjust(String rightrespadjust) {
		this.rightrespadjust = rightrespadjust;
	}
	
	@Length(min=0, max=200, message="质量要求的补充调整长度必须介于 0 和 200 之间")
	public String getQualityreqadjust() {
		return qualityreqadjust;
	}

	public void setQualityreqadjust(String qualityreqadjust) {
		this.qualityreqadjust = qualityreqadjust;
	}
	
	@Length(min=0, max=200, message="保修要求的补充调整长度必须介于 0 和 200 之间")
	public String getWarrantyadjust() {
		return warrantyadjust;
	}

	public void setWarrantyadjust(String warrantyadjust) {
		this.warrantyadjust = warrantyadjust;
	}
	
	@Length(min=0, max=200, message="工程验收请款结算的补充调整长度必须介于 0 和 200 之间")
	public String getSettletermadjust() {
		return settletermadjust;
	}

	public void setSettletermadjust(String settletermadjust) {
		this.settletermadjust = settletermadjust;
	}

	public String getPartyBCode() {
		return partyBCode;
	}

	public void setPartyBCode(String partyBCode) {
		this.partyBCode = partyBCode;
	}

	public String getPartyBName() {
		return partyBName;
	}

	public void setPartyBName(String partyBName) {
		this.partyBName = partyBName;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getIsHurry() {
		return isHurry;
	}

	public void setIsHurry(String isHurry) {
		this.isHurry = isHurry;
	}

	public String getSettleterm() {
		return settleterm;
	}

	public void setSettleterm(String settleterm) {
		this.settleterm = settleterm;
	}

	public String getLaborprice() {
		return laborprice;
	}

	public void setLaborprice(String laborprice) {
		this.laborprice = laborprice;
	}
	
}