/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bt.modules.accident.entity.*;
import com.bt.modules.activiti.entities.WFOperationResult;
import com.bt.modules.factory.entity.ManufPerson;
import com.bt.modules.factory.service.ManufPersonService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.DesignDirectorBuildnoMappingService;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.entity.Purchase;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.service.SupplierService;
import com.thinkgem.jeesite.common.supcan.common.Common;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.modules.accident.service.AccidentManageDetailService;
import com.bt.modules.accident.service.AccidentManageService;
import com.bt.modules.accident.service.AccidentRatioService;
import com.bt.modules.accident.service.AccidentShareMoneyService;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.logistics.entity.LogisticsSend;
import com.bt.modules.logistics.service.LogisticsSendService;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;

/**
 * 事故管理Controller
 * @author pc
 * @version 2015-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/accident/accidentManage")
public class AccidentManageController extends BaseController {

	@Autowired
	private AccidentManageDetailService accidentManageDetailService;
	@Autowired
	private AccidentManageService accidentManageService;
	@Autowired
	private AccidentShareMoneyService accidentShareMoneyService;
	@Autowired 
	private LogisticsSendService logisticsSendService;
	@Autowired
	private AccidentRatioService accidentRatioService;
	@Autowired
	private OrderBomDetailService orderBomDetailService;
	@Autowired
	private ActTaskService actTaskService;		//流程

	@Autowired
	private ProjectService projectService;
	@Autowired
	private OrderBomBaseService orderBomBaseService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private DesignDirectorBuildnoMappingService designDirectorBuildnoMappingService;
	@Autowired
	private ActAccessTaskDirectService actService;
	@Autowired
	private ManufPersonService manufPersonService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private SupplierService supplierService;

	@ModelAttribute
	public AccidentManage get(@RequestParam(required=false) String id) {
		AccidentManage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accidentManageService.get(id);
		}
		if (entity == null){
			entity = new AccidentManage();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(AccidentManage accidentManage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<AccidentManage> page = accidentManageService.findPage(new Page<AccidentManage>(request, response), accidentManage); 
		model.addAttribute("page", page);
		model.addAttribute("accidentManage", accidentManage);
		return "modules/accident/accidentManageList";
	}

	/**
	 * 新增 跳转
	 * @param accidentManage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(AccidentManage accidentManage, Model model) {
		String returnUrl = "modules/accident/accidentManageForm";
		if(CommonConstant.ACCIDENT_SC_COLLECT.equals(accidentManage.getType())){
			List<AccidentShareMoney> asmList = new ArrayList<AccidentShareMoney>();
			AccidentShareMoney asm1 = new AccidentShareMoney();
			asm1.setDepartment("项目部");
			asmList.add(asm1);
			AccidentShareMoney asm2 = new AccidentShareMoney();
			asm2.setDepartment("物流");
			asmList.add(asm2);
			AccidentShareMoney asm3 = new AccidentShareMoney();
			asm3.setDepartment("加工厂");
			asmList.add(asm3);
			accidentManage.setAsmList(asmList);
			returnUrl = "modules/accident/accidentSCCollectForm";
			LogisticsSend ls = new LogisticsSend();
			ls.setStatus(CommonStatus.LOGISTICS_YFH);//此处要根据发货单那边做出相应改变  目前去完全发货状态的单
			model.addAttribute("logisticsSendList", logisticsSendService.getListToAccident(ls));
		}else if(CommonConstant.ACCIDENT_GFC_COLLECT.equals(accidentManage.getType())){
			returnUrl = "modules/accident/accidentGFCCollectForm";
			List<String> purchaseSeries = purchaseService.getUniqueIdentifies(CommonStatus.PURCHASE_YFH);
			model.addAttribute("purchaseSeries", purchaseSeries);

			//获取事故比例分摊金额
			List<AccidentShareMoney> asmList = new ArrayList<AccidentShareMoney>();
			AccidentShareMoney asmProject = new AccidentShareMoney();
			asmProject.setDepartment("项目部");
			asmList.add(asmProject);
			AccidentShareMoney asmSupplier = new AccidentShareMoney();
			asmSupplier.setDepartment("供应商");
			asmList.add(asmSupplier);
			AccidentShareMoney asmLogistics = new AccidentShareMoney();
			asmLogistics.setDepartment("物流");
			asmList.add(asmLogistics);
			accidentManage.setAsmList(asmList);
		}else if(CommonConstant.ACCIDENT_SC_SELL.equals(accidentManage.getType())){
			returnUrl = "modules/accident/accidentSCSellForm";
			List<Project> projects = buildDropdownProjectData();
			model.addAttribute("projects", projects);

			//获取事故比例分摊金额
			List<AccidentShareMoney> asmList = new ArrayList<AccidentShareMoney>();
			AccidentShareMoney asmProject = new AccidentShareMoney();
			asmProject.setDepartment("项目部");
			asmList.add(asmProject);
			AccidentShareMoney asmDesign = new AccidentShareMoney();
			asmDesign.setDepartment("设计");
			asmList.add(asmDesign);
			AccidentShareMoney asmGroup = new AccidentShareMoney();
			asmGroup.setDepartment("班组");
			asmList.add(asmGroup);
			AccidentShareMoney asmManufactory = new AccidentShareMoney();
			asmManufactory.setDepartment("加工厂");
			asmList.add(asmManufactory);
			accidentManage.setAsmList(asmList);

		}else if(CommonConstant.ACCIDENT_GFC_SELL.equals(accidentManage.getType())){
			returnUrl = "modules/accident/accidentGFCSellForm";
			List<Project> projects = buildDropdownProjectData();
			model.addAttribute("projects", projects);

			//获取事故比例分摊金额
			List<AccidentShareMoney> asmList = new ArrayList<AccidentShareMoney>();
			AccidentShareMoney asmProject = new AccidentShareMoney();
			asmProject.setDepartment("项目部");
			asmList.add(asmProject);
			AccidentShareMoney asmDesign = new AccidentShareMoney();
			asmDesign.setDepartment("设计");
			asmList.add(asmDesign);
			AccidentShareMoney asmGroup = new AccidentShareMoney();
			asmGroup.setDepartment("班组");
			asmList.add(asmGroup);
			AccidentShareMoney asmManufactory = new AccidentShareMoney();
			asmManufactory.setDepartment("供应商");
			asmList.add(asmManufactory);
			accidentManage.setAsmList(asmList);

		}
		model.addAttribute("flag", "add");
		model.addAttribute("accidentManage", accidentManage);
		return returnUrl;
	}


	/**
	 * 从其他模块发起石材收货事故
	 * @param logisticSendId 发货单id
	 * @return
	 */
	@RequestMapping(value = "startupSCReceiveAccident/{logisticSendId}", method = RequestMethod.GET)
	public String startupSCReceiveAccidentFromOtherModule(@PathVariable String logisticSendId, Model model){
		AccidentManage accidentManage = new AccidentManage();
		accidentManage.setType(CommonConstant.ACCIDENT_SC_COLLECT);
		accidentManage.setOrderId(logisticSendId);
		LogisticsSend logisticsSend = logisticsSendService.get(accidentManage.getOrderId());
		accidentManage.setRequireDate(logisticsSend.getRequireDate());
		accidentManage.setAccientNo(logisticsSend.getSeriesnumber());
		return form(accidentManage, model);
	}

	/**
	 * 从其他模块发起钢辅材收货事故
	 * @param purchaseNO
	 * @return
	 */
	@RequestMapping(value = "startupGFCReceiveAccident/{purchaseNO}", method = RequestMethod.GET)
	public String startupGFCReceiveAccidentFromOtherModule(@PathVariable String purchaseNO, Model model){
		AccidentManage accidentManage = new AccidentManage();
		accidentManage.setOrderId(purchaseNO);
		accidentManage.setType(CommonConstant.ACCIDENT_GFC_COLLECT);
		return form(accidentManage, model);
	}

	/**
	 * 编辑/查看 跳转
	 * @param accidentManage
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "edit")
	public String edit(AccidentManage accidentManage, Model model) {
		String returnUrl = "modules/accident/accidentManageForm";
		if(CommonConstant.ACCIDENT_SC_COLLECT.equals(accidentManage.getType())){
			initializeEditFormForSCCollect(accidentManage, model);
			returnUrl = "modules/accident/accidentSCCollectForm";
		}else if(CommonConstant.ACCIDENT_GFC_COLLECT.equals(accidentManage.getType())){
			initializeEditFormForGFCCollect(accidentManage, model);
			returnUrl = "modules/accident/accidentGFCCollectForm";
		}else if(CommonConstant.ACCIDENT_SC_SELL.equals(accidentManage.getType())){
			intializeEditFormForSCSell(accidentManage, model);
			returnUrl = "modules/accident/accidentSCSellForm";
		}else if(CommonConstant.ACCIDENT_GFC_SELL.equals(accidentManage.getType())){
			initializeEditFormForGFCSell(accidentManage, model);
			returnUrl = "modules/accident/accidentGFCSellForm";
		}
		model.addAttribute("flag", "edit");
		model.addAttribute("accidentManage", accidentManage);
		return returnUrl;
	}

	/**
	 * 初始化刚辅材销售事故编辑页面
	 * @param accidentManage
	 * @param model
	 */
	private void initializeEditFormForGFCSell(AccidentManage accidentManage, Model model){
		//事故比例分摊金额
		AccidentShareMoney asm = new AccidentShareMoney();
		asm.setAccidentManageId(accidentManage.getId());
		List<AccidentShareMoney> asmList = accidentShareMoneyService.findList(asm);
		accidentManage.setAsmList(asmList);
		//明细
		AccidentManageDetail amd = new AccidentManageDetail();
		amd.setAccidentManageId(accidentManage.getId());
		List<AccidentManageDetail> list = accidentManageDetailService.findList(amd);
		List<AccidentManageDetail> amdList = new ArrayList<AccidentManageDetail>();
		if(list != null && list.size() > 0){
			for(AccidentManageDetail detail : list){
				if(detail != null){
					//事故比例
					AccidentRatio accidentRatio = new AccidentRatio();
					accidentRatio.setAccidentType(CommonConstant.ACCIDENT_GFC_SELL);
					accidentRatio.setAccidentDetailTypeId(detail.getAccidentTypeId());
					List<AccidentRatio> arList = accidentRatioService.findList(accidentRatio);
					for(AccidentRatio ar : arList){
						detail.setShowtype(ar.getAccidentDetailType());
						if(ar != null){
							if("项目部".equals(ar.getRespPart())){
								detail.setXmb(ar.getRatio());
							}else if("设计".equals(ar.getRespPart())){
								detail.setSj(ar.getRatio());
							}else if("班组".equals(ar.getRespPart())){
								detail.setBz(ar.getRatio());
							}else if("供应商".equals(ar.getRespPart())){
								detail.setJgc(ar.getRatio());
							}
						}
					}
					amdList.add(detail);
				}
			}
		}
		accidentManage.setAmdList(amdList);

		//项目列表
		List<Project> projects = buildDropdownProjectData();
		model.addAttribute("projects", projects);

		Subproject subproject = subProjectService.get(accidentManage.getSubProjId());
		accidentManage.setBuildingDisplayName(subproject.getBuildingDisplayName());

		//获取下料单号
		OrderBomBase order = orderBomBaseService.get(accidentManage.getOrderId());
		model.addAttribute("order", order);
	}

	/**
	 * 初始化刚辅材收货事故编辑页面
	 * @param accidentManage
	 */
	private void initializeEditFormForGFCCollect(AccidentManage accidentManage, Model model){
		//事故比例分摊金额
		AccidentShareMoney asm = new AccidentShareMoney();
		asm.setAccidentManageId(accidentManage.getId());
		List<AccidentShareMoney> asmList = accidentShareMoneyService.findList(asm);
		accidentManage.setAsmList(asmList);
		//明细
		AccidentManageDetail amd = new AccidentManageDetail();
		amd.setAccidentManageId(accidentManage.getId());
		List<AccidentManageDetail> list = accidentManageDetailService.findList(amd);
		List<AccidentManageDetail> amdList = new ArrayList<AccidentManageDetail>();
		if(list != null && list.size() > 0){
			for(AccidentManageDetail detail : list){
				if(detail != null){
					//事故比例
					AccidentRatio accidentRatio = new AccidentRatio();
					accidentRatio.setAccidentType(CommonConstant.ACCIDENT_GFC_COLLECT);
					accidentRatio.setAccidentDetailTypeId(detail.getAccidentTypeId());
					List<AccidentRatio> arList = accidentRatioService.findList(accidentRatio);
					for(AccidentRatio ar : arList){
						detail.setShowtype(ar.getAccidentDetailType());
						if(ar != null){
							if("项目部".equals(ar.getRespPart())){
								detail.setXmb(ar.getRatio());
							}else if("物流".equals(ar.getRespPart())){
								detail.setWl(ar.getRatio());
							}else if("供应商".equals(ar.getRespPart())){
								detail.setGys(ar.getRatio());
							}
						}
					}
					amdList.add(detail);
				}
			}
		}
		accidentManage.setAmdList(amdList);

		List<String> purchaseSeries = purchaseService.getUniqueIdentifies(CommonStatus.PURCHASE_YFH);
		model.addAttribute("purchaseSeries", purchaseSeries);
	}

	/**
	 * 初始化石材收货事故编辑页面
	 * @param accidentManage
	 */
	private void initializeEditFormForSCCollect(AccidentManage accidentManage, Model model){
		//事故比例分摊金额
		AccidentShareMoney asm = new AccidentShareMoney();
		asm.setAccidentManageId(accidentManage.getId());
		List<AccidentShareMoney> asmList = accidentShareMoneyService.findList(asm);
		accidentManage.setAsmList(asmList);
		//明细
		AccidentManageDetail amd = new AccidentManageDetail();
		amd.setAccidentManageId(accidentManage.getId());
		List<AccidentManageDetail> list = accidentManageDetailService.findList(amd);
		List<AccidentManageDetail> amdList = new ArrayList<AccidentManageDetail>();
		if(list != null && list.size() > 0){
			for(AccidentManageDetail detail : list){
				if(detail != null){
					//事故比例
					AccidentRatio accidentRatio = new AccidentRatio();
					accidentRatio.setAccidentType(CommonConstant.ACCIDENT_SC_COLLECT);
					accidentRatio.setAccidentDetailTypeId(detail.getAccidentTypeId());
					List<AccidentRatio> arList = accidentRatioService.findList(accidentRatio);
					for(AccidentRatio ar : arList){
						detail.setShowtype(ar.getAccidentDetailType());
						if(ar != null){
							if("项目部".equals(ar.getRespPart())){
								detail.setXmb(ar.getRatio());
							}else if("物流".equals(ar.getRespPart())){
								detail.setWl(ar.getRatio());
							}else if("加工厂".equals(ar.getRespPart())){
								detail.setJgc(ar.getRatio());
							}
						}
					}
					amdList.add(detail);
				}
			}
		}
		accidentManage.setAmdList(amdList);
		//发货通知单
		LogisticsSend ls = new LogisticsSend();
		ls.setStatus(CommonStatus.LOGISTICS_YFH);
		model.addAttribute("logisticsSendList", logisticsSendService.getListToAccident(ls));
		LogisticsSend l = logisticsSendService.get(accidentManage.getOrderId());
		if(l != null){
			accidentManage.setSendCC((l.getSeriesnumber()).substring((l.getSeriesnumber()).length()-2));
			accidentManage.setRequireDate(l.getRequireDate());
			accidentManage.setFactSendDate(l.getFactSendDate());
		}
	}

	/**
	 * 初始化石材销售编辑页面
	 * @param accidentManage
	 */
	private void intializeEditFormForSCSell(AccidentManage accidentManage, Model model){
		//事故比例分摊金额
		AccidentShareMoney asm = new AccidentShareMoney();
		asm.setAccidentManageId(accidentManage.getId());
		List<AccidentShareMoney> asmList = accidentShareMoneyService.findList(asm);
		accidentManage.setAsmList(asmList);
		//明细
		AccidentManageDetail amd = new AccidentManageDetail();
		amd.setAccidentManageId(accidentManage.getId());
		List<AccidentManageDetail> list = accidentManageDetailService.findList(amd);
		List<AccidentManageDetail> amdList = new ArrayList<AccidentManageDetail>();
		if(list != null && list.size() > 0){
			for(AccidentManageDetail detail : list){
				if(detail != null){
					//事故比例
					AccidentRatio accidentRatio = new AccidentRatio();
					accidentRatio.setAccidentType(CommonConstant.ACCIDENT_SC_SELL);
					accidentRatio.setAccidentDetailTypeId(detail.getAccidentTypeId());
					List<AccidentRatio> arList = accidentRatioService.findList(accidentRatio);
					for(AccidentRatio ar : arList){
						detail.setShowtype(ar.getAccidentDetailType());
						if(ar != null){
							if("项目部".equals(ar.getRespPart())){
								detail.setXmb(ar.getRatio());
							}else if("设计".equals(ar.getRespPart())){
								detail.setSj(ar.getRatio());
							}else if("班组".equals(ar.getRespPart())){
								detail.setBz(ar.getRatio());
							}else if("加工厂".equals(ar.getRespPart())){
								detail.setJgc(ar.getRatio());
							}
						}
					}
					amdList.add(detail);
				}
			}
		}
		accidentManage.setAmdList(amdList);

		//项目列表
		List<Project> projects = buildDropdownProjectData();
		model.addAttribute("projects", projects);

		Subproject subproject = subProjectService.get(accidentManage.getSubProjId());
		accidentManage.setBuildingDisplayName(subproject.getBuildingDisplayName());

		//获取下料单号
		OrderBomBase order = orderBomBaseService.get(accidentManage.getOrderId());
		model.addAttribute("order", order);
	}


	/**
	 * 构造项目下拉选择框的填充数据
	 * @return
	 */
	private List<Project> buildDropdownProjectData(){
		List<Project> projects = projectService.findAllApprovaledProjects();
		Project projectHint = new Project();
		projectHint.setName("--请选择项目--");
		projects.add(0, projectHint);
		return projects;
	}

	
	/**
	 * 根据发货单ID获取箱的数据
	 * @return
	 */
	@RequestMapping(value = "getBoxsBylsID")
	@ResponseBody
	public List<Map<String,Object>> getBoxsBylsID(HttpServletRequest request, HttpServletResponse response){
		String lsID = request.getParameter("lsID");
		List<Map<String, Object>> listBox = logisticsSendService.getBoxsBylsID(lsID);
		return listBox;
	}
	
	/**
	 * 根据下料单ID和箱号获取下料单明细的数据
	 * @return
	 */
	@RequestMapping(value = "getOrderBomDetailByOrderID")
	@ResponseBody
	public List<OrderBomDetail> getOrderBomDetailByOrderID(OrderBomDetail orderBomDetail,HttpServletRequest request, HttpServletResponse response){
		List<OrderBomDetail> list = orderBomDetailService.findList(orderBomDetail);
		return list;
	}
	
	/**
	 * 事故细分类型类型
	 * @return
	 */
	@RequestMapping(value = "getUniqueAccidentType")
	@ResponseBody 
	public List<AccidentRatio> getUniqueAccidentType(AccidentRatio accidentRatio,HttpServletRequest request, HttpServletResponse response){
		List<AccidentRatio> list = accidentRatioService.findUniqueAccidentType(accidentRatio);
		return list;
	}

	/**
	 * 事故类型
	 * @return
	 */
	@RequestMapping(value = "getAccidentType")
	@ResponseBody
	public List<AccidentRatio> getAccidentType(AccidentRatio accidentRatio,HttpServletRequest request, HttpServletResponse response){
		List<AccidentRatio> list = accidentRatioService.findList(accidentRatio);
		return list;
	}

	
	@RequestMapping(value = "save")
	@Transactional(readOnly = false)
	public String save(AccidentManage accidentManage, Model model, RedirectAttributes redirectAttributes) {
		String amId = IdGen.uuid();
		accidentManage.setId(amId);
		accidentManage.setCreateUser(UserUtils.getUser().getName());
		accidentManage.setCreateDate(new Date());
		accidentManageService.insert(accidentManage);
		List<AccidentShareMoney> asmList = accidentManage.getAsmList();
		if(asmList != null &&asmList.size() > 0){
			for(AccidentShareMoney asm:asmList){
				if(asm != null){
					asm.setAccidentManageId(amId);
					accidentShareMoneyService.save(asm);
				}
			}
		}
		List<AccidentManageDetail> amdList = accidentManage.getAmdList();
		if(amdList != null && amdList.size() > 0){
			for(AccidentManageDetail amd:amdList){
				if(amd != null){
					amd.setAccidentManageId(amId);
					accidentManageDetailService.save(amd);
				}
				
			}
		}
		addMessage(redirectAttributes, "保存成功");
//		return "redirect:"+Global.getAdminPath()+"/accident/accidentManage/?repage";
		return "redirect:" + adminPath + "/accident/accidentManage/edit?id="+amId;
	}
	
	@RequestMapping(value = "update")
	@Transactional(readOnly = false)
	public String update(AccidentManage accidentManage,HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		accidentManage.setUpdateBy(UserUtils.getUser());
		accidentManage.setUpdateDate(new Date());
		accidentManageService.save(accidentManage);
		
		List<AccidentShareMoney> asmList = accidentManage.getAsmList();
		if(asmList != null &&asmList.size() > 0){
			for(AccidentShareMoney asm:asmList){
				accidentShareMoneyService.save(asm);
			}
		}


		if(accidentManage.getType().equals(CommonConstant.ACCIDENT_GFC_COLLECT) ||
				accidentManage.getType().equals(CommonConstant.ACCIDENT_GFC_SELL)){
			updateGFCDetail(accidentManage);
		}else{
			updateSCDetail(accidentManage);
		}

		String delId =request.getParameter("delId");
		if(StringUtils.isNotEmpty(delId)){
			String[] array =delId.split(",");
			if(array !=null && array.length>0){
				for(int i=0;i<array.length;i++){
					AccidentManageDetail amd = new AccidentManageDetail();
					amd.setId(array[i]);
					accidentManageDetailService.delete(amd);
				}
			}
		}
		addMessage(redirectAttributes, "保存成功");
		return "redirect:" + adminPath + "/accident/accidentManage/edit?id="+accidentManage.getId();
	}


	/**
	 * 更新钢辅材的事故明细
	 * @param accidentManage
	 */
	private void updateGFCDetail(AccidentManage accidentManage){
		List<AccidentManageDetail> amdList = accidentManage.getAmdList();
		if(amdList != null && amdList.size() > 0){
			for(AccidentManageDetail amd:amdList){
				if(StringUtils.isEmpty(amd.getId()) && StringUtils.isNotEmpty(amd.getMaterielName()) && StringUtils.isNotEmpty(amd.getStandardDesc())){
					//添加明细
					amd.setAccidentManageId(accidentManage.getId());
					accidentManageDetailService.save(amd);
				}else if(StringUtils.isNotEmpty(amd.getId())){
					//修改明细
					accidentManageDetailService.update(amd);
				}
			}
		}
	}


	/**
	 * 更新石材的事故明细
	 * @param accidentManage
	 */
	private void updateSCDetail(AccidentManage accidentManage){
		List<AccidentManageDetail> amdList = accidentManage.getAmdList();
		if(amdList != null && amdList.size() > 0){
			for(AccidentManageDetail amd:amdList){
				if(StringUtils.isEmpty(amd.getId()) && StringUtils.isNotEmpty(amd.getBoxNo()) && StringUtils.isNotEmpty(amd.getMaterielNo())){
					//添加明细
					amd.setAccidentManageId(accidentManage.getId());
					accidentManageDetailService.save(amd);
				}else if(StringUtils.isNotEmpty(amd.getId())){
					//修改明细
					accidentManageDetailService.update(amd);
				}
			}
		}
	}

	
	@RequestMapping(value = "delete")
	@Transactional(readOnly = false)
	public String delete(AccidentManage accidentManage,HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String accidentIds =request.getParameter("accidentId");
		String accidentType =request.getParameter("accidentType");
		String[] array =accidentIds.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				AccidentManage am = new AccidentManage();
				am.setId(array[i]);
				accidentManageService.delete(am);
				
				AccidentManageDetail amd = new AccidentManageDetail();
				amd.setAccidentManageId(array[i]);
				accidentManageDetailService.deleteByamId(amd);
				
				AccidentShareMoney asm = new AccidentShareMoney();
				asm.setAccidentManageId(array[i]);
				accidentShareMoneyService.deleteByamId(asm);
			}
		}
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/accident/accidentManage/list?type="+accidentType;
	}

	/**
	 * 提交(开始流程)
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "startWorkflow")
	@Transactional(readOnly = false)
	public WFOperationResult startWorkflow(HttpServletRequest request,HttpServletResponse response,Model model) {
		String accidentId = request.getParameter("accidentId");
		String auditProcess = request.getParameter("auditProcess"); //审核类型
		AccidentManage accidentManage = accidentManageService.get(accidentId);

		StringBuilder errorMessage = new StringBuilder();
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, AccidentManageService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, accidentId);
		String actID = null;
		Project project;
		if(CommonConstant.ACCIDENT_SC_COLLECT.equals(accidentManage.getType()) || CommonConstant.ACCIDENT_SC_SELL.equals(accidentManage.getType())){
			//石材
			String orderId = null;
			if(CommonConstant.ACCIDENT_SC_COLLECT.equals(accidentManage.getType())){
				//石材收货事故
				AccidentManageDetail detail = accidentManageDetailService.findOnlyOne(accidentId);
				orderId = detail.getOrderBomBaseId();
			}else{
				//石材销售事故
				orderId =accidentManage.getOrderId();
			}
			OrderBomBase orderBomBase = orderBomBaseService.get(orderId);
			Subproject subproject = subProjectService.get(orderBomBase.getSubProjId());
			project = projectService.get(subproject.getProjectId());

			if(StringUtils.isEmpty(project.getProjectManagerBid())){
				errorMessage.append("项目负责人不能为空").append("\n");
			}
			if(StringUtils.isEmpty(project.getRegionalManagerBid())){
				errorMessage.append("区域经理不能为空").append("\n");
			}
			if(StringUtils.isEmpty(project.getOperationSpecialistBid())){
				errorMessage.append("运营专员不能为空").append("\n");
			}
			if(StringUtils.isEmpty(subproject.getDesigner())){
				errorMessage.append("设计师不能为空").append("\n");
			}
			if(StringUtils.isEmpty(project.getCoordinatorLeaderBid())){
				errorMessage.append("运营主管不能为空").append("\n");
			}
			if(StringUtils.isEmpty(subproject.getDesignLeaderBid())){
				errorMessage.append("设计主管不能为空").append("\n");
			}

			if(errorMessage.length()==0){
				variable.put("project_responsible_people", UserUtils.get(project.getProjectManagerBid()).getLoginName());
				variable.put("area_manager", UserUtils.get(project.getRegionalManagerBid()).getLoginName());
				variable.put("operation_specialist", UserUtils.get(project.getOperationSpecialistBid()).getLoginName());
				variable.put("designer", UserUtils.get(subproject.getDesigner()).getLoginName());
				variable.put("operation_director", UserUtils.get(project.getCoordinatorLeaderBid()).getLoginName());

				User user = systemService.getUser(subproject.getDesignLeaderBid());
				variable.put("design_director", user.getLoginName());
				actID = actTaskService.startProcess("SaleAccidentStoneAuditFlow", "btg_accident_manage",
						"workflow_id","",variable);
			}

		}else if(CommonConstant.ACCIDENT_GFC_COLLECT.equals(accidentManage.getType()) || CommonConstant.ACCIDENT_GFC_SELL.equals(accidentManage.getType())){

			Purchase purchase = null;
			OrderBomBase orderBomBase = null;
			if(CommonConstant.ACCIDENT_GFC_COLLECT.equals(accidentManage.getType())){
				AccidentManageDetail accidentManageDetail = accidentManageDetailService.findOnlyOne(accidentId);
				orderBomBase = orderBomBaseService.get(accidentManageDetail.getOrderBomBaseId());
				purchase = purchaseService.get(accidentManageDetail.getPurchaseId());
			}else{
				orderBomBase = orderBomBaseService.get(accidentManage.getOrderId());
				purchase = purchaseService.getOnePurchaseByOrderId(accidentManage.getOrderId());
			}

			Subproject subproject = subProjectService.get(orderBomBase.getSubProjId());
			project = projectService.get(subproject.getProjectId());

			Supplier supplier = supplierService.get(purchase.getSupp().getId());
			//钢辅材
			if(CommonConstant.AUDIT_PROCESS_DESIGN.equals(auditProcess)){

				if(StringUtils.isEmpty(project.getProjectManagerBid())){
					errorMessage.append("项目负责人不能为空").append("\n");
				}
				if(StringUtils.isEmpty(project.getRegionalManagerBid())){
					errorMessage.append("区域经理不能为空").append("\n");
				}
				if(StringUtils.isEmpty(project.getOperationSpecialistBid())){
					errorMessage.append("运营专员不能为空").append("\n");
				}
				if(StringUtils.isEmpty(project.getCoordinatorLeaderBid())){
					errorMessage.append("运营主管不能为空").append("\n");
				}
				if(StringUtils.isEmpty(purchase.getPurchaseby().getId())){
					errorMessage.append("采购员不能为空").append("\n");
				}
				if(StringUtils.isEmpty(supplier.getBusinessPreson())){
					errorMessage.append("供应商不能为空").append("\n");
				}
				if(StringUtils.isEmpty(subproject.getDesigner())){
					errorMessage.append("设计师不能为空").append("\n");
				}
				if(StringUtils.isEmpty(subproject.getDesignLeaderBid())){
					errorMessage.append("设计主管不能为空").append("\n");
				}

				if(errorMessage.length()==0){
					//设计审核
					variable.put("project_responsible_people", UserUtils.get(project.getProjectManagerBid()).getLoginName());
					variable.put("area_manager", UserUtils.get(project.getRegionalManagerBid()).getLoginName());
					variable.put("operation_specialist", UserUtils.get(project.getOperationSpecialistBid()).getLoginName());
					variable.put("operation_director", UserUtils.get(project.getCoordinatorLeaderBid()).getLoginName());
					variable.put("purchaser", UserUtils.get(purchase.getPurchaseby().getId()).getLoginName());
					variable.put("supplier", UserUtils.get(supplier.getBusinessPreson()).getLoginName());
					variable.put("designer", UserUtils.get(subproject.getDesigner()).getLoginName());
					variable.put("design_director", UserUtils.get(subproject.getDesignLeaderBid()).getLoginName());

					actID = actTaskService.startProcess("SaleAccidentGFCDesignAuditFlow", "btg_accident_manage", "workflow_id","",variable);
				}

			}else if(CommonConstant.AUDIT_PROCESS_SUPPLIER.equals(auditProcess)){
				if(StringUtils.isEmpty(project.getOperationSpecialistBid())){
					errorMessage.append("运营专员不能为空").append("\n");
				}
				if(StringUtils.isEmpty(project.getCostManagerBid())){
					errorMessage.append("成本工程师不能为空").append("\n");
				}
				if(StringUtils.isEmpty(supplier.getBusinessPreson())){
					errorMessage.append("供应商联系人").append("\n");
				}

				if(errorMessage.length()==0) {
					//供应商审核
					variable.put("operation_specialist", UserUtils.get(project.getOperationSpecialistBid()).getLoginName());
					variable.put("costing_engineer", UserUtils.get(project.getCostManagerBid()).getLoginName());
					variable.put("supplier_contactor", UserUtils.get(supplier.getBusinessPreson()).getLoginName());
					actID = actTaskService.startProcess("SaleAccidentGPCAuditFlow", "btg_accident_manage", "workflow_id", "", variable);
				}
			}
		}

		if(actID != null) {
			accidentManage.setWorkflowid(actID);
			accidentManage.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
			accidentManageService.updateWorkflowId(accidentManage);
			return new WFOperationResult("流程启动成功", WFOperationResult.SUCCESSFUL);
		}else{
			return new WFOperationResult(errorMessage.toString(), WFOperationResult.FAIL);
		}

	}



	/**
	 * 完成task
	 * @return
	 */
	@RequestMapping(value = "act/complete", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String completeTask(@RequestBody AccidentCompleteTaskParam param){
		String userId = UserUtils.getUser().getLoginName();
		Map<String, String> variables = new HashMap<String, String>();
		variables.put(ActivitiConstants.APPROVAL_RESULT_VARIABLE,param.getApproval());
		variables.put(ActivitiConstants.REJECT_BACK_REASON, param.getRejectBackReason());
		if(org.springframework.util.StringUtils.hasLength(param.getManufactory())){
			ManufPerson manufPerson = manufPersonService.get(param.getManufactory());
			variables.put("produceManager", UserUtils.get(manufPerson.getManager()).getLoginName());
			variables.put("manufactory", UserUtils.get(manufPerson.getPrincipal()).getLoginName());
			variables.put("orderTracePeople", UserUtils.get(manufPerson.getTracer()).getLoginName());
		}
		actService.completeTask(param.getProcessInstanceId(), userId, variables);
		return "true";
	}

	@RequestMapping(value = "getOrderDetailByPurchaseNO/{seriesNumber}", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderBomDetail> getOrderDetailByPurchaseNO(@PathVariable String seriesNumber){
		return purchaseService.getOrderDetailByPurchaseNO(seriesNumber);
	}

	@RequestMapping(value = "getOnePurchaseBySeriesNumber/{seriesNumber}", method = RequestMethod.GET)
	@ResponseBody
	public Purchase getOnePurchaseBySeriesNumber(@PathVariable String seriesNumber){
		return purchaseService.getOnePurchaseBySeriesNumber(seriesNumber);
	}

}