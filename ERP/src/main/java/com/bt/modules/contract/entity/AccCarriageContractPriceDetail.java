/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 辅料运输合同明细1Entity
 * @author yhh
 * @version 2015-08-11
 */
//Fixme 必须重写 equals 和 hashcode 方法
public class AccCarriageContractPriceDetail extends ContractDetail<AccCarriageContractPriceDetail> {
	
	private static final long serialVersionUID = 1L;
	private String contractId;		// 合同id
	private String kmCount;		// 公里数
	private String under5tonsPriceCarriage;		// 5吨内运送费
	private String under5tonsPriceDeliver;		// 5吨内送货费
	private String upon5tonsPriceCarriage;		// 5吨外运送费
	private String upon5tonsPriceDeliver;		// 5吨外送货费
	
	public AccCarriageContractPriceDetail() {
		super();
	}

	public AccCarriageContractPriceDetail(String id){
		super(id);
	}

	@Length(min=1, max=32, message="合同id长度必须介于 1 和 32 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	@ExcelField(title="公里数", type=0, align=2, sort=1)
	public String getKmCount() {
		return kmCount;
	}

	public void setKmCount(String kmCount) {
		this.kmCount = kmCount;
	}

	@ExcelField(title="5吨内运送费", type=0, align=2, sort=2)
	public String getUnder5tonsPriceCarriage() {
		return under5tonsPriceCarriage;
	}

	public void setUnder5tonsPriceCarriage(String under5tonsPriceCarriage) {
		this.under5tonsPriceCarriage = under5tonsPriceCarriage;
	}

	@ExcelField(title="5吨内送货费", type=0, align=2, sort=3)
	public String getUnder5tonsPriceDeliver() {
		return under5tonsPriceDeliver;
	}

	public void setUnder5tonsPriceDeliver(String under5tonsPriceDeliver) {
		this.under5tonsPriceDeliver = under5tonsPriceDeliver;
	}

	@ExcelField(title="5吨外运送费", type=0, align=2, sort=4)
	public String getUpon5tonsPriceCarriage() {
		return upon5tonsPriceCarriage;
	}

	public void setUpon5tonsPriceCarriage(String upon5tonsPriceCarriage) {
		this.upon5tonsPriceCarriage = upon5tonsPriceCarriage;
	}

	@ExcelField(title="5吨外送货费", type=0, align=2, sort=5)
	public String getUpon5tonsPriceDeliver() {
		return upon5tonsPriceDeliver;
	}

	public void setUpon5tonsPriceDeliver(String upon5tonsPriceDeliver) {
		this.upon5tonsPriceDeliver = upon5tonsPriceDeliver;
	}

	
}