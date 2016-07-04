/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.entity;

import java.util.List;

import com.bt.modules.supplier.entity.Supplier;
/**
 * purchasingEntity
 * @author yhh
 * @version 2015-08-11
 */
public class PurchasingContractBase extends ConContainDetail<PurchasingContractBase, PurchasingContractDetail> {
	
	private static final long serialVersionUID = 1L;
	private Supplier supp;	//对应的供应商
	
	private List<OtherContractDetail> detailListX;	
	private String delIdsX;		
	
	public PurchasingContractBase() {
		super();
	}

	public PurchasingContractBase(String id){
		super(id);
	}
	
	public Supplier getSupp() {
		return supp;
	}

	public void setSupp(Supplier supp) {
		this.supp = supp;
	}

	public List<OtherContractDetail> getDetailListX() {
		return detailListX;
	}

	public void setDetailListX(List<OtherContractDetail> detailListX) {
		this.detailListX = detailListX;
	}

	public String getDelIdsX() {
		return delIdsX;
	}

	public void setDelIdsX(String delIdsX) {
		this.delIdsX = delIdsX;
	}

}