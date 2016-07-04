/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.dao;

import java.util.List;
import java.util.Map;

import com.bt.modules.purchase.entity.PurchaseDemandSubProjectMapping;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 采购需求对应的二级项目关联DAO接口
 * @author xiaocai
 * @version 2015-08-17
 */
@MyBatisDao
public interface PurchaseDemandSubProjectMappingDao extends CrudDao<PurchaseDemandSubProjectMapping> {
	
	/**
	 * 根据采购编号获取相应的详细数据信息
	 * @param seriesNumber
	 * @return
	 */
	public List<Map<String, Object>> getDetailBySeriesNumber(String seriesNumber);
	/**
	 * end
	 */
	/**
	 * 根据采购需求获取相应的列表数据
	 * 不传参数默认读取新建以及未生成需求订单的数据
	 * @param pID  采购需求编号
	 * @return
	 */
	public List<Map<String, Object>> getNewPro(PurchaseDemandSubProjectMapping psm);
	
	
}