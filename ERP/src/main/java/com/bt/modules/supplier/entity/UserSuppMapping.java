/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 供应商-生产经理关联Entity
 * @author xiaocai
 * @version 2015-10-27
 */
public class UserSuppMapping extends DataEntity<UserSuppMapping> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户
	private Supplier supp;		// 供应商
	
	public UserSuppMapping() {
		super();
	}

	public UserSuppMapping(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Supplier getSupp() {
		return supp;
	}

	public void setSupp(Supplier supp) {
		this.supp = supp;
	}
	
	
}