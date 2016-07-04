/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.entity;


import java.util.ArrayList;
import java.util.List;

import com.bt.modules.material.entity.Material;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 库存表Entity
 * @author xiaocai
 * @version 2016-1-13
 */
public class Inventory extends DataEntity<Inventory> {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String materialId;		// 物料id
	private String materialNo;		// 物料编号
	private String materialType;		// 物料类型物料类型（0-成品：箱，1-材料：黑材，钢材等）
	private String materialName;		// 物料名称
	private int quantity;		// 库存余量
	private String batchno;		// 批号
	private String shelf;		// 架号
	private String depotPlaceId;		// 仓位id
	private int fockQuantity;		// 锁库数量
	private String mtomo;		// 计划跟踪号
	
	private Depot depot;		// 仓库
	private Material material;		// 基础物料
	
	private Subproject sub;			//二级项目
	private Project project;		//项目
	private OrderBomBase orderBomBase;		//下料单
	private OrderBomDetail orderBomDetail;		//下料单详情
	private OrderBomBox orderBomBox;		//箱
	private int outQuantity;
	
	private String groupByStr;		//分组语句 
	List<String> listMaterialTypes = new ArrayList<String>();	//物料类型组合
	List<String> listMaterialNos;	//物料编号
	List<String> ids = new ArrayList<String>();
	private String tranType;	//操作类型
	 
	//界面传输数据
	private String outPro;	//出库项目
	private String outSub;	//出库楼栋（二级）
	private String inPro;	//入库项目
	private String inSub;	//入库楼栋（二级）
	
	
	
	public Inventory() {
		super();
	}
	public Inventory(String id) {
		super(id);
	}
	public Inventory(String materialID,String materialNo,String materialType, String materialName, 
			Depot depot, int quantity){
		this();
		this.materialId=materialID;
		this.materialNo=materialNo;
		this.materialType=materialType;
		this.materialName=materialName;
		this.depot=depot;
		this.quantity=quantity;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMaterialType() {
		return materialType;
	}

	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}

	public String getMaterialId() {
		return materialId;
	}

	public void setMaterialId(String materialId) {
		this.materialId = materialId;
	}
	
	public String getBatchno() {
		return batchno;
	}

	public void setBatchno(String batchno) {
		this.batchno = batchno;
	}
	
	public String getShelf() {
		return shelf;
	}

	public void setShelf(String shelf) {
		this.shelf = shelf;
	}
	
	public Depot getDepot() {
		return depot;
	}

	public void setDepot(Depot depot) {
		this.depot = depot;
	}

	public String getDepotPlaceId() {
		return depotPlaceId;
	}

	public void setDepotPlaceId(String depotPlaceId) {
		this.depotPlaceId = depotPlaceId;
	}
	
	public String getMtomo() {
		return mtomo;
	}

	public void setMtomo(String mtomo) {
		this.mtomo = mtomo;
	}

	public String getMaterialName() {
		return materialName;
	}

	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getFockQuantity() {
		return fockQuantity;
	}

	public void setFockQuantity(int fockQuantity) {
		this.fockQuantity = fockQuantity;
	}

	public String getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(String materialNo) {
		this.materialNo = materialNo;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public String getOutPro() {
		return outPro;
	}

	public void setOutPro(String outPro) {
		this.outPro = outPro;
	}

	public String getOutSub() {
		return outSub;
	}

	public void setOutSub(String outSub) {
		this.outSub = outSub;
	}

	public String getInPro() {
		return inPro;
	}

	public void setInPro(String inPro) {
		this.inPro = inPro;
	}

	public String getInSub() {
		return inSub;
	}

	public void setInSub(String inSub) {
		this.inSub = inSub;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getGroupByStr() {
		return groupByStr;
	}

	public void setGroupByStr(String groupByStr) {
		this.groupByStr = groupByStr;
	}

	public OrderBomBase getOrderBomBase() {
		return orderBomBase;
	}

	public void setOrderBomBase(OrderBomBase orderBomBase) {
		this.orderBomBase = orderBomBase;
	}

	public List<String> getListMaterialTypes() {
		return listMaterialTypes;
	}

	public void setListMaterialTypes(List<String> listMaterialTypes) {
		this.listMaterialTypes = listMaterialTypes;
	}

	public OrderBomBox getOrderBomBox() {
		return orderBomBox;
	}

	public void setOrderBomBox(OrderBomBox orderBomBox) {
		this.orderBomBox = orderBomBox;
	}

	public Subproject getSub() {
		return sub;
	}

	public void setSub(Subproject sub) {
		this.sub = sub;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public OrderBomDetail getOrderBomDetail() {
		return orderBomDetail;
	}

	public void setOrderBomDetail(OrderBomDetail orderBomDetail) {
		this.orderBomDetail = orderBomDetail;
	}

	public int getOutQuantity() {
		return outQuantity;
	}

	public void setOutQuantity(int outQuantity) {
		this.outQuantity = outQuantity;
	}
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public List<String> getListMaterialNos() {
		return listMaterialNos;
	}
	public void setListMaterialNos(List<String> listMaterialNos) {
		this.listMaterialNos = listMaterialNos;
	}
	
}