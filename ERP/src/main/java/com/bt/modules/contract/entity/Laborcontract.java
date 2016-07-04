/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.project.entity.Project;
import com.bt.modules.qualityitem.entity.Qualityitem;
import com.bt.modules.utils.CommonStatus;

/**
 * 劳务合同Entity
 * @author yhh
 * @version 2015-08-05
 */
public class Laborcontract extends ConContainDetail<Laborcontract, Laboritems> {
	
	private static final long serialVersionUID = 1L;
	private String contractJiafang;  //甲方
	private String companyType;		//公司主体
	private String proName;		// 工程名称
	private String laborcontract;		// 施工合同
	private String address;		// 项目地址
	private String exetype;		// 班组类别
	private String subsidy;		// 住宿补贴
	private String ctype;		// 乙方施工班组
	private String house;		// 户型
	private String buildings;		// 楼栋号
	private String buildingsDisName;		// 楼栋号显示名称
	private String hurrybuildings;		// 需赶工楼栋号
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
	private String signDate;		// 施工日期
	private String exeScope;		// 施工范围（现存的是承接范围）
	private String acceptScope;		// 承接范围
	private String stonePrice;		// 石材总价
	private String bonePrice;		// 骨架总价
	private String contractPrice;		// 合同总价
	private String standardPrice;		// 标准总价
	private String budgetPrice;		// 预算总价
	private String allRatio;		// 总体浮动比例
	private String scheduleRatio;		// 合同进度款比例
	private String exscheduleRatio;		// 进度款最高发放比例
	private String accountRatio;		// 结算款最高支付比例
	private String qualityRatioFrist;		// 保质金比例1
	private String qualityRatioSecond;		// 保质金比例2
	private String qualityPayDateFrist;		// 保质金比例支付时间1
	private String qualityPayDateSecond;		// 保质金比例支付时间2
	private String checkStatus;		// 审批状态
	private String conStatus;		// 合同状态
	private String fujian;		// 附件
//	private String settlementType;		// 结算方式
	private String projectId;			//项目id
	private String contractNo;
	/*
	 * 20160120	需求调整添加字段
	 */
	private String isHurry;		// 是否赶工
	private String agreementDate;		// 签约（协议）日期
	private String settleterm;		// 工程验收请款结算
	private String qualityExpireDateFrist;		// 保质金到期时间1
	private String qualityExpireDateSecond;		// 保质金到期时间2
	private String completeDate;		// 竣工日期
	private String settleDate;		// 结算日期
	private String settleSum;		// 结算金额
	
	private String boneArea;       //骨架面积
	private String stoneArea;       //挂石面积
	private String otherArea;       //其他面积
	private String qualityitem;     //质保金条款
	

	private String taxRatio;		//税率
	private String executionName;		//班组名
	private String fristTypeName;		//一级分类名
	
	private Project project;
	private ContractAccountType contractAccountTypeContractType;	//合同类型
	private ContractAccountType contractAccountTypeFrist;	//一级类别
	private ContractAccountType contractAccountTypeSecond;	//二级类别
	private Qualityitem conQualityPay;		//合同条款
	
	
	private String parentid;//拆分前ID
	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	private List<Laborcontract> labcontractList;//拆分后劳务合同
	public List<Laborcontract> getLabcontractList() {
		return labcontractList;
	}

	public void setLabcontractList(List<Laborcontract> labcontractList) {
		this.labcontractList = labcontractList;
	}

	private BtgConJiaContractDetail jiaContractDetail;

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	private List<Laboritems> detailList;		//明细列表
	public Laborcontract() {
		super();
	}

	public Laborcontract(String id){
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
	
	
	public String getBuildingsDisName() {
		return buildingsDisName;
	}

	public void setBuildingsDisName(String buildingsDisName) {
		this.buildingsDisName = buildingsDisName;
	}
	
	
	public String getBoneArea() {
		return boneArea;
	}

	public void setBoneArea(String boneArea) {
		this.boneArea = boneArea;
	}

	public String getStoneArea() {
		return stoneArea;
	}

	public void setStoneArea(String stoneArea) {
		this.stoneArea = stoneArea;
	}

	public String getOtherArea() {
		return otherArea;
	}

	public void setOtherArea(String otherArea) {
		this.otherArea = otherArea;
	}

	public String getQualityitem() {
		return qualityitem;
	}

	public void setQualityitem(String qualityitem) {
		this.qualityitem = qualityitem;
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
	
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public String getContractJiafang() {
		return contractJiafang;
	}

	public void setContractJiafang(String contractJiafang) {
		this.contractJiafang = contractJiafang;
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
	
	@Length(min=0, max=64, message="施工日期长度必须介于 0 和 64 之间")
	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}
	
	@Length(min=0, max=200, message="长度必须介于 0 和 200 之间")
	public String getExeScope() {
		return exeScope;
	}

	public void setExeScope(String exeScope) {
		this.exeScope = exeScope;
	}
	
	@Length(min=0, max=200, message="承接范围长度必须介于 0 和 200 之间")
	public String getAcceptScope() {
		return acceptScope;
	}

	public void setAcceptScope(String acceptScope) {
		this.acceptScope = acceptScope;
	}
	
	public String getStonePrice() {
		return stonePrice;
	}

	public void setStonePrice(String stonePrice) {
		this.stonePrice = stonePrice;
	}
	
	public String getBonePrice() {
		return bonePrice;
	}

	public void setBonePrice(String bonePrice) {
		this.bonePrice = bonePrice;
	}
	
	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}
	
	public String getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(String standardPrice) {
		this.standardPrice = standardPrice;
	}
	
	public String getBudgetPrice() {
		return budgetPrice;
	}

	public void setBudgetPrice(String budgetPrice) {
		this.budgetPrice = budgetPrice;
	}
	
	public String getAllRatio() {
		return allRatio;
	}

	public void setAllRatio(String allRatio) {
		this.allRatio = allRatio;
	}
	
	public String getScheduleRatio() {
		return scheduleRatio;
	}

	public void setScheduleRatio(String scheduleRatio) {
		this.scheduleRatio = scheduleRatio;
	}
	
	public String getExscheduleRatio() {
		return exscheduleRatio;
	}

	public void setExscheduleRatio(String exscheduleRatio) {
		this.exscheduleRatio = exscheduleRatio;
	}
	
	public String getAccountRatio() {
		return accountRatio;
	}

	public void setAccountRatio(String accountRatio) {
		this.accountRatio = accountRatio;
	}
	
	@Length(min=0, max=20, message="审批状态长度必须介于 0 和 20 之间")
	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}
	
	@Length(min=0, max=50, message="合同状态长度必须介于 0 和 50 之间")
	public String getConStatus() {
		return conStatus;
	}

	public void setConStatus(String conStatus) {
		this.conStatus = conStatus;
		this.conStatusUtils(conStatus);
	}
	/**
	 * 数据状态处理
	 * @param cStatus
	 */
	public void conStatusUtils(String cStatus){
		this.getExtraData().put("stop", true);
		this.getExtraData().put("cancelStop", true);
		this.getExtraData().put("relieve", true);
		if(CommonStatus.WORK_FLOW_END.equals(this.workflowstatus)){
			if(CON_STATUS_STOP.equals(cStatus)){
				this.getExtraData().put("relieve", false);
				this.getExtraData().put("cancelStop", false);
			}else if(CON_STATUS_NORMAL.equals(cStatus)){
				this.getExtraData().put("stop", false);
				this.getExtraData().put("relieve", false);
			}/*else if(CON_STATUS_RELIEVE.equals(cStatus)){
				this.getExtraData().put("stop", false);
			}*/
		}
		//合同状态显示处理
		if(CommonStatus.WORK_FLOW_OPEN.equals(this.workflowstatus)){
			this.getExtraData().put("conStatusLab", "待审批");
		}else if(CON_STATUS_NORMAL.equals(cStatus)){
			this.getExtraData().put("conStatusLab", "生效");
		}else if(CON_STATUS_STOP.equals(cStatus)){
			this.getExtraData().put("conStatusLab", "中止");
		}else if(CON_STATUS_RELIEVE.equals(cStatus)){
			this.getExtraData().put("conStatusLab", "解除");
		}else{
			this.getExtraData().put("conStatusLab", "待提交");
		}
		
	}
	
	@Length(min=0, max=500, message="附件长度必须介于 0 和 500 之间")
	public String getFujian() {
		return fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}


//	public String getSettlementType() {
//		return settlementType;
//	}
//
//	public void setSettlementType(String settlementType) {
//		this.settlementType = settlementType;
//	}

	public List<Laboritems> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<Laboritems> detailList) {
		this.detailList = detailList;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getTaxRatio() {
		return taxRatio;
	}

	public void setTaxRatio(String taxRatio) {
		this.taxRatio = taxRatio;
	}

	public String getExecutionName() {
		return executionName;
	}

	public void setExecutionName(String executionName) {
		this.executionName = executionName;
	}

	public String getFristTypeName() {
		return fristTypeName;
	}

	public void setFristTypeName(String fristTypeName) {
		this.fristTypeName = fristTypeName;
	}

	public String getQualityRatioFrist() {
		return qualityRatioFrist;
	}

	public void setQualityRatioFrist(String qualityRatioFrist) {
		this.qualityRatioFrist = qualityRatioFrist;
	}

	public String getQualityRatioSecond() {
		return qualityRatioSecond;
	}

	public void setQualityRatioSecond(String qualityRatioSecond) {
		this.qualityRatioSecond = qualityRatioSecond;
	}

	public String getQualityPayDateFrist() {
		return qualityPayDateFrist;
	}

	public void setQualityPayDateFrist(String qualityPayDateFrist) {
		this.qualityPayDateFrist = qualityPayDateFrist;
	}

	public String getQualityPayDateSecond() {
		return qualityPayDateSecond;
	}

	public void setQualityPayDateSecond(String qualityPayDateSecond) {
		this.qualityPayDateSecond = qualityPayDateSecond;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public BtgConJiaContractDetail getJiaContractDetail() {
		return jiaContractDetail;
	}

	public void setJiaContractDetail(BtgConJiaContractDetail jiaContractDetail) {
		this.jiaContractDetail = jiaContractDetail;
	}

	public String getIsHurry() {
		return isHurry;
	}

	public void setIsHurry(String isHurry) {
		this.isHurry = isHurry;
	}

	public String getAgreementDate() {
		return agreementDate;
	}

	public void setAgreementDate(String agreementDate) {
		this.agreementDate = agreementDate;
	}

	public String getSettleterm() {
		return settleterm;
	}

	public void setSettleterm(String settleterm) {
		this.settleterm = settleterm;
	}

	public String getQualityExpireDateFrist() {
		return qualityExpireDateFrist;
	}

	public void setQualityExpireDateFrist(String qualityExpireDateFrist) {
		this.qualityExpireDateFrist = qualityExpireDateFrist;
	}

	public String getQualityExpireDateSecond() {
		return qualityExpireDateSecond;
	}

	public void setQualityExpireDateSecond(String qualityExpireDateSecond) {
		this.qualityExpireDateSecond = qualityExpireDateSecond;
	}

	public String getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}

	public String getSettleDate() {
		return settleDate;
	}

	public void setSettleDate(String settleDate) {
		this.settleDate = settleDate;
	}

	public String getSettleSum() {
		return settleSum;
	}

	public void setSettleSum(String settleSum) {
		this.settleSum = settleSum;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ContractAccountType getContractAccountTypeFrist() {
		return contractAccountTypeFrist;
	}

	public void setContractAccountTypeFrist(
			ContractAccountType contractAccountTypeFrist) {
		this.contractAccountTypeFrist = contractAccountTypeFrist;
	}

	public ContractAccountType getContractAccountTypeSecond() {
		return contractAccountTypeSecond;
	}

	public void setContractAccountTypeSecond(
			ContractAccountType contractAccountTypeSecond) {
		this.contractAccountTypeSecond = contractAccountTypeSecond;
	}

	public Qualityitem getConQualityPay() {
		return conQualityPay;
	}

	public void setConQualityPay(Qualityitem conQualityPay) {
		this.conQualityPay = conQualityPay;
	}

	public ContractAccountType getContractAccountTypeContractType() {
		return contractAccountTypeContractType;
	}

	public void setContractAccountTypeContractType(
			ContractAccountType contractAccountTypeContractType) {
		this.contractAccountTypeContractType = contractAccountTypeContractType;
	}
	
	
	/**
	 * 合同标识
	 */
	/**
	 * 合同列表数据标识
	 */
	public static final String CON_LIST="2";
	/**
	 * 合同默认状态
	 */
	/**
	 * 新建默认状态
	 */
	public static final String CON_STATUS_DEFAULT="0";
	/**
	 * 正常使用
	 */
	public static final String CON_STATUS_NORMAL="1";
	/**
	 * 中止
	 */
	public static final String CON_STATUS_STOP="2";
	/**
	 * 解除
	 */
	public static final String CON_STATUS_RELIEVE="3";
	/**
	 * 变更状态
	 */
	public static final String CON_STATUS_CHANGE="4";
	
	
}