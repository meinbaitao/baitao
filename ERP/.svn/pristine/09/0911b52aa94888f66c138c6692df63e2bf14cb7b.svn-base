/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.purchase.dao.PurchaseSFDetailDao;
import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 采购收发详细Service
 * @author xiaocai
 * @version 2015-08-07
 */
@Service
@Transactional(readOnly = true)
public class PurchaseSFDetailService extends CrudService<PurchaseSFDetailDao, PurchaseSFDetail> {

	@Autowired
	PurchaseSFDetailDao purchaseSFDetailDao;
	/**
	 * 批量插入数据
	 * @param listPSF
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<PurchaseSFDetail> listPSF){
		for(PurchaseSFDetail p:listPSF){
			p.setCreateBy(UserUtils.getUser());
			p.setCreateDate(new Date());
			purchaseSFDetailDao.insert(p);
		}
	}
	/**
	 * 插入单条数据
	 * @param p
	 */
	@Transactional(readOnly = false)
	public void insert(PurchaseSFDetail p){
		purchaseSFDetailDao.insert(p);
	}
	/**
	 * 批量修改数据
	 * @param listPSF
	 */
	@Transactional(readOnly = false)
	public void batchUpdate(List<PurchaseSFDetail> listPSF){
		for(PurchaseSFDetail p:listPSF){
			purchaseSFDetailDao.update(p);
		}
	}
	/**
	 * 根据订单编号获取收发详情
	 * @param seriesnumber
	 * @return
	 */
	public List<PurchaseSFDetail> getSFDetailByPID(String pID){
		if(StringUtils.isBlank(pID)){
			return new ArrayList<PurchaseSFDetail>();
		}else{
			return purchaseSFDetailDao.getSFDetailByPID(pID);
		}
			
	}
	public int getToDaysCount(Date date){
		if(date==null){
			date = new Date();
		}
		return purchaseSFDetailDao.getToDaysCount(date);
	}
	/**
	 * 修改单条数据
	 * @param PurchaseSFDetail
	 */
	@Transactional(readOnly = false)
	public void update(PurchaseSFDetail purchaseSFDetail){
		purchaseSFDetail.setUpdateDate(new Date());
		purchaseSFDetailDao.update(purchaseSFDetail);
	}
	
	
	public PurchaseSFDetail get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseSFDetail> findList(PurchaseSFDetail PurchaseSFDetail) {
		return super.findList(PurchaseSFDetail);
	}
	
	public Page<PurchaseSFDetail> findPage(Page<PurchaseSFDetail> page, PurchaseSFDetail PurchaseSFDetail) {
		return super.findPage(page, PurchaseSFDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseSFDetail PurchaseSFDetail) {
		super.save(PurchaseSFDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseSFDetail PurchaseSFDetail) {
		super.delete(PurchaseSFDetail);
	}
	
}