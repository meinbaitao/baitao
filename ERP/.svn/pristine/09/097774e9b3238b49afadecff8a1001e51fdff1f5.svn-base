/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.person.service.CommonPersonService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.entity.PurchaseDemandAssign;
import com.bt.modules.purchase.service.PurchaseDemandAssignService;
import com.bt.modules.purchase.service.PurchaseDemandOrderBomDetailMappingService;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.purchase.service.PurchaseDemandSubProjectMappingService;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.DateUtils;
import com.bt.modules.utils.RequestUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 采购需求单Controller
 * @author xiaocai
 * @version 2015-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchaseDemand")
public class PurchaseDemandController extends BaseController { 

	@Autowired
	private PurchaseDemandService purchaseDemandService;	//申购需求
	@Autowired	
	private PurchaseService purchaseService;				//采购订单
	@Autowired
	private PurchaseDemandAssignService purchaseDemandAssignService;	//指派需求数量记录
	@Autowired
	private ProjectService projectService;					//一级项目
	@Autowired
	private SubProjectService subProjectService;			//二级项目
	@Autowired
	private PurchaseDemandSubProjectMappingService purchaseDemandSubProjectMappingService;  //采购需求和二级项目关联表
	@Autowired
	private SystemService systemService;	//系统
	@Autowired
	private CommonPersonService commonPersonService;		//常用联系人
	@Autowired
	private ActTaskService actTaskService;		//流程
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;		//流程
	@Autowired
	private OrderBomBaseService orderBomBaseService;		//下料单
	@Autowired
	private OrderBomDetailService orderBomDetailService;	//下料单明细
	@Autowired
	private PurchaseDemandOrderBomDetailMappingService purchaseDemandOrderBomDetailMappingService;
	
	/**
	 * start-1 2015年11月2日
	 */
	
	/**
	 * 运营下钢辅料管理
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"commissionerAssign"})
	public String commissionerAssign(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		String message = RequestUtils.getParameter(request,"message");
		String isStatus = request.getParameter("isStatus");
		String searchStatus = request.getParameter("searchStatus");
		purchaseDemand.setGlfpGB("proName");
		purchaseDemand.setIsStatus(isStatus);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProjectToYY(new Page<PurchaseDemand>(request, response), purchaseDemand,searchStatus);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DZP_YYZY);
		model.addAttribute("message", message);
		return "modules/purchase/commissionerAssign";
	}
	/**
	 * 运营主管查看列表数据
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"directorAssign"})
	public String directorAssign(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		String message = RequestUtils.getParameter(request,"message");
		String isStatus = request.getParameter("isStatus");
		String searchStatus = request.getParameter("searchStatus");
		purchaseDemand.setGlfpGB("proName");
		purchaseDemand.setIsStatus(isStatus);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProjectToYY(new Page<PurchaseDemand>(request, response), purchaseDemand,searchStatus);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DZP_YYZG);
		model.addAttribute("message", message);
		return "modules/purchase/directorAssign";
	}
	
	/**
	 * 保存要求到货时间
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"saveStoneExpectDate"})
	public String saveStoneExpectDate(HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		//要求到货时间
		String stoneExpectDateStr = request.getParameter("stoneExpectDateStr");
//		String isStatus = request.getParameter("isStatus");
		Subproject sub = new Subproject();
		Date date = null;
		if(StringUtils.isNotBlank(stoneExpectDateStr)){	//要求到货时间
			sub.setStoneExpectDate(stoneExpectDateStr);
			date = DateUtils.getDateByPattern(stoneExpectDateStr, "yyyy-MM-dd");
		}
		List<PurchaseDemandAssign> listPDA = new ArrayList<PurchaseDemandAssign>();	//记录数据
		List<String> ids = RequestUtils.getParameterValuesToList(request, "cBox");
		List<String> obbIDs = RequestUtils.getParameterValuesToList(request, "obbaseBox");
		Map<String,Integer> mapResSumCount = new HashMap<String,Integer>();	//定义剩余量
		PurchaseDemandAssign pda;
		//判断选中下料单的情况，补充界面中没选择的下料单中的详情数据的剩余量
		if(obbIDs.size()>0){	//直接选中下料单进行指派
			//根据选中的下料单获取对应的下料单详情数据
			List<PurchaseDemand> listPD = purchaseDemandService.getListByObbIds(obbIDs);
			List<String> oids = new ArrayList<String>();
			Map<String,Integer> mapPDCount = new HashMap<String,Integer>();	//总需求量
			for(PurchaseDemand pd:listPD){	//组装对应的下料单详情数据的ids
				oids.add(pd.getId());
				mapPDCount.put(pd.getId(), pd.getCount());
			}
			Map<String,Integer> mapPDSumCount = purchaseDemandAssignService.getAlreadySumCount(oids,"");	//统计已指派量
			int res = 0;
			//补充选中下料单未选中详情单情况
			for(String key:mapPDCount.keySet()){	//处理对应详情的剩余量
				res = mapPDCount.get(key)-mapPDSumCount.get(key);	//剩余量=总量-总已指派量
				mapResSumCount.put(key, res);
				if(!ids.contains(key)){
					ids.add(key);
				}
			}
		}
		Map<String,Integer> mapId = purchaseDemandAssignService.getIdCount(ids);		//统计条数
		//循环组装界面选中需要指派的数据
		for(String id:ids){
//			String countStr = request.getParameter("yy"+id);	//循环获取对应的数量
			int count = RequestUtils.getInt(request, "yy"+id);
			if(count<=0){	//当数量 没有或者小于等于0 时则认为不操作该数据
				if(!mapResSumCount.containsKey(id)||mapResSumCount.get(id)<=0){
					continue;
				}else{
					count=mapResSumCount.get(id);
				}
			}
			//组装对应的实体对象
			pda = new PurchaseDemandAssign();
			pda.setId(IdGen.uuid());
			pda.setSeriesnumber(SeriesNumberUtils.getPurchaseDemandAssignSeriesNumber(mapId.get(id)));//获取编号
			pda.setPurchaseDemandId(id);
			pda.setStatus(CommonStatus.PURCHASE_DZP_YYZG);
			pda.setCount(count);
			pda.setAssignDate(new Date());
			pda.setRequireDate(date);
			
			listPDA.add(pda);
		}
		//插入指派记录数据
		purchaseDemandAssignService.batchInsert(listPDA);
		//根据ids修改要求到货时间
		purchaseDemandService.updateExpectDateByPDIds(ids, stoneExpectDateStr);
		//刷新界面数据
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("proName");
		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		model.addAttribute("page", page);
		model.addAttribute("message", "提交成功");
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DZP_YYZY);
		return "modules/purchase/commissionerAssign";
	}
	/**
	 * 运营主管
	 * 驳回运营专员指派数量
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"rebutSugg"})
	public String rebutSugg(HttpServletRequest request,HttpServletResponse response,Model model) {
		String suggestion = request.getParameter("suggestion");
		List<String> ids = RequestUtils.getParameterStringsToList(request, "rebutIDs");//CommonUtils.stringToList(request.getParameter("rebutIDs"));	//需求IDs
		List<String> obbIDs = RequestUtils.getParameterStringsToList(request, "obbIDs");//CommonUtils.stringToList(request.getParameter("obbIDs"));	//下料单IDs
		if(obbIDs.size()>0){	//下料单包含的需求单填充
			List<PurchaseDemand> listPD = purchaseDemandService.getListByObbIds(obbIDs);
			ids = purchaseDemandService.purchaseDemandIdsParseIds(ids, listPD);
		}
		if(ids.size()>0){
			purchaseDemandAssignService.updateSuggByDemandIDs(ids, suggestion,CommonStatus.PURCHASE_ASSIGN_BH, CommonStatus.PURCHASE_DZP_YYZG);
		}
		model.addAttribute("message", "驳回成功");
		return "redirect:" + adminPath + "/purchase/purchaseDemand/directorAssign";
	}
	/**
	 * 运营主管
	 * 同意提交运营专员指派数量
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"submitSugg"})
	public String submitSugg(HttpServletRequest request,HttpServletResponse response,Model model) {
		String suggestion = request.getParameter("suggestion");
		List<String> ids = RequestUtils.getParameterStringsToList(request, "submitIDs");//CommonUtils.stringToList(request.getParameter("rebutIDs"));	//需求IDs
		List<String> obbIDs = RequestUtils.getParameterStringsToList(request, "obbIDs");//CommonUtils.stringToList(request.getParameter("obbIDs"));	//下料单IDs
		if(obbIDs.size()>0){	//下料单包含的需求单填充
			List<PurchaseDemand> listPD = purchaseDemandService.getListByObbIds(obbIDs);
			ids = purchaseDemandService.purchaseDemandIdsParseIds(ids, listPD);
		}
		if(ids.size()>0){
			List<PurchaseDemand> listPD = this.purchaseDemandUtils(ids, CommonStatus.PURCHASE_DZP_CGZG,CommonStatus.PURCHASE_DZP_CGZG);
			purchaseDemandService.batchUpdate(listPD);
			purchaseDemandAssignService.updateSuggByDemandIDs(ids, suggestion,CommonStatus.PURCHASE_DZP_CGZG, CommonStatus.PURCHASE_DZP_YYZG);
		}
		model.addAttribute("message", "提交成功");
		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/directorAssign";
	}
	/**
	 * 将对应的id和状态组装起来
	 * @param ids
	 * @param status
	 * @return
	 */
	public List<PurchaseDemand> purchaseDemandUtils(List<String> ids,String status,String ltStatus){
		List<PurchaseDemand> listPD = new ArrayList<PurchaseDemand>();
		PurchaseDemand purchaseDemand;
		for(String id:ids){
			purchaseDemand = new PurchaseDemand(); 
			purchaseDemand.setId(id);
			purchaseDemand.setStatus(status);
			purchaseDemand.setLtVal(ltStatus);
			listPD.add(purchaseDemand);
		}
		return listPD;
	}
	/**
	 *  根据项目ID获取相关的全部的下料单
	 * @return
	 */
	@RequestMapping(value = {"getObbByProID"})
	@ResponseBody
	public Map<String,Object> getObbByProID(HttpServletRequest request,HttpServletResponse response) {
		String proID = request.getParameter("proID");
		String isStatus = request.getParameter("isStatus");
		Project project = new Project();
		project.setId(proID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obbase");
		purchaseDemand.setProject(project);
		purchaseDemand.setIsStatus(isStatus);
		if(UserUtils.verificationRole("cgy")){		//采购员
			purchaseDemand.setAssignto(UserUtils.getUser());
//			purchaseDemand.setStatus(isStatus);
		}else if(UserUtils.verificationRole("cgzg")){	//采购主管
			purchaseDemand.setStatus(isStatus);
		}
		List<PurchaseDemand> listPD = purchaseDemandService.getListForProject(purchaseDemand);
		//采购员数据处理
		if(UserUtils.verificationRole("cgy")){
			listPD = this.cgyListUtils(listPD, isStatus);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", listPD);
		return map;
	}
	/**
	 * 采购员数据显示
	 * @param listPD
	 * @param isStatus
	 * @return
	 */
	public List<PurchaseDemand> cgyListUtils(List<PurchaseDemand> listPD,String isStatus){
		List<PurchaseDemand> listPDs = new ArrayList<PurchaseDemand>();
		for(PurchaseDemand p1:listPD){
			if(this.obbCountUtils(p1.getOrderBomBase().getId())&&CommonStatus.PURCHASE_DXD.equals(isStatus)){	//未下单
				listPDs.add(p1);
			}else if(!this.obbCountUtils(p1.getOrderBomBase().getId())&&CommonStatus.PURCHASE_YXD.equals(isStatus)){	//已下单
				listPDs.add(p1);
			}
		}
		return listPDs;
	}
	/**
	 * 运营查看
	 * 根据下料单编号获取相关的列表详情数据 
	 * @return
	 */
	@RequestMapping(value = {"getDetailByObbIDForCommissioner"})
	@ResponseBody
	public Map<String,Object> getDetailByObbID(HttpServletRequest request,HttpServletResponse response) {
		String obbID = request.getParameter("obbID");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
//		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		List<PurchaseDemand> pds = purchaseDemandService.getDetailListByObbID(purchaseDemand);
		//需显示列表数据
		List<String> ids = new ArrayList<String>();
//		List<PurchaseDemand> pds = page.getList();
		for(PurchaseDemand p:pds){	//组装对应的ids
			ids.add(p.getId());
		}
		Map<String,Integer> mapSC = purchaseDemandAssignService.getAlreadySumCount(ids,"");	//已经指派的数量
		Map<String,Integer> mapRC = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_YYZG);	//可驳回的数量
		Map<String,String> mapAssignLog = purchaseDemandAssignService.getAssignLog(ids);	//指派记录
//		Map<String,String> mapRebutLog = purchaseDemandAssignService.getRebutLog(ids);		//审批意见和时间
		//设置返回数据
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mapSC", mapSC);
		map.put("mapRC", mapRC);
		map.put("mapAssignLog", mapAssignLog);
//		map.put("mapRebutLog", mapRebutLog);
		map.put("list", pds);
		return map;
	}
	/**
	 * 采购主管
	 * 查看列表详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDetailByObbIDForWaitAssign"})
	@ResponseBody
	public Map<String,Object> getDetailByObbIDForWaitAssign(HttpServletRequest request,HttpServletResponse response) {
		String obbID = request.getParameter("obbID");
//		String status = request.getParameter("status");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
//		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		List<PurchaseDemand> pds = purchaseDemandService.getDetailListByObbID(purchaseDemand);
		List<String> ids = new ArrayList<String>();
//		List<PurchaseDemand> pds = page.getList();
		for(PurchaseDemand p:pds){	//组装对应的ids
			ids.add(p.getId());
		}
		//指派总量（运营已下单数量）
		Map<String,Integer> mapSC = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_CGZG);
		//已采购数量
		Map<String,Integer> mapPC = purchaseService.getPurchaseCountByDemandIds(ids);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", pds);
		map.put("mapSC", mapSC);
		map.put("mapPC", mapPC);
		return map;
	}
	/**
	 * 待采购列表
	 * 采购员
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDetailByObbIDForWaitPurchase"})
	@ResponseBody
	public Map<String,Object> getDetailByObbIDForWaitPurchase(HttpServletRequest request,HttpServletResponse response) {
		String obbID = request.getParameter("obbID");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
		purchaseDemand.setAssignto(UserUtils.getUser());
		List<PurchaseDemand> pds = purchaseDemandService.getDetailListByObbID(purchaseDemand);
		List<String> ids = new ArrayList<String>();
//		List<PurchaseDemand> pds = page.getList();
		for(PurchaseDemand p:pds){	//组装对应的ids
			ids.add(p.getId());
		}
		//指派总量（运营已下单数量）
		Map<String,Integer> mapSC = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_CGZG);
		//已采购数量
		Map<String,Integer> mapPC = purchaseService.getPurchaseCountByDemandIds(ids);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", pds);
		map.put("mapSC", mapSC);
		map.put("mapPC", mapPC);
		return map;
	}
	/**
	 * 待指派（钢、辅料）
	 * 采购主管
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"waitAssignGFLList"})
	public String waitAssignGFLList(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) {
		purchaseDemand.setGlfpGB("proName");
		purchaseDemand.setStatus(CommonStatus.PURCHASE_DZP_CGZG);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DZP_CGZG);
		return "modules/purchase/waitAssignGFLList";
	}
	/**
	 * 已指派（钢、辅料）
	 * 采购主管
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"hasAssignGFLList"})
	public String hasAssignGFLList(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) {
		purchaseDemand.setGlfpGB("proName");
		purchaseDemand.setStatus(CommonStatus.PURCHASE_DXD);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DXD);
		return "modules/purchase/hasAssignGFLList";
	}
	/**
	 * 采购主管指派数据
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"assignGFL"})	//采购主管指派数据
	@Transactional(readOnly = false)
	public String assignGFL(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) {
		String cgy = request.getParameter("cgyID");
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		List<String> ids = RequestUtils.getParameterStringsToList(request, "assignIDs");
		List<String> obbIDs = RequestUtils.getParameterStringsToList(request, "obbIDs");//下料单IDs
		if(obbIDs.size()>0){	//下料单包含的需求单填充
			List<PurchaseDemand> listPD = purchaseDemandService.getListByObbIdsAndStatus(obbIDs,CommonStatus.PURCHASE_DZP_CGZG);
			ids = purchaseDemandService.purchaseDemandIdsParseIds(ids, listPD);
		}
		List<PurchaseDemand> listPD = this.assignDataUtils(new User(cgy),ids);
		//数据处理完成 指派数据
		purchaseDemandService.batchUpdate(listPD);
		//修改指派后的数据
		purchaseDemandAssignService.updateStatusByDemandIDs(ids, CommonStatus.PURCHASE_DXD, CommonStatus.PURCHASE_DZP_YYZG);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitAssignGFLList";
	}
	/**
	 * 待采购（钢辅料）
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"waitPurchaseGFLList"})
	public String waitPurchaseGFLList(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) {
		purchaseDemand.setGlfpGB("proName");
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		purchaseDemand.setTypes(types);
		purchaseDemand.setAssignto(UserUtils.getUser());
//		purchaseDemand.setStatus(CommonStatus.PURCHASE_DXD);
		List<PurchaseDemand> listPD = purchaseDemandService.getListForProject(purchaseDemand);
		//待采购数据处理
		listPD = this.cgyPurchaseListUtils(listPD, CommonStatus.PURCHASE_DXD);
		model.addAttribute("listPD", listPD);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DXD);
		return "modules/purchase/waitPurchaseGFLList";
	}
	/**
	 * 采购员采购数据处理
	 * @param listPD
	 * @param isStatus
	 * @return
	 */
	public List<PurchaseDemand> cgyPurchaseListUtils(List<PurchaseDemand> listPD,String isStatus){
		if(!UserUtils.verificationRole("cgy")){
			return listPD;
		}
		List<PurchaseDemand> listPDs = new ArrayList<PurchaseDemand>();
		for(PurchaseDemand p:listPD){
			String proID = p.getProject().getId();//request.getParameter("proID");
			Project project = new Project();
			project.setId(proID);
			PurchaseDemand purchaseDemand = new PurchaseDemand();
			purchaseDemand.setGlfpGB("obbase");
			purchaseDemand.setProject(project);
			purchaseDemand.setIsStatus(isStatus);
					//采购员
				purchaseDemand.setAssignto(UserUtils.getUser());
			List<PurchaseDemand> list = purchaseDemandService.getListForProject(purchaseDemand);
			for(PurchaseDemand p1:list){
				listPDs.add(p1);
			}
		}
		//采购员数据处理
		listPDs = this.cgyListUtils(listPDs, isStatus);
		listPDs = this.removeDuplicate(listPDs);//根据项目名称对数据去重
		return listPDs;
	}
	/**
	 * 根据项目名称对数据进行去重
	 * @param listPD
	 * @return
	 */
	public List<PurchaseDemand> removeDuplicate(List<PurchaseDemand> listPD){
		List<PurchaseDemand> listPDs = new ArrayList<PurchaseDemand>();
		Map<String,PurchaseDemand> map = new HashMap<String, PurchaseDemand>();
		for(PurchaseDemand p:listPD){
			map.put(p.getProject().getName(), p);
		}
		for(String key:map.keySet()){
			listPDs.add(map.get(key));
		}
		return listPDs;
	}
	/**
	 * 判断下料单是否下单完成
	 * @param obbID
	 * @return
	 */
	public boolean obbCountUtils(String obbID){
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
		purchaseDemand.setAssignto(UserUtils.getUser());
		List<PurchaseDemand> list = purchaseDemandService.getListForProject(purchaseDemand);
		List<String> ids = new ArrayList<String>();
		for(PurchaseDemand p:list){	//组装对应的ids
			ids.add(p.getId());
		}
		//指派总量（运营已下单数量）
		Map<String,Integer> mapSC = purchaseDemandAssignService.getAlreadySumCount(ids,"");
		//已采购数量
		Map<String,Integer> mapPC = purchaseService.getPurchaseCountByDemandIds(ids);
		int sc=0;
		int pc=0;
		for(String key:mapSC.keySet()){
			sc+=mapSC.get(key);
		}
		for(String key:mapPC.keySet()){
			pc+=mapPC.get(key);
		}
		if(pc!=sc){
			return true;
		}
		return false;
	}
	/**
	 * 已采购
	 * @param purchaseDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"hasPurchaseGFLList"})
	public String hasPurchaseGFLList(PurchaseDemand purchaseDemand,HttpServletRequest request,HttpServletResponse response,Model model) {
		purchaseDemand.setGlfpGB("proName");
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		purchaseDemand.setTypes(types);
		purchaseDemand.setAssignto(UserUtils.getUser());
//		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(request, response), purchaseDemand);
		List<PurchaseDemand> listPD = purchaseDemandService.getListForProject(purchaseDemand);
		//待采购数据处理
		listPD = this.cgyPurchaseListUtils(listPD, CommonStatus.PURCHASE_YXD);
		model.addAttribute("listPD", listPD);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_YXD);
		return "modules/purchase/hasPurchaseGFLList";
	}
	/**
	 * 指派对应的数据组装
	 * @param request
	 * @return
	 */
	public List<PurchaseDemand> assignDataUtils(User userCGY,List<String> ids){
		List<PurchaseDemand> listPD=new ArrayList<PurchaseDemand>();
		for(String id:ids){
			PurchaseDemand pd = new PurchaseDemand();
			pd.setId(id);
			pd.setAssignto(userCGY);
			pd.setUpdateDate(new Date());
			pd.setStatus(CommonStatus.PURCHASE_DXD);
			listPD.add(pd);
		}
		return listPD;
	}
	/**
	 * 2015年11月2日
	 * end-1
	 */
	
}