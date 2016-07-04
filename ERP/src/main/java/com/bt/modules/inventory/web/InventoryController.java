/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.contract.entity.LaborDemand;
import com.bt.modules.contract.service.LaborDemandService;
import com.bt.modules.inventory.entity.Depot;
import com.bt.modules.inventory.entity.Inventory;
import com.bt.modules.inventory.entity.StandingBook;
import com.bt.modules.inventory.entity.StandingBookDetail;
import com.bt.modules.inventory.service.DepotService;
import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.inventory.service.StandingBookDetailService;
import com.bt.modules.inventory.service.StandingBookService;
import com.bt.modules.material.service.MaterialService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.DateUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 库存表Controller
 * @author xiaocai
 * @version 2015年12月3日
 */
@Controller
@RequestMapping(value = "${adminPath}/inventory/inventory")
public class InventoryController extends BaseController {

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
	 * 加载钢辅料领料界面
	 * @return
	 */
	@RequestMapping(value = {"loadGFLClaimFrom"})	//钢辅料
	public String loadGFLClaimFrom(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		//获取已经生成了下料单的数据
		OrderBomBase orderBomBase = new OrderBomBase();
		List<OrderBomBase> listOBB = orderBomBaseService.getListForGFLToInventory(orderBomBase);
		//获取生成数量组装生成对应的编号
		int count = standingBookService.getTodayCount(new Date(), CommonConstant.STANDINGBOOK_LINGLIAO);
		String seriesNumber = SeriesNumberUtils.getStandingBookSeriesNumber(count, CommonConstant.STANDINGBOOK_LINGLIAO,CommonConstant.MATERIAL_FULIAO);
		//组装返回数据
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listOBB", listOBB);
		map.put("seriesNumber", seriesNumber);
		map.put("materielTypes", CommonUtils.purchaseUniformMaterielTypeMap());
		model.addAttribute("map", map);
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		return "modules/inventory/loadGFLClaimFrom";
	}
	
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
	 * 领料户型带出领料楼栋
	 * 根据(用到)户型获取楼栋号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getInBuildingByHouseType"})
	@ResponseBody
	public Map<String,Object> getInBuildingByHouseType(HttpServletRequest request, HttpServletResponse response) {
		//项目名称
		String projectName = request.getParameter("projectName");
//		Project project = new Project();
//		project.setName(projectName);
		//对应的户型
		String houseType = request.getParameter("houseType");
//		Subproject sub = new Subproject();
//		sub.setHouseType(houseType);
//		sub.setProject(project);
		//获取相应的列表数据	
		List<Subproject> listIn = subProjectService.getSubsByProNameAndHouseType(projectName,houseType);	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listBuilding", listIn);
		return map;
	}
	/**
	 * 根据选择 用到栋号和项目相关数据作为条件  
	 * 	带出相应的
	 * 劳务合同以及相关的列表数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getContractAndListByProject"})
	@ResponseBody
	public Map<String,Object> getContractAndListByProject(HttpServletRequest request, HttpServletResponse response) {
		String imt = request.getParameter("imt");
		String projectName = request.getParameter("projectName");	//项目名称
		String building = request.getParameter("building");	//楼栋号
		String materielType = request.getParameter("materielType");//材料类型
		String orderType = request.getParameter("orderType");	//下料类型
		//获取相应的列表数据	
		List<LaborDemand> listLD = laborDemandService.getByProject(projectName, building);
		OrderBomDetail orderBomDetail = new OrderBomDetail();
		Project project = new Project();
		project.setName(projectName);
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setUniformMaterielType(materielType);
		orderBomBase.setOrderType(orderType);
		//对应的户型
		String houseType = request.getParameter("houseType");
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		sub.setBuilding(building);
		orderBomDetail.setProject(project);
		orderBomDetail.setSub(sub);
		orderBomDetail.setOrderBomBase(orderBomBase);
		List<OrderBomDetail> listDetail = orderBomDetailService.getListToInventory(orderBomDetail,imt);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listData", listLD);
		map.put("listDetail", listDetail);
		return map;
	}
	
	/**
	 * 根据出库户型获取出库楼栋号
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getOutBuildingByHouseType"})
	@ResponseBody
	public Map<String,Object> getOutBuildingByHouseType(HttpServletRequest request, HttpServletResponse response) {
		String imt = request.getParameter("imt");
		//组装查询条件
		Inventory inv = inventoryService.getInvDataByConditionBuildingUtils();
		//项目名称
		String projectName = request.getParameter("projectName");
		Project project = new Project();
		project.setName(projectName);
		inv.setProject(project);
		//对应的户型
		String houseType = request.getParameter("houseType");
		Subproject sub = new Subproject();
		sub.setHouseType(houseType);
		inv.setSub(sub);
		//获取相应的列表数据	
		List<Inventory> listInv = inventoryService.getInvDataByConditionAndImt(inv,imt);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listBuilding", listInv);
		return map;
	}
	/**
	 * 根据出库栋号拉取相应的库存数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDataByOutBuilding"})
	@ResponseBody
	public Map<String,Object> getDataByOutBuilding(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");//项目名称
		String building = request.getParameter("building");	//楼栋号
		String orderType = request.getParameter("orderType");	//材料类型
		String imt = request.getParameter("imt");
		
		//获取相应的列表数据
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> mapQuantity = inventoryService.getQuantityByOutBuilding(projectName, building,orderType,imt);
		map.put("mapQuantity", mapQuantity);
//		if(CommonConstant.INVENTORY_MATERIAL_TYPE_SC.equals(imt)){
//			Map<String,Object> mapBoxQuantity = inventoryService.getQuantityByOutBuilding(projectName, building);
//			map.put("mapBoxQuantity", mapBoxQuantity);
//		}
		return map;
	}
	/**
	 * 钢辅料领料
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"gflClaim"})	
	@Transactional(readOnly = false)
	public String gflClaim( StandingBook standingBook,HttpServletRequest request, HttpServletResponse response, Model model) throws BusinessException {
		List<Inventory> listInvs = this.parseJsonToInventory(request.getParameter("json"));
		String projectName = request.getParameter("listPro");					//项目名称
		String subOut = request.getParameter("outBuilding");			//出库户型
		String subIn = request.getParameter("claimBuilding");			//用到户型
		String sendee = request.getParameter("laborDemand");			//施工班组
		String businessDateStr = request.getParameter("businessDate");	//领料日期
		String remarks = request.getParameter("remarks");	//备注
		Date businessDate = new Date();
		if(StringUtils.isNotBlank(businessDateStr)){
			businessDate = DateUtils.getDateByPattern(businessDateStr, "yyyy-MM-dd");
		}
		List<String> listM = parseMaterialNos(listInvs);
		Map<String,Integer> map = this.quantityUtils(listInvs);
		//获取对应的物料编号在库存中的数据
		listInvs = inventoryService.getByMaterialNos(projectName, subOut, listM);
		List<Inventory> listInv = new ArrayList<Inventory>();
		for(Inventory invs:listInvs){
//			String quantityStr = request.getParameter("quantity"+id);
			String materialNo = invs.getMaterialNo();
			if(!map.containsKey(materialNo)||map.get(materialNo)<=0){
				continue;
			}
			
			Inventory inv = new Inventory();
			inv.setId(invs.getId());
			inv.setMaterialNo(materialNo);
			inv.setQuantity(map.get(materialNo));
			
			listInv.add(inv);
		}
		if(listInv.size()==0){	//如果没有获取材料，则不继续执行
			return "redirect:"+Global.getAdminPath()+"/inventory/inventory/claimGFLList";
		}
//		List<Inventory> listInv = standingBook.getListInv();
		//领料-出库
		Project project = projectService.getByProjectName(projectName);
		Subproject inSub = subProjectService.getOneByProjectNameAndBuild(projectName, subIn);
		Subproject outSub = subProjectService.getOneByProjectNameAndBuild(projectName, subOut);
		inventoryService.batchOutInventory(listInv, project, inSub, outSub, 
					sendee,CommonConstant.STANDINGBOOK_LINGLIAO, CommonConstant.INVENTORY_MATERIAL_TYPE_GFL,businessDate,remarks);
//		inventoryService.batchOutInventory(listInv, "",CommonConstant.STANDINGBOOK_LINGLIAO);
		return "redirect:"+Global.getAdminPath()+"/inventory/inventory/claimGFLList";
	}
	/**
	 * 石材领料
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"scClaim"})	
	@Transactional(readOnly = false)
	public String scClaim( StandingBook standingBook,HttpServletRequest request, HttpServletResponse response, Model model) throws BusinessException {
		List<Inventory> listInvs = this.parseJsonToInventory(request.getParameter("json"));
		String projectName = request.getParameter("listPro");					//项目名称
		String subOut = request.getParameter("outBuilding");			//出库户型
		String subIn = request.getParameter("claimBuilding");			//用到户型
		String sendee = request.getParameter("laborDemand");			//施工班组
		String businessDateStr = request.getParameter("businessDate");	//领料日期
		String remarks = request.getParameter("remarks");
		Date businessDate = new Date();
		if(StringUtils.isNotBlank(businessDateStr)){
			businessDate = DateUtils.getDateByPattern(businessDateStr, "yyyy-MM-dd");
		}
//		List<String> listM = parseMaterialNos(listInvs);
		Map<String,Integer> map = this.scQuantityUtils(listInvs);
		//获取对应的物料编号在库存中的数据
		listInvs = inventoryService.getSCBylist(projectName, subOut, listInvs);
		List<Inventory> listInv = new ArrayList<Inventory>();
		for(Inventory invs:listInvs){
//			String quantityStr = request.getParameter("quantity"+id);
			String materialNo = invs.getMaterialNo();
			String boxNo = invs.getOrderBomDetail().getBoxNo();
			if(!map.containsKey(boxNo+materialNo)||map.get(boxNo+materialNo)<=0){
				continue;
			}
			
			Inventory inv = new Inventory();
			inv.setId(invs.getId());
			inv.setMaterialNo(materialNo);
			inv.setQuantity(map.get(boxNo+materialNo));
			
			listInv.add(inv);
		}
		if(listInv.size()==0){	//如果没有获取材料，则不继续执行
			return "redirect:"+Global.getAdminPath()+"/inventory/inventory/claimSCList";
		}
//		List<Inventory> listInv = standingBook.getListInv();
		//领料-出库
		Project project = projectService.getByProjectName(projectName);
		Subproject inSub = subProjectService.getOneByProjectNameAndBuild(projectName, subIn);
		Subproject outSub = subProjectService.getOneByProjectNameAndBuild(projectName, subOut);
		inventoryService.batchOutInventory(listInv, project, inSub, outSub, 
					sendee,CommonConstant.STANDINGBOOK_LINGLIAO, CommonConstant.INVENTORY_MATERIAL_TYPE_SC,businessDate,remarks);
//		inventoryService.batchOutInventory(listInv, "",CommonConstant.STANDINGBOOK_LINGLIAO);
		return "redirect:"+Global.getAdminPath()+"/inventory/inventory/claimSCList";
	}
	/**
	 * 解析json数据
	 * @param pJson
	 * @return
	 */
	private List<Inventory> parseJsonToInventory(String pJson) {
		List<Inventory> listInv = new ArrayList<Inventory>();
		try {
			JSONObject dataJson= JSONObject.fromObject(pJson);//new JSONObject(pJson);
			JSONArray jsonArray= dataJson.getJSONArray("inv");
			Inventory inv ;
			for(int i=0;i<jsonArray.size();i++){
				JSONObject jObj = jsonArray.getJSONObject(i);
				String materielNo = "";
				if(jObj.containsKey("materielNo")){
					materielNo = jObj.getString("materielNo");
				}
				String detailId="";
				if(jObj.containsKey("detailId")){
					detailId = jObj.getString("detailId");
				}
				OrderBomDetail orderBomDetail=new OrderBomDetail();
				if(jObj.containsKey("boxNo")){
					String boxNo = jObj.getString("boxNo");
					orderBomDetail.setBoxNo(boxNo);
				}
				int countVal = 0;
				if(jObj.containsKey("countVal")){
					countVal = jObj.getInt("countVal");
				}
				
				inv = new Inventory();
				inv.setMaterialNo(materielNo);
				inv.setMaterialId(detailId);
				inv.setQuantity(countVal);
				inv.setOrderBomDetail(orderBomDetail);
				
				listInv.add(inv);
			}
		} catch (Exception e) {
			logger.debug("加工单json转换出错："+e.getMessage());
		}
		return listInv;
	}
	/**
	 * 获取批量物料编号
	 * @param listInv
	 * @return
	 */
	private List<String> parseMaterialNos(List<Inventory> listInv) {
		List<String> listM = new ArrayList<String>();
		for(Inventory m : listInv){
			if(StringUtils.isNotBlank(m.getMaterialNo())){
				listM.add(m.getMaterialNo());
			}
		}
		return listM;
	}
	/**
	 * 出库数量转换
	 * @param listInv
	 * @return
	 */
	public Map<String,Integer> quantityUtils(List<Inventory> listInv){
		Map<String,Integer> map = new HashMap<String, Integer>();
		for(Inventory inv : listInv){
			if(inv.getQuantity()>0){
				map.put(inv.getMaterialNo(), inv.getQuantity());
			}
		}
		return map;
	}
	public Map<String,Integer> scQuantityUtils(List<Inventory> listInv){
		Map<String,Integer> map = new HashMap<String, Integer>();
		for(Inventory inv : listInv){
			if(inv.getQuantity()>0){
				map.put(inv.getOrderBomDetail().getBoxNo()+inv.getMaterialNo(), inv.getQuantity());
			}
		}
		return map;
	}
	

	
	/**
	 * 加载石材领料界面
	 * @return
	 */
	@RequestMapping(value = {"loadSCClaimFrom"})	
	public String loadSCClaimFrom(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		//获取已经生成了下料单的数据
		OrderBomBase orderBomBase = new OrderBomBase();
		List<OrderBomBase> listOBB = orderBomBaseService.getListForSCToInventory(orderBomBase);
		//获取生成数量组装生成对应的编号
		int count = standingBookService.getTodayCount(new Date(), CommonConstant.STANDINGBOOK_LINGLIAO);
		String seriesNumber = SeriesNumberUtils.getStandingBookSeriesNumber(count, CommonConstant.STANDINGBOOK_LINGLIAO,CommonConstant.MATERIAL_SHICAI);
		//组装返回数据
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listOBB", listOBB);
		map.put("seriesNumber", seriesNumber);
		map.put("orderTypes", CommonUtils.stoneOrderTypeMap());
		model.addAttribute("map", map);
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		return "modules/inventory/loadSCClaimFrom";
	}
	/**
	 * 获取箱的详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getBoxDetail"})
	@ResponseBody
	public Map<String,Object> getBoxDetail(HttpServletRequest request, HttpServletResponse response) {
		String projectName = request.getParameter("projectName");	//项目名称
		String building = request.getParameter("building");			//楼栋号
//		String obbaseID = request.getParameter("obbaseID");			//下料单ID
		String obboxNo = request.getParameter("obboxNo");			//箱号
		//获取相应的列表数据	
//		List<LaborDemand> listLD = laborDemandService.getByProject(projectName, building);
		OrderBomDetail orderBomDetail = new OrderBomDetail();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		orderBomDetail.setProject(project);
		orderBomDetail.setSub(sub);
		orderBomDetail.setBoxNo(obboxNo);
		List<OrderBomDetail> listDetail = orderBomDetailService.getBoxDetail(orderBomDetail);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listDetail", listDetail);
		return map;
	}
	/**
	 * 库存统计（钢辅料）
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"statisticGFL"})
	public String statisticGFL(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<StandingBook> page = standingBookService.findPage(new Page<StandingBook>(request, response), standingBook); 
		Inventory inv = inventoryService.getInvDataByConditionInvUtils();
		//根据当前用户的ID获取对应的仓库数据
		List<Depot> listDepot = depotService.getGFLListByUserID(UserUtils.getUser().getId());
		List<Inventory> listInv = new ArrayList<Inventory>();
		if(listDepot.size()>0){	//判断当前用户是否有管理的仓库
			inv.setProject(listDepot.get(0).getProject());
//			inv.setSub(listDepot.get(0).getSub());
			listInv = inventoryService.getStatisticList(inv,CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
			model.addAttribute("projectName", listDepot.get(0).getProject().getName());
		}
		model.addAttribute("materialName", "");
		model.addAttribute("listInv", listInv);
		model.addAttribute("listMaterialNames", inventoryService.groupByMaterialName(listInv));
//		model.addAttribute("map", depotService.getOneProjectData(listDepot));
		model.addAttribute("map", depotService.getProjectData(listDepot));
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		return "modules/inventory/statisticGFL";
	}
	/**
	 * 搜索钢辅料的数据
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"searchGFL"})
	public String searchGFL(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String materialName = request.getParameter("materialName");
		
		//组装对应的查询条件
		Inventory inv = inventoryService.getInvDataByConditionInvUtils();
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		sub.setHouseType(houseType);
		//根据当前用户的ID获取对应的仓库数据
		List<Inventory> listInv = new ArrayList<Inventory>();
			inv.setProject(project);
			inv.setSub(sub);
			inv.setMaterialName(materialName);
			listInv = inventoryService.getStatisticList(inv,CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		model.addAttribute("materialName", materialName);
//		model.addAttribute("listInv", inventoryService.getEqMaterialName(listInv, materialName));
		model.addAttribute("listInv", listInv);
		model.addAttribute("listMaterialNames", inventoryService.groupByMaterialName(listInv));
		model.addAttribute("map", depotService.getProjectData(depotService.getGFLListByUserID(UserUtils.getUser().getId())));
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		return "modules/inventory/statisticGFL";
	}
	/**
	 * 库存统计（石材）
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"statisticSC"})
	public String statisticSC(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<StandingBook> page = standingBookService.findPage(new Page<StandingBook>(request, response), standingBook); 
		Inventory inv = inventoryService.getInvDataByConditionInvUtils();
		//根据当前用户的ID获取对应的仓库数据
		List<Depot> listDepot = depotService.getSCListByUserID(UserUtils.getUser().getId());
		List<Inventory> listInv = new ArrayList<Inventory>();
		if(listDepot.size()>0){	//判断当前用户是否有管理的仓库
			inv.setProject(listDepot.get(0).getProject());
			listInv = inventoryService.getStatisticList(inv,CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
			model.addAttribute("projectName", listDepot.get(0).getProject().getName());
		}
		model.addAttribute("orderTypeVal", "");
		model.addAttribute("listInv", listInv);
		model.addAttribute("listOrderTypes", inventoryService.groupByObbaseOrderType(listInv));
		model.addAttribute("map", depotService.getProjectData(listDepot));
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		return "modules/inventory/statisticSC";
	}
	/**
	 * 搜索石材的数据
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"searchSC"})
	public String searchSC(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		String projectName = request.getParameter("projectName");
		String houseType = request.getParameter("houseType");
		String building = request.getParameter("building");
		String orderTypeVal = request.getParameter("orderTypeVal");
		
		//组装对应的查询条件
		Inventory inv = inventoryService.getInvDataByConditionInvUtils();
		Project project = new Project();
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setOrderType(orderTypeVal);
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		sub.setHouseType(houseType);
		//根据当前用户的ID获取对应的仓库数据
		List<Inventory> listInv = new ArrayList<Inventory>();
			inv.setProject(project);
			inv.setSub(sub);
			inv.setOrderBomBase(orderBomBase);
			listInv = inventoryService.getStatisticList(inv,CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		model.addAttribute("orderTypeVal", orderTypeVal);
//		model.addAttribute("listInv", inventoryService.getEqOrderTypeVal(listInv, orderTypeVal));
		model.addAttribute("listInv", listInv);
		model.addAttribute("listOrderTypes", inventoryService.groupByObbaseOrderType(listInv));
		model.addAttribute("map", depotService.getProjectData(depotService.getSCListByUserID(UserUtils.getUser().getId())));
		model.addAttribute("imt", CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		return "modules/inventory/statisticSC";
	}
	/**
	 * 领料单明细
	 * @param standingBook
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"claimGFLDetail"})	//钢辅料
	public String claimGFLDetail( HttpServletRequest request, HttpServletResponse response, Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		StandingBook standingBook = new StandingBook();
		standingBook.setSeriesnumber(seriesnumber);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getByStandingBook(standingBook);
		
		List<OrderBomDetail> listOBDetail = new ArrayList<OrderBomDetail>();
		Project project = new Project();
		Subproject subIn = new Subproject();
		Subproject subOut = new Subproject();
		if(listSBDetail.size()>0){
			//加载相关的数据
			project = listSBDetail.get(0).getInventory().getProject();
			subIn = listSBDetail.get(0).getStandingBook().getSubIn();
			subOut = listSBDetail.get(0).getInventory().getSub();
			for(StandingBookDetail sbd:listSBDetail){
				OrderBomDetail obd = sbd.getInventory().getOrderBomDetail();
				obd.setProject(project);
				obd.setSub(subIn);
				obd.getExtraData().put("claimCount", sbd.getQuantity());
				obd.getExtraData().put("invCount", sbd.getInventory().getQuantity());
				listOBDetail.add(obd);
			}
			listOBDetail = orderBomDetailService.listOBDetailExtraDataUtils(listOBDetail);
			
			project = listSBDetail.get(0).getInventory().getProject();
			subIn = listSBDetail.get(0).getStandingBook().getSubIn();
			subOut = listSBDetail.get(0).getInventory().getSub();
			model.addAttribute("standingBookDetail", listSBDetail.get(0));
			model.addAttribute("standingBook", listSBDetail.get(0).getStandingBook());
		}else{
			model.addAttribute("standingBookDetail", new StandingBookDetail());
			model.addAttribute("standingBook", new StandingBook());
		}
		model.addAttribute("project", project);
		model.addAttribute("subIn", subIn);
		model.addAttribute("subOut", subOut);
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("listOBDetail", listOBDetail);
		return "modules/inventory/claimGFLDetail";
	}
	@RequestMapping(value = {"claimSCDetail"})	//石材
	public String claimSCDetail( HttpServletRequest request, HttpServletResponse response, Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		StandingBook standingBook = new StandingBook();
		standingBook.setSeriesnumber(seriesnumber);
		List<StandingBookDetail> listSBDetail = standingBookDetailService.getByStandingBook(standingBook);
		
		List<OrderBomDetail> listOBDetail = new ArrayList<OrderBomDetail>();
		Project project = new Project();
		Subproject subIn = new Subproject();
		Subproject subOut = new Subproject();
		if(listSBDetail.size()>0){
			//加载相关的数据
			project = listSBDetail.get(0).getInventory().getProject();
			subIn = listSBDetail.get(0).getStandingBook().getSubIn();
			subOut = listSBDetail.get(0).getInventory().getSub();
			for(StandingBookDetail sbd:listSBDetail){
				OrderBomDetail obd = sbd.getInventory().getOrderBomDetail();
				obd.setProject(project);
				obd.setSub(subIn);
				obd.getExtraData().put("claimCount", sbd.getQuantity());
				obd.getExtraData().put("invCount", sbd.getInventory().getQuantity());
				listOBDetail.add(obd);
			}
			listOBDetail = orderBomDetailService.listOBDetailExtraDataUtils(listOBDetail);
			model.addAttribute("standingBookDetail", listSBDetail.get(0));
			model.addAttribute("standingBook", listSBDetail.get(0).getStandingBook());
			
		}else{
			model.addAttribute("standingBookDetail", new StandingBookDetail());
			model.addAttribute("standingBook", new StandingBook());
		}
		model.addAttribute("project", project);
		model.addAttribute("subIn", subIn);
		model.addAttribute("subOut", subOut);
		model.addAttribute("listSBDetail", listSBDetail);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("listOBDetail", listOBDetail);
		return "modules/inventory/claimSCDetail";
	}
	/**
	 * 列表数据
	 * 2015-12-18
	 * @return
	 */
	@RequestMapping(value = {"claimGFLList"})	//领料单（钢、辅材料）
	public String claimGFLList(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		standingBook.setSeriesnumber(seriesnumber);
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setTranType(CommonConstant.STANDINGBOOK_LINGLIAO);
		Page<StandingBook> page = standingBookService.findPage(new Page<StandingBook>(request, response), standingBook); 
		model.addAttribute("page", page);
		return "modules/inventory/claimGFLList";
	}
	/**
	 * 石材库存管理
	 * 2015-12-18
	 */
	@RequestMapping(value = {"claimSCList"})
	public String claimSCList(StandingBook standingBook, HttpServletRequest request, HttpServletResponse response, Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		standingBook.setSeriesnumber(seriesnumber);
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setTranType(CommonConstant.STANDINGBOOK_LINGLIAO);
		Page<StandingBook> page = standingBookService.findPage(new Page<StandingBook>(request, response), standingBook); 
		model.addAttribute("page", page);
		return "modules/inventory/claimSCList";
	}
	
}