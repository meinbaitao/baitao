/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 已移交楼栋Entity
 * @author jinyuanf
 * @version 2015-11-25
 */
public class TransferedBuilding extends BaseReportEntity<TransferedBuilding> {
	
	private static final long serialVersionUID = 1L;
	private String reportId;		// 项目周报表主键
	private String buildNo;		// 楼栋号
	private String district;		// 苑区
	private Date transferDate;		// 移交时间


	public TransferedBuilding() {
		super();
	}

	public TransferedBuilding(String id){
		super(id);
	}

	
	@Length(min=1, max=64, message="项目周报表主键长度必须介于 1 和 64 之间")
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
	@Length(min=1, max=100, message="楼栋号长度必须介于 1 和 100 之间")
	public String getBuildNo() {
		return buildNo;
	}

	public void setBuildNo(String buildNo) {
		this.buildNo = buildNo;
	}
	
	@Length(min=1, max=50, message="苑区长度必须介于 1 和 50 之间")
	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}


}