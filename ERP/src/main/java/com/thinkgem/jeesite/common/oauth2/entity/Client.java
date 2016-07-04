package com.thinkgem.jeesite.common.oauth2.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;


/**
 * 客户端实体
 * @author XuJunXiong
 * @version 2015-07-10
 */
public class Client extends DataEntity<Client> {
	private static final long serialVersionUID = 1L;
    private String clientName;
    private String clientId;
    private String clientSecret;
    private Boolean available = Boolean.FALSE;
    
    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }
    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Client client = (Client) o;

        if (id != null ? !id.equals(client.id) : client.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", clientName='" + clientName + '\'' +
                ", clientId='" + clientId + '\'' +
                ", clientSecret='" + clientSecret + '\'' +
                '}';
    }

	@Override
	public void preInsert() {
		
	}

	@Override
	public void preUpdate() {
		
	}
}
