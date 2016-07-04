/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 采购需求对应的二级项目关联Entity
 * @author xiaocai
 * @version 2015-08-17
 */
public class PurchaseDemandSubProjectMapping extends DataEntity<PurchaseDemandSubProjectMapping> {
	
	private static final long serialVersionUID = 1L;
	private String pdid;		// 采购需求ID
	private String subid;		// 二级项目ID
	public String getPdid() {
		return pdid;
	}
	public void setPdid(String pdid) {
		this.pdid = pdid;
	}
	public String getSubid() {
		return subid;
	}
	public void setSubid(String subid) {
		this.subid = subid;
	}
	
	
	
}