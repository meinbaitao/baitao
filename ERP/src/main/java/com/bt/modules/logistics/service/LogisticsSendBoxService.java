/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.logistics.dao.LogisticsSendBoxDao;
import com.bt.modules.logistics.entity.LogisticsSendBox;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 发货通知加工箱mappingService
 * @author xiaocai
 * @version 2015-10-15
 */
@Service
@Transactional(readOnly = true)
public class LogisticsSendBoxService extends CrudService<LogisticsSendBoxDao, LogisticsSendBox> {

	@Autowired
	private LogisticsSendBoxDao logisticsSendBoxDao;
	
	/**
	 * 批量插入数据
	 * @param listLSB
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<LogisticsSendBox> listLSB) {
		for(LogisticsSendBox lsb:listLSB){
			logisticsSendBoxDao.insert(lsb);
		}
	}
	/**
	 * 获取相应的发货箱的总数
	 * @param lsb
	 * @return
	 */
	public int getSendBoxTotal(LogisticsSendBox lsb){
		return logisticsSendBoxDao.getSendBoxTotal(lsb);
	}
	
	
	public LogisticsSendBox get(String id) {
		return super.get(id);
	}
	
	public List<LogisticsSendBox> findList(LogisticsSendBox logisticsSendBox) {
		return super.findList(logisticsSendBox);
	}
	
	public Page<LogisticsSendBox> findPage(Page<LogisticsSendBox> page, LogisticsSendBox logisticsSendBox) {
		return super.findPage(page, logisticsSendBox);
	}
	
	@Transactional(readOnly = false)
	public void save(LogisticsSendBox logisticsSendBox) {
		super.save(logisticsSendBox);
	}
	
	@Transactional(readOnly = false)
	public void delete(LogisticsSendBox logisticsSendBox) {
		super.delete(logisticsSendBox);
	}
	
}