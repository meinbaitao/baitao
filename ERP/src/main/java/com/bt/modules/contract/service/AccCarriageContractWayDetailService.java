/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.AccCarriageContractPriceDetail;
import com.bt.modules.contract.entity.AccCarriageContractWayDetail;
import com.bt.modules.contract.dao.AccCarriageContractWayDetailDao;

/**
 * 辅料运输合同明细2Service
 * @author yhh
 * @version 2015-08-11
 */
@Service
@Transactional(readOnly = true)
public class AccCarriageContractWayDetailService extends CrudService<AccCarriageContractWayDetailDao, AccCarriageContractWayDetail> {

	@Autowired
	private AccCarriageContractWayDetailDao accCarriageContractWayDetailDao;
	
	public AccCarriageContractWayDetail get(String id) {
		return super.get(id);
	}
	
	public List<AccCarriageContractWayDetail> findList(AccCarriageContractWayDetail accCarriageContractWayDetail) {
		return super.findList(accCarriageContractWayDetail);
	}
	
	public Page<AccCarriageContractWayDetail> findPage(Page<AccCarriageContractWayDetail> page, AccCarriageContractWayDetail accCarriageContractWayDetail) {
		return super.findPage(page, accCarriageContractWayDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(AccCarriageContractWayDetail accCarriageContractWayDetail) {
		accCarriageContractWayDetail.setIsNewRecord(true);
		super.save(accCarriageContractWayDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(AccCarriageContractWayDetail accCarriageContractWayDetail) {
		accCarriageContractWayDetail.setIsNewRecord(false);
		super.save(accCarriageContractWayDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccCarriageContractWayDetail accCarriageContractWayDetail) {
		super.delete(accCarriageContractWayDetail);
	}
	
	/**
	 * 批量删除明细
	 * @param idsPrice
	 */
	@Transactional(readOnly = false)
	public void deletePriceDetail(String idsPrice){
		if(StringUtils.isNoneEmpty(idsPrice)){
			String[] items = idsPrice.split(",");
			if(null != items && items.length>0){
				for(int i=0; i<items.length; i++){
					AccCarriageContractWayDetail accpd = new AccCarriageContractWayDetail();
					accpd.setId(items[i]);
					super.delete(accpd);
				}
			}
		}
	}
	@Transactional(readOnly = false)
	public void deleteWayDetail(String idsWay){
		if(StringUtils.isNoneEmpty(idsWay)){
			String[] items = idsWay.split(",");
			if(null != items && items.length>0){
				for(int i=0; i<items.length; i++){
					AccCarriageContractWayDetail accpd = new AccCarriageContractWayDetail();
					accpd.setId(items[i]);
					super.delete(accpd);
				}
			}
		}
	}
	
}