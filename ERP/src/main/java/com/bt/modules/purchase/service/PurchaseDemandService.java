/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.purchase.dao.PurchaseDemandDao;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 采购需求Service
 * @author xiaocai
 * @version 2015-08-07
 */
@Service(PurchaseDemandService.BEAN_NAME)
@Transactional(readOnly = true)
public class PurchaseDemandService extends CrudService<PurchaseDemandDao, PurchaseDemand> implements ProcessDataHandler {

	public static final String BEAN_NAME = "com.bt.modules.purchase.service.PurchaseDemandService";
	
	@Autowired
	private PurchaseDemandDao purchaseDemandDao;
	@Autowired
	private PurchaseDemandAssignService purchaseDemandAssignService;	//指派需求数量记录
	
//	public Page<PurchaseDemand> findPage(Page<PurchaseDemand> page, PurchaseDemand purchaseDemand) {
//		//请求获取数据
//		purchaseDemand.setisSeriesNumber(false);
//		page = super.findPage(page, purchaseDemand);
//		//获取部分数据进行处理
//		List<PurchaseDemand> listPD = page.getList();
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("status", null);
//		for(PurchaseDemand pd:listPD){
//			map.put("pdid", pd.getId());
//			map.put("mtype", pd.getMtype());
//			int sum = purchaseDemandDao.sumTotal(map);
//			pd.setSumCount(sum);
//		}
//		
//		//将处理完成的数据重新放回去
//		page.setList(listPD);
////		return super.findPage(page, purchaseDemand);
//		return page;
//	}
	
	/**
	 * 根据已有的采购需求显示相关的项目列表数据
	 * 2015年11月2日
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<PurchaseDemand> getListForProject(Page<PurchaseDemand> page, PurchaseDemand entity) {
		entity.setPage(page);
		List<PurchaseDemand> listPD = this.getListForProject(entity);
		//实行对数据的统计
		page.setList(listPD);
		return page;
	}
	/**
	 * 返回全部列表数据
	 * @param entity
	 * @return
	 */
	public List<PurchaseDemand> getDetailListByObbID(PurchaseDemand entity) {
		return this.getListForProject(entity);
	}
	
	/**
	 * 根据实体对象条件获取相应的列表数据
	 * @param entity
	 * @return
	 */
	public List<PurchaseDemand> getListForProject(PurchaseDemand entity){
		List<PurchaseDemand> listPD = purchaseDemandDao.getListForProject(entity);
		if(listPD==null){
			listPD = new ArrayList<PurchaseDemand>();
		}
		//对数据进行状态处理
		listPD = this.getObbStatusByList(listPD, entity.getIsStatus());
		return listPD;
	}
	
	/**
	 * 根据实体对象条件获取相应的列表数据
	 * @param entity
	 * @return
	 */
	public List<PurchaseDemand> getListForDatatrack(PurchaseDemand entity){
		List<PurchaseDemand> listPD = purchaseDemandDao.getListForDatatrack(entity);
		if(listPD==null){
			listPD = new ArrayList<PurchaseDemand>();
		}
		//对数据进行状态处理
		listPD = this.getObbStatusByList(listPD, entity.getIsStatus());
		return listPD;
	}
	/**
	 * 根据ids修改要求到货时间
	 * @param ids
	 * @param expectDate
	 */
	@Transactional(readOnly = false)
	public void updateExpectDateByPDIds(List<String> ids,String expectDate){
		if(ids.size()==0||StringUtils.isBlank(expectDate)){
			return;
		}
		
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		
//		purchaseDemand.setSub(sub);
//		purchaseDemand.setOrderBomBase(orderBomBase);
		purchaseDemand.setGlfpGB("obbase");
		purchaseDemand.setIds(ids);
		List<PurchaseDemand> listPD = this.getListForProject(purchaseDemand);
		Subproject sub;
//		sub.setSkeletonExpectDate(expectDate);
		for(PurchaseDemand pd:listPD){
			sub = new Subproject();
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(pd.getOrderBomBase().getUniformMaterielType())){
				sub.setPendantExpectDate(expectDate);
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(pd.getOrderBomBase().getUniformMaterielType())){
				sub.setSkeletonExpectDate(expectDate);
			}
			pd.setSub(sub);
			purchaseDemandDao.updateExpectDateByIds(pd);
		}
		
	}
	/**
	 * 运营查看列表数据
	 * @param page
	 * @param entity
	 * @return
	 */
	public Page<PurchaseDemand> getListForProjectToYY(Page<PurchaseDemand> page, PurchaseDemand entity,String searchStatus) {
		entity.setPage(page);
		List<PurchaseDemand> listPD = this.getListForProject(entity);
		//对数据进行状态筛选
		listPD = this.getListBySearchStatus(listPD,entity.getIsStatus(), searchStatus);
		page.setList(listPD);
		return page;
	}
	/**
	 * 根据下料单获取全部的需求单
	 * @param obbIDs
	 * @return
	 */
	public List<PurchaseDemand> getListByObbIds(List<String> obbIDs) {
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setIds(obbIDs);
		PurchaseDemand p = new PurchaseDemand();
		p.setGlfpGB("obdetail");	//一个详情对应一个采购单
		p.setOrderBomBase(orderBomBase);
		List<PurchaseDemand> listPD = purchaseDemandDao.getListForProject(p);
		return listPD;
	}
	/**
	 * 根据下料单获取需求单
	 * @param obbIDs
	 * @param status
	 * @return
	 */
	public List<PurchaseDemand> getListByObbIdsAndStatus(List<String> obbIDs,String status) {
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setIds(obbIDs);
		PurchaseDemand p = new PurchaseDemand();
		p.setGlfpGB("obdetail");	//一个详情对应一个采购单
		p.setOrderBomBase(orderBomBase);
		p.setStatus(status);
		List<PurchaseDemand> listPD = purchaseDemandDao.getListForProject(p);
		return listPD;
	}
	/**
	 * 将listPD中的id填充到ids中
	 * @param ids
	 * @param listPD
	 * @return
	 */
	public List<String> purchaseDemandIdsParseIds(List<String> ids,List<PurchaseDemand> listPD) {
		for(PurchaseDemand pd:listPD){	//组装对应的下料单详情数据的ids
			if(!ids.contains(pd.getId())){
				ids.add(pd.getId());
			}
		}
		return ids;
	}
	/**
	 * 获取相应的数据进行判断数据的当前状态
	 * @param listPD
	 */
	public List<PurchaseDemand> getObbStatusByList(List<PurchaseDemand> listPD,String status){
		if(StringUtils.isBlank(status)){
			return listPD;
		}
		List<String> ids = new ArrayList<String>();
		for(PurchaseDemand pd:listPD){
			ids.add(pd.getOrderBomBase().getId());
		}
		if(CommonStatus.PURCHASE_DZP_YYZY.equals(status)){	//运营专员
			//获取下单总量的值
			Map<String,Integer> mapObbCount = this.getObbCount(ids);
//			Map<String,Integer> mapAssignCount = this.getAssignCount(ids,status);
			Map<String,Integer> mapAssignsCount = this.getAssignsCount(ids,status);
			listPD = this.yyStatusLabUtils(listPD, mapObbCount, mapAssignsCount);
		}else if(CommonStatus.PURCHASE_DZP_YYZG.equals(status)){
			for(PurchaseDemand pd:listPD){
				if(this.yyzgStatusFlag(pd.getOrderBomBase().getId())){
					pd.getOrderBomBase().setStatus(CommonStatus.Order_BOM_BASE_STATUS_LAB_DZP);
				}else{
					pd.getOrderBomBase().setStatus(CommonStatus.Order_BOM_BASE_STATUS_LAB_ZPWC);
				}
			}
		}
		return listPD;
	}
	/**
	 * 判断是否存在待驳回数据
	 * @param obbID
	 * @return
	 */
	public boolean yyzgStatusFlag(String obbID){
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
		List<PurchaseDemand> pds = this.getListForProject( purchaseDemand);
		//需显示列表数据
		List<String> ids = new ArrayList<String>();
		for(PurchaseDemand p:pds){	//组装对应的ids
			ids.add(p.getId());
		}
		Map<String,Integer> mapRC = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_YYZG);	//可驳回的数量
		for(String key:mapRC.keySet()){
			if(mapRC.get(key)>0){
				return true;
			}
		}
		return false;
	}
	/**
	 * 根据搜索状态获取筛选数据
	 * @param listPD
	 * @param searchStatus
	 * @return
	 */
	public List<PurchaseDemand> getListBySearchStatus(List<PurchaseDemand> listPD,String status,String searchStatus){
		if(StringUtils.isBlank(searchStatus)){
			return listPD;
		}
		List<PurchaseDemand> listPDs = new ArrayList<PurchaseDemand>();
		Map<String,PurchaseDemand> mapP = new HashMap<String, PurchaseDemand>();
		for(PurchaseDemand pd:listPD){
			String proID = pd.getProject().getId();
			Project project = new Project();
			project.setId(proID);
			PurchaseDemand purchaseDemand = new PurchaseDemand();
			purchaseDemand.setGlfpGB("obbase");
			purchaseDemand.setProject(project);
			purchaseDemand.setIsStatus(status);
			List<PurchaseDemand> list = this.getListForProject(purchaseDemand);
			for(PurchaseDemand p:list){
				if(p.getOrderBomBase().getStatus().equals(searchStatus)){
//					listPDs.add(pd);
					mapP.put(p.getProject().getName(), p);
					break;
				}
			}
		}
		for(String key:mapP.keySet()){
			listPDs.add(mapP.get(key));
		}
		return listPDs;
	}
	/**
	 * 运营指派状态处理
	 * @param listPD	源数据
	 * @param mapObbCount	下单需求量
	 * @param mapAssignsCount	已指派量
	 */
	public List<PurchaseDemand> yyStatusLabUtils(List<PurchaseDemand> listPD,Map<String,Integer> mapObbCount,Map<String,Integer> mapAssignsCount){
		for(PurchaseDemand pd:listPD){
			String key = pd.getOrderBomBase().getId();
			//判断下单总数量是否等于指派总数量
			if(mapObbCount.containsKey(key)&&mapAssignsCount.containsKey(key)&&
					mapObbCount.get(key).intValue()<=mapAssignsCount.get(key).intValue()){	
				pd.getOrderBomBase().setStatus(CommonStatus.Order_BOM_BASE_STATUS_LAB_ZPWC);
			}else{
				pd.getOrderBomBase().setStatus(CommonStatus.Order_BOM_BASE_STATUS_LAB_DZP);
			}
		}
		return listPD;
	}
	/**
	 * 循环将统计值处理
	 * @param obbIDs
	 * @return Map<String,Object> key-obbaseID	value-count
	 */
	public Map<String,Integer> getObbCount(List<String> obbIDs){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids", obbIDs);
		map.put("DEL_FLAG_NORMAL", PurchaseDemand.DEL_FLAG_NORMAL);
		List<Map<String,Object>> listMap = purchaseDemandDao.getObbCount(map);
		Map<String,Integer> maps = new HashMap<String, Integer>();
		for(Map<String,Object> m:listMap){	//循环处理相应值
			if(m.containsKey("obbaseID")){
				maps.put(m.get("obbaseID")+"", Integer.parseInt(m.get("count")+""));
			}
		}
		return maps;
	}
	/**
	 * 2015-12-10
	 * 根据条件获取指派数据（含状态）总量
	 * @param obbIDs
	 * @param status
	 * @return
	 */
	public Map<String,Integer> getAssignCount(List<String> obbIDs,String status){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids", obbIDs);
		map.put("status", status);
		map.put("DEL_FLAG_NORMAL", PurchaseDemand.DEL_FLAG_NORMAL);
		List<Map<String,Object>> listMap = purchaseDemandDao.getAssignCount(map);
		Map<String,Integer> maps = new HashMap<String, Integer>();
		for(Map<String,Object> m:listMap){	//循环处理相应值
			if(m.containsKey("obbaseID")){
				maps.put(m.get("obbaseID")+"", Integer.parseInt(m.get("count")+""));
			}
		}
		return maps;
	}
	/**
	 * 数据已流转到后面步骤的数据
	 * @param obbIDs
	 * @param status
	 * @return
	 */
	public Map<String,Integer> getAssignsCount(List<String> obbIDs,String status){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("ids", obbIDs);
//		map.put("gtVal", status);
		map.put("gtEqVal", status);
		map.put("DEL_FLAG_NORMAL", PurchaseDemand.DEL_FLAG_NORMAL);
		List<Map<String,Object>> listMap = purchaseDemandDao.getAssignCount(map);
		map.clear();
		Map<String,Integer> maps = new HashMap<String, Integer>();
		for(Map<String,Object> m:listMap){	//循环处理相应值
			if(m.containsKey("obbaseID")){
				maps.put(m.get("obbaseID")+"", Integer.parseInt(m.get("count")+""));
			}
		}
		return maps;
	}
	/**
	 * end 1
	 * 2015年11月9日
	 */
	
	
	
	/**
	 * 批量插入采购申请数据
	 * @param listPD
	 */
	@Transactional(readOnly = false)
	public void batchPurchaseDemand(List<PurchaseDemand> listPD){
		for(PurchaseDemand pd:listPD){
			purchaseDemandDao.insert(pd);
		}
	}
	
	@Transactional(readOnly = false)
	public void batchSaveApplyPurchase(List<PurchaseDemand> listPD,String seriesnumber){
		//删除编号对应的数据再进行新增
		purchaseDemandDao.delBySeriesnumber(seriesnumber);
		//循环插入数据
		for(PurchaseDemand pd:listPD){
			purchaseDemandDao.insert(pd);
		}
	}
	/**
	 * 
	 * @param date
	 * @return
	 */
	public int getToDaysCount(Date date){
		if(date==null){
			date = new Date();
		}
		return purchaseDemandDao.getToDaysCount(date);
	}
	/**
	 * 
	 * @param ids
	 * @return
	 */
	public List<PurchaseDemand> getByIDs(List<String> ids) {
		//不传送ID则直接返回空集合
		if(ids==null||ids.size()==0){
			return new ArrayList<PurchaseDemand>();
		}
		List<PurchaseDemand> list = purchaseDemandDao.getByIDs(ids);
		if(list==null){
			list = new ArrayList<PurchaseDemand>();
		}
		return list;
	}
	/**
	 * 简单修改数据
	 * @param purchaseDemand
	 */
	@Transactional(readOnly = false)
	public void update(PurchaseDemand purchaseDemand) {
		purchaseDemandDao.update(purchaseDemand);
	}
	/**
	 * 批量修改数据（如：指派时）
	 * @param listPD
	 */
	@Transactional(readOnly = false)
	public void batchUpdate(List<PurchaseDemand> listPD){
		for(PurchaseDemand pd:listPD){
			purchaseDemandDao.update(pd);
		}
	}
	/**
	 * 插入单条数据
	 * @param purchaseDemand
	 */
	@Transactional(readOnly = false)
	public void insert(PurchaseDemand purchaseDemand) {
		purchaseDemandDao.insert(purchaseDemand);
	}
	/**
	 * 根据申购编号获取相应的列表数据
	 * @param seriesnumber 申购编号
	 * @return
	 */
	public List<PurchaseDemand> getBySeriesNumber(String seriesnumber){
		if(StringUtils.isBlank(seriesnumber)){
			return new ArrayList<PurchaseDemand>();
		}
		List<PurchaseDemand> list = purchaseDemandDao.getBySeriesNumber(seriesnumber);
		if(list==null){
			list = new ArrayList<PurchaseDemand>();
		}
		return list;
	}
	
	public Page<PurchaseDemand> findPage(Page<PurchaseDemand> page, PurchaseDemand purchaseDemand) {
		//请求获取数据
//		purchaseDemand.setisSeriesNumber(false);
		purchaseDemand.setGlfpGB("seriesnumber");
		page = super.findPage(page, purchaseDemand);
		//获取部分数据进行处理
		List<PurchaseDemand> listPD = page.getList();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", null);
		for(PurchaseDemand pd:listPD){
			map.put("pdid", pd.getId());
			map.put("mtype", pd.getMtype());
			int sum = purchaseDemandDao.sumTotal(map);
			pd.setSumCount(sum);
		}
		
		//将处理完成的数据重新放回去
		page.setList(listPD);
//		return super.findPage(page, purchaseDemand);
		return page;
	}
	
	public Page<PurchaseDemand> applyHCList(Page<PurchaseDemand> page, PurchaseDemand purchaseDemand) {
		//请求获取数据
//		purchaseDemand.setisSeriesNumber(true);
		purchaseDemand.setGlfpGB("seriesnumber");
		page = super.findPage(page, purchaseDemand);
		//获取部分数据进行处理
		List<PurchaseDemand> listPD = page.getList();
		
		//将处理完成的数据重新放回去
		page.setList(listPD);
		return page;
	}
	
	
	
	public PurchaseDemand get(String id) {
		return super.get(id);
	}
	
	public List<PurchaseDemand> findList(PurchaseDemand purchaseDemand) {
		return super.findList(purchaseDemand);
	}
	
	
	@Transactional(readOnly = false)
	public void save(PurchaseDemand purchaseDemand) {
		super.save(purchaseDemand);
	}
	
	@Transactional(readOnly = false)
	public void delete(PurchaseDemand purchaseDemand) {
		super.delete(purchaseDemand);
	}
	
	/**
	 * 流程执行完成进行回调此函数进行数据的相关修改
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		List<String> listIDs = (List<String>) variables.get(ActivitiConstants.PRIMARY_KEY);
		List<PurchaseDemand> listPD = new ArrayList<PurchaseDemand>();
		for(String id:listIDs){
			PurchaseDemand pd = new PurchaseDemand();
			pd.setId(id);
			pd.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
			pd.setStatus(CommonStatus.PURCHASE_DZP_YYZY);
			
			listPD.add(pd);
		}
		this.batchUpdate(listPD);
	}
	
}