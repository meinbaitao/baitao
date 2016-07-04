package com.thinkgem.jeesite.common.oauth2.entity;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户和客户端授权Bean
 * @author XuJunXiong
 * @version 2015-07-11
 */
public class UserClientAuth extends DataEntity<UserClientAuth> {
	private static final long serialVersionUID = 1L;
	private String userId;
	private String clientId;
	private List<String> roleIds;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public List<String> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<String> roleIds) {
		this.roleIds = roleIds;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		UserClientAuth client = (UserClientAuth) o;

		if (id != null ? !id.equals(client.id) : client.id != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		return id != null ? id.hashCode() : 0;
	}

	@Override
	//Fixme 请用StringBuilder替代 字符串拼接
	public String toString() {
		return "Client{" + "id=" + id + ", userId='" + userId + '\''
				+ ", clientId='" + clientId + '\'' + ", roleIds='"
				+ roleIds.toArray().toString() + '\'' + '}';
	}

	@Override
	public void preInsert() {

	}

	@Override
	public void preUpdate() {

	}
}
