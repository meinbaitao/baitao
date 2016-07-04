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
import com.bt.modules.contract.entity.LaborItemsPrice;
import com.bt.modules.contract.dao.LaborItemsPriceDao;

/**
 * 劳务价库表Service
 * @author yhh
 * @version 2015-08-19
 */
@Service
@Transactional(readOnly = true)
public class LaborItemsPriceService extends CrudService<LaborItemsPriceDao, LaborItemsPrice> {
	
	@Autowired
	private LaborItemsPriceDao laborItemsPriceDao;
	
	public LaborItemsPrice get(String id) {
		return super.get(id);
	}
	
	public List<LaborItemsPrice> findList(LaborItemsPrice laborItemsPrice) {
		return super.findList(laborItemsPrice);
	}
	
	public Page<LaborItemsPrice> findPage(Page<LaborItemsPrice> page, LaborItemsPrice laborItemsPrice) {
		return super.findPage(page, laborItemsPrice);
	}
	
	@Transactional(readOnly = false)
	public void save(LaborItemsPrice laborItemsPrice) {
		laborItemsPrice.setIsNewRecord(true);
		super.save(laborItemsPrice);
	}
	
	@Transactional(readOnly = false)
	public void update(LaborItemsPrice laborItemsPrice) {
		laborItemsPrice.setIsNewRecord(false);
		super.save(laborItemsPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(LaborItemsPrice laborItemsPrice) {
		super.delete(laborItemsPrice);
	}
	
	/**
	 * 由分项名获取分项
	 * @param laborItemsPrice
	 * @return
	 */
	public LaborItemsPrice getByName(LaborItemsPrice laborItemsPrice){
		return laborItemsPriceDao.getByName(laborItemsPrice);
	}
	/**
	 * 根据条件获取相应的列表数据
	 * @param laborItemsPrice
	 * @return
	 */
	public List<LaborItemsPrice> getByCondition(LaborItemsPrice laborItemsPrice){
		List<LaborItemsPrice> list = laborItemsPriceDao.getByCondition(laborItemsPrice); 
		if(list==null){
			list = new ArrayList<LaborItemsPrice>();
		}
		return list;
	}
	public List<LaborItemsPrice> getByType(String type){
		LaborItemsPrice laborItemsPrice = new LaborItemsPrice();
		laborItemsPrice.setType(type);
		List<LaborItemsPrice> list = laborItemsPriceDao.getByCondition(laborItemsPrice); 
		if(list==null){
			list = new ArrayList<LaborItemsPrice>();
		}
		return list;
	}
}