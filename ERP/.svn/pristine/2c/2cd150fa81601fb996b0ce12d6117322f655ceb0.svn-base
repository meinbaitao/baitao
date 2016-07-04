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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.modules.inventory.entity.Depot;
import com.bt.modules.inventory.entity.Inventory;
import com.bt.modules.inventory.entity.StandingBook;
import com.bt.modules.inventory.entity.StandingBookDetail;
import com.bt.modules.inventory.service.DepotService;
import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.inventory.service.StandingBookDetailService;
import com.bt.modules.inventory.service.StandingBookService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.utils.CommonConstant;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 库存台帐表Controller
 * @author xiaocai
 * @version 2016-1-13
 */
@Controller
@RequestMapping(value = "${adminPath}/inventory/standingBook")
public class StandingBookController extends BaseController {

	@Autowired
	private StandingBookService standingBookService;	//库存操作记录
	@Autowired
	private StandingBookDetailService standingBookDetailService;	//库存操作明细
	@Autowired
	private DepotService depotService;		//仓库
	@Autowired
	private InventoryService inventoryService;	//库存
	@Autowired
	private ProjectService projectService;					//一级项目
	
	/**
	 * 钢辅料台账统计
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"standingBookGFL"})
	public String standingBookGFL( HttpServletRequest request, HttpServletResponse response, Model model) {
		//根据当前用户的ID获取对应的仓库数据
		List<Depot> listDepot = depotService.getGFLListByUserID(UserUtils.getUser().getId());
		//仓库条件
		Inventory inv = new Inventory();
		if(listDepot.size()>0){
			Depot depot = listDepot.get(0);
			inv.setProject(depot.getProject());
			model.addAttribute("projectName", listDepot.get(0).getProject().getName());
//			inv.setSub(depot.getSub());
		}
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inv);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookGFLList(standingBookDetail);
		StandingBook standingBook = new StandingBook();
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		List<StandingBook> listSB = standingBookService.getGBSendee(standingBook);
		model.addAttribute("map", depotService.getProjectData(listDepot));
		model.addAttribute("listMaterialNames", inventoryService.groupByMaterialName(standingBookDetailService.getListInvByListDetail(listSBDetail)));
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("listSB", listSB);
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		model.addAttribute("materialName", "");
		model.addAttribute("sendee", "");
		return "modules/inventory/standingBookGFL";
	}
	/**
	 * 钢辅料台账记录查询
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"searchGFL"})
	public String searchGFL(HttpServletRequest request, HttpServletResponse response, Model model) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String materialName = request.getParameter("materialName");
		String sendee = request.getParameter("sendee");		//接收人（施工班组）
		
		
		//仓库条件
		Project project = new Project();
		project.setName(projectName); 
		Inventory inv = new Inventory();
		inv.setProject(project);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		sub.setHouseType(houseType);
		StandingBook standingBook = new StandingBook();
		standingBook.setSubIn(sub);
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setStandingBook(standingBook);
		standingBookDetail.setInventory(inv);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookGFLList(standingBookDetail);
		listSBDetail = standingBookDetailService.searchGFLListUtils(listSBDetail, materialName, sendee);
		standingBook = new StandingBook();
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		List<StandingBook> listSB = standingBookService.getGBSendee(standingBook);
		
		model.addAttribute("map", depotService.getOneProjectData(depotService.getGFLListByUserID(UserUtils.getUser().getId())));
		model.addAttribute("listMaterialNames", inventoryService.groupByMaterialName(standingBookDetailService.getListInvByListDetail(listSBDetail)));
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("listSB", listSB);
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		model.addAttribute("materialName", materialName);
		model.addAttribute("sendee", sendee);
		return "modules/inventory/standingBookGFL";
	}
	
	/**
	 * 石材台账统计
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"standingBookSC"})
	public String standingBookSC(HttpServletRequest request, HttpServletResponse response, Model model) {
		//根据当前用户的ID获取对应的仓库数据
		List<Depot> listDepot = depotService.getSCListByUserID(UserUtils.getUser().getId());
		//仓库条件
		Inventory inv = new Inventory();
		if(listDepot.size()>0){
			Depot depot = listDepot.get(0);
			inv.setProject(depot.getProject());
//			inv.setSub(depot.getSub());
			model.addAttribute("projectName", listDepot.get(0).getProject().getName());
		}
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inv);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookSCList(standingBookDetail);
		StandingBook standingBook = new StandingBook();
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		List<StandingBook> listSB = standingBookService.getGBSendee(standingBook);
		model.addAttribute("listDepot", listDepot);
		model.addAttribute("map", depotService.getProjectData(listDepot));
		model.addAttribute("listOrderTypes", inventoryService.groupByObbaseOrderType(standingBookDetailService.getListInvByListDetail(listSBDetail)));
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("listSB", listSB);
		model.addAttribute("orderTypeVal", "");
		model.addAttribute("sendee", "");
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		return "modules/inventory/standingBookSC";
	}
	/**
	 * 石材台账记录查询
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"searchSC"})
	public String searchSC(HttpServletRequest request, HttpServletResponse response, Model model) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String orderTypeVal = request.getParameter("orderTypeVal");
		String sendee = request.getParameter("sendee");		//接收人（施工班组）
		
		//仓库条件
		Inventory inv = new Inventory();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		sub.setHouseType(houseType);
			inv.setProject(project);
		StandingBook standingBook = new StandingBook();
		standingBook.setSubIn(sub);
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setStandingBook(standingBook);
		standingBookDetail.setInventory(inv);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookSCList(standingBookDetail);
		listSBDetail = standingBookDetailService.searchSCListUtils(listSBDetail, orderTypeVal, sendee);
		standingBook = new StandingBook();
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		List<StandingBook> listSB = standingBookService.getGBSendee(standingBook);
		model.addAttribute("map", depotService.getProjectData(depotService.getSCListByUserID(UserUtils.getUser().getId())));
		model.addAttribute("listOrderTypes", inventoryService.groupByObbaseOrderType(standingBookDetailService.getListInvByListDetail(listSBDetail)));
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("listSB", listSB);
		model.addAttribute("orderTypeVal", orderTypeVal);
		model.addAttribute("sendee", sendee);
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		return "modules/inventory/standingBookSC";
	}

	
	/**
	 * model select condition optimize
	 * 界面的select（筛选条件）标签数据优化
	 * start	2015-12-11
	 */
	
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
		
		Project project = new Project();
		project.setName(projectName);
		
		Inventory inventory = new Inventory();
		inventory.setProject(project);
		
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inventory);
		
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookListByImt(standingBookDetail,imt);
		listSBDetail = standingBookDetailService.removeDuplicateHouseType(listSBDetail);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listSBDetail);
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
		
		StandingBook standingBook = new StandingBook();
		standingBook.setSubIn(sub);
		//获取相应的列表数据	
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inv);
		standingBookDetail.setStandingBook(standingBook);
		
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookListByImt(standingBookDetail,imt);
		listSBDetail = standingBookDetailService.removeDuplicateBuilding(listSBDetail);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listSBDetail);
		return map;
	}
	/**
	 * 根据楼栋带出相应的施工班组
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getSendeeByBuilding"})
	@ResponseBody
	public Map<String,Object> getDataByBuilding(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = new Inventory();//inventoryService.getInvDataByConditionBuildingUtils();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		sub.setBuilding(building);
		
		inv.setProject(project);
		inv.setSub(sub);
		
		StandingBook standingBook = new StandingBook();
		standingBook.setSubIn(sub);
		//获取相应的列表数据	
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inv);
		standingBookDetail.setStandingBook(standingBook);
		
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookListByImt(standingBookDetail,imt);
		listSBDetail = standingBookDetailService.removeDuplicateSendee(listSBDetail);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listSBDetail);
		return map;
	}
	/**
	 * 根据施工班组获取相应的数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDataBySendee"})
	@ResponseBody
	public Map<String,Object> getDataBySendee(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String sendee = request.getParameter("sendee");
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = new Inventory();//inventoryService.getInvDataByConditionBuildingUtils();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		sub.setBuilding(building);
		
		inv.setProject(project);
		inv.setSub(sub);
		
		StandingBook standingBook = new StandingBook();
		standingBook.setSubIn(sub);
		standingBook.setSendee(sendee);
		//获取相应的列表数据	
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setInventory(inv);
		standingBookDetail.setStandingBook(standingBook);
		
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getStandingBookListByImt(standingBookDetail,imt);
		listSBDetail = standingBookDetailService.removeDuplicateMaterialName(listSBDetail);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listSBDetail);
		map.put("listOrderTypes", inventoryService.groupByObbaseOrderType(standingBookDetailService.getListInvByListDetail(listSBDetail)));
		return map;
	}
	/**
	 * model select condition optimize
	 * 界面的select（筛选条件）标签数据优化
	 * end	2015-12-11
	 */
	
	
	
}