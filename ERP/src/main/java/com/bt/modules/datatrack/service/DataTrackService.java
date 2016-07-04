/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.datatrack.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.contract.dao.ContractPrintDao;
import com.bt.modules.contract.entity.ManufContractBase;
import com.bt.modules.datatrack.dao.DataTrackDao;
import com.bt.modules.datatrack.entity.DataTrackDetail;
import com.bt.modules.production.entity.Production;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 合同台账Service
 * @author dy
 * @version 2016-4-7 16:13:14
 */
@Service
@Transactional(readOnly = true)
public class DataTrackService extends CrudService<DataTrackDao, DataTrackDetail> {

	
	@Autowired
	private DataTrackDao dataTrackDao;
	
	/**
	 * @param id
	 * @return
	 */
	public List<DataTrackDetail> getBaseBomNoForProduct(String id){
		return dataTrackDao.getBaseBomNoForProduct(id);
	}
	
	/**
	 * @param id
	 * @return
	 */
	public List<DataTrackDetail> getBaseBomNoForPurchase(String id){
		return dataTrackDao.getBaseBomNoForPurchase(id);
	}
	
	/**
	 * @param projectid
	 * @param orderBomNo
	 * @return
	 */
	public List<DataTrackDetail> getListForProject(String projectid,String orderBomNo) {
		return dataTrackDao.getListForProject(projectid,orderBomNo);
	}
	
	/**
	 * @param status
	 * @param orderBomId
	 * @return
	 */
	public List<DataTrackDetail> getDetailProduct(String status,String orderBomId) {
		List<DataTrackDetail> list = dataTrackDao.getDetailProduct(status,orderBomId);
		if(list==null){
			list = new ArrayList<DataTrackDetail>();
		}
		return list;
	}
	
	/**
	 * @param status
	 * @param orderBomId
	 * @return
	 */
	public List<DataTrackDetail> getDetailPurchase(String status,String orderBomId) {
		List<DataTrackDetail> list = dataTrackDao.getDetailPurchase(status,orderBomId);
		if(list==null){
			list = new ArrayList<DataTrackDetail>();
		}
		return list;
	}
	
}

