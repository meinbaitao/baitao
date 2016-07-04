/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.datatrack.dao;

import java.util.List;

import com.bt.modules.datatrack.entity.DataTrackDetail;
import com.bt.modules.production.entity.Production;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 合同台账DAO接口
 * @author yhh
 * @version 2015-11-02
 */
@MyBatisDao
public interface DataTrackDao extends CrudDao<DataTrackDetail>{
	
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<DataTrackDetail> getBaseBomNoForProduct(String id);
	
	public List<DataTrackDetail> getBaseBomNoForPurchase(String id);
	
	public List<DataTrackDetail> getListForProject(String projectid,String orderBomNo);
	
	public List<DataTrackDetail> getDetailProduct(String status,String orderBomId);
	
	public List<DataTrackDetail> getDetailPurchase(String status,String orderBomId);
}