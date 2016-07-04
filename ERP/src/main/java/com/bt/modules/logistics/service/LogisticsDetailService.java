/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.finance.service.ManufSettlementService;
import com.bt.modules.logistics.entity.LogisticsDetail;
import com.bt.modules.logistics.dao.LogisticsDetailDao;
import com.bt.modules.production.dao.ProductionDao;
import com.bt.modules.utils.CommonConstant;

/**
 * 发货清单Service
 * @author yhh
 * @version 2015-11-05
 */
@Service
@Transactional(readOnly = true)
public class LogisticsDetailService extends CrudService<LogisticsDetailDao, LogisticsDetail> {

	@Autowired
	private LogisticsDetailDao logisticsDetailDao;
	
	@Autowired
	private ProductionDao productionDao;
	
	@Autowired
	private ManufSettlementService manufSettlementService;
	
	public LogisticsDetail get(String id) {
		return super.get(id);
	}
	
	public List<LogisticsDetail> findList(LogisticsDetail logisticsDetail) {
		return super.findList(logisticsDetail);
	}
	
	public Page<LogisticsDetail> findPage(Page<LogisticsDetail> page, LogisticsDetail logisticsDetail) {
		return super.findPage(page, logisticsDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(LogisticsDetail logisticsDetail) {
		super.save(logisticsDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(LogisticsDetail logisticsDetail) {
		super.delete(logisticsDetail);
	}
	
	/**
	 * 由生产单id列表获取所有相关物料
	 * @param productionIds
	 * @return
	 */
	public List<LogisticsDetail> findLogisticsDetail(List<String> productionIds){
		List<LogisticsDetail> logisticsDetailList = new ArrayList<LogisticsDetail>();
		//遍历生产单,获取箱id列表
		for(String productionId : productionIds){
			if(StringUtils.isNotBlank(productionId)){
				String orderBomBoxId = productionDao.get(productionId).getOrderBomBox().getId();
				List<LogisticsDetail> logisticsDetails = logisticsDetailDao.findMaterialsByBoxId(orderBomBoxId);
				logisticsDetailList.addAll(logisticsDetails);
			}
		}
		return logisticsDetailList;
	}
	
	/**
	 * 发货物料组装结算类别
	 * @param list
	 * @return
	 */
	public List<LogisticsDetail> patchSettlementTypeForDetail(List<LogisticsDetail> list){
		//雕花件编号
		String dhjPrefix = "DHB";
		List<String> diaohuaj = manufSettlementService.getMaterialNoByType(dhjPrefix);
			
		//葫芦瓶
		String hlpPrefix = "HLP";
		//花盆
		String hpPrefix = "HP";
		for(LogisticsDetail detail : list){
			String materialNo = detail.getMaterialNo();
			String orderBomType = detail.getOrderType();
			int type = Integer.valueOf(orderBomType);
			//下料单类型  2-平板下料单 3-门窗套线下料单 4-腰线下料单 5-造型板下料单 
			//	6-圆柱下料单 7-雕花下料单8-弧形板下料单9-屋檐板下料单10-窗侧板下料单
			switch(type){
				case 2: case 9: case 10:
					detail.setSettlementType(CommonConstant.SettlementType_pb);
					break;
				case 3:
					detail.setSettlementType(CommonConstant.SettlementType_mctx);
					break;
				case 4:
					detail.setSettlementType(CommonConstant.SettlementType_yx);
					break;
				case 5: case 8:
					detail.setSettlementType(CommonConstant.SettlementType_zxb);
					break;
				case 7:
					String shortMaterialNo = "";
					for (String no : diaohuaj) {
						if (materialNo.contains(no)) {
							shortMaterialNo = no;
							break;
						}
					}
					if(diaohuaj.contains(shortMaterialNo)){
						detail.setSettlementType(CommonConstant.SettlementType_dhj);
					}else{
						detail.setSettlementType(CommonConstant.SettlementType_dh);
					}
					break;
				case 6:
					if(materialNo.startsWith(hlpPrefix)){
						detail.setSettlementType(CommonConstant.SettlementType_hlp);
					}
					else if( materialNo.startsWith(hpPrefix)){
						detail.setSettlementType(CommonConstant.SettlementType_hp);
					}
					else{
						detail.setSettlementType(CommonConstant.SettlementType_yz);
					}
					break;
				default:
					detail.setSettlementType("待定");
					break;
			}
		}
		
		return list;
	}
	
	
	/**
	 * 批量保存发货物料
	 * @param logisticSendId
	 * @param logisticsDetailList
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<LogisticsDetail> logisticsDetailList){
		//遍历发货列表,添加发货通知单id
		for(LogisticsDetail logisticsDetail : logisticsDetailList){
			save(logisticsDetail);
		}
	}
}