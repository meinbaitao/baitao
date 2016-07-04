/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 二级项目进度Entity
 * @author yhh
 * @version 2015-07-31
 */
public class Scheduledetail extends DataEntity<Scheduledetail> {
	
	private static final long serialVersionUID = 1L;
	private String subprojectId;		// 二级项目
	private String location;		// 苑区
	private String projectupdateId;		// 项目进度
	private String skeletonlabor;		// 骨架施工组
	private String stonelabor;		// 石材施工组
	private String skeletonlaborcount;		// 骨架施工组人数
	private String stonelaborcount;		// 石材施工组人数
	private String skelentonplanratio;		// 骨架计划完成比例
	private String stoneplanratio;		// 石材计划完成比例
	private String stonecompratio;		// 石材完成比例
	private String skeletoncompratio;		// 骨架完成比例
	private String nextSkelentonplanratio;		// 下周骨架计划完成比例
	private String nextStoneplanratio;		// 下周石材计划完成比例
	private String revenue;		// 产值
	private String revenueratio;		// 产值进度
	private String visaCount; //签证数量
	
	
	
	public String getVisaCount() {
		return visaCount;
	}

	public void setVisaCount(String visaCount) {
		this.visaCount = visaCount;
	}

	public Scheduledetail() {
		super();
	}

	public Scheduledetail(String id){
		super(id);
	}

	@Length(min=0, max=64, message="二级项目长度必须介于 0 和 64 之间")
	public String getSubprojectId() {
		return subprojectId;
	}

	public void setSubprojectId(String subprojectId) {
		this.subprojectId = subprojectId;
	}
	
	@Length(min=0, max=50, message="苑区长度必须介于 0 和 50 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Length(min=0, max=64, message="项目进度长度必须介于 0 和 64 之间")
	public String getProjectupdateId() {
		return projectupdateId;
	}

	public void setProjectupdateId(String projectupdateId) {
		this.projectupdateId = projectupdateId;
	}
	
	@Length(min=0, max=50, message="骨架施工组长度必须介于 0 和 50 之间")
	public String getSkeletonlabor() {
		return skeletonlabor;
	}

	public void setSkeletonlabor(String skeletonlabor) {
		this.skeletonlabor = skeletonlabor;
	}
	
	@Length(min=0, max=50, message="石材施工组长度必须介于 0 和 50 之间")
	public String getStonelabor() {
		return stonelabor;
	}

	public void setStonelabor(String stonelabor) {
		this.stonelabor = stonelabor;
	}
	
	@Length(min=0, max=11, message="骨架施工组人数长度必须介于 0 和 11 之间")
	public String getSkeletonlaborcount() {
		return skeletonlaborcount;
	}

	public void setSkeletonlaborcount(String skeletonlaborcount) {
		this.skeletonlaborcount = skeletonlaborcount;
	}
	
	@Length(min=0, max=11, message="石材施工组人数长度必须介于 0 和 11 之间")
	public String getStonelaborcount() {
		return stonelaborcount;
	}

	public void setStonelaborcount(String stonelaborcount) {
		this.stonelaborcount = stonelaborcount;
	}
	
	public String getSkelentonplanratio() {
		return skelentonplanratio;
	}

	public void setSkelentonplanratio(String skelentonplanratio) {
		this.skelentonplanratio = skelentonplanratio;
	}
	
	public String getStoneplanratio() {
		return stoneplanratio;
	}

	public void setStoneplanratio(String stoneplanratio) {
		this.stoneplanratio = stoneplanratio;
	}
	
	public String getStonecompratio() {
		return stonecompratio;
	}

	public void setStonecompratio(String stonecompratio) {
		this.stonecompratio = stonecompratio;
	}
	
	public String getSkeletoncompratio() {
		return skeletoncompratio;
	}

	public void setSkeletoncompratio(String skeletoncompratio) {
		this.skeletoncompratio = skeletoncompratio;
	}
	
	public String getNextSkelentonplanratio() {
		return nextSkelentonplanratio;
	}

	public void setNextSkelentonplanratio(String nextSkelentonplanratio) {
		this.nextSkelentonplanratio = nextSkelentonplanratio;
	}
	
	public String getNextStoneplanratio() {
		return nextStoneplanratio;
	}

	public void setNextStoneplanratio(String nextStoneplanratio) {
		this.nextStoneplanratio = nextStoneplanratio;
	}
	
	public String getRevenue() {
		return revenue;
	}

	public void setRevenue(String revenue) {
		this.revenue = revenue;
	}
	
	public String getRevenueratio() {
		return revenueratio;
	}

	public void setRevenueratio(String revenueratio) {
		this.revenueratio = revenueratio;
	}
	
}