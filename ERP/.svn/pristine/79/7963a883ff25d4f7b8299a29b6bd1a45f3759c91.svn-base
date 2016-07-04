/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.modules.contract.service.LaborDemandService;
import com.bt.modules.inventory.entity.Inventory;
import com.bt.modules.inventory.service.DepotService;
import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.inventory.service.StandingBookDetailService;
import com.bt.modules.inventory.service.StandingBookService;
import com.bt.modules.material.service.MaterialService;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonConstant;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 库存统计
 * 筛选条件优化 Controller
 * @author xiaocai
 */
@Controller
@RequestMapping(value = "${adminPath}/inventory/statistic")
public class StatisticController extends BaseController {

	@Autowired
	private InventoryService inventoryService;	//库存
	@Autowired
	private MaterialService materialService;	//基础物料
	@Autowired
	private OrderBomBoxService orderBomBoxService;	//箱
	@Autowired
	private OrderBomBaseService orderBomBaseService;	//下料单
	@Autowired
	private OrderBomDetailService orderBomDetailService;	//下料单详情
	@Autowired
	private DepotService depotService;			//仓库
	@Autowired
	private StandingBookService standingBookService;	//库存操作记录
	@Autowired
	private StandingBookDetailService standingBookDetailService;	//库存操作mi
	@Autowired
	private LaborDemandService laborDemandService;	//劳务合同
	@Autowired
	private SubProjectService subProjectService;	//二级项目信息
	@Autowired
	private ProjectService projectService;	//一级项目信息
	
	/**
	 * 根据一级项目名称获取对应的户型
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getHouseTypeByProjectName"})
	@ResponseBody
	public Map<String,Object> getHouseTypeByProjectName(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = inventoryService.getInvDataByConditionHouseTypeUtils();
		Project project = new Project();
		project.setName(projectName);
		inv.setProject(project);
		//获取相应的列表数据	
		List<Inventory> listOut = inventoryService.getInvDataByConditionAndImt(inv,imt);	
		List<Subproject> listIn = subProjectService.getSubHouseTypeByProjectName(projectName);			
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listOut", listOut);	//出库户型
		map.put("listIn", listIn);		//用到户型
		return map;
	}
	/**
	 * 根据户型获取相应的楼栋号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getBuildingByHouseType"})
	@ResponseBody
	public Map<String,Object> getBuildingByHouseType(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = inventoryService.getInvDataByConditionBuildingUtils();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		
		inv.setProject(project);
		inv.setSub(sub);
		//获取相应的列表数据	
		List<Inventory> listOut = inventoryService.getInvDataByConditionAndImt(inv,imt);	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listOut", listOut);	
		return map;
	}
	/**
	 * 根据楼栋带出相应的数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDataByBuilding"})
	@ResponseBody
	public Map<String,Object> getDataByBuilding(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = inventoryService.getInvDataByConditionInvUtils();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		sub.setBuilding(building);
		
		inv.setProject(project);
		inv.setSub(sub);
		//获取相应的列表数据	
		List<Inventory> listData = inventoryService.getStatisticList(inv,imt);	
		List<Inventory> listOut = null;
		if(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL.equals(imt)){
			listOut = inventoryService.groupByMaterialName(listData);
		}else if(CommonConstant.INVENTORY_MATERIAL_TYPE_SC.equals(imt)){
			listOut = inventoryService.groupByObbaseOrderType(listData);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listData);
		map.put("listOut", listOut);
		return map;
	}
}