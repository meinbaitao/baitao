/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.entity;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.purchase.entity.Purchase;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 库存采购单关系关联Entity
 * @author xiaocai
 * @version 2015-10-19
 */
public class InventoryPurchaseMapping extends DataEntity<InventoryPurchaseMapping> {
	
	private static final long serialVersionUID = 1L;
	private String inventoryId;		// 库存数据ID
	private String purchaseId;		// 采购单ID
	
	private Inventory inventory;	
	private Purchase purchase;	
	
	public InventoryPurchaseMapping() {
		super();
	}

	public InventoryPurchaseMapping(String id){
		super(id);
	}

	@Length(min=0, max=64, message="库存数据ID长度必须介于 0 和 64 之间")
	public String getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(String inventoryId) {
		this.inventoryId = inventoryId;
	}
	
	@Length(min=0, max=64, message="采购单ID长度必须介于 0 和 64 之间")
	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	
}