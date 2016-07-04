/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.production.web;

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

import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.entity.UserSuppMapping;
import com.bt.modules.supplier.service.UserSuppMappingService;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.DateUtils;
import com.bt.modules.utils.RequestUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 生产单Controller
 * @author xiaocai
 * @version 2015-09-21
 */
@Controller
@RequestMapping(value = "${adminPath}/production/production")
public class ProductionController extends BaseController {

	@Autowired
	private ProductionService productionService;//生产订单
	@Autowired
	private OrderBomBoxService orderBomBoxService;	//箱列表数据
	@Autowired
	private OrderBomBaseService orderBomBaseService;	//下料单基本
	@Autowired
	private InventoryService inventoryService;	//库存管理
	@Autowired
	private OrderBomDetailService orderBomDetailService;	//箱详情列表数据
	@Autowired
	private ProjectService projectService;					//一级项目
	@Autowired
	private SubProjectService subProjectService;			//二级项目
	@Autowired
	private UserSuppMappingService userSuppMappingService;			//供应商-生产经理关联
	
	
	/**
	 * 运营专员指派列表数据
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"commissionerAssign"})
	public String commissionerAssign(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
//		//非运营主管、运营专员不返回数据
//		if(!UserUtils.verificationRole("yyzy")){
//			return "modules/production/commissionerAssign";
//		}else{
//			//状态筛选
//			String searchStatus = request.getParameter("searchStatus");
//			String status = request.getParameter("isStatus");
//			production = productionService.searchStatusUtils(production, searchStatus,status);
//		}
		
		//状态筛选
		String searchStatus = request.getParameter("searchStatus");
//		String isStatus = request.getParameter("isStatus");
//		production = productionService.searchStatusUtils(production, searchStatus,status);
//		//权限填充	2016-4-19	
//		if(this.productionPublicRole()){
//			production.setCreateBy(UserUtils.getUser());	
//		}
//		//获取相应的数据
//		production.setGlfpGB("proName");
//		Page<Production> page = productionService.getListForProject(new Page<Production>(request, response), production);
		//获取权限筛选数据
		Page<Production> page = productionService.getListForProjectByShiro(new Page<Production>(request, response), production, searchStatus, CommonStatus.PRODUCTION_DZP_YYZY);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DZP_YYZY);
		return "modules/production/commissionerAssign";
	}
	/**
	 * 运营主管查看数据
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"directorAssign"})
	public String directorAssign(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
//		//非运营主管、运营专员不返回数据
//		if(!UserUtils.verificationRole("yyzg")){
//			return "modules/production/directorAssign";
//		}else{
//			//状态筛选
//			String searchStatus = request.getParameter("searchStatus");
//			String status = request.getParameter("isStatus");
//			production = productionService.searchStatusUtils(production, searchStatus,status);
//		}
		//状态筛选
		String searchStatus = request.getParameter("searchStatus");
//		String isStatus = request.getParameter("isStatus");
//		production = productionService.searchStatusUtils(production, searchStatus,status);
//		//权限填充	2016-4-19	(总裁办、运营经理、运营中心负责人、区域中心负责人以及admin看到全部数据)
//		if(this.productionPublicRole()){
//			production.setCreateBy(UserUtils.getUser());	
//		}
//		//获取相应的数据
//		production.setGlfpGB("proName");
//		//运营主管查看自己的数据
//		Project project = new Project();
////		project.setCoordinatorLeaderBid(UserUtils.getUser().getId());
//		production.setProject(project);
//		Page<Production> page = productionService.getListForProject(new Page<Production>(request, response), production);
		//获取权限筛选数据
		Page<Production> page = productionService.getListForProjectByShiro(new Page<Production>(request, response), production, searchStatus, CommonStatus.PRODUCTION_DZP_YYZG);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DZP_YYZG);
		return "modules/production/directorAssign";
	}
	/**
	 *  根据项目ID获取相关的全部的下料单
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"getObbByProID"})
	@ResponseBody
	public Map<String,Object> getObbByProID(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String proID = request.getParameter("proID");
		String isStatus = request.getParameter("isStatus");
		String attrID = request.getParameter("attrID");
		String searchStatus = request.getParameter("searchStatus");
//		Project project = new Project();
//		project.setId(proID);
////		project = projectService.get(proID);
////		projectService.checkProjectReturnStr(project, "materialStaffBid", "", "此项目没有选择材料员，将会影响确认收货环节");
//		Production production = new Production();
//		if(UserUtils.verificationRole("scjl")){	//生产经理
//			production.setAssignto(UserUtils.getUser());
//		}
//		production.setGlfpGB("obbase");
//		production.setProject(project);
//		production.setGtEqVal(isStatus);
//		if("waitSign".equals(attrID)||"waitProduction".equals(attrID)){	//待签收、待生产	只查看对应状态的数据
//			production.setGtEqVal("");
//			production.setStatus(status);
////			Supplier supp = new Supplier();
////			supp.setBusinessPreson(UserUtils.getUser().getId());
////			production.setSupp(supp);
//			production = this.jgcDataUtils(production);
//		}else if("waitIntake".equals(attrID)){		//入库的数据
////			Supplier supp = new Supplier();
////			supp.setBusinessPreson(UserUtils.getUser().getId());
////			production.setSupp(supp);
//			production = this.jgcDataUtils(production);
//		}
//		if(StringUtils.isNotBlank(searchStatus)){
//			production = productionService.searchStatusUtils(production, searchStatus,status);
//		}
//		List<Production> list = productionService.getListForProject(production);
		List<Production> list = productionService.getObbListByProID(proID, isStatus, attrID, searchStatus);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("tips", list);
		return map;
	}
	/**
	 * 保存要求到货时间
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"saveStoneExpectDate"})
	public String saveStoneExpectDate(HttpServletRequest request,HttpServletResponse response,Model model) {
		//要求到货时间
		String stoneExpectDateStr = request.getParameter("stoneExpectDateStr");
		String isStatus = request.getParameter("isStatus");
		Subproject sub = new Subproject();
		if(StringUtils.isNotBlank(stoneExpectDateStr)){
			sub.setStoneExpectDate(stoneExpectDateStr);
		}
		String ids = request.getParameter("saveIDs");
		//调用公共类进行修改
		productionService.updateStatusByOBBaseIDsUtils(ids, sub, "", "",CommonStatus.PRODUCTION_DZP_YYZG,isStatus);
		//修改石材要求到货时间
		if(StringUtils.isNotBlank(stoneExpectDateStr)){
			Production production = productionService.getIdsByObbIdsProductionUtils(ids, sub, CommonStatus.PRODUCTION_DZP_YYZG,isStatus, "");
			production.setGlfpGB("sub");
			//返回需要修改的楼栋信息
			List<Production> list = productionService.getIdsByObbIds(production);
			for(Production obj:list){
				Subproject subProject = obj.getSub();
				subProject.setStoneExpectDate(stoneExpectDateStr);
				subProjectService.updateStoneExpectDateById(subProject);
			}
		}
		model.addAttribute("xMessage", "提交成功");
		return "redirect:"+Global.getAdminPath()+"/production/production/commissionerAssign";
	}
	/**
	 * 运营主管提交
	 * 审核意见
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"submitSugg"})
	public String submitSugg(HttpServletRequest request,HttpServletResponse response,Model model) {
		//要求到货时间
		String submitSuggestion = request.getParameter("submitSuggestion");
		String isStatus = request.getParameter("isStatus");
		Subproject sub = new Subproject();
		String ids = request.getParameter("submitIDs");
		//调用修改
		productionService.updateStatusByOBBaseIDsUtils(ids, sub, submitSuggestion, "",CommonStatus.PRODUCTION_DZP_YYJL,isStatus);
		model.addAttribute("xMessage", "提交成功");
		return "redirect:"+Global.getAdminPath()+"/production/production/directorAssign";
	}
	/**
	 * 运营主管驳回驳回
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"rebutSugg"})
	public String rebutSugg(HttpServletRequest request,HttpServletResponse response,Model model) {
		//要求到货时间
		String rebutSuggestion = request.getParameter("rebutSuggestion");
		String isStatus = request.getParameter("isStatus");
		Subproject sub = new Subproject();
		String ids = request.getParameter("rebutIDs");
		//调用修改
		productionService.updateStatusByOBBaseIDsUtils(ids, sub, rebutSuggestion, "",CommonStatus.PRODUCTION_DZP_YYZY,isStatus);
		model.addAttribute("xMessage", "驳回成功");
		return "redirect:"+Global.getAdminPath()+"/production/production/directorAssign";
	}
	/**
	 * 运营经理查看列表数据
	 * @param Production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * 运营经理操作（指派给生产经理）（+备注）
	 */
	@RequestMapping(value = {"operateAssign"})
	public String operateAssign(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String searchStatus = request.getParameter("searchStatus");
//		String isStatus = request.getParameter("isStatus");
//		//权限筛选	2016-4-20
//		if(this.productionPublicRole()){
//			production.setCreateBy(UserUtils.getUser());	
//		}
//		production = productionService.searchStatusUtils(production, searchStatus,status);
//		production.setGlfpGB("proName");
//		Page<Production> page = productionService.getListForProject(new Page<Production>(request, response), production);
		//获取权限筛选数据
		Page<Production> page = productionService.getListForProjectByShiro(new Page<Production>(request, response), production, searchStatus, CommonStatus.PRODUCTION_DZP_YYJL);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DZP_YYJL);
		return "modules/production/operateAssign";
	}
	/**
	 * 根据生产经理信息带出相应的加工厂数据
	 * @param production
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getSuppByUid"})
	@ResponseBody
	public List<UserSuppMapping> getSuppByUid(Production production,HttpServletRequest request,HttpServletResponse response) {
		String uid = request.getParameter("uid");
		UserSuppMapping userSuppMapping = new UserSuppMapping();
		userSuppMapping.setUser(new User(uid));
		return userSuppMappingService.getUSMList(userSuppMapping);
	}
	/**
	 * 根据下料单编号获取相关的列表详情数据 
	 * @param production
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getDetailByObbID"})
	@ResponseBody
	public Map<String,Object> getDetailByObbID(HttpServletRequest request,HttpServletResponse response) {
		//获取下料单ID
		String obbId = request.getParameter("obbID");
		String attrID = request.getParameter("attrVal");
		String isStatus = request.getParameter("isStatus");
//		if(UserUtils.verificationRole("scjl")){	//生产经理
//			production.setAssignto(UserUtils.getUser());
//			production.setCreateBy(UserUtils.getUser());
//		}
//		OrderBomBox obb = new OrderBomBox();
//		obb.setOrderBomId(obbId);
//		production.setOrderBomBox(obb);
//		production.setStatus(status);
//		production.setGtEqVal(isStatus);
//		if("waitSign".equals(attrID)||"waitProduction".equals(attrID)){
//			production.setStatus(status);
//			production.setGtEqVal("");
////			Supplier supp = new Supplier();
////			supp.setBusinessPreson(UserUtils.getUser().getId());
////			production.setSupp(supp);
//			production = this.jgcDataUtils(production);
//		}else if("waitIntake".equals(attrID)){
////			Supplier supp = new Supplier();
////			supp.setBusinessPreson(UserUtils.getUser().getId());
////			production.setSupp(supp);
//			production = this.jgcDataUtils(production);
//		}else{
//			production.setGlfpGB("");
//		}
		//查询相应的列表详情数据
//		List<Production> list = productionService.getDetail(production);
		List<Production> list = productionService.getDetailByObbID(obbId, isStatus, attrID);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		return map;
	}
//	/**
//	 * 根据下料单编号获取相关的箱详情数据 
//	 * @param production
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = {"getBoxDetailByObbID"})
//	@ResponseBody
//	public List<Production> getBoxDetailByObbID( HttpServletRequest request,HttpServletResponse response) {
//		Production production = new Production();
//		//获取下料单ID
//		String obbId = request.getParameter("obbID");
//		String status = request.getParameter("status");
//		String fname = request.getParameter("fname");
//		OrderBomBox obb = new OrderBomBox();
//		obb.setOrderBomId(obbId);
//		production.setOrderBomBox(obb);
//		if("waitProduction".equals(fname)){
//			production.setStatus(status);
//			production.setGtEqVal("");
//		}
//		//查询相应的列表详情数据
//		List<Production> list = productionService.getBoxDetail(production);
//		return list;
//	}
	/**
	 * 运营经理
	 * 指派生产经理
	 * @param Production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"assignSCJL"})
	public String assignSCJL(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		//获取界面传过来的用户ID
		String scjlID = request.getParameter("scjl");
		String jgcID = request.getParameter("jgc");
		String amaldarremarks = request.getParameter("amaldarremarks");
		User scjl = new User();
		scjl.setId(scjlID);
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		List<String> ids = RequestUtils.getParameterStringsToList(request, "assignIDs");//CommonUtils.stringToList(request.getParameter("assignIDs"));	//加工单ids
		List<String> obbIDs = RequestUtils.getParameterStringsToList(request, "obbIDs");//CommonUtils.stringToList(request.getParameter("obbIDs"));		//下料单ids
		String obboxStatus = request.getParameter("obboxStatus");
		List<Production> listPD=new ArrayList<Production>();
		Production p;
		for(String id:ids){
			p = new Production();
			p.setId(id);
			p.setAssignto(scjl);
			p.setAmaldarremarks(amaldarremarks);
			p.setStatus(CommonStatus.PRODUCTION_DZP_SCJL);
			p.setSupp(new Supplier(jgcID));
			p.setUpdateDate(new Date());
			
			listPD.add(p);
		}
		productionService.batchUpdate(listPD);
		//根据下料单IDs进行修改相关数据
		if(obbIDs.size()>0){
			//组装实体条件
			p = new Production();
			p.setIds(obbIDs);
			p.setAssignto(scjl);
			p.setAmaldarremarks(amaldarremarks);
			p.setStatus(CommonStatus.PRODUCTION_DZP_SCJL);
			p.setOriginStatus(obboxStatus);
			p.setSupp(new Supplier(jgcID));
			p.setUpdateDate(new Date());
			productionService.updateStatusByOBBaseIDs(p);
		}
		return "redirect:"+Global.getAdminPath()+"/production/production/operateAssign";
	}	
	/**
	 * 运营经理驳回给运营主管
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"directorRebutSugg"})
	public String directorRebutSugg(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String remarks = request.getParameter("rebutSuggestion");	//驳回意见
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		List<String> rebutIDs = RequestUtils.getParameterStringsToList(request, "rebutIDs");//CommonUtils.stringToList(request.getParameter("rebutIDs"));
		String obbIDs = request.getParameter("rebutObbIDs");
		String isStatus = request.getParameter("isStatus");
		List<Production> listPD=new ArrayList<Production>();
		Production pd;
		for(String id:rebutIDs){
			pd = new Production();
			pd.setId(id);
			pd.setAmaldarremarks(remarks);
			pd.setUpdateDate(new Date());
			pd.setStatus(CommonStatus.PRODUCTION_DZP_YYZG);
			
			listPD.add(pd);
		}
		productionService.batchUpdate(listPD);
		//根据下料单IDs进行修改相关数据
		productionService.updateStatusByOBBaseIDsUtils(obbIDs, new Subproject(), "",remarks ,CommonStatus.PRODUCTION_DZP_YYZG,isStatus);
		return "redirect:"+Global.getAdminPath()+"/production/production/operateAssign";
	}
	/**
	 * 生产经理查看属于自己的待指派列表数据
	 * @return
	 * 生产经理操作
	 */
	@RequestMapping(value = {"waitAssign"})
	public String waitAssign(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String searchStatus = request.getParameter("searchStatus");
//		String isStatus = request.getParameter("isStatus");
//		production = productionService.searchStatusUtils(production, searchStatus,status);
//		production.setGlfpGB("proName");
//		//权限数据筛选控制
//		if(this.productionPublicRole()&&UserUtils.verificationRole("scjl")){	//非查看全部数据且是生产经理
//			production.setAssignto(UserUtils.getUser());
//		}else if(this.productionPublicRole()){
//			production.setAboutUser(UserUtils.getUser());
//		}
//		Page<Production> page = productionService.getListForProject(new Page<Production>(request, response), production);
		Page<Production> page = productionService.getListForProjectToProductionAssign(new Page<Production>(request, response), production, searchStatus, CommonStatus.PRODUCTION_DZP_SCJL);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DZP_SCJL);
		return "modules/production/waitAssign";
	}
	/**
	 * 指派跟单员
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"assignProduction"})
	@Transactional(readOnly = false)
	public String assignProduction(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String isStatus = request.getParameter("isStatus");
		//获取界面传过来的用户ID
		String gdyID = request.getParameter("gdy");
		String remarks = request.getParameter("remarks");
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		List<String> assignIDs = RequestUtils.getParameterStringsToList(request, "assignIDs");//CommonUtils.stringToList(request.getParameter("assignIDs"));
		List<String> obbIDs = RequestUtils.getParameterStringsToList(request, "obbIDs");//CommonUtils.stringToList(request.getParameter("obbIDs"));//获取界面的下料ids
		List<Production> listPD=new ArrayList<Production>();
		Production p;
		Date orderDate = new Date();
		for(String id:assignIDs){
			p = new Production();
			p.setId(id);
			p.setRemarks(remarks);
			p.setStatus(CommonStatus.PRODUCTION_DQS);
			p.setDocumentaryby(new User(gdyID));
			p.setUpdateDate(new Date());
			p.setOrderDate(orderDate);
			if(UserUtils.verificationRole("scjl")){	//生产经理
				p.setScjl(UserUtils.getUser());
			}
			
			listPD.add(p);
		}
		productionService.batchUpdate(listPD);
		//下料单
		if(obbIDs.size()>0){
			//根据下料单IDs组装需要进行修改的相关数据
			p = new Production();
			p.setIds(obbIDs);
			p.setRemarks(remarks);
			p.setStatus(CommonStatus.PRODUCTION_DQS);
			p.setDocumentaryby(new User(gdyID));
			p.setOriginStatus(isStatus);
			p.setUpdateDate(new Date());
			p.setOrderDate(orderDate);
			if(UserUtils.verificationRole("scjl")){	//生产经理
				p.setScjl(UserUtils.getUser());
			}
			
			//根据下料单ID直接修改全部相关数据的状态以及相关字段
			productionService.updateStatusByOBBaseIDs(p);
		}
		return "redirect:"+Global.getAdminPath()+"/production/production/waitAssign";
	}
	/**
	 * 待签收列表数据
	 * @return
	 * 2015年10月30日
	 */
	@RequestMapping(value = {"waitSign"})
	public String waitSign(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
//		production.setGlfpGB("proName");
		//添加工厂人员信息条件
//		Supplier supp = new Supplier();
//		supp.setBusinessPreson(UserUtils.getUser().getId());
//		production.setSupp(supp);
//		production = this.jgcDataUtils(production);
		production.setStatus(CommonStatus.PRODUCTION_DQS);
//		Page<Production> page = productionService.getListForProject(new Page<Production>(request, response), production);
		Page<Production> page = productionService.getListForProjectToFactory(new Page<Production>(request, response), production);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DQS);
		return "modules/production/waitSign";
		
	}
	/**
	 * 加工厂人员进行签收加工单
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"signProduction"})
	public String signProduction(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		//获取界面传过来的指派采购数据(拆分组合生成实体)
		List<String> signIDs = RequestUtils.getParameterStringsToList(request, "signIDs");//CommonUtils.stringToList(request.getParameter("signIDs"));
		List<Production> listPD=new ArrayList<Production>();
		Production p;
		for(String id:signIDs){
			p = new Production();
			p.setId(id);
			p.setUpdateDate(new Date());
//			pd.setOrderDate(new Date());
			p.setStatus(CommonStatus.PRODUCTION_DSC);
			
			listPD.add(p);
		}
		productionService.batchUpdate(listPD);
		//根据下料单IDs进行修改相关数据
		String obbIDs = request.getParameter("obbIDs");
		String obboxStatus = request.getParameter("obboxStatus");
		productionService.updateStatusByOBBaseIDsToSupp(obbIDs, new Subproject(), CommonStatus.PRODUCTION_DSC,obboxStatus,UserUtils.getUserId());
		return "redirect:"+Global.getAdminPath()+"/production/production/waitSign";
	}
	/**
	 * 待生产 列表数据
	 * @return
	 * 2015年10月30日
	 */
	@RequestMapping(value = {"waitProduction"})
	public String waitProduction(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
//		production.setGlfpGB("proName");
		production.setStatus(CommonStatus.PRODUCTION_DSC);
		//添加工厂人员信息条件
//		Supplier supp = new Supplier();
//		supp.setBusinessPreson(UserUtils.getUser().getId());
//		production.setSupp(supp);
//		production = this.jgcDataUtils(production);
		Page<Production> page = productionService.getListForProjectToFactory(new Page<Production>(request, response), production);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DSC);
		return "modules/production/waitProduction";
	}
	/**
	 * 生产
	 * 加工厂跟单员对已签收加工单进行生产处理
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"production"})
	public String production(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String finishDateStr = request.getParameter("finishDate");
		Date finishDate=null;
		if(StringUtils.isNotBlank(finishDateStr)){
			finishDate = DateUtils.getDateByPattern(finishDateStr, "yyyy-MM-dd");
		}
		//获取界面传过来的指派采购数据(拆分组合生成实体)
//		List<String> signIDs = CommonUtils.stringToList(request.getParameter("signIDs"));
		List<String> signIDs = RequestUtils.getParameterStringsToList(request, "signIDs");
		List<Production> listPD=new ArrayList<Production>();
		Production pd;
		for(String id:signIDs){
			pd = new Production();
			pd.setId(id);
			pd.setUpdateDate(new Date());
			pd.setStatus(CommonStatus.PRODUCTION_DRK);
			pd.setFinishDate(finishDate);
			
			listPD.add(pd);
		}
		productionService.batchUpdate(listPD);
		//根据下料单IDs进行修改相关数据
		String obboxStatus = request.getParameter("obboxStatus");
		List<String> obbIDs=CommonUtils.stringToList(request.getParameter("obbIDs"));
		if(obbIDs.size()>0){	//整笔下料单进行修改
			Production p = new Production();
			p.setIds(obbIDs);
			p.setStatus(CommonStatus.PRODUCTION_DRK);
			p.setOriginStatus(obboxStatus);
			p.setFinishDate(finishDate);
			productionService.updateStatusByOBBaseIDs(p);
		}
		return "redirect:"+Global.getAdminPath()+"/production/production/waitProduction";
	}
	/**
	 * 待入库列表数据
	 * @param production
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"waitIntake"})
	public String waitIntake(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		String searchStatus = request.getParameter("searchStatus");
		String status = request.getParameter("isStatus");
		production = productionService.searchStatusUtils(production, searchStatus,status);
		
//		production.setGlfpGB("proName");
		production.setGtEqVal(CommonStatus.PRODUCTION_DRK);
		//添加工厂人员信息条件
//		Supplier supp = new Supplier();
//		supp.setBusinessPreson(UserUtils.getUser().getId());
//		production.setSupp(supp);
//		production = this.jgcDataUtils(production);
		Page<Production> page = productionService.getListForProjectToFactory(new Page<Production>(request, response), production);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DRK);
		
		return "modules/production/waitIntake";
	}
	/**
	 * 入库
	 * @return
	 */
	@RequestMapping(value = {"intake"})
	public String intake(Production production,HttpServletRequest request,HttpServletResponse response,Model model) {
		//获取界面传过来的指派采购数据(拆分组合生成实体)
//		List<String> ids = CommonUtils.stringToList(request.getParameter("intakeIDs"));
		List<String> ids = RequestUtils.getParameterStringsToList(request, "intakeIDs");
		List<Production> listPD=new ArrayList<Production>();
		Production pd;
		for(String id:ids){
			pd = new Production();
			pd.setId(id);
			pd.setUpdateDate(new Date());
			pd.setStatus(CommonStatus.PRODUCTION_YRK);
			
			listPD.add(pd);
		}
		productionService.batchUpdate(listPD);//批量修改数据状态
		//根据下料单IDs进行修改相关数据
		String obbIDs = request.getParameter("obbIDs");
		String obboxStatus = request.getParameter("obboxStatus");
		productionService.updateStatusByOBBaseIDsToSupp(obbIDs, new Subproject(),CommonStatus.PRODUCTION_YRK,obboxStatus,UserUtils.getUserId());
		return "redirect:"+Global.getAdminPath()+"/production/production/waitIntake";
	}
	/**
	 * end 2015年9月23日
	 */
}