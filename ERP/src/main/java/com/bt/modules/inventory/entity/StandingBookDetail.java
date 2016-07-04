/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 出入库台账明细Entity
 * @author xiaocai
 * @version 2015-10-10
 */
public class StandingBookDetail extends DataEntity<StandingBookDetail> {
	
	private static final long serialVersionUID = 1L;
	private String standingBookId;		// 台账表ID
	private int quantity;		// 数量
	private String mtono;		// 跟踪号
	
	private Inventory inventory;	//库存中的数据
	private StandingBook standingBook;	//入库记录
	
	private String gbStr;		//分组条件
	
	private String logLab;		//材料操作记录
	
	public StandingBookDetail() {
		super();
	}

	public StandingBookDetail(String id){
		super(id);
	}

	public StandingBookDetail(String id,int quantity,StandingBook standingBook,Inventory inventory){
		this.id=id;
		this.quantity=quantity;
		this.standingBook=standingBook;
		this.inventory=inventory;
	}
	
	public String getStandingBookId() {
		return standingBookId;
	}

	public void setStandingBookId(String standingBookId) {
		this.standingBookId = standingBookId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getMtono() {
		return mtono;
	}

	public void setMtono(String mtono) {
		this.mtono = mtono;
	}

	public Inventory getInventory() {
		return inventory;
	}

	public void setInventory(Inventory inventory) {
		this.inventory = inventory;
	}

	public StandingBook getStandingBook() {
		return standingBook;
	}

	public void setStandingBook(StandingBook standingBook) {
		this.standingBook = standingBook;
	}

	public String getGbStr() {
		return gbStr;
	}

	public void setGbStr(String gbStr) {
		this.gbStr = gbStr;
	}

	public String getLogLab() {
		return logLab;
	}

	public void setLogLab(String logLab) {
		this.logLab = logLab;
	}
	
	
}