/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 物料运输价格明细Entity
 * @author yhh
 * @version 2016-01-25
 */
public class AccCarriageContractDetail extends ContractDetail<AccCarriageContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private String seriesnumber;		// 序号
	private String startAddr;		// 起运地址
	private String province;		// 省份
	private String city;		// 城市
	private String oneToFive;		// 1-5吨
	private String fiveToTen;		// 5.1-10吨
	private String tenToFifty;		// 10.1-15吨
	private String fiftyToTwenty;		// 15.1-20吨
	private String twentyToTwentyfive;		// 20.1-25吨
	private String twentyfiveToThirty;		// 25.1-30吨
	private String thirtyToThirtyfive;		// 30.1-35吨
	private String thirtyfiveAbove;		// 35吨以上
	private String uploadPrice;		// 送货费
	private String fixedPrice;		// 包车
	private String duration;		// 运输时间
	
	public AccCarriageContractDetail() {
		super();
	}

	public AccCarriageContractDetail(String id){
		super(id);
	}

	@ExcelField(title="序号", type=0, align=2, sort=1)
	@Length(min=0, max=32, message="序号长度必须介于 0 和 32 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}

	@ExcelField(title="起运地址", type=0, align=2, sort=11)
	@Length(min=0, max=300, message="起运地址长度必须介于 0 和 300 之间")
	public String getStartAddr() {
		return startAddr;
	}

	public void setStartAddr(String startAddr) {
		this.startAddr = startAddr;
	}

	@ExcelField(title="省份", type=0, align=2, sort=22)
	@Length(min=0, max=64, message="省份长度必须介于 0 和 64 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	@ExcelField(title="城市", type=0, align=2, sort=32)
	@Length(min=0, max=64, message="城市长度必须介于 0 和 64 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@ExcelField(title="1-5吨", type=0, align=2, sort=42)
	public String getOneToFive() {
		return oneToFive;
	}

	public void setOneToFive(String oneToFive) {
		this.oneToFive = oneToFive;
	}

	@ExcelField(title="5.1-10吨", type=0, align=2, sort=52)
	public String getFiveToTen() {
		return fiveToTen;
	}

	public void setFiveToTen(String fiveToTen) {
		this.fiveToTen = fiveToTen;
	}

	@ExcelField(title="10.1-15吨", type=0, align=2, sort=62)
	public String getTenToFifty() {
		return tenToFifty;
	}

	public void setTenToFifty(String tenToFifty) {
		this.tenToFifty = tenToFifty;
	}

	@ExcelField(title="15.1-20吨", type=0, align=2, sort=72)
	public String getFiftyToTwenty() {
		return fiftyToTwenty;
	}

	public void setFiftyToTwenty(String fiftyToTwenty) {
		this.fiftyToTwenty = fiftyToTwenty;
	}

	@ExcelField(title="20.1-25吨", type=0, align=2, sort=82)
	public String getTwentyToTwentyfive() {
		return twentyToTwentyfive;
	}

	public void setTwentyToTwentyfive(String twentyToTwentyfive) {
		this.twentyToTwentyfive = twentyToTwentyfive;
	}

	@ExcelField(title="25.1-30吨", type=0, align=2, sort=92)
	public String getTwentyfiveToThirty() {
		return twentyfiveToThirty;
	}

	public void setTwentyfiveToThirty(String twentyfiveToThirty) {
		this.twentyfiveToThirty = twentyfiveToThirty;
	}

	@ExcelField(title="30.1-35吨", type=0, align=2, sort=112)
	public String getThirtyToThirtyfive() {
		return thirtyToThirtyfive;
	}

	public void setThirtyToThirtyfive(String thirtyToThirtyfive) {
		this.thirtyToThirtyfive = thirtyToThirtyfive;
	}

	@ExcelField(title="35吨以上", type=0, align=2, sort=122)
	public String getThirtyfiveAbove() {
		return thirtyfiveAbove;
	}

	public void setThirtyfiveAbove(String thirtyfiveAbove) {
		this.thirtyfiveAbove = thirtyfiveAbove;
	}

	@ExcelField(title="送货费", type=0, align=2, sort=132)
	public String getUploadPrice() {
		return uploadPrice;
	}

	public void setUploadPrice(String uploadPrice) {
		this.uploadPrice = uploadPrice;
	}

	@ExcelField(title="包车", type=0, align=2, sort=152)
	public String getFixedPrice() {
		return fixedPrice;
	}

	public void setFixedPrice(String fixedPrice) {
		this.fixedPrice = fixedPrice;
	}

	@ExcelField(title="运输时间", type=0, align=2, sort=162)
	@Length(min=0, max=16, message="运输时间长度必须介于 0 和 16 之间")
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
}