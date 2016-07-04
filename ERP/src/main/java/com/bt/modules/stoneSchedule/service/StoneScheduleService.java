/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.stoneSchedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;

/**
 * 石材进度跟进Service
 * @author xiaocai
 * @version 2015-12-2
 */
@Service
@Transactional(readOnly = true)
public class StoneScheduleService{

	@Autowired
	private OrderBomBaseService orderBomBaseService;	//下料单
	@Autowired
	private ProductionService productionService;		//加工单
	/**
	 * 以项目为基础分组统计全部的下料单的箱数据
	 * @param projectName
	 * @return
	 */
	public Map<String,Object> getListForProject(String projectName){
		Project project = new Project();
		project.setName(projectName);
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setProject(project);
		
		List<OrderBomBase> listOBB = orderBomBaseService.getListForStoneSchedule(orderBomBase);
		//循环获取汇总数据
		for(OrderBomBase obb:listOBB){
			Production p = new Production();
			p.setProject(obb.getProject());
			p.setSub(obb.getSub());
			p.setStatus("");
//			obb.getExtraData().put("countOrderBase", productionService.countOrderBase(p));				//设计下料总量
			obb.getExtraData().put("waitIntakeCount", productionService.waitIntakeCount(p));			//待入库量
			obb.getExtraData().put("hasIntakeCount", productionService.hasIntakeCount(p));				//已入库量
			obb.getExtraData().put("waitSendCount", productionService.waitSendCount(p));				//待发货量
			obb.getExtraData().put("waitCarCount", productionService.waitCarCount(p));					//待派车量
			obb.getExtraData().put("hasCarWaitSendCount", productionService.hasCarWaitSendCount(p));	//已派车未发量
			obb.getExtraData().put("sendCount", productionService.sendCount(p));						//在途箱数
			obb.getExtraData().put("receiveCount", productionService.receiveCount(p));						//已收箱数
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listOBB", listOBB);
		return map;
	}
	
	/**
	 * 为楼栋获取石材进度跟进数据
	 * @param production
	 * @return
	 */
	public Map<String,Object> getListForStoneScheduleToSub(String projectName,String building){
		Production production = new Production();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		
		production.setGlfpGB("sendNotice");
		production.setProject(project);
		production.setSub(sub);
		
		List<Production> listProduction = productionService.getListForStoneScheduleToSub(production);
		for(Production p:listProduction){	//循环填充界面需要的数据
			p.setStatus("");
			p.getExtraData().put("countOrderBase", productionService.countOrderBase(p));				//设计下料总量
			p.getExtraData().put("waitIntakeCount", productionService.waitIntakeCount(p));			//待入库量
			p.getExtraData().put("hasIntakeCount", productionService.hasIntakeCount(p));				//已入库量
			p.getExtraData().put("waitSendCount", productionService.waitSendCount(p));				//待发货量
			p.getExtraData().put("waitCarCount", productionService.waitCarCount(p));					//待派车量
			p.getExtraData().put("hasCarWaitSendCount", productionService.hasCarWaitSendCount(p));	//已派车未发量
			p.getExtraData().put("sendCount", productionService.sendCount(p));						//在途箱数
			p.getExtraData().put("receiveCount", productionService.receiveCount(p));						//在途箱数
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listProduction", listProduction);
		return map;
	}
}