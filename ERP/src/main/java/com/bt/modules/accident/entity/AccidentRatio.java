/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 事故比例Entity
 * @author pc
 * @version 2015-10-14
 */
public class AccidentRatio extends DataEntity<AccidentRatio> {
	
	private static final long serialVersionUID = 1L;

	private String accidentType;
	private String auditProcess;
	private String respPart;
	private String ratio;
	private String accidentDetailType;
	private String accidentDetailTypeId;
	private String encloseMaterials;
	private String tips;

	public String getAccidentType() {
		return accidentType;
	}

	public void setAccidentType(String accidentType) {
		this.accidentType = accidentType;
	}

	public String getRespPart() {
		return respPart;
	}

	public void setRespPart(String respPart) {
		this.respPart = respPart;
	}

	public String getRatio() {
		return ratio;
	}

	public void setRatio(String ratio) {
		this.ratio = ratio;
	}

	public String getAccidentDetailType() {
		return accidentDetailType;
	}

	public void setAccidentDetailType(String accidentDetailType) {
		this.accidentDetailType = accidentDetailType;
	}

	public String getEncloseMaterials() {
		return encloseMaterials;
	}

	public void setEncloseMaterials(String encloseMaterials) {
		this.encloseMaterials = encloseMaterials;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public String getAuditProcess() {
		return auditProcess;
	}

	public void setAuditProcess(String auditProcess) {
		this.auditProcess = auditProcess;
	}

	public String getAccidentDetailTypeId() {
		return accidentDetailTypeId;
	}

	public void setAccidentDetailTypeId(String accidentDetailTypeId) {
		this.accidentDetailTypeId = accidentDetailTypeId;
	}

}