package com.thinkgem.jeesite.modules.sys.entity;

import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 白名单Entity
 * @author xujianpeng
 * @version 2016-04-28
 */
public class Whitelists extends DataEntity<Whitelists> {

	private static final long serialVersionUID = 1L;
	
		private String name;	// 白名单名称
		
		private String roleEnName;	// 角色英文名称
		
		private String description;	//描述
		
		private String status; //启用状态
		
		private List<Role> roleNameList = Lists.newArrayList(); //选中的角色英文名列表
		
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		public String getRoleEnName() {
			return roleEnName;
		}

		public void setRoleEnName(String roleEnName) {
			this.roleEnName = roleEnName;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public List<Role> getRoleNameList() {
			return roleNameList;
		}

		public void setRoleNameList(List<Role> roleNameList) {
			this.roleNameList = roleNameList;
		}
		
		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public void setRoleIdList(String roleIds) {
			roleNameList = Lists.newArrayList();
			String[] roleIdList = roleIds.split(",");
			for (String roleId : roleIdList) {
				Role role = new Role();
				role.setId(roleId);
				roleNameList.add(role);
			}
		}
}