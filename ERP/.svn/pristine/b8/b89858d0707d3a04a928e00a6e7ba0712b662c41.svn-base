/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 辅料运输合同明细2Entity
 * @author yhh
 * @version 2015-08-11
 */
//Fixme 必须重写 equals 和 hashcode 方法
public class AccCarriageContractWayDetail extends ContractDetail<AccCarriageContractWayDetail> {
	
	private static final long serialVersionUID = 1L;
	private String contractId;		// 合同id
	private String startArea;			//发货区域
	private String startAddr;		// 发货地址
	private String goodType;		//产品类别
	private String goodCover;		//产品包装
	private String endName;		// 工地名称
	private String endAddr;		// 工地地址
	private String kmCount;		// 公里数
	
	
	public AccCarriageContractWayDetail() {
		super();
	}

	public AccCarriageContractWayDetail(String id){
		super(id);
	}

	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	@ExcelField(title="发货区域", type=0, align=2, sort=1)
	public String getStartArea() {
		return startArea;
	}

	public void setStartArea(String startArea) {
		this.startArea = startArea;
	}

	@ExcelField(title="发货地址", type=0, align=2, sort=2)
	public String getStartAddr() {
		return startAddr;
	}

	public void setStartAddr(String startAddr) {
		this.startAddr = startAddr;
	}

	@ExcelField(title="产品类别", type=0, align=2, sort=3)
	public String getGoodType() {
		return goodType;
	}

	public void setGoodType(String goodType) {
		this.goodType = goodType;
	}

	@ExcelField(title="产品包装", type=0, align=2, sort=4)
	public String getGoodCover() {
		return goodCover;
	}

	public void setGoodCover(String goodCover) {
		this.goodCover = goodCover;
	}

	@ExcelField(title="工地名称", type=0, align=2, sort=5)
	public String getEndName() {
		return endName;
	}

	public void setEndName(String endName) {
		this.endName = endName;
	}

	@ExcelField(title="工地地址", type=0, align=2, sort=6)
	public String getEndAddr() {
		return endAddr;
	}

	public void setEndAddr(String endAddr) {
		this.endAddr = endAddr;
	}

	@ExcelField(title="公里数", type=0, align=2, sort=7)
	public String getKmCount() {
		return kmCount;
	}

	public void setKmCount(String kmCount) {
		this.kmCount = kmCount;
	}

	
}