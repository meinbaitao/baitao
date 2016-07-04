package com.bt.modules.project.entity;

import java.util.List;
import java.util.Map;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.contract.entity.JiaContract;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.User;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 一级项目信息Entity
 * @author xjp
 * @version 2015-09-02
 */
public class Project extends DataEntity<Project> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 项目名称
	private String code;		// 项目简称
	private String location;		// 苑区
	private Area area;		// 区域
	private String province;		// 省份
	private String city;		// 市区县
	private String town;		// 镇
	private String businessLine;		// 业务板块
	private String compy;		// 项目公司名称
	private String startTime;		// 计划开工时间
	private String endTime;		// 计划完工时间
	private String status;		// 状态
	private String projectManagerBid;		// 项目负责人
	private String regionalManagerBid;		// 区域经理
	private String pcDirectorBid;		// 运营经理
	private String coordinatorLeaderBid;		// 运营主管
	private String operationSpecialistBid;	//运营专员
	private String generalManagerAid;		// 甲方项目总经理
	private String regionalManagerAid;		// 甲方项目区域总经理
	private String localManagerAid;		// 甲方现场跟进人
	private String generalManagerMobile;		// 甲方项目总经理联系方式
	private String regionalManagerMobile;		// 甲方项目区域总联系方式
	private String localManagerMobile;		// 甲方现场跟进人联系方式
	private String materialStaffBid;		// 材料员
	private String constructStaffBid;		// 施工员
	private String materialStaffMobile;		// 材料员联系方式
	private String constructStaffMobile;		// 施工员联系方式
	private String costManagerBid;		// 成本负责人
	private String costOfficerBid;		// 成本组长
	private String costLeaderBid;		// 成本主管
	private String costManagerMobile;		// 成本负责人联系方式
	private String costOfficerMobile;		// 成本组长联系方式
	private String costLeaderMobile;		// 成本主管联系方式
	private String designer;		// 设计师
	private String designLeaderBid;		// 设计主管
	private String designerMobile;		// 设计师联系方式
	private String designLeaderMobile;		// 设计主管联系方式
	private String report;		// 是否需要报建
	private String isReport;		// 是否已报建
	private String isAttachUnit;		// 是否挂靠
	private String weeklyReportRequired;		// 是否需要周报
	private String attachUnit;		// 挂靠单位
	private String address;		//项目地址
	private String adminstaffbid;//行政专员
	

	private String showProjectManagerBid;		// 项目负责人(页面显示)
	private String showRegionalManagerBid;		// 区域经理(页面显示)
	private String showPcDirectorBid;			// 运营经理(页面显示)
	private String showCoordinatorLeaderBid;	// 运营主管(页面显示)
	private String showOperationSpecialistBid;	//运营专员(页面显示)
	private String showMaterialStaffBid;		// 材料员(页面显示)
	private String showConstructStaffBid;		// 施工员(页面显示)
	private String showAdminstaffbid;				//行政专员(页面显示)
	
	private User projectManager;	//项目负责人
	private String memberListStr;   //项目相关人员
	
	public String getAdminstaffbid() {
		return adminstaffbid;
	}

	public void setAdminstaffbid(String adminstaffbid) {
		this.adminstaffbid = adminstaffbid;
	}

	private List<Subproject> subList;//二级项目集合
	private List<Map<String,String>> designList;//设计主管集合
	
	private List<JiaContract> jiaContractList;		//关联甲方合同
	
	public Project() {
		super();
	}

	public Project(String id){
		super(id);
	}

	@Length(min=1, max=200, message="项目名称长度必须介于 1 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="项目简称长度必须介于 0 和 64 之间")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	@Length(min=0, max=50, message="苑区长度必须介于 0 和 50 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@NotNull(message="区域不能为空")
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}
	
	@Length(min=0, max=64, message="省份长度必须介于 0 和 64 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=64, message="市区县长度必须介于 0 和 64 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=64, message="镇长度必须介于 0 和 64 之间")
	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}
	
	@Length(min=0, max=64, message="业务板块长度必须介于 0 和 64 之间")
	public String getBusinessLine() {
		return businessLine;
	}

	public void setBusinessLine(String businessLine) {
		this.businessLine = businessLine;
	}
	
	@Length(min=0, max=100, message="项目公司名称长度必须介于 0 和 100 之间")
	public String getCompy() {
		return compy;
	}

	public void setCompy(String compy) {
		this.compy = compy;
	}
	
	@Length(min=0, max=64, message="计划开工时间长度必须介于 0 和 64 之间")
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	@Length(min=0, max=64, message="计划完工时间长度必须介于 0 和 64 之间")
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=50, message="项目负责人长度必须介于 0 和 50 之间")
	public String getProjectManagerBid() {
		return projectManagerBid;
	}

	public void setProjectManagerBid(String projectManagerBid) {
		this.projectManagerBid = projectManagerBid;
	}
	
	@Length(min=0, max=50, message="区域经理长度必须介于 0 和 50 之间")
	public String getRegionalManagerBid() {
		return regionalManagerBid;
	}

	public void setRegionalManagerBid(String regionalManagerBid) {
		this.regionalManagerBid = regionalManagerBid;
	}
	
	@Length(min=0, max=50, message="运营经理长度必须介于 0 和 50 之间")
	public String getPcDirectorBid() {
		return pcDirectorBid;
	}

	public void setPcDirectorBid(String pcDirectorBid) {
		this.pcDirectorBid = pcDirectorBid;
	}
	
	@Length(min=0, max=50, message="运营主管长度必须介于 0 和 50 之间")
	public String getCoordinatorLeaderBid() {
		return coordinatorLeaderBid;
	}

	public void setCoordinatorLeaderBid(String coordinatorLeaderBid) {
		this.coordinatorLeaderBid = coordinatorLeaderBid;
	}
	
	@Length(min=0, max=50, message="甲方项目总经理长度必须介于 0 和 50 之间")
	public String getGeneralManagerAid() {
		return generalManagerAid;
	}

	public void setGeneralManagerAid(String generalManagerAid) {
		this.generalManagerAid = generalManagerAid;
	}
	
	@Length(min=0, max=50, message="甲方项目区域总经理长度必须介于 0 和 50 之间")
	public String getRegionalManagerAid() {
		return regionalManagerAid;
	}

	public void setRegionalManagerAid(String regionalManagerAid) {
		this.regionalManagerAid = regionalManagerAid;
	}
	
	@Length(min=0, max=50, message="甲方现场跟进人长度必须介于 0 和 50 之间")
	public String getLocalManagerAid() {
		return localManagerAid;
	}

	public void setLocalManagerAid(String localManagerAid) {
		this.localManagerAid = localManagerAid;
	}
	
	@Length(min=0, max=50, message="甲方项目总经理联系方式长度必须介于 0 和 50 之间")
	public String getGeneralManagerMobile() {
		return generalManagerMobile;
	}

	public void setGeneralManagerMobile(String generalManagerMobile) {
		this.generalManagerMobile = generalManagerMobile;
	}
	
	@Length(min=0, max=50, message="甲方项目区域总联系方式长度必须介于 0 和 50 之间")
	public String getRegionalManagerMobile() {
		return regionalManagerMobile;
	}

	public void setRegionalManagerMobile(String regionalManagerMobile) {
		this.regionalManagerMobile = regionalManagerMobile;
	}
	
	@Length(min=0, max=50, message="甲方现场跟进人联系方式长度必须介于 0 和 50 之间")
	public String getLocalManagerMobile() {
		return localManagerMobile;
	}

	public void setLocalManagerMobile(String localManagerMobile) {
		this.localManagerMobile = localManagerMobile;
	}
	
	@Length(min=0, max=50, message="材料员长度必须介于 0 和 50 之间")
	public String getMaterialStaffBid() {
		return materialStaffBid;
	}

	public void setMaterialStaffBid(String materialStaffBid) {
		this.materialStaffBid = materialStaffBid;
	}
	
	@Length(min=0, max=50, message="施工员长度必须介于 0 和 50 之间")
	public String getConstructStaffBid() {
		return constructStaffBid;
	}

	public void setConstructStaffBid(String constructStaffBid) {
		this.constructStaffBid = constructStaffBid;
	}
	
	@Length(min=0, max=50, message="材料员联系方式长度必须介于 0 和 50 之间")
	public String getMaterialStaffMobile() {
		return materialStaffMobile;
	}

	public void setMaterialStaffMobile(String materialStaffMobile) {
		this.materialStaffMobile = materialStaffMobile;
	}
	
	@Length(min=0, max=50, message="施工员联系方式长度必须介于 0 和 50 之间")
	public String getConstructStaffMobile() {
		return constructStaffMobile;
	}

	public void setConstructStaffMobile(String constructStaffMobile) {
		this.constructStaffMobile = constructStaffMobile;
	}
	
	@Length(min=0, max=50, message="成本负责人长度必须介于 0 和 50 之间")
	public String getCostManagerBid() {
		return costManagerBid;
	}

	public void setCostManagerBid(String costManagerBid) {
		this.costManagerBid = costManagerBid;
	}
	
	@Length(min=0, max=50, message="成本组长长度必须介于 0 和 50 之间")
	public String getCostOfficerBid() {
		return costOfficerBid;
	}

	public void setCostOfficerBid(String costOfficerBid) {
		this.costOfficerBid = costOfficerBid;
	}
	
	@Length(min=0, max=50, message="成本主管长度必须介于 0 和 50 之间")
	public String getCostLeaderBid() {
		return costLeaderBid;
	}

	public void setCostLeaderBid(String costLeaderBid) {
		this.costLeaderBid = costLeaderBid;
	}
	
	@Length(min=0, max=50, message="成本负责人联系方式长度必须介于 0 和 50 之间")
	public String getCostManagerMobile() {
		return costManagerMobile;
	}

	public void setCostManagerMobile(String costManagerMobile) {
		this.costManagerMobile = costManagerMobile;
	}
	
	@Length(min=0, max=50, message="成本组长联系方式长度必须介于 0 和 50 之间")
	public String getCostOfficerMobile() {
		return costOfficerMobile;
	}

	public void setCostOfficerMobile(String costOfficerMobile) {
		this.costOfficerMobile = costOfficerMobile;
	}
	
	@Length(min=0, max=50, message="成本主管联系方式长度必须介于 0 和 50 之间")
	public String getCostLeaderMobile() {
		return costLeaderMobile;
	}

	public void setCostLeaderMobile(String costLeaderMobile) {
		this.costLeaderMobile = costLeaderMobile;
	}
	
	@Length(min=0, max=50, message="设计师长度必须介于 0 和 50 之间")
	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}
	
	@Length(min=0, max=50, message="设计主管长度必须介于 0 和 50 之间")
	public String getDesignLeaderBid() {
		return designLeaderBid;
	}

	public void setDesignLeaderBid(String designLeaderBid) {
		this.designLeaderBid = designLeaderBid;
	}
	
	@Length(min=0, max=50, message="设计师联系方式长度必须介于 0 和 50 之间")
	public String getDesignerMobile() {
		return designerMobile;
	}

	public void setDesignerMobile(String designerMobile) {
		this.designerMobile = designerMobile;
	}
	
	@Length(min=0, max=50, message="设计主管联系方式长度必须介于 0 和 50 之间")
	public String getDesignLeaderMobile() {
		return designLeaderMobile;
	}

	public void setDesignLeaderMobile(String designLeaderMobile) {
		this.designLeaderMobile = designLeaderMobile;
	}
	
	@Length(min=0, max=1, message="是否需要报建长度必须介于 0 和 1 之间")
	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}
	
	@Length(min=0, max=1, message="是否已报建长度必须介于 0 和 1 之间")
	public String getIsReport() {
		return isReport;
	}

	public void setIsReport(String isReport) {
		this.isReport = isReport;
	}
	
	@Length(min=0, max=1, message="是否挂靠长度必须介于 0 和 1 之间")
	public String getIsAttachUnit() {
		return isAttachUnit;
	}

	public void setIsAttachUnit(String isAttachUnit) {
		this.isAttachUnit = isAttachUnit;
	}
	
	@Length(min=0, max=1, message="是否需要周报长度必须介于 0 和 1 之间")
	public String getWeeklyReportRequired() {
		return weeklyReportRequired;
	}

	public void setWeeklyReportRequired(String weeklyReportRequired) {
		this.weeklyReportRequired = weeklyReportRequired;
	}
	
	@Length(min=0, max=200, message="挂靠单位长度必须介于 0 和 200 之间")
	public String getAttachUnit() {
		return attachUnit;
	}

	public void setAttachUnit(String attachUnit) {
		this.attachUnit = attachUnit;
	}
	
	public List<Subproject> getSubList() {
		return subList;
	}

	public void setSubList(List<Subproject> subList) {
		this.subList = subList;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOperationSpecialistBid() {
		return operationSpecialistBid;
	}

	public void setOperationSpecialistBid(String operationSpecialistBid) {
		this.operationSpecialistBid = operationSpecialistBid;
	}

	public List<Map<String, String>> getDesignList() {
		return designList;
	}

	public void setDesignList(List<Map<String, String>> designList) {
		this.designList = designList;
	}

	public String getShowProjectManagerBid() {
		return showProjectManagerBid;
	}

	public void setShowProjectManagerBid(String showProjectManagerBid) {
		this.showProjectManagerBid = showProjectManagerBid;
	}

	public String getShowRegionalManagerBid() {
		return showRegionalManagerBid;
	}

	public void setShowRegionalManagerBid(String showRegionalManagerBid) {
		this.showRegionalManagerBid = showRegionalManagerBid;
	}

	public String getShowPcDirectorBid() {
		return showPcDirectorBid;
	}

	public void setShowPcDirectorBid(String showPcDirectorBid) {
		this.showPcDirectorBid = showPcDirectorBid;
	}

	public String getShowCoordinatorLeaderBid() {
		return showCoordinatorLeaderBid;
	}

	public void setShowCoordinatorLeaderBid(String showCoordinatorLeaderBid) {
		this.showCoordinatorLeaderBid = showCoordinatorLeaderBid;
	}

	public String getShowOperationSpecialistBid() {
		return showOperationSpecialistBid;
	}

	public void setShowOperationSpecialistBid(String showOperationSpecialistBid) {
		this.showOperationSpecialistBid = showOperationSpecialistBid;
	}

	public String getShowMaterialStaffBid() {
		return showMaterialStaffBid;
	}

	public void setShowMaterialStaffBid(String showMaterialStaffBid) {
		this.showMaterialStaffBid = showMaterialStaffBid;
	}

	public String getShowConstructStaffBid() {
		return showConstructStaffBid;
	}

	public void setShowConstructStaffBid(String showConstructStaffBid) {
		this.showConstructStaffBid = showConstructStaffBid;
	}

	public String getShowAdminstaffbid() {
		return showAdminstaffbid;
	}

	public void setShowAdminstaffbid(String showAdminstaffbid) {
		this.showAdminstaffbid = showAdminstaffbid;
	}

	public List<JiaContract> getJiaContractList() {
		return jiaContractList;
	}

	public void setJiaContractList(List<JiaContract> jiaContractList) {
		this.jiaContractList = jiaContractList;
	}

	public User getProjectManager() {
		return projectManager;
	}

	public void setProjectManager(User projectManager) {
		this.projectManager = projectManager;
	}

	public void setMemberListStr(String memberListStr) {
		this.memberListStr = memberListStr;
	}
	
	public String getMemberListStr() {
		return memberListStr;
	}
}