/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 二级项目信息Entity
 * @author xjp
 * @version 2015-09-02
 */
public class Subproject extends DataEntity<Subproject> {
	
	private static final long serialVersionUID = 1L;
	private String projectId;		// 项目主键
	private String materialId;		// 石材品种
	private String houseType;		// 户型
	private String building;		// 楼栋号
	private String buildingDisplayName;		// 楼栋号显示名称 许俊雄20160401愚人节
	private String status;		// 状态
	private String type;		// 类别:别墅、综合楼、商铺
	private String designer;//设计师
	private String designerMobile;//设计师联系电话
	private String designLeaderBid;//设计主管
	private String designLeaderBidMobile;//设计主管联系电话
	//数据字典显示字段
	private String showdesigner;//页面显示
	private String showdesignLeader;//页面显示
	private String showType;		//页面显示字段
	private String showStatus;		//页面显示字段
	private String showMaterial;    //页面显示字段
	
	private String areaofStone;		// 预估挂石面积
	private String stoneActualArea;		// 实际挂石面积
	private String planStartDate;		// 计划开始时间
	private String planEndDate;		// 计划完成时间
	private String designStartDate;		// 设计图纸计划完成时间
	private String designCompleteDate;		// 设计图纸实际完成时间
	private String stoneOrderDate;		// 石材下单计划完成时间
	private String stoneCompleteDate;		// 石材下单实际完成时间
	private String stoneExpectDate;		// 石材要求到货时间
	private String stoneActualDate;		// 石材实际到货时间
	private String skeletonOrderDate;		// 骨架类材料下单计划完成时间
	private String skeletonCompleteDate;		// 骨架类材料下单实际完成时间
	private String skeletonExpectDate;		// 骨架类材料要求到货时间
	private String skeletonActualDate;		// 骨架类材料实际到货时间
	private String pendantOrderDate;		// 挂件类材料下单计划完成时间
	private String pendantCompleteDate;		// 挂件类材料下单实际完成时间
	private String pendantExpectDate;		// 挂件类材料要求到货时间
	private String pendantActualDate;		// 挂件类材料实际到货之间
	private String estimateRevenue;		// 各栋预估总产值
	//private String workflowId;		// 工作流
	//private String workflowStatus;		// 工作流状态

	private String jiaContractNum;//甲方合同号
	
	private Project project;	//一级项目
	private String gbStr;		//分组条件
	
	//施工图信息
	private String subattachmentId;//施工图文件ID
	private String subattachmentName;//施工图文件名称
	private String subattachmenCreateDate;//上传日期
	private String processChartType;//图纸类型
	private Boolean isJgcry;//是否为加工厂人员
	
	public Subproject() {
		super();
	}

	public Subproject(String id){
		super(id);
	}

	@Length(min=0, max=64, message="项目主键长度必须介于 0 和 64 之间")
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	@Length(min=0, max=100, message="石材品种长度必须介于 0 和 100 之间")
	public String getMaterialId() {
		return materialId;
	}

	public void setMaterialId(String materialId) {
		this.materialId = materialId;
	}
	
	@Length(min=1, max=50, message="户型长度必须介于 1 和 50 之间")
	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}
	
	@Length(min=1, max=100, message="楼栋号长度必须介于 1 和 100 之间")
	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}
	
	//TODO 检查导出功能，是否要修改
	public String getBuildingDisplayName() {
		return buildingDisplayName;
	}

	public void setBuildingDisplayName(String buildingDisplayName) {
		this.buildingDisplayName = buildingDisplayName;
	}

	@Length(min=1, max=1, message="状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=50, message="类别:别墅、综合楼、商铺长度必须介于 1 和 50 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getAreaofStone() {
		return areaofStone;
	}

	public void setAreaofStone(String areaofStone) {
		this.areaofStone = areaofStone;
	}
	
	public String getStoneActualArea() {
		return stoneActualArea;
	}

	public void setStoneActualArea(String stoneActualArea) {
		this.stoneActualArea = stoneActualArea;
	}
	
	@Length(min=0, max=20, message="计划开始时间长度必须介于 0 和 20 之间")
	public String getPlanStartDate() {
		return planStartDate;
	}

	public void setPlanStartDate(String planStartDate) {
		this.planStartDate = planStartDate;
	}
	
	@Length(min=0, max=20, message="计划完成时间长度必须介于 0 和 20 之间")
	public String getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}
	
	@Length(min=0, max=20, message="设计图纸计划完成时间长度必须介于 0 和 20 之间")
	public String getDesignStartDate() {
		return designStartDate;
	}

	public void setDesignStartDate(String designStartDate) {
		this.designStartDate = designStartDate;
	}
	
	@Length(min=0, max=20, message="设计图纸实际完成时间长度必须介于 0 和 20 之间")
	public String getDesignCompleteDate() {
		return designCompleteDate;
	}

	public void setDesignCompleteDate(String designCompleteDate) {
		this.designCompleteDate = designCompleteDate;
	}
	
	@Length(min=0, max=20, message="石材下单计划完成时间长度必须介于 0 和 20 之间")
	public String getStoneOrderDate() {
		return stoneOrderDate;
	}

	public void setStoneOrderDate(String stoneOrderDate) {
		this.stoneOrderDate = stoneOrderDate;
	}
	
	@Length(min=0, max=20, message="石材下单实际完成时间长度必须介于 0 和 20 之间")
	public String getStoneCompleteDate() {
		return stoneCompleteDate;
	}

	public void setStoneCompleteDate(String stoneCompleteDate) {
		this.stoneCompleteDate = stoneCompleteDate;
	}
	
	@Length(min=0, max=20, message="石材要求到货时间长度必须介于 0 和 20 之间")
	public String getStoneExpectDate() {
		return stoneExpectDate;
	}

	public void setStoneExpectDate(String stoneExpectDate) {
		this.stoneExpectDate = stoneExpectDate;
	}
	
	@Length(min=0, max=20, message="石材实际到货时间长度必须介于 0 和 20 之间")
	public String getStoneActualDate() {
		return stoneActualDate;
	}

	public void setStoneActualDate(String stoneActualDate) {
		this.stoneActualDate = stoneActualDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料下单计划完成时间长度必须介于 0 和 20 之间")
	public String getSkeletonOrderDate() {
		return skeletonOrderDate;
	}

	public void setSkeletonOrderDate(String skeletonOrderDate) {
		this.skeletonOrderDate = skeletonOrderDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料下单实际完成时间长度必须介于 0 和 20 之间")
	public String getSkeletonCompleteDate() {
		return skeletonCompleteDate;
	}

	public void setSkeletonCompleteDate(String skeletonCompleteDate) {
		this.skeletonCompleteDate = skeletonCompleteDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料要求到货时间长度必须介于 0 和 20 之间")
	public String getSkeletonExpectDate() {
		return skeletonExpectDate;
	}

	public void setSkeletonExpectDate(String skeletonExpectDate) {
		this.skeletonExpectDate = skeletonExpectDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料实际到货时间长度必须介于 0 和 20 之间")
	public String getSkeletonActualDate() {
		return skeletonActualDate;
	}

	public void setSkeletonActualDate(String skeletonActualDate) {
		this.skeletonActualDate = skeletonActualDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料下单计划完成时间长度必须介于 0 和 20 之间")
	public String getPendantOrderDate() {
		return pendantOrderDate;
	}

	public void setPendantOrderDate(String pendantOrderDate) {
		this.pendantOrderDate = pendantOrderDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料下单实际完成时间长度必须介于 0 和 20 之间")
	public String getPendantCompleteDate() {
		return pendantCompleteDate;
	}

	public void setPendantCompleteDate(String pendantCompleteDate) {
		this.pendantCompleteDate = pendantCompleteDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料要求到货时间长度必须介于 0 和 20 之间")
	public String getPendantExpectDate() {
		return pendantExpectDate;
	}

	public void setPendantExpectDate(String pendantExpectDate) {
		this.pendantExpectDate = pendantExpectDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料实际到货之间长度必须介于 0 和 20 之间")
	public String getPendantActualDate() {
		return pendantActualDate;
	}

	public void setPendantActualDate(String pendantActualDate) {
		this.pendantActualDate = pendantActualDate;
	}
	
	public String getEstimateRevenue() {
		return estimateRevenue;
	}

	public void setEstimateRevenue(String estimateRevenue) {
		this.estimateRevenue = estimateRevenue;
	}
	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	public String getShowStatus() {
		return showStatus;
	}

	public void setShowStatus(String showStatus) {
		this.showStatus = showStatus;
	}

	public String getShowMaterial() {
		return showMaterial;
	}

	public void setShowMaterial(String showMaterial) {
		this.showMaterial = showMaterial;
	}

	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}

	public String getDesignerMobile() {
		return designerMobile;
	}

	public void setDesignerMobile(String designerMobile) {
		this.designerMobile = designerMobile;
	}

	public String getShowdesigner() {
		return showdesigner;
	}

	public void setShowdesigner(String showdesigner) {
		this.showdesigner = showdesigner;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getGbStr() {
		return gbStr;
	}

	public void setGbStr(String gbStr) {
		this.gbStr = gbStr;
	}
	

	public String getSubattachmentId() {
		return subattachmentId;
	}

	public void setSubattachmentId(String subattachmentId) {
		this.subattachmentId = subattachmentId;
	}

	public String getSubattachmentName() {
		return subattachmentName;
	}

	public void setSubattachmentName(String subattachmentName) {
		this.subattachmentName = subattachmentName;
	}

	public String getDesignLeaderBid() {
		return designLeaderBid;
	}

	public void setDesignLeaderBid(String designLeaderBid) {
		this.designLeaderBid = designLeaderBid;
	}

	public String getDesignLeaderBidMobile() {
		return designLeaderBidMobile;
	}

	public void setDesignLeaderBidMobile(String designLeaderBidMobile) {
		this.designLeaderBidMobile = designLeaderBidMobile;
	}

	public String getShowdesignLeader() {
		return showdesignLeader;
	}

	public void setShowdesignLeader(String showdesignLeader) {
		this.showdesignLeader = showdesignLeader;
	}

	public String getJiaContractNum() {
		return jiaContractNum;
	}

	public void setJiaContractNum(String jiaContractNum) {
		this.jiaContractNum = jiaContractNum;
	}
	
	public String getSubattachmenCreateDate() {
		return subattachmenCreateDate;
	}
	
	public void setSubattachmenCreateDate(String subattachmenCreateDate) {
		this.subattachmenCreateDate = subattachmenCreateDate;
	}
	
	public String getProcessChartType() {
		return processChartType;
	}
	public void setProcessChartType(String processChartType) {
		this.processChartType = processChartType;
	}
	
	public Boolean getIsJgcry() {
		return isJgcry;
	}
	
	public void setIsJgcry(Boolean isJgcry) {
		this.isJgcry = isJgcry;
	}
	
}