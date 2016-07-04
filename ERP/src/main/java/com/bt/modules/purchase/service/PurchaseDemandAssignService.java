/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.purchase.dao.PurchaseDemandAssignDao;
import com.bt.modules.purchase.entity.PurchaseDemandAssign;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.DateUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 运营指派采购需求量Service
 * @author xiaocai
 * @version 2015-11-05
 */
@Service
@Transactional(readOnly = true)
public class PurchaseDemandAssignService extends CrudService<PurchaseDemandAssignDao, PurchaseDemandAssign> {

	@Autowired
	private PurchaseDemandAssignDao purchaseDemandAssignDao;
	
	@Transactional(readOnly = false)
	public void insert(PurchaseDemandAssign purchaseDemandAssign) {
		purchaseDemandAssignDao.insert(purchaseDemandAssign);
	}
	
	@Transactional(readOnly = false)
	public void batchInsert(List<PurchaseDemandAssign> listPDA) {
		for(PurchaseDemandAssign pda:listPDA){
			pda.setCreateDate(new Date());
			pda.setCreateBy(UserUtils.getUser());
			purchaseDemandAssignDao.insert(pda);
		}
		
	}
	/**
	 * 根据相应的条件查询对应的列表数据
	 * @param ids
	 * @return
	 */
	public List<PurchaseDemandAssign> getListByIDsAndStatus(List<String> ids,String status) {
		PurchaseDemandAssign purchaseDemandAssign = new PurchaseDemandAssign();
		if(CommonStatus.PURCHASE_DZP_CGZG.equals(status)){
			purchaseDemandAssign.setGtEqVal(status);
		}else{
			purchaseDemandAssign.setStatus(status);
		}
		purchaseDemandAssign.setDemandIDs(ids);
		purchaseDemandAssign.setGbStr("purchaseDemandId");
		List<PurchaseDemandAssign> listPDA = this.getListByCondition(purchaseDemandAssign);
		return listPDA;
	}
	/**
	 * 根据条件进行数据查询
	 * @param purchaseDemandAssign
	 * @return
	 */
	public List<PurchaseDemandAssign> getListByCondition(PurchaseDemandAssign purchaseDemandAssign) {
		List<PurchaseDemandAssign> listPDA = purchaseDemandAssignDao.getListByCondition(purchaseDemandAssign);
		if(listPDA==null){
			listPDA = new ArrayList<PurchaseDemandAssign>();
		}
		return listPDA;
	}
	/**
	 * 根据 采购需求id 获取对应的指派记录条数
	 * 用来统计指派次数
	 * 所以被驳回的也需要记录
	 * @param ids	采购需求id
	 * @return	Map<String,Integer>
	 */
	public Map<String,Integer> getIdCount(List<String> ids) {
		List<PurchaseDemandAssign> listPDA = this.getListByIDsAndStatus(ids,CommonStatus.PURCHASE_ASSIGN_BH);	//从service中获取对应的数据
		Map<String,Integer> mapIdCount = new HashMap<String,Integer>();
		for(PurchaseDemandAssign pda:listPDA){	//循环将list转换成map
			mapIdCount.put(pda.getPurchaseDemandId(), pda.getIdCount());
		}
		Map<String,Integer> mapSC = new HashMap<String,Integer>();	//定义返回数据
		for(String key:ids){	//填充每个需求的指派总量
			if(mapIdCount.containsKey(key)){	//数据统计量
				mapSC.put(key, mapIdCount.get(key));
			}else{	//数据库中没有指派记录为0
				mapSC.put(key, 0);
			}
		}
		return mapSC;
	}
	/**
	 * 根据 采购需求id 获取对应的指派总数量
	 * 没有指派记录的数量为0
	 * @param ids
	 * @return
	 */
	public Map<String,Integer> getAlreadySumCount(List<String> ids,String status) {
		Map<String,Integer> mapSC = new HashMap<String,Integer>();	//定义返回数据
		List<PurchaseDemandAssign> listPDA = this.getListByIDsAndStatus(ids,status);	//从service中获取对应的数据
		Map<String,Integer> mapSumCount = new HashMap<String,Integer>();
		for(PurchaseDemandAssign pda:listPDA){	//循环将list转换成map
			mapSumCount.put(pda.getPurchaseDemandId(), pda.getSumCount());
		}
		for(String key:ids){	//填充每个需求的指派总量
			if(mapSumCount.containsKey(key)){	//数据统计量
				mapSC.put(key, mapSumCount.get(key));
			}else{	//数据库中没有记录为0
				mapSC.put(key, 0);
			}
		}
		return mapSC;
	}
	/**
	 * 获取对应ids的指派记录
	 * @param demandIDs
	 * @return
	 */
	public Map<String,String> getAssignLog(List<String> demandIDs){
		PurchaseDemandAssign purchaseDemandAssign = new PurchaseDemandAssign();
		purchaseDemandAssign.setDemandIDs(demandIDs);
		purchaseDemandAssign.setGbStr("id");
		purchaseDemandAssign.setStatus("-1");
		List<PurchaseDemandAssign> listPDA = this.getListByCondition(purchaseDemandAssign);
		Map<String,String> map = new HashMap<String, String>();
		for(String id:demandIDs){
			map.put(id, "");
		}
		String key = "";
		String log = "";
		String changeStr="";
		for(PurchaseDemandAssign pda:listPDA){
			if(StringUtils.isNotBlank(pda.getStatus())){
				changeStr = Integer.parseInt(pda.getStatus())>0?"提交":"驳回";
			}
			key = pda.getPurchaseDemandId();
			log = "日期："+DateUtils.getDateStrByPattern(pda.getRequireDate(), "yyyy-MM-dd")+";数量"+pda.getCount()+"<br/>";
			log += changeStr+"意见："+pda.getRemarks()+"<br/>";
			map.put(key, map.get(key)+log);
		}
		return map;
	}
//	/**
//	 * 数据驳回记录
//	 * @param demandIDs
//	 * @return
//	 */
//	public Map<String,String> getRebutLog(List<String> demandIDs){
//		PurchaseDemandAssign purchaseDemandAssign = new PurchaseDemandAssign();
//		purchaseDemandAssign.setDemandIDs(demandIDs);
//		purchaseDemandAssign.setGbStr("updateDate");
//		List<PurchaseDemandAssign> listPDA = this.getListByCondition(purchaseDemandAssign);
//		Map<String,String> map = new HashMap<String, String>();
//		for(String id:demandIDs){
//			map.put(id, "");
//		}
//		String key = "";
//		String log = "";
//		for(PurchaseDemandAssign pda:listPDA){
//			key = pda.getPurchaseDemandId();
//			log = "日期："+DateUtils.getDateStrByPattern(pda.getUpdateDate(), "yyyy-MM-dd")+";数量"+pda.getCount()+"<br/>";
//			log+="意见："+pda.getRemarks()+"<br/>";
//			map.put(key, map.get(key)+log);
//		}
//		return map;
//	}
	/**
	 * 修改数据状态
	 * @param ids
	 * @param changeStatus
	 * @param originStatus
	 */
	@Transactional(readOnly = false)
	public void updateStatusByDemandIDs(List<String> ids,String changeStatus,String originStatus){
		if(ids==null||ids.size()==0){
			return;
		}
		PurchaseDemandAssign purchaseDemandAssign = new PurchaseDemandAssign();
		purchaseDemandAssign.setStatus(changeStatus);
		purchaseDemandAssign.setOriginStatus(originStatus);
		purchaseDemandAssign.setDemandIDs(ids);
		purchaseDemandAssignDao.updateStatusByDemandIDs(purchaseDemandAssign);
	}
	@Transactional(readOnly = false)
	public void updateSuggByDemandIDs(List<String> ids,String sugg,String changeStatus,String originStatus){
		if(ids==null||ids.size()==0){
			return;
		}
		PurchaseDemandAssign purchaseDemandAssign = new PurchaseDemandAssign();
		purchaseDemandAssign.setRemarks(sugg);
		purchaseDemandAssign.setStatus(changeStatus);
		purchaseDemandAssign.setOriginStatus(originStatus);
		purchaseDemandAssign.setDemandIDs(ids);
		purchaseDemandAssign.setAssignDate(new Date());	//指派时间，流向采购部的时间
		purchaseDemandAssign.setUpdateDate(new Date());
		purchaseDemandAssignDao.updateStatusByDemandIDs(purchaseDemandAssign);
	}
	
	public PurchaseDemandAssign get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseDemandAssign> findList(PurchaseDemandAssign purchaseDemandAssign) {
		return super.findList(purchaseDemandAssign);
	}
	
	public Page<PurchaseDemandAssign> findPage(Page<PurchaseDemandAssign> page, PurchaseDemandAssign purchaseDemandAssign) {
		return super.findPage(page, purchaseDemandAssign);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseDemandAssign purchaseDemandAssign) {
		super.save(purchaseDemandAssign);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseDemandAssign purchaseDemandAssign) {
		super.delete(purchaseDemandAssign);
	}
	
}