/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 二级项目信息Entity
 * @author lky
 * @version 2015-11-30
 */
public class ViewSubprojectProgress extends DataEntity<ViewSubprojectProgress> {
	
	private static final long serialVersionUID = 1L;
	private String subid;		// 二级项目
	private String projectid;		// 项目主键
	private String subhousetype;		// 户型
	private String subbuilding;		// 楼栋号
	private String buildingDisplayName;
	private String subastone;		// 预估挂石面积
	private String showtype;		// 标签名
	private String materialtype;		// 标签名
	private String planstartdate;		// 计划开始时间
	private String planenddate;		// 计划完成时间
	private String designstartdate;		// 设计图纸计划完成时间
	private String stoneorderdate;		// 石材下单计划完成时间
	private String skeletonorderdate;		// 骨架类材料下单计划完成时间
	private String pendantorderdate;		// 挂件类材料下单计划完成时间
	private String stoneedate;		// 石材要求到货时间
	private String skeletonedate;		// 骨架类材料要求到货时间
	private String pendantedate;		// 挂件类材料要求到货时间
	private String designCompleteDate;		// 设计图纸实际完成时间
	private String stoneCompleteDate;		// 石材下单实际完成时间
	private String skeletonCompleteDate;		// 骨架类材料下单实际完成时间
	private String pendantCompleteDate;		// 挂件类材料下单实际完成时间
	private String showdesigner;		// 姓名
	private String designerMobile;		// 设计师联系方式
	private String stoneActualArea;		// 实际挂石面积
	private String workclass;		// workclass
	private String larbomoney;		// larbomoney
	private String stoneActualDate;		// 石材实际到货时间
	private String skeletonActualDate;		// 骨架类材料实际到货时间
	private String pendantActualDate;		// 挂件类材料实际到货之间
	private String workshiftdate;		// workshiftdate
	private String completedate;		// completedate
	private String estimateRevenue;		// 各栋预估总产值
	
	public ViewSubprojectProgress() {
		super();
	}

	public ViewSubprojectProgress(String id){
		super(id);
	}

	@Length(min=1, max=64, message="二级项目长度必须介于 1 和 64 之间")
	public String getSubid() {
		return subid;
	}

	public void setSubid(String subid) {
		this.subid = subid;
	}
	
	@Length(min=0, max=64, message="项目主键长度必须介于 0 和 64 之间")
	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	
	@Length(min=1, max=50, message="户型长度必须介于 1 和 50 之间")
	public String getSubhousetype() {
		return subhousetype;
	}

	public void setSubhousetype(String subhousetype) {
		this.subhousetype = subhousetype;
	}
	
	@Length(min=1, max=100, message="楼栋号长度必须介于 1 和 100 之间")
	public String getSubbuilding() {
		return subbuilding;
	}

	public void setSubbuilding(String subbuilding) {
		this.subbuilding = subbuilding;
	}
	
	public String getBuildingDisplayName() {
		return buildingDisplayName;
	}
	
	public void setBuildingDisplayName(String buildingDisplayName) {
		this.buildingDisplayName = buildingDisplayName;
	}
	
	public String getSubastone() {
		return subastone;
	}

	public void setSubastone(String subastone) {
		this.subastone = subastone;
	}
	
	@Length(min=0, max=100, message="标签名长度必须介于 0 和 100 之间")
	public String getShowtype() {
		return showtype;
	}

	public void setShowtype(String showtype) {
		this.showtype = showtype;
	}
	
	@Length(min=0, max=100, message="标签名长度必须介于 0 和 100 之间")
	public String getMaterialtype() {
		return materialtype;
	}

	public void setMaterialtype(String materialtype) {
		this.materialtype = materialtype;
	}
	
	@Length(min=0, max=20, message="计划开始时间长度必须介于 0 和 20 之间")
	public String getPlanstartdate() {
		return planstartdate;
	}

	public void setPlanstartdate(String planstartdate) {
		this.planstartdate = planstartdate;
	}
	
	@Length(min=0, max=20, message="计划完成时间长度必须介于 0 和 20 之间")
	public String getPlanenddate() {
		return planenddate;
	}

	public void setPlanenddate(String planenddate) {
		this.planenddate = planenddate;
	}
	
	@Length(min=0, max=20, message="设计图纸计划完成时间长度必须介于 0 和 20 之间")
	public String getDesignstartdate() {
		return designstartdate;
	}

	public void setDesignstartdate(String designstartdate) {
		this.designstartdate = designstartdate;
	}
	
	@Length(min=0, max=20, message="石材下单计划完成时间长度必须介于 0 和 20 之间")
	public String getStoneorderdate() {
		return stoneorderdate;
	}

	public void setStoneorderdate(String stoneorderdate) {
		this.stoneorderdate = stoneorderdate;
	}
	
	@Length(min=0, max=20, message="骨架类材料下单计划完成时间长度必须介于 0 和 20 之间")
	public String getSkeletonorderdate() {
		return skeletonorderdate;
	}

	public void setSkeletonorderdate(String skeletonorderdate) {
		this.skeletonorderdate = skeletonorderdate;
	}
	
	@Length(min=0, max=20, message="挂件类材料下单计划完成时间长度必须介于 0 和 20 之间")
	public String getPendantorderdate() {
		return pendantorderdate;
	}

	public void setPendantorderdate(String pendantorderdate) {
		this.pendantorderdate = pendantorderdate;
	}
	
	@Length(min=0, max=20, message="石材要求到货时间长度必须介于 0 和 20 之间")
	public String getStoneedate() {
		return stoneedate;
	}

	public void setStoneedate(String stoneedate) {
		this.stoneedate = stoneedate;
	}
	
	@Length(min=0, max=20, message="骨架类材料要求到货时间长度必须介于 0 和 20 之间")
	public String getSkeletonedate() {
		return skeletonedate;
	}

	public void setSkeletonedate(String skeletonedate) {
		this.skeletonedate = skeletonedate;
	}
	
	@Length(min=0, max=20, message="挂件类材料要求到货时间长度必须介于 0 和 20 之间")
	public String getPendantedate() {
		return pendantedate;
	}

	public void setPendantedate(String pendantedate) {
		this.pendantedate = pendantedate;
	}
	
	@Length(min=0, max=20, message="设计图纸实际完成时间长度必须介于 0 和 20 之间")
	public String getDesignCompleteDate() {
		return designCompleteDate;
	}

	public void setDesignCompleteDate(String designCompleteDate) {
		this.designCompleteDate = designCompleteDate;
	}
	
	@Length(min=0, max=20, message="石材下单实际完成时间长度必须介于 0 和 20 之间")
	public String getStoneCompleteDate() {
		return stoneCompleteDate;
	}

	public void setStoneCompleteDate(String stoneCompleteDate) {
		this.stoneCompleteDate = stoneCompleteDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料下单实际完成时间长度必须介于 0 和 20 之间")
	public String getSkeletonCompleteDate() {
		return skeletonCompleteDate;
	}

	public void setSkeletonCompleteDate(String skeletonCompleteDate) {
		this.skeletonCompleteDate = skeletonCompleteDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料下单实际完成时间长度必须介于 0 和 20 之间")
	public String getPendantCompleteDate() {
		return pendantCompleteDate;
	}

	public void setPendantCompleteDate(String pendantCompleteDate) {
		this.pendantCompleteDate = pendantCompleteDate;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getShowdesigner() {
		return showdesigner;
	}

	public void setShowdesigner(String showdesigner) {
		this.showdesigner = showdesigner;
	}
	
	@Length(min=0, max=50, message="设计师联系方式长度必须介于 0 和 50 之间")
	public String getDesignerMobile() {
		return designerMobile;
	}

	public void setDesignerMobile(String designerMobile) {
		this.designerMobile = designerMobile;
	}
	
	public String getStoneActualArea() {
		return stoneActualArea;
	}

	public void setStoneActualArea(String stoneActualArea) {
		this.stoneActualArea = stoneActualArea;
	}
	
	public String getWorkclass() {
		return workclass;
	}

	public void setWorkclass(String workclass) {
		this.workclass = workclass;
	}
	
	public String getLarbomoney() {
		return larbomoney;
	}

	public void setLarbomoney(String larbomoney) {
		this.larbomoney = larbomoney;
	}
	
	@Length(min=0, max=20, message="石材实际到货时间长度必须介于 0 和 20 之间")
	public String getStoneActualDate() {
		return stoneActualDate;
	}

	public void setStoneActualDate(String stoneActualDate) {
		this.stoneActualDate = stoneActualDate;
	}
	
	@Length(min=0, max=20, message="骨架类材料实际到货时间长度必须介于 0 和 20 之间")
	public String getSkeletonActualDate() {
		return skeletonActualDate;
	}

	public void setSkeletonActualDate(String skeletonActualDate) {
		this.skeletonActualDate = skeletonActualDate;
	}
	
	@Length(min=0, max=20, message="挂件类材料实际到货之间长度必须介于 0 和 20 之间")
	public String getPendantActualDate() {
		return pendantActualDate;
	}

	public void setPendantActualDate(String pendantActualDate) {
		this.pendantActualDate = pendantActualDate;
	}
	
	public String getWorkshiftdate() {
		return workshiftdate;
	}

	public void setWorkshiftdate(String workshiftdate) {
		this.workshiftdate = workshiftdate;
	}
	
	public String getCompletedate() {
		return completedate;
	}

	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
	
	public String getEstimateRevenue() {
		return estimateRevenue;
	}

	public void setEstimateRevenue(String estimateRevenue) {
		this.estimateRevenue = estimateRevenue;
	}
	
}