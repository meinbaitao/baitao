/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.entity;


import java.util.ArrayList;
import java.util.List;

import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.supplier.entity.Supplier;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 仓库信息Entity
 * @author xiaocai
 * @version 2016-1-13
 */
public class Depot extends DataEntity<Depot> {
	
	private static final long serialVersionUID = 1L;
	private String id;
//	private String userId;		// 仓库管理员
	private String name;	//仓库名称
	private String address;		// 仓库地址
	private String type;		// 仓库类型
//	private String factorys;		// 加工厂
	
	private User depotUser;
	private Project project;	//项目
	private Subproject sub;		//二级项目
	private Supplier supp;		//供应商（加工厂）
	
	List<String> listMaterialTypes = new ArrayList<String>();	//物料类型组合
	private String orderType;	//下料单类型
	
	public Depot() {
		super();
	}

	public Depot(String id){
		super(id);
	}
	
	public Depot(String id,String name,String depotType,User user){
		this();
		this.id=id;
		this.name=name;
		this.type=depotType;
		this.depotUser=user;
	}
	/**
	 * 组装查询唯一库存条件
	 * @param depotUser
	 * @param project
	 * @param sub
	 * @param supp
	 */
	public Depot(Project project,Subproject sub,Supplier supp){
		this();
		this.project=project;
		this.sub=sub;
		this.supp=supp;
	}
	/**
	 * 组装新增数据
	 */
	public Depot(String id,String name,String depotType,
			Project project,Subproject sub,Supplier supp){
		this();
		this.id=id;
		this.name=name;
		this.type=depotType;
		this.project=project;
		this.sub=sub;
		this.supp=supp;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User getDepotUser() {
		return depotUser;
	}

	public void setDepotUser(User depotUser) {
		this.depotUser = depotUser;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Subproject getSub() {
		return sub;
	}

	public void setSub(Subproject sub) {
		this.sub = sub;
	}

	public Supplier getSupp() {
		return supp;
	}

	public void setSupp(Supplier supp) {
		this.supp = supp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getListMaterialTypes() {
		return listMaterialTypes;
	}

	public void setListMaterialTypes(List<String> listMaterialTypes) {
		this.listMaterialTypes = listMaterialTypes;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	
}