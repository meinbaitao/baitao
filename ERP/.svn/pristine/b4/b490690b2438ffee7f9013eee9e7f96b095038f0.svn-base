/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.dao;

import java.util.List;

import com.bt.modules.logistics.entity.ProductionLogisticsSendMapping;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 生产发货关系关联DAO接口
 * @author xiaocai
 * @version 2015-09-23
 */
@MyBatisDao
public interface ProductionLogisticsSendMappingDao extends CrudDao<ProductionLogisticsSendMapping> {
	/**
	 * 根据物流ID查看发货详细
	 * @param lID
	 * @return
	 */
	public List<ProductionLogisticsSendMapping> getProDetailByLID(ProductionLogisticsSendMapping ls);
	/**
	 * 根据实体中的条件获取但是实体数据
	 * @param plsm
	 * @return
	 */
	public int deleteByProductionId(ProductionLogisticsSendMapping plsm);
}