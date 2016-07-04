/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.contract.entity.PurchasingContractDetail;

/**
 * purchasingDAO接口
 * @author yhh
 * @version 2015-08-11
 */
@MyBatisDao
public interface PurchasingContractDetailDao extends CrudDao<PurchasingContractDetail> {
	/**
	 * 根据合同相关条件加载相关的列表数据
	 * @param purchasingContractDetail
	 * @return
	 */
	public List<PurchasingContractDetail> getListByCondition(PurchasingContractDetail purchasingContractDetail);
}