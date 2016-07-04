/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 石材运输明细Entity
 * @author yhh
 * @version 2015-12-01
 */
public class StoneCarriageContractDetail extends ContractDetail<StoneCarriageContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		//序号
	private String startAddr;		// 起运地址
	private String province;		// 省份
	private String city;		// 城市
	private String pastCity;		// 对应往年城市
	private String companyCity;		// 对应集团报价城市
	private String kilometre;		// 公里
	private String companyPrice;		// 集团报价
	private String pastPrice;		// 往年合同价
	private String preTaxFullCarPrice;		// 整车运输中标价格
	private String afterTaxFullCarPrice;		// 整车运输中标不含税价格
	private String preTaxSplitPrice;		// 零担运输中标价格
	private String afterTaxSplitPrice;		// 零担运输中标不含税价格
	private String preTaxLightPrice;		// 零担轻货中标价格
	private String afterTaxLightPrice;		// 零担轻货中标不含税价格
	private String duration;		// 运输时间
	
	public StoneCarriageContractDetail() {
		super();
	}

	public StoneCarriageContractDetail(String id){
		super(id);
	}
	
	@ExcelField(title=" 序号", type=0, align=2, sort=1)
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}

	@ExcelField(title=" 起运地址", type=0, align=2, sort=2)
	@Length(min=0, max=300, message="起运地址长度必须介于 0 和 300 之间")
	public String getStartAddr() {
		return startAddr;
	}

	public void setStartAddr(String startAddr) {
		this.startAddr = startAddr;
	}

	@ExcelField(title="省份", type=0, align=2, sort=11)	
	@Length(min=0, max=64, message="省份长度必须介于 0 和 64 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@ExcelField(title="城市", type=0, align=2, sort=21)	
	@Length(min=0, max=64, message="城市长度必须介于 0 和 64 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@ExcelField(title="对应往年城市【空白为往年无价格】", type=0, align=2, sort=31)	
	@Length(min=0, max=64, message="对应往年城市长度必须介于 0 和 64 之间")
	public String getPastCity() {
		return pastCity;
	}

	public void setPastCity(String pastCity) {
		this.pastCity = pastCity;
	}

	@ExcelField(title="对应集团报价城市", type=0, align=2, sort=41)	
	@Length(min=0, max=64, message="对应集团报价城市长度必须介于 0 和 64 之间")
	public String getCompanyCity() {
		return companyCity;
	}

	public void setCompanyCity(String companyCity) {
		this.companyCity = companyCity;
	}

	@ExcelField(title="公里", type=0, align=2, sort=51)	
	@Length(min=0, max=18, message="公里长度必须介于 0 和 18 之间")
	public String getKilometre() {
		return kilometre;
	}

	public void setKilometre(String kilometre) {
		this.kilometre = kilometre;
	}

	@ExcelField(title="集团报价【 工程板块报价】", type=0, align=2, sort=61)	
	@Length(min=0, max=18, message="集团报价长度必须介于 0 和 18 之间")
	public String getCompanyPrice() {
		return companyPrice;
	}

	public void setCompanyPrice(String companyPrice) {
		this.companyPrice = companyPrice;
	}

	@ExcelField(title="往年合同价", type=0, align=2, sort=71)	
	@Length(min=0, max=18, message="往年合同价长度必须介于 0 和 18 之间")
	public String getPastPrice() {
		return pastPrice;
	}

	public void setPastPrice(String pastPrice) {
		this.pastPrice = pastPrice;
	}

	@ExcelField(title="整车运输中标价格（元/吨）", type=0, align=2, sort=81)	
	@Length(min=0, max=18, message="整车运输中标价格长度必须介于 0 和 18 之间")
	public String getPreTaxFullCarPrice() {
		return preTaxFullCarPrice;
	}

	public void setPreTaxFullCarPrice(String preTaxFullCarPrice) {
		this.preTaxFullCarPrice = preTaxFullCarPrice;
	}

	@ExcelField(title="整车运输中标不含税价格（元/吨）", type=0, align=2, sort=91)	
	@Length(min=0, max=18, message="整车运输中标不含税价格长度必须介于 0 和 18 之间")
	public String getAfterTaxFullCarPrice() {
		return afterTaxFullCarPrice;
	}

	public void setAfterTaxFullCarPrice(String afterTaxFullCarPrice) {
		this.afterTaxFullCarPrice = afterTaxFullCarPrice;
	}

	@ExcelField(title="零担运输中标价格（元/吨）", type=0, align=2, sort=111)	
	@Length(min=0, max=18, message="零担运输中标价格长度必须介于 0 和 18 之间")
	public String getPreTaxSplitPrice() {
		return preTaxSplitPrice;
	}

	public void setPreTaxSplitPrice(String preTaxSplitPrice) {
		this.preTaxSplitPrice = preTaxSplitPrice;
	}

	@ExcelField(title="零担运输中标不含税价格（元/吨）", type=0, align=2, sort=121)	
	@Length(min=0, max=18, message="零担运输中标不含税价格长度必须介于 0 和 18 之间")
	public String getAfterTaxSplitPrice() {
		return afterTaxSplitPrice;
	}

	public void setAfterTaxSplitPrice(String afterTaxSplitPrice) {
		this.afterTaxSplitPrice = afterTaxSplitPrice;
	}

	@ExcelField(title="零担轻货中标价格（元/方）", type=0, align=2, sort=131)	
	@Length(min=0, max=18, message="零担轻货中标价格长度必须介于 0 和 18 之间")
	public String getPreTaxLightPrice() {
		return preTaxLightPrice;
	}

	public void setPreTaxLightPrice(String preTaxLightPrice) {
		this.preTaxLightPrice = preTaxLightPrice;
	}

	@ExcelField(title="零担轻货中标不含税价格（元/方）", type=0, align=2, sort=151)	
	@Length(min=0, max=18, message="零担轻货中标不含税价格长度必须介于 0 和 18 之间")
	public String getAfterTaxLightPrice() {
		return afterTaxLightPrice;
	}

	public void setAfterTaxLightPrice(String afterTaxLightPrice) {
		this.afterTaxLightPrice = afterTaxLightPrice;
	}

	@ExcelField(title="运输时间（小时）", type=0, align=2, sort=161)	
	@Length(min=0, max=16, message="运输时间长度必须介于 0 和 16 之间")
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
}