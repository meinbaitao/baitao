package com.thinkgem.jeesite.common.oauth2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.thinkgem.jeesite.common.oauth2.dao.ClientDao;
import com.thinkgem.jeesite.common.oauth2.entity.Client;
import com.thinkgem.jeesite.common.service.BaseService;

/**
 * 客户端管理
 * 
 * @author JunXiongXu
 * @version 2015-07-10
 */

@Service
@Transactional(readOnly = true)
public class ClientService extends BaseService {

	@Autowired
	private ClientDao clientDao;

	public Client findByClientId(String clientId) {
		return clientDao.get(clientId);
	}

}
