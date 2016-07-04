/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.contract.entity.PurchasingContractDetail;
import com.bt.modules.contract.dao.PurchasingContractBaseDao;
import com.bt.modules.contract.dao.PurchasingContractDetailDao;

/**
 * purchasingService
 * @author yhh
 * @version 2015-08-11
 */
@Service
@Transactional(readOnly = true)
public class PurchasingContractDetailService extends CrudService<PurchasingContractDetailDao, PurchasingContractDetail> {

	@Autowired
	private PurchasingContractDetailDao purchasingContractDetailDao;
	@Autowired
	private PurchasingContractBaseDao purchasingContractBaseDao;
	
	public PurchasingContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<PurchasingContractDetail> findList(PurchasingContractDetail purchasingContractDetail) {
		return super.findList(purchasingContractDetail);
	}
	
	public Page<PurchasingContractDetail> findPage(Page<PurchasingContractDetail> page, PurchasingContractDetail purchasingContractDetail) {
		return super.findPage(page, purchasingContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchasingContractDetail purchasingContractDetail) {
		purchasingContractDetail.setIsNewRecord(true);
		super.save(purchasingContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(PurchasingContractDetail purchasingContractDetail) {
		purchasingContractDetail.setIsNewRecord(false);
		super.save(purchasingContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchasingContractDetail purchasingContractDetail) {
		super.delete(purchasingContractDetail);
	}
	/**
	 * 根据合同编号获取相关的详情数据
	 * @param purchasingContractId
	 * @return
	 */
	public List<PurchasingContractDetail> getListByPurchasingContractId(String purchasingContractId){
		if(StringUtils.isBlank(purchasingContractId)){
			return new ArrayList<PurchasingContractDetail>();
		}
		PurchasingContractBase purchasingContractBase = purchasingContractBaseDao.get(purchasingContractId);
		if(purchasingContractBase==null||StringUtils.isBlank(purchasingContractBase.getPartyBName())){
			return new ArrayList<PurchasingContractDetail>();
		}
		PurchasingContractDetail purchasingContractDetail = new PurchasingContractDetail();
		purchasingContractDetail.setPurchasingContractBase(purchasingContractBase);
		List<PurchasingContractDetail> listPCD = this.getListByCondition(purchasingContractDetail);
		return listPCD;
	}
	/**
	 * 根据合同名称加载相关的合同相应项
	 * @param purchasingContractName
	 * @return
	 */
	public List<PurchasingContractDetail> getListByPurchasingContractName(String purchasingContractName,String isprovince){
		if(StringUtils.isBlank(purchasingContractName)){
			return new ArrayList<PurchasingContractDetail>();
		}
		PurchasingContractBase purchasingContractBase = new PurchasingContractBase(); 
		purchasingContractBase.setPartyBName(purchasingContractName);
		PurchasingContractDetail purchasingContractDetail = new PurchasingContractDetail();
		purchasingContractDetail.setPurchasingContractBase(purchasingContractBase);
		purchasingContractDetail.setIsInProvince(isprovince);
		List<PurchasingContractDetail> listPCD = this.getListByCondition(purchasingContractDetail);
		return listPCD;
	}
	/**
	 * 根据条件加载相关的合同详情数据
	 * @param purchasingContractDetail
	 * @return
	 */
	public List<PurchasingContractDetail> getListByCondition(PurchasingContractDetail purchasingContractDetail){
		List<PurchasingContractDetail> listPCD = purchasingContractDetailDao.getListByCondition(purchasingContractDetail);
		if(listPCD==null){
			listPCD = new ArrayList<PurchasingContractDetail>();
		}
		return listPCD;
	}
	
}