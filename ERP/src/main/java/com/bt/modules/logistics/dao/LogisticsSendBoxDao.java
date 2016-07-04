/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.dao;

import com.bt.modules.logistics.entity.LogisticsSendBox;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 发货通知加工箱mappingDAO接口
 * @author xiaocai
 * @version 2015-10-15
 */
@MyBatisDao
public interface LogisticsSendBoxDao extends CrudDao<LogisticsSendBox> {
	/**
	 * 获取相应的发货箱的总数
	 * @param lsb
	 * @return
	 */
	public int getSendBoxTotal(LogisticsSendBox lsb);
}