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
import com.bt.modules.contract.dao.AccCarriageContractPriceDetailDao;

/**
 * 辅料运输合同明细1Service
 * @author yhh
 * @version 2015-08-11
 */
@Service
@Transactional(readOnly = true)
public class AccCarriageContractPriceDetailService extends CrudService<AccCarriageContractPriceDetailDao, AccCarriageContractPriceDetail> {

	@Autowired
	private AccCarriageContractPriceDetailDao accCarriageContractPriceDetailDao;
	
	public AccCarriageContractPriceDetail get(String id) {
		return super.get(id);
	}
	
	public List<AccCarriageContractPriceDetail> findList(AccCarriageContractPriceDetail accCarriageContractPriceDetail) {
		return super.findList(accCarriageContractPriceDetail);
	}
	
	public Page<AccCarriageContractPriceDetail> findPage(Page<AccCarriageContractPriceDetail> page, AccCarriageContractPriceDetail accCarriageContractPriceDetail) {
		return super.findPage(page, accCarriageContractPriceDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(AccCarriageContractPriceDetail accCarriageContractPriceDetail) {
		accCarriageContractPriceDetail.setIsNewRecord(true);
		super.save(accCarriageContractPriceDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(AccCarriageContractPriceDetail accCarriageContractPriceDetail) {
		accCarriageContractPriceDetail.setIsNewRecord(false);
		super.save(accCarriageContractPriceDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccCarriageContractPriceDetail accCarriageContractPriceDetail) {
		super.delete(accCarriageContractPriceDetail);
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
					AccCarriageContractPriceDetail accpd = new AccCarriageContractPriceDetail();
					accpd.setId(items[i]);
					super.delete(accpd);
				}
			}
		}
	}
	
}