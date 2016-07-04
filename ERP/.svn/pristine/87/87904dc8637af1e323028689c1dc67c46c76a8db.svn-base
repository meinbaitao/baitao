/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.dao.StoneCarriageContractDetailDao;

/**
 * 石材运输明细Service
 * @author yhh
 * @version 2015-12-01
 */
@Service
@Transactional(readOnly = true)
public class StoneCarriageContractDetailService extends CrudService<StoneCarriageContractDetailDao, StoneCarriageContractDetail> {

	@Autowired
	private StoneCarriageContractDetailDao stoneCarriageContractDetailDao;
	
	/**
	 * 对起运地址进行分组
	 * @return
	 */
	public List<StoneCarriageContractDetail> getGroupByStartAddress(){
		List<StoneCarriageContractDetail> listSCCD = stoneCarriageContractDetailDao.getGroupByStartAddress();
		if(listSCCD==null){
			listSCCD = new ArrayList<StoneCarriageContractDetail>();
		}
		return listSCCD;
	}
	
	public StoneCarriageContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<StoneCarriageContractDetail> findList(StoneCarriageContractDetail stoneCarriageContractDetail) {
		return super.findList(stoneCarriageContractDetail);
	}
	
	public Page<StoneCarriageContractDetail> findPage(Page<StoneCarriageContractDetail> page, StoneCarriageContractDetail stoneCarriageContractDetail) {
		return super.findPage(page, stoneCarriageContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(StoneCarriageContractDetail stoneCarriageContractDetail) {
		super.save(stoneCarriageContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(StoneCarriageContractDetail stoneCarriageContractDetail) {
		super.delete(stoneCarriageContractDetail);
	}
	
}