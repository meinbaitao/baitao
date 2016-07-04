/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.finance.entity.TransportationSettlement;
import com.bt.modules.finance.entity.TransportationSettlementDetail;
import com.bt.modules.finance.service.TransportationSettlementService;
import com.bt.modules.logistics.service.LogisticsSendService;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.utils.CommonStatus;

/**
 * 运费结算Controller
 * @author yhh
 * @version 2015-09-28
 */
@Controller
@RequestMapping(value = "${adminPath}/finance/transportationSettlement")
public class TransportationSettlementController extends BaseController {

	@Autowired
	private LogisticsSendService logisticsSendService;
	
	@Autowired
	private TransportationSettlementService transportationSettlementService;
	
	@Autowired
	private ActTaskService actTaskService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private SystemService systemService;
	
	@ModelAttribute
	public TransportationSettlement get(@RequestParam(required=false) String id) {
		TransportationSettlement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = transportationSettlementService.get(id);
		}
		if (entity == null){
			entity = new TransportationSettlement();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(TransportationSettlement transportationSettlement, HttpServletRequest request,
			HttpServletResponse response, Model model) {
//		Page<TransportationSettlement> page = transportationSettlementService
//				.findPage(new Page<TransportationSettlement>(request, response), transportationSettlement); 
//		model.addAttribute("page", page);
//		return "modules/finance/transportationSettlementList";
		transportationSettlement.setCreateBy(UserUtils.getUser());
		Page<TransportationSettlement> page = transportationSettlementService.findMyTransportationSettlement(new Page<TransportationSettlement>(request, response), transportationSettlement); 
		model.addAttribute("page", page);
		return "modules/finance/findMyTransportationSettlement";
	}
	
	/**
	 * 流程数据
	 */
	/**
	 * 
	 * @param transportationSettlement
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyTransportationSettlement"})
	public String findMyTransportationSettlement(TransportationSettlement transportationSettlement, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		transportationSettlement.setCreateBy(UserUtils.getUser());
		Page<TransportationSettlement> page = transportationSettlementService.findMyTransportationSettlement(new Page<TransportationSettlement>(request, response), transportationSettlement); 
		model.addAttribute("page", page);
		return "modules/finance/findMyTransportationSettlement";
	}
	@RequestMapping(value = {"findUnAuditTransportationSettlement"})
	public String findUnAuditTransportationSettlement(TransportationSettlement transportationSettlement, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		transportationSettlement.setCreateBy(UserUtils.getUser());
		Page<TransportationSettlement> page = transportationSettlementService.findUnAuditTransportationSettlement(new Page<TransportationSettlement>(request, response), transportationSettlement); 
		model.addAttribute("page", page);
		return "modules/finance/findUnAuditTransportationSettlement";
	}
	@RequestMapping(value = {"findAuditDoneTransportationSettlement"})
	public String findAuditDoneTransportationSettlement(TransportationSettlement transportationSettlement, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		transportationSettlement.setCreateBy(UserUtils.getUser());
		Page<TransportationSettlement> page = transportationSettlementService.findAuditDoneTransportationSettlement(new Page<TransportationSettlement>(request, response), transportationSettlement); 
		model.addAttribute("page", page);
		return "modules/finance/findAuditDoneTransportationSettlement";
	}

	@RequestMapping(value = "form")
	public String form(TransportationSettlement transportationSettlement, Model model) {
		String logisticSendId = transportationSettlement.getLogisticSend();
		if(null != logisticSendId){
			//匹配价格
			transportationSettlement = transportationSettlementService.matchContractPrice(transportationSettlement);
			
			//查看,获取结算明细信息
			List<TransportationSettlementDetail> detailList = transportationSettlementService
					.createSettlementDetail(logisticSendId);
			
			//是否平摊明细运费
			String sumPrice = transportationSettlement.getSumPrice();
			if(StringUtils.isNotBlank(sumPrice)){
				detailList = transportationSettlementService.countDividePrice(transportationSettlement);
			}
			model.addAttribute("detailList", detailList);
		}
		
		model.addAttribute("transportationSettlement", transportationSettlement);
		return "modules/finance/transportationSettlementForm";
	}
	
	@RequestMapping(value = "save")
	public String save(TransportationSettlement transportationSettlement, Model model, RedirectAttributes redirectAttributes) {
		if(transportationSettlement.getIsNewRecord()){
			transportationSettlement.setIsNewRecord(true);
			transportationSettlementService.save(transportationSettlement);
		}else{
			transportationSettlement.setIsNewRecord(false);
			transportationSettlementService.save(transportationSettlement);
		}
		
		addMessage(redirectAttributes, "保存运费结算成功");
		return "redirect:"+Global.getAdminPath()+"/finance/transportationSettlement/?repage";
	}
	
	@RequestMapping(value = "delete")
	public String delete(TransportationSettlement transportationSettlement, RedirectAttributes redirectAttributes) {
		transportationSettlementService.delete(transportationSettlement);
		addMessage(redirectAttributes, "删除运费结算成功");
		return "redirect:"+Global.getAdminPath()+"/finance/transportationSettlement/?repage";
	}

	/**
	 * ajax 计算平摊运费
	 * @param logisticSend
	 * @param transportationSettlement
	 */
	@ResponseBody
	@RequestMapping(value="countDividePrice", method = RequestMethod.POST)
	public List<TransportationSettlementDetail> countDividePrice(@RequestBody TransportationSettlement transportationSettlement,
				HttpServletRequest request, HttpServletResponse response){
		return transportationSettlementService.countDividePrice(transportationSettlement);
	}
	
	/**
	 * 提交合同待审
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	 @RequestMapping(value = {"startworkflow"})
	@ResponseBody
	public String startworkflow(HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		String bindingId = request.getParameter("bindingId");
		
		//提交流程（正式开启流程）
		TransportationSettlement entity = transportationSettlementService.get(bindingId);
		
		//成本工程师
		String costDesignerId = projectService.get(entity.getProjectId()).getCostManagerBid();
		//检查成本工程师是否存在，如果不存在的话就爆出异常
		//由于是ajax提交，系统自动会封装成JSON出去
		//许俊雄 20160511
		if(costDesignerId == null){
			throw new BusinessException("transportSettel.costDesigner.notexist",entity.getProjectId());
		}
		String costDesigner = systemService.getUser(costDesignerId).getLoginName();
		
		
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put("costing_engineer", costDesigner);
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, TransportationSettlementService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, bindingId);
		String actID = actTaskService.startProcess("TransportCostingRecordFlow", "btg_transportation_settlement", "workflow_id","",variable);
		
		//更新合同工作流
		entity.setWorkflowid(actID);
		entity.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		transportationSettlementService.save(entity);
		return bindingId;
	}
	 
	
	
}