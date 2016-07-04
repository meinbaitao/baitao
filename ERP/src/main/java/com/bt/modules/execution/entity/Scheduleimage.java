/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.execution.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 楼栋形象图Entity
 * @author yhh
 * @version 2015-07-31
 */
public class Scheduleimage extends DataEntity<Scheduleimage> {
	
	private static final long serialVersionUID = 1L;
	private String subprojectId;		// 二级项目
	private String projectupdateId;		// 项目进度
	private String picturesouth;		// 南面
	private String picturenorth;		// 北面
	private String pictureeast;		// 东面
	private String picturewest;		// 西面
	private String picturesoutheast;		// 东南面
	private String picturenortheast;		// 东北面
	private String picturesouthwest;		// 西南面
	private String picturenorthwest;		// 西北面
	
	public Scheduleimage() {
		super();
	}

	public Scheduleimage(String id){
		super(id);
	}

	@Length(min=0, max=64, message="二级项目长度必须介于 0 和 64 之间")
	public String getSubprojectId() {
		return subprojectId;
	}

	public void setSubprojectId(String subprojectId) {
		this.subprojectId = subprojectId;
	}
	
	@Length(min=0, max=64, message="项目进度长度必须介于 0 和 64 之间")
	public String getProjectupdateId() {
		return projectupdateId;
	}

	public void setProjectupdateId(String projectupdateId) {
		this.projectupdateId = projectupdateId;
	}
	
	@Length(min=0, max=100, message="南面长度必须介于 0 和 100 之间")
	public String getPicturesouth() {
		return picturesouth;
	}

	public void setPicturesouth(String picturesouth) {
		this.picturesouth = picturesouth;
	}
	
	@Length(min=0, max=100, message="北面长度必须介于 0 和 100 之间")
	public String getPicturenorth() {
		return picturenorth;
	}

	public void setPicturenorth(String picturenorth) {
		this.picturenorth = picturenorth;
	}
	
	@Length(min=0, max=100, message="东面长度必须介于 0 和 100 之间")
	public String getPictureeast() {
		return pictureeast;
	}

	public void setPictureeast(String pictureeast) {
		this.pictureeast = pictureeast;
	}
	
	@Length(min=0, max=100, message="西面长度必须介于 0 和 100 之间")
	public String getPicturewest() {
		return picturewest;
	}

	public void setPicturewest(String picturewest) {
		this.picturewest = picturewest;
	}

	public String getPicturesoutheast() {
		return picturesoutheast;
	}

	public void setPicturesoutheast(String picturesoutheast) {
		this.picturesoutheast = picturesoutheast;
	}

	public String getPicturenortheast() {
		return picturenortheast;
	}

	public void setPicturenortheast(String picturenortheast) {
		this.picturenortheast = picturenortheast;
	}

	public String getPicturesouthwest() {
		return picturesouthwest;
	}

	public void setPicturesouthwest(String picturesouthwest) {
		this.picturesouthwest = picturesouthwest;
	}

	public String getPicturenorthwest() {
		return picturenorthwest;
	}

	public void setPicturenorthwest(String picturenorthwest) {
		this.picturenorthwest = picturenorthwest;
	}
	
	
}