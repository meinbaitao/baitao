package com.bt.modules.datatrack.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.area.entity.Province;
import com.bt.modules.area.service.ProvinceService;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.JiaContract;
import com.bt.modules.contract.service.BtgConJiaContractDetailService;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.datatrack.entity.DataTrackDetail;
import com.bt.modules.datatrack.service.DataTrackService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.bt.modules.purchase.service.PurchaseDemandAssignService;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;


/**
 * 一级项目信息
 * @author xjp
 * @version 2015-8-1
 */
@Controller
@RequestMapping(value = "${adminPath}/datatrack")
public class DatatrackController extends BaseController {
	
	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);

	public static final String CACHE_DICT_MAP = "dictMap";
	
	@Autowired	
	private PurchaseService purchaseService;				//采购订单
	
	/**
	 * 一级项目Service
	 */
	@Autowired
	private ProjectService projectService;
	
	/**
	 * 二级项目Service
	 */
	@Autowired
	private SubProjectService subProjectService;
	
	@Autowired
	private DataTrackService datatrackService;
	
	@Autowired
	private  BtgConJiaContractDetailService  btgConJiaContractDetailService ;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	PurchaseDemandAssignService purchaseDemandAssignService;
	
	@Autowired 
	PurchaseDemandService purchaseDemandService;
	
	
	/**
	 * 分页查询一级项目信息
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	//@RequiresPermissions("project:view")
	@RequestMapping(value = {"list", ""})
	public String list(Project project,HttpServletRequest request,HttpServletResponse response,Model model) {
		//查询主项列表，如果有名称参数则带入名称参数查询列表
		Page<Project> page = projectService.findPage(new Page<Project>(request, response), project); 
		model.addAttribute("page", page);
		return "modules/datatrack/projectList";
	}
	
	/**
	 * 跳转查看、修改页面
	 * @param project
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "view")
	public String view(Project project, HttpServletRequest request,Model model) {
		if(StringUtils.isEmpty(project.getId())){
			project.setId(request.getParameter("projectId"));
		}
		Project projects = projectService.get(project);
		projects.setSubList(subProjectService.findByProjectIdList(project.getId()));
		//查询一级项目信息
		model.addAttribute("project",projects);
		model.addAttribute("flag","view");
		//查询二级项目信息
		return "modules/datatrack/projectDetail";
	}
	/**
	 * 跟踪甲方合同号
	 * @param project
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "trackJiaContract")
	public String form(@ModelAttribute("jiaContract") JiaContract jiaContract,HttpServletRequest request,Model model) {
		
		String id = request.getParameter("id");
		
		
		//合同基础信息与明细
		BtgConJiaContractDetail btgConJiaContractDetail = new BtgConJiaContractDetail();
		btgConJiaContractDetail.setContractId(jiaContract.getId());
		jiaContract.setDetailList(btgConJiaContractDetailService.findList(btgConJiaContractDetail));
		model.addAttribute("jiaContract", jiaContract);
				
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(jiaContract.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);		
		
		//项目列表
		List<Project> projectList = projectService.findAllApprovaledProjects();
		List<Project> projectFilter = new ArrayList<Project>();
		for(Project pp : projectList){
			if(null != pp.getCostLeaderBid()){
				projectFilter.add(pp);
			}
		}
		model.addAttribute("projectList", projectFilter);
		
		return "modules/contract/jiaContractForm";

	}
	
	@RequestMapping(value = "trackProduct")
	public String trackProduct(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<DataTrackDetail> list = new ArrayList<DataTrackDetail>();
		list = datatrackService.getBaseBomNoForProduct(String.valueOf(request.getParameter("subid")));
		for(int i = 0; i < list.size() ; i++){
			String bomid = list.get(i).getOrderBomBase().getId();
			List<DataTrackDetail>  yylist= datatrackService.getDetailProduct("10",bomid);
			List<Integer>  templist= new ArrayList<Integer>();
			if(yylist != null){
				for(DataTrackDetail e:yylist){
					if(e != null){
						templist.add(Integer.parseInt(e.getStatus()));
						list.get(i).setOrderBomBase(e.getOrderBomBase());
					}else{
						continue;
					}
				}
				if(null != templist && templist.size()>0){
					Collections.sort(templist);
					list.get(i).setStatus(String.valueOf(templist.get(0)));
				}
			}
		}
		model.addAttribute("list",list);
		return "modules/datatrack/productDocument";
	}
	
	
	@RequestMapping(value = "trackPurchase")
	public String trackPurchase(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<DataTrackDetail> list = new ArrayList<DataTrackDetail>();
		list = datatrackService.getBaseBomNoForPurchase(String.valueOf(request.getParameter("subid")));
		for(int i = 0; i < list.size() ; i++){
			String bomid = list.get(i).getOrderBomBase().getId();
			List<DataTrackDetail>  yylist= datatrackService.getDetailPurchase("10",bomid);
			List<Integer>  templist= new ArrayList<Integer>();
			if(yylist != null){
				for(DataTrackDetail e:yylist){
					if(e != null){
						templist.add(Integer.parseInt(e.getStatus()));
						list.get(i).setOrderBomBase(e.getOrderBomBase());
					}else{
						continue;
					}
				}
				if(null != templist && templist.size()>0){
					Collections.sort(templist);
					list.get(i).setStatus(String.valueOf(templist.get(0)));
				}
			}
		}
		model.addAttribute("list",list);
		return "modules/datatrack/purchaseDocument";
	}
	
	
	@RequestMapping(value = {"getProductDetailByBaseBomID"})
	@ResponseBody
	public Map<String,Object> getProductDetailByBaseBomID(HttpServletRequest request,HttpServletResponse response) {
		//获取下料单ID
		String obbId = request.getParameter("obbID");
		String status = request.getParameter("status");
		//查询相应的列表详情数据
		List<DataTrackDetail> list = datatrackService.getDetailProduct(status,obbId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = {"getPurchaseDetailByBaseBomID"})
	@ResponseBody
	public Map<String,Object> getDetailByObbID(HttpServletRequest request,HttpServletResponse response) {
		String obbID = request.getParameter("obbID");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setId(obbID);
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obdetail");
		purchaseDemand.setOrderBomBase(orderBomBase);
		//需显示列表数据
		List<String> ids = new ArrayList<String>();
		List<PurchaseDemand> pds = purchaseDemandService.getListForDatatrack(purchaseDemand);
		for(PurchaseDemand p:pds){	//组装对应的ids
			ids.add(p.getId());
		}
		Map<String,Integer> mapSC = purchaseDemandAssignService.getAlreadySumCount(ids,"");	//已经指派的数量
		Map<String,Integer> mapRC = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_YYZG);	//可驳回的数量
		Map<String,Integer> mapCG = purchaseDemandAssignService.getAlreadySumCount(ids,CommonStatus.PURCHASE_DZP_CGZG);	//指派总量（运营已下单数量）
		
		Map<String,String> mapAssignLog = purchaseDemandAssignService.getAssignLog(ids);	//指派记录
		Map<String,Integer> mapPC = purchaseService.getPurchaseCountByDemandIds(ids);
		Map<String,PurchaseSFDetail> mapSF = purchaseService.getSFCountByDemandIds(ids);
		
		//设置返回数据
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mapSC", mapSC);
		map.put("mapRC", mapRC);
		map.put("mapCG", mapCG);
		map.put("mapPC", mapPC);
		map.put("mapSF", mapSF);
		map.put("mapAssignLog", mapAssignLog);
		map.put("list", pds);
		return map;
	}
	
}
