/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ProcessDefinitionKeyEnum;
import com.bt.modules.activiti.entities.WFOperationResult;
import com.bt.modules.activiti.support.VariablesBuilder;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.Execution;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.entity.Laboritems;
import com.bt.modules.contract.service.BtgConJiaContractDetailService;
import com.bt.modules.contract.service.ExecutionService;
import com.bt.modules.contract.service.LaborcontractService;
import com.bt.modules.contract.service.LaboritemsService;
import com.bt.modules.finance.entity.LaborSettlement;
import com.bt.modules.finance.service.LaborSettlementService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonStatus;

/**
 * 劳务结算Controller
 * @author yhh
 * @version 2015-12-15
 */
@Controller
@RequestMapping(value = "${adminPath}/finance/laborSettlement")
public class LaborSettlementController extends BaseController {

	@Autowired
	private LaborSettlementService laborSettlementService;
	@Autowired
	private LaborcontractService laborContractService;
	@Autowired
	private LaboritemsService laborItemsService;
	@Autowired
	private BtgConJiaContractDetailService jiaContractDetailService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private ActTaskService actTaskService;
	//注入二级项目信息
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private ExecutionService executionService;
	
	@ModelAttribute
	public LaborSettlement get(@RequestParam(required=false) String id) {
		LaborSettlement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laborSettlementService.get(id);
		}
		if (entity == null){
			entity = new LaborSettlement();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LaborSettlement laborSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		return findMylaborSettlement(laborSettlement, request, response, model);
	}
	
	
	@RequestMapping(value = "allList")
	public String listVerify( LaborSettlement laborSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborSettlement> page = laborSettlementService.findPage(new Page<LaborSettlement>(request, response), laborSettlement); 
		for(LaborSettlement l : page.getList()){
			l.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(l.getLaborContract().getProjectId(), l.getBuilding()));
		}
		model.addAttribute("page", page);	
		return "modules/finance/laborSettlementList";
	}
	/**
	 * 查看我创建的劳务合同
	 * 注：当前用户创建且没有提交的数据
	 * @param laborSettlement
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findMylaborSettlement")
	public String findMylaborSettlement( LaborSettlement laborSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		laborSettlement.setCreateBy(UserUtils.getUser());
		Page<LaborSettlement> page = laborSettlementService.findMylaborSettlement(new Page<LaborSettlement>(request, response), laborSettlement); 
		for(LaborSettlement l : page.getList()){
			l.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(l.getLaborContract().getProjectId(), l.getBuilding()));
		}
		model.addAttribute("page", page);
		return "modules/finance/laborSettlementList";
	}
	
	/**
	 * 查看待我审批
	 * 注：显示当前用户已提交未审批完成及待当前用户审批的所有数据
	 * @param laborSettlement
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findUnAuditLaborSettlement")
	public String findUnAuditLaborSettlement(LaborSettlement laborSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborSettlement> page = laborSettlementService.findUnAuditLaborSettlement(new Page<LaborSettlement>(request, response), laborSettlement); 
		for(LaborSettlement l : page.getList()){
			l.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(l.getLaborContract().getProjectId(), l.getBuilding()));
		}
		model.addAttribute("page", page);
		return "modules/finance/laborSettlementList";
	}
	
	/**
	 * 查看我审批过的-即与我相关的
	 * 注：先默认显示全部已审批完毕
	 * @param laborSettlement
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findAuditDoneLaborSettlement")
	public String findAuditDoneLaborSettlement(LaborSettlement laborSettlement, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborSettlement> page = laborSettlementService.findAuditDoneLaborSettlement(new Page<LaborSettlement>(request, response), laborSettlement); 
		for(LaborSettlement l : page.getList()){
			l.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(l.getLaborContract().getProjectId(), l.getBuilding()));
		}
		model.addAttribute("page", page);
		return "modules/finance/laborSettlementList";
	}
	
	
	@RequestMapping(value = "form")
	public String form(LaborSettlement laborSettlement,HttpServletRequest request, HttpServletResponse response, Model model) {
		//是否新记录
		if(laborSettlement.getIsNewRecord()){
			laborSettlement.setId(IdGen.uuid());
			model.addAttribute("flag", "edit");
			model.addAttribute("flags", "edit");
		}else{
			model.addAttribute("flag", "edit");
			model.addAttribute("flags", "view");
//			Laborcontract contract = laborContractService.get(laborSettlement.getLaborContract());
//			if(null != contract.getHouse()){
//				String[] houseType= contract.getHouse().split(",");
//				model.addAttribute("houseTypeOptions", houseType);
//			}
//			if(null != contract.getBuildings()){
//				String[] building = contract.getBuildings().split(",");
//				model.addAttribute("buildingOptions", building);
//			}
			laborSettlement.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(laborSettlement.getLaborContract().getProjectId(), laborSettlement.getBuilding()));
		}
		//查询可选项目
		User aboutUser = null;
		if (!UserUtils.verificationRole("lwzy")) {
			aboutUser = UserUtils.getUser();
		}
		//劳务合同列表
		Laborcontract contract = new Laborcontract();
		contract.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		contract.setDelFlag(Laborcontract.DEL_FLAG_NORMAL);
		List<Laborcontract> contractList = laborContractService.findLists(contract);
		List<LaborSettlement> projectList = laborSettlementService.findProject(aboutUser);
		model.addAttribute("projectList",projectList);
		model.addAttribute("contractList", contractList);
		model.addAttribute("laborSettlement", laborSettlement);
		return "modules/finance/laborSettlementForm";
	}

	@RequestMapping(value = "save")
	public String save(LaborSettlement laborSettlement, Model model, RedirectAttributes redirectAttributes) {
		laborSettlementService.save(laborSettlement);
		addMessage(redirectAttributes, "保存劳务结算成功");
		return "redirect:"+Global.getAdminPath()+"/finance/laborSettlement/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(LaborSettlement laborSettlement, RedirectAttributes redirectAttributes) {
		laborSettlementService.delete(laborSettlement);
		addMessage(redirectAttributes, "删除劳务结算成功");
		return "redirect:"+Global.getAdminPath()+"/finance/laborSettlement/?repage";
	}

	/**
	 * Aajx由合同id获取劳务合同
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getContractById")
	public Laborcontract getContractById(HttpServletRequest request, HttpServletResponse response){
		String contractId = request.getParameter("contractId");
		Laborcontract contract = laborContractService.get(contractId);
		
		Execution execution = new Execution();
		execution.setName(contract.getCtype());
		execution.setId(contract.getCtype());
		execution = executionService.getByName(execution);
		
		if(null != execution){
			contract.setExecutionName(execution.getName());
		}
		
		
		//劳务清单
		Laboritems laborItem = new Laboritems();
		laborItem.setContractId(contractId);
		List<Laboritems> detialList = laborItemsService.findList(laborItem);
		contract.setDetailList(detialList);
		//甲方合同楼栋信息
		BtgConJiaContractDetail jiaContractDetail = jiaContractDetailService.getByLaborContractId(contractId);
		contract.setJiaContractDetail(jiaContractDetail);
		contract.setBuildingsDisName(subProjectService
					.getBuilDisplayNameStr(contract.getProjectId(), contract.getBuildings()));
		return contract;
	}
	
	/**
	 * Aajx由项目简称获取合同编号
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getContractNoByCode")
	public List<Laborcontract> getContractNoByCode(HttpServletRequest request, HttpServletResponse response){
		String code = request.getParameter("code");
		//劳务合同列表
		Laborcontract contract = new Laborcontract();
		contract.setKeyWord(code);
		List<Laborcontract> contractList = laborContractService.findList(contract);
		return contractList;
	}
	
	@RequestMapping(value = "startProcess/{laborSettlementId}")
	@Transactional(readOnly = false)
	public @ResponseBody
	WFOperationResult startProcess(@PathVariable String laborSettlementId) throws Exception{
		
		//FIXME 如果用户不保存提交，请先保存。 许俊雄20160517
		LaborSettlement laborSettlement = laborSettlementService.get(laborSettlementId);
		
		Map<String, Object> variables = null;
		String instanceId = "";
		
		//劳务结算和项目不能为空
		if(laborSettlement != null && 
				laborSettlement.getLaborContract()!=null &&
				StringUtils.isNotBlank(laborSettlement.getLaborContract().getProjectId())){
			Project project = projectService.get(laborSettlement.getLaborContract().getProjectId());
			variables = new VariablesBuilder()
			.putPrimaryKey(laborSettlementId)
			.putPersistBeanName(LaborSettlementService.BEAN_NAME)
			.putPojectRespon(UserUtils.getNotNull(project.getProjectManagerBid()).getLoginName()
					,project.getCode())
			.putAreaManager(UserUtils.getNotNull(project.getRegionalManagerBid()).getLoginName()
					,project.getCode())
			.putQuanlitySecure(project.getId())
			.putCostRespon(UserUtils.getNotNull(project.getCostManagerBid()).getLoginName()
					,project.getCode())
			.putCostLeader(UserUtils.getNotNull(project.getCostOfficerBid()).getLoginName()
					,project.getCode())
			.build();
			instanceId = actTaskService.startProcess(ProcessDefinitionKeyEnum.PD_LARBOR_CONTACT_CAL.getName()
					, "btg_labor_settlement", laborSettlementId, "劳务结算流程", variables);
		}else{
			logger.error("劳务结算不存在或者项目不存在");
			throw new BusinessException("");
		}
		
		laborSettlement.setWorkflowid(instanceId);
		laborSettlement.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		laborSettlementService.update(laborSettlement);
		return new WFOperationResult("流程启动成功", WFOperationResult.SUCCESSFUL);
	}
}