/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 生产合同Entity
 * @author yhh
 * @version 2015-08-10
 */
public class ManufContractBase extends ConContainDetail<ManufContractBase, ManufContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String uniformMateriel;		// 统一使用材料
	private String manufArea;	//产区
	
	private List<ManufContractDetail> detailList;		//明细列表
	
	public ManufContractBase() {
		super();
	}

	public ManufContractBase(String id){
		super(id);
	}

	@ExcelField(title="统一使用材料", type=0, align=2, sort=21)
	@Length(min=0, max=60, message="统一使用材料长度必须介于 0 和 60 之间")
	public String getUniformMateriel() {
		return uniformMateriel;
	}

	public void setUniformMateriel(String uniformMateriel) {
		this.uniformMateriel = uniformMateriel;
	}
	
	public String getManufArea() {
		return manufArea;
	}

	public void setManufArea(String manufArea) {
		this.manufArea = manufArea;
	}

	public List<ManufContractDetail> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<ManufContractDetail> detailList) {
		this.detailList = detailList;
	}

	
}