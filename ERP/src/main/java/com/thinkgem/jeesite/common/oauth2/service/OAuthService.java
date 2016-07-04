package com.thinkgem.jeesite.common.oauth2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.oauth2.dao.ClientDao;
import com.thinkgem.jeesite.common.oauth2.dao.UserClientAuthDao;
import com.thinkgem.jeesite.common.oauth2.entity.Client;
import com.thinkgem.jeesite.common.oauth2.entity.UserClientAuth;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.CacheUtils;

/**
 * 授权服务层
 * 
 * @author JunXiongXu
 * @version 2015-07-09
 */

@Service
@Transactional(readOnly = true)
public class OAuthService extends BaseService {

	// 缓存的key at　ehcache-local.xml
	public static final String CODE_CACHE = "code-cache";

	@Autowired
	private ClientDao clientDao;

	@Autowired
	private UserClientAuthDao authDao;

	/**
	 * 检查user的client的权限
	 * 
	 * @param clientId
	 * @param username
	 * @return boolean
	 */
	public boolean checkClientAuthorization(String clientId, String userId) {
		UserClientAuth clientAuth = new UserClientAuth();
		clientAuth.setClientId(clientId);
		clientAuth.setUserId(userId);
		return authDao.getByClientUser(clientAuth) != null;
	}
	
	public String getIdByClientId(String clientId) {
		return clientDao.get(clientId).getId();
	}

	public boolean checkClientId(String clientId) {
		return clientDao.get(clientId) != null;
	}

	public boolean checkClientSecret(String clientSecret) {
		Client entity = new Client();
		entity.setClientSecret(clientSecret);
		return !clientDao.findList(entity).isEmpty();
	}

	public void addAuthCode(String authCode, String username) {
		CacheUtils.put(CODE_CACHE, authCode, username);
	}

	public void addAccessToken(String accessToken, String username) {
		CacheUtils.put(CODE_CACHE, accessToken, username);
	}

	public String getUsernameByAuthCode(String authCode) {
		return (String) CacheUtils.get(CODE_CACHE, authCode);
	}

	public String getUsernameByAccessToken(String accessToken) {
		return (String) CacheUtils.get(CODE_CACHE, accessToken);
	}

	public boolean checkAuthCode(String authCode) {
		return CacheUtils.get(CODE_CACHE, authCode) != null;
	}

	public boolean checkAccessToken(String accessToken) {
		return CacheUtils.get(CODE_CACHE, accessToken) != null;
	}

	public long getExpireIn() {
		// 获取超时的时间
		return 3600L;
	}
}
