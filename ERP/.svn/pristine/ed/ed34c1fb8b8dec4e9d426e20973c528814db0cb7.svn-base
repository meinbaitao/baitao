/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.project.entity.Subproject;


/**
 * 劳务清单Entity
 * @author yhh
 * @version 2015-12-14
 */
public class Laboritems extends ContractDetail<Laboritems> {
	
	private static final long serialVersionUID = 1L;
	private String originId;		//源数据ID（对应基础物料库中的数据id）
	private String contractId;		// 合同id
	private String seriesnumber;		// 编号
	private String name;		// 名称
	private String standard;		// 规格
	private String length;		// 长
	private String width;		// 宽
	private String heigh;		// 高
	private String unit;		// 单位
//	private String processOne;		// 骨架工序一
//	private String processTwo;		// 石材工序三
//	private String processThree;		// 骨架工序二
//	private String processFour;		// 石材工序四
	private String preNumber;		// 成本预算量
	private String numberRatio;		// 数量浮动比例
	private String afterNumber;		// 合同量
//	private String processPriceOne;		// 骨架工序一
//	private String processPriceTwo;		// 石材工序三
//	private String processPriceThree;		// 骨架工序二
//	private String processPriceFour;		// 石材工序四
	private String priceRatio;		// 价格浮动比例
	private String standardPrice;		// 标准价合计
	private String contractPrice;		// 合同价合计
	private String priceDifference;		// 价格差
	private String budgetPrice;		// 成本预算合计
	
	private String colligatePrice;		//综合单价
	private String colligatePriceStone;	//综合单价（骨架）
	private String colligatePriceSkeleton;	//综合单价（石材）
	private String contractColligatePrice;	//合同综合单价
	private String contractPriceStone;	//合同单价（骨架）
	private String contractPriceSkeleton;	//合同单价（石材）
	
	private Subproject sub;	//	对应的二级项目
	
	private List<Laboritems> listLaboritems;//列表数据
	
	public Laboritems() {
		super();
	}

	public Laboritems(String id){
		super(id);
	}

	@Length(min=0, max=64, message="合同id长度必须介于 0 和 64 之间")
	public String getContractId() {
		return contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	
	@Length(min=0, max=64, message="编号长度必须介于 0 和 64 之间")
	public String getSeriesnumber() {
		return seriesnumber;
	}

	public void setSeriesnumber(String seriesnumber) {
		this.seriesnumber = seriesnumber;
	}
	
	@Length(min=0, max=64, message="名称长度必须介于 0 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="规格长度必须介于 0 和 64 之间")
	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}
	
	@Length(min=0, max=20, message="长长度必须介于 0 和 20 之间")
	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}
	
	@Length(min=0, max=20, message="宽长度必须介于 0 和 20 之间")
	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}
	
	@Length(min=0, max=20, message="高长度必须介于 0 和 20 之间")
	public String getHeigh() {
		return heigh;
	}

	public void setHeigh(String heigh) {
		this.heigh = heigh;
	}
	
	@Length(min=0, max=50, message="单位长度必须介于 0 和 50 之间")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
//	@Length(min=0, max=20, message="骨架工序一长度必须介于 0 和 20 之间")
//	public String getProcessOne() {
//		return processOne;
//	}
//
//	public void setProcessOne(String processOne) {
//		this.processOne = processOne;
//	}
//	
//	@Length(min=0, max=20, message="石材工序三长度必须介于 0 和 20 之间")
//	public String getProcessTwo() {
//		return processTwo;
//	}
//
//	public void setProcessTwo(String processTwo) {
//		this.processTwo = processTwo;
//	}
//	
//	@Length(min=0, max=20, message="骨架工序二长度必须介于 0 和 20 之间")
//	public String getProcessThree() {
//		return processThree;
//	}
//
//	public void setProcessThree(String processThree) {
//		this.processThree = processThree;
//	}
//	
//	@Length(min=0, max=20, message="石材工序四长度必须介于 0 和 20 之间")
//	public String getProcessFour() {
//		return processFour;
//	}
//
//	public void setProcessFour(String processFour) {
//		this.processFour = processFour;
//	}
	
	@Length(min=0, max=20, message="成本预算量长度必须介于 0 和 20 之间")
	public String getPreNumber() {
		return preNumber;
	}

	public void setPreNumber(String preNumber) {
		this.preNumber = preNumber;
	}
	
	@Length(min=0, max=18, message="数量浮动比例长度必须介于 0 和 18 之间")
	public String getNumberRatio() {
		return numberRatio;
	}

	public void setNumberRatio(String numberRatio) {
		this.numberRatio = numberRatio;
	}
	
	@Length(min=0, max=20, message="合同量长度必须介于 0 和 20 之间")
	public String getAfterNumber() {
		return afterNumber;
	}

	public void setAfterNumber(String afterNumber) {
		this.afterNumber = afterNumber;
	}
	
//	@Length(min=0, max=20, message="骨架工序一长度必须介于 0 和 20 之间")
//	public String getProcessPriceOne() {
//		return processPriceOne;
//	}
//
//	public void setProcessPriceOne(String processPriceOne) {
//		this.processPriceOne = processPriceOne;
//	}
//	
//	@Length(min=0, max=20, message="石材工序三长度必须介于 0 和 20 之间")
//	public String getProcessPriceTwo() {
//		return processPriceTwo;
//	}
//
//	public void setProcessPriceTwo(String processPriceTwo) {
//		this.processPriceTwo = processPriceTwo;
//	}
//	
//	@Length(min=0, max=20, message="骨架工序二长度必须介于 0 和 20 之间")
//	public String getProcessPriceThree() {
//		return processPriceThree;
//	}
//
//	public void setProcessPriceThree(String processPriceThree) {
//		this.processPriceThree = processPriceThree;
//	}
//	
//	@Length(min=0, max=20, message="石材工序四长度必须介于 0 和 20 之间")
//	public String getProcessPriceFour() {
//		return processPriceFour;
//	}
//
//	public void setProcessPriceFour(String processPriceFour) {
//		this.processPriceFour = processPriceFour;
//	}
	
	@Length(min=0, max=18, message="价格浮动比例长度必须介于 0 和 18 之间")
	public String getPriceRatio() {
		return priceRatio;
	}

	public void setPriceRatio(String priceRatio) {
		this.priceRatio = priceRatio;
	}
	
	@Length(min=0, max=20, message="标准价合计长度必须介于 0 和 20 之间")
	public String getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(String standardPrice) {
		this.standardPrice = standardPrice;
	}
	
	@Length(min=0, max=20, message="合同价合计长度必须介于 0 和 20 之间")
	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}
	
	@Length(min=0, max=18, message="价格差长度必须介于 0 和 18 之间")
	public String getPriceDifference() {
		return priceDifference;
	}

	public void setPriceDifference(String priceDifference) {
		this.priceDifference = priceDifference;
	}
	
	@Length(min=0, max=20, message="成本预算合计长度必须介于 0 和 20 之间")
	public String getBudgetPrice() {
		return budgetPrice;
	}

	public void setBudgetPrice(String budgetPrice) {
		this.budgetPrice = budgetPrice;
	}

	public String getColligatePrice() {
		return colligatePrice;
	}

	public void setColligatePrice(String colligatePrice) {
		this.colligatePrice = colligatePrice;
	}

	public String getColligatePriceStone() {
		return colligatePriceStone;
	}

	public void setColligatePriceStone(String colligatePriceStone) {
		this.colligatePriceStone = colligatePriceStone;
	}

	public String getColligatePriceSkeleton() {
		return colligatePriceSkeleton;
	}

	public void setColligatePriceSkeleton(String colligatePriceSkeleton) {
		this.colligatePriceSkeleton = colligatePriceSkeleton;
	}

	public String getContractColligatePrice() {
		return contractColligatePrice;
	}

	public void setContractColligatePrice(String contractColligatePrice) {
		this.contractColligatePrice = contractColligatePrice;
	}

	public String getContractPriceStone() {
		return contractPriceStone;
	}

	public void setContractPriceStone(String contractPriceStone) {
		this.contractPriceStone = contractPriceStone;
	}

	public String getContractPriceSkeleton() {
		return contractPriceSkeleton;
	}

	public void setContractPriceSkeleton(String contractPriceSkeleton) {
		this.contractPriceSkeleton = contractPriceSkeleton;
	}

	public List<Laboritems> getListLaboritems() {
		return listLaboritems;
	}

	public void setListLaboritems(List<Laboritems> listLaboritems) {
		this.listLaboritems = listLaboritems;
	}

	public String getOriginId() {
		return originId;
	}

	public void setOriginId(String originId) {
		this.originId = originId;
	}

	public Subproject getSub() {
		return sub;
	}

	public void setSub(Subproject sub) {
		this.sub = sub;
	}
	
}