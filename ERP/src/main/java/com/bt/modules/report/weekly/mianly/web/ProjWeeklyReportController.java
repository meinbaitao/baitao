/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.web;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bt.modules.activiti.entities.WFOperationResult;
import com.bt.modules.report.weekly.mianly.entity.*;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.contract.service.LaborcontractService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.report.common.WeeklyReportHelper;
import com.bt.modules.report.weekly.mianly.service.BuildingScheduleService;
import com.bt.modules.report.weekly.mianly.service.ProjWeeklyReportService;
import com.bt.modules.report.weekly.mianly.service.TransferedBuildingService;
import com.bt.modules.report.weekly.mianly.service.UntransferBuildingService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.ServiceException;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 周报主体信息Controller
 * @author jinyuanf
 * @version 2015-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/report/weekly/mainly/projWeeklyReport")
public class ProjWeeklyReportController extends BaseController {

	private static final Logger LOGGER = LoggerFactory.getLogger(ProjWeeklyReportController.class);

	@Autowired
	private ProjWeeklyReportService projWeeklyReportService;

	@Autowired
	private TransferedBuildingService transferedBuildingService;
	@Autowired
	private UntransferBuildingService untransferBuildingService;
	@Autowired
	private BuildingScheduleService buildingScheduleService;

	@Autowired
	private ProjectService projectService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private JiaContractService jiaContractService;
	@Autowired
	private LaborcontractService laborcontractService;
	@Autowired
	private ActTaskService actTaskService;

	
	@ModelAttribute
	public ProjWeeklyReport get(@RequestParam(required=false) String id) {
		ProjWeeklyReport entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = projWeeklyReportService.get(id);
		}
		if (entity == null){
			entity = new ProjWeeklyReport();
		}
		return entity;
	}

	@RequestMapping(value="reportListFirstTime/{projectId}")
	public String reportListFirstTime(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable String projectId){
		ProjWeeklyReport projWeeklyReport = new ProjWeeklyReport();
		projWeeklyReport.setProjectId(projectId);
		return reportList(projWeeklyReport, request, response, model);
	}

	@RequestMapping(value = {"reportList", ""})
	public String reportList(ProjWeeklyReport projWeeklyReport, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ProjWeeklyReport> pageParam = new Page<ProjWeeklyReport>(request, response);
		pageParam.setOrderBy(" a.week_serial_num desc");
		Page<ProjWeeklyReport> page = projWeeklyReportService.findPage(pageParam, projWeeklyReport);
		for(ProjWeeklyReport report: page.getList()){
			report.setProjResponsPeopleName(UserUtils.get(report.getProjReponsPeople()).getName());
		}
		model.addAttribute("projWeeklyReport", projWeeklyReport);
		model.addAttribute("page", page);
		return "modules/report/weekly/mainly/projectWeeklyReportList";
	}

	@RequestMapping(value = {"initializeEditView/{reportId}", ""})
	public String initializeEditView(@PathVariable String reportId, Model model){
		ProjWeeklyReport projWeeklyReport = projWeeklyReportService.get(reportId);
		return initEdit(projWeeklyReport, model);
	}


	@RequestMapping(value = "gateway/projectId/{projectId}")
	public String gateway(ProjWeeklyReport projWeeklyReport, Model model, @PathVariable String projectId) throws  Exception {
		projWeeklyReport.setProjectId(projectId);
		projWeeklyReport.setWeekSerialNum(WeeklyReportHelper.getCurrentlyWeekSerial());
		ProjWeeklyReport previousWeeklyReport = projWeeklyReportService.getPreviousWeekReport(projWeeklyReport);
		ProjWeeklyReport thisWeekReport = projWeeklyReportService.getOneWeekReport(projWeeklyReport);
		if(previousWeeklyReport == null && thisWeekReport == null){
			return initAddForNeverReport(projWeeklyReport, model);
		}else if(thisWeekReport != null){
			return initEdit(thisWeekReport, model);
		}else{
			thisWeekReport = new ProjWeeklyReport();
			return initAddForEverReport(thisWeekReport, model, previousWeeklyReport);
		}
	}

	/**
	 * 从来没填过周报的项目
	 * @param projWeeklyReport
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	private String initAddForNeverReport(ProjWeeklyReport projWeeklyReport, Model model) throws Exception{
		projWeeklyReport.setWeekSerialNum(WeeklyReportHelper.getCurrentlyWeekSerial());
		bindWeeklyDatePeriod(projWeeklyReport);
		Project project = projectService.get(projWeeklyReport.getProjectId());
		model.addAttribute("project", project);

		List<Subproject> subprojects = subProjectService.findByProjectIdList(projWeeklyReport.getProjectId());
		List<UntransferBuilding> untransferBuildings = new ArrayList<UntransferBuilding>();
		for(Subproject subproject : subprojects){
			UntransferBuilding untransferBuilding = new UntransferBuilding();
			untransferBuilding.setBuildNo(subproject.getBuilding());
			untransferBuilding.setDistrict(project.getLocation());
			untransferBuilding.setBuildingDisplayName(subproject.getBuildingDisplayName());
			untransferBuilding.setHouseType(subproject.getHouseType());
			untransferBuilding.setActualStoneArea(subproject.getStoneActualArea());
			untransferBuilding.getExtraData().put("subproject", subproject);
			untransferBuildings.add(untransferBuilding);
		}
		model.addAttribute("untransferBuildings", untransferBuildings);
		setTotalContractMoney(projWeeklyReport);
		projWeeklyReport.setPlanStartDate(project.getStartTime());
		projWeeklyReport.setPlanFinishDate(project.getEndTime());
		projWeeklyReport.setProjReponsPeople(project.getProjectManagerBid());
		
		projectService.checkProject(project, "projectManagerBid", "", "report.weekly.001");
		projWeeklyReport.setProjResponsPeopleName(UserUtils.get(project.getProjectManagerBid()).getName());
		return "modules/report/weekly/mainly/projectWeeklyReport-Add";
	}

	/**
	 * 曾经填过周报的项目
	 * @param thisWeeklyReport
	 * @param model
	 * @param lastWeeklyReport
	 * @return
	 */
	private String initAddForEverReport(ProjWeeklyReport thisWeeklyReport, Model model, ProjWeeklyReport lastWeeklyReport) throws BusinessException {
		try {
			BeanUtils.copyProperties(thisWeeklyReport, lastWeeklyReport);
		} catch (IllegalAccessException e) {
			LOGGER.error(e.getMessage(), e);
			throw new BusinessException("report.weekly.002", e.getMessage());
		} catch (InvocationTargetException e) {
			LOGGER.error(e.getMessage(), e);
			throw new BusinessException("report.weekly.002", e.getMessage());
		}
		bindWeeklyDatePeriod(thisWeeklyReport);
		thisWeeklyReport.setWeekSerialNum(WeeklyReportHelper.getCurrentlyWeekSerial());
		thisWeeklyReport.setId(null);
		Project project = projectService.get(thisWeeklyReport.getProjectId());
		model.addAttribute("project", project);
		model.addAttribute("projWeeklyReport", thisWeeklyReport);
		bindSubsetInfo(lastWeeklyReport, model);
		thisWeeklyReport.setProjResponsPeopleName(UserUtils.get(project.getProjectManagerBid()).getName());
		return "modules/report/weekly/mainly/projectWeeklyReport-ever-Add";
	}


	private String initEdit(ProjWeeklyReport projWeeklyReport, Model model){
		bindSubsetInfo(projWeeklyReport, model);
		projWeeklyReport.setProjResponsPeopleName(UserUtils.get(projWeeklyReport.getProjReponsPeople()).getName());

		//如果流程还未开启，重新设置合同总额
		if(!StringUtils.isNotEmpty(projWeeklyReport.getWorkflowid())){
			setTotalContractMoney(projWeeklyReport);
		}
		Project project = projectService.get(projWeeklyReport.getProjectId());
		model.addAttribute("project", project);
		model.addAttribute("projWeeklyReport", projWeeklyReport);
		return "modules/report/weekly/mainly/projectWeeklyReport-Edit";
	}

	/**
	 * 绑定已交付楼栋、未交付楼栋、在建信息列表
	 * 到request对象，用做页面初始化
	 *
	 * @param projWeeklyReport
	 * @param model
	 */
	private void bindSubsetInfo(ProjWeeklyReport projWeeklyReport, Model model){
		Subproject querySubProject = new Subproject();
		querySubProject.setProjectId(projWeeklyReport.getProjectId());
		Map<String, Subproject> buildingMapping = subProjectService.findAllBuildingNameByProject(querySubProject);
		TransferedBuilding transferedBuildingParam = new TransferedBuilding();
		transferedBuildingParam.setReportId(projWeeklyReport.getId());
		List<TransferedBuilding> transferedBuildings = transferedBuildingService.findList(transferedBuildingParam);
		for(TransferedBuilding transferedBuilding : transferedBuildings){
			String compositeKey = SubProjectService.buildCompositeKey(projWeeklyReport.getProjectId(), transferedBuilding.getBuildNo());
			if(buildingMapping.containsKey(compositeKey)){
				transferedBuilding.getExtraData().put("subproject", buildingMapping.get(compositeKey));
			}else{
				transferedBuilding.getExtraData().put("subproject", new Subproject());
			}
//			setBuildDisplayName(buildingMapping.get(compositeKey), transferedBuilding);
		}

		UntransferBuilding untransferBuildingParam = new UntransferBuilding();
		untransferBuildingParam.setReportId(projWeeklyReport.getId());
		List<UntransferBuilding> untransferBuildings = untransferBuildingService.findList(untransferBuildingParam);
		for(UntransferBuilding untransferBuilding : untransferBuildings){	//未移交楼栋数据加载
			String compositeKey = SubProjectService.buildCompositeKey(projWeeklyReport.getProjectId(), untransferBuilding.getBuildNo());
			if(buildingMapping.containsKey(compositeKey)){
				untransferBuilding.getExtraData().put("subproject", buildingMapping.get(compositeKey));
				if(StringUtils.isBlank(untransferBuilding.getActualStoneArea())){	//施工面积为空时默认拉取二级项目中的实际挂石面积
					untransferBuilding.setActualStoneArea(buildingMapping.get(compositeKey).getStoneActualArea());
				}
			}else{
				untransferBuilding.getExtraData().put("subproject", new Subproject());
			}
//			setBuildDisplayName(buildingMapping.get(compositeKey), untransferBuilding);
		}
		model.addAttribute("transferedBuildings", transferedBuildings);
		model.addAttribute("untransferBuildings", untransferBuildings);

		BuildingSchedule buildingScheduleParam = new BuildingSchedule();
		buildingScheduleParam.setReportId(projWeeklyReport.getId());
		List<BuildingSchedule> buildingSchedules = buildingScheduleService.findList(buildingScheduleParam);
		for(BuildingSchedule buildingSchedule : buildingSchedules){
			String compositeKey = SubProjectService.buildCompositeKey(projWeeklyReport.getProjectId(), buildingSchedule.getBuildNo());
			setBuildDisplayName(buildingMapping.get(compositeKey), buildingSchedule);
		}
		model.addAttribute("buildingSchedules", buildingSchedules);
	}

	private void setBuildDisplayName(Subproject subproject, BaseReportEntity entity){
		if(subproject != null) {
			entity.setBuildingDisplayName(subproject.getBuildingDisplayName());
			entity.setHouseType(subproject.getHouseType());
		}else{
			entity.setBuildingDisplayName("");
			entity.setHouseType("");
		}
	}


	@RequestMapping(value = "save")
	@Transactional(readOnly = false)
	public String save(ProjWeeklyReport projWeeklyReport, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request, HttpServletResponse response) throws Exception {
		projWeeklyReport.setCreateTime(new Date());
		projWeeklyReportService.save(projWeeklyReport);
		transferedBuildingService.batchSave(projWeeklyReport.getTransferedBuildings(), projWeeklyReport);
		untransferBuildingService.batchSave(projWeeklyReport.getUnTransferBuildings(), projWeeklyReport);
		buildingScheduleService.batchSave(projWeeklyReport.getBuildingSchedules(), projWeeklyReport);
		addMessage(redirectAttributes, "保存周报成功");

		Project project = new Project();
		project.setId(projWeeklyReport.getProjectId());
		return this.gateway(projWeeklyReport, model, projWeeklyReport.getProjectId());
//		return this.projectList(project, request,response,model);
	}


	@RequestMapping(value = "edit")
	@Transactional(readOnly = false)
	public String edit(ProjWeeklyReport projWeeklyReport, Model model,
					   HttpServletRequest request,HttpServletResponse response) throws Exception{
		projWeeklyReportService.update(projWeeklyReport);
        transferedBuildingService.deleteAllByReportId(projWeeklyReport.getId());
		untransferBuildingService.deleteAllByReportId(projWeeklyReport.getId());
		transferedBuildingService.batchSave(projWeeklyReport.getTransferedBuildings(), projWeeklyReport);
		untransferBuildingService.batchSave(projWeeklyReport.getUnTransferBuildings(), projWeeklyReport);
		buildingScheduleService.batchMixSave(projWeeklyReport.getBuildingSchedules(), projWeeklyReport);
		buildingScheduleService.batchDeleteForUpdate(projWeeklyReport.getBuildingScheduleDeletedIds());

		Project project = new Project();
		project.setId(projWeeklyReport.getProjectId());
		return this.gateway(projWeeklyReport, model, projWeeklyReport.getProjectId());
//		return this.projectList(project, request,response,model);
	}

	@RequestMapping(value = "delete")
	public String delete(ProjWeeklyReport projWeeklyReport, RedirectAttributes redirectAttributes) {
		projWeeklyReportService.delete(projWeeklyReport);
		addMessage(redirectAttributes, "删除周报成功");
		return "redirect:"+Global.getAdminPath()+"/mianly/projWeeklyReport/?repage";
	}


	/**
	 * 绑定周报的周期
	 * @param projWeeklyReport
	 */
	private void bindWeeklyDatePeriod(ProjWeeklyReport projWeeklyReport){
		Date today = new Date();
		Calendar calendar = Calendar.getInstance();
		int weekDay = calendar.get(Calendar.DAY_OF_WEEK);
		Date lastSaturday = null;
		Date thisFriday = null;

		if(weekDay == Calendar.SATURDAY){
			lastSaturday = today;
			calendar.setTime(today);
			calendar.add(Calendar.DAY_OF_YEAR, Calendar.FRIDAY);
			thisFriday = calendar.getTime();
		}else{
			int offset = Calendar.SATURDAY - weekDay -1;
			calendar.setTime(today);
			calendar.add(Calendar.DAY_OF_YEAR, -weekDay);
			lastSaturday = calendar.getTime();
			calendar.setTime(today);
			calendar.add(Calendar.DAY_OF_YEAR, offset);
			thisFriday = calendar.getTime();
		}

		projWeeklyReport.setReportBeginDate(lastSaturday);
		projWeeklyReport.setReportEndDate(thisFriday);
	}


	/**
	 * 周报页面显示项目列表数据
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"projectList", ""})
	public String projectList(Project project,HttpServletRequest request,HttpServletResponse response,Model model) {
		return findUnAuditWeekReport(new ProjWeeklyReport(), request, response, model);
	}


	/**
	 * 周报页面显示我创建的项目列表数据
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyWeekReport"})
	public String findMyWeekReport(ProjWeeklyReport projWeeklyReport,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<ProjWeeklyReport> page = projWeeklyReportService.findMyWeekReport(new Page<ProjWeeklyReport>(request, response), projWeeklyReport);
		model.addAttribute("page", page);
		model.addAttribute("projWeeklyReport", projWeeklyReport);
		return "modules/report/weekly/mainly/findMyWeekReport";
	}


	/**
	 * 待审批
	 * @param projWeeklyReport
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findUnAuditWeekReport"})
	public String findUnAuditWeekReport(ProjWeeklyReport projWeeklyReport,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<ProjWeeklyReport> page = projWeeklyReportService.findUnAuditWeekReport(new Page<ProjWeeklyReport>(request, response), projWeeklyReport);
		for(ProjWeeklyReport report: page.getList()){
			report.setProjResponsPeopleName(UserUtils.get(report.getProjReponsPeople()).getName());
		}
		model.addAttribute("page", page);
		model.addAttribute("projWeeklyReport", projWeeklyReport);
		return "modules/report/weekly/mainly/findUnAuditWeekReport";
	}


	/**
	 * 查看我审批过的
	 * @param projWeeklyReport
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findAuditDoneWeekReport"})
	public String findAuditDoneWeekReport(ProjWeeklyReport projWeeklyReport,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<ProjWeeklyReport> page = projWeeklyReportService.findAuditDoneWeekReport(new Page<ProjWeeklyReport>(request, response), projWeeklyReport);
		model.addAttribute("page", page);
		model.addAttribute("projWeeklyReport", projWeeklyReport);
		return "modules/report/weekly/mainly/findAuditDoneWeekReport";
	}

	@RequestMapping(value="getLaborContract/projectId/{projectId}/buildingNO/{buildingNO}")
	public @ResponseBody
	Laborcontract getLaborContract(@PathVariable String projectId, @PathVariable String buildingNO){
		return laborcontractService.getOneByProIdAndBuild(projectId, buildingNO);
	}

	@RequestMapping(value="getSubprojByProjectAndBuild/projectId/{projectId}/buildingNO/{buildingNO}")
	public @ResponseBody Subproject getSubprojByProjectAndBuild(@PathVariable String projectId, @PathVariable String buildingNO){
		Subproject subproject = new Subproject();
		subproject.setProjectId(projectId);
		subproject.setBuilding(buildingNO);
		return subProjectService.getOneByProjectAndBuild(subproject);
	}

	@RequestMapping(value="startAuditFlow/reportId/{reportId}")
	@Transactional(readOnly = false)
	public @ResponseBody WFOperationResult startAuditFlow(@PathVariable String reportId){
		ProjWeeklyReport projWeeklyReport = projWeeklyReportService.get(reportId);
		Project project =projectService.get(projWeeklyReport.getProjectId());
		Map<String, Object> variableMap = new HashMap<String, Object>();
		variableMap.put(ActivitiConstants.PRIMARY_KEY, reportId);
		variableMap.put(ActivitiConstants.PERSIST_BEAN_NAME, ProjWeeklyReportService.BEAN_NAME);
		if(StringUtils.isEmpty(project.getRegionalManagerBid()) ||
				UserUtils.get(project.getRegionalManagerBid()) == null){
			return new WFOperationResult("项目信息中的区域经理不能为空", WFOperationResult.FAIL);
		}
		variableMap.put("area_manager", UserUtils.get(project.getRegionalManagerBid()).getLoginName());
		String instanceId = actTaskService.startProcess("projectWeeklyReportAuditFlow", "btg_proj_weekly_report", reportId, "项目周报审批流程", variableMap);
		projWeeklyReport.setId(reportId);
		projWeeklyReport.setWorkflowid(instanceId);
		projWeeklyReport.setWorkflowstatus(CommonStatus.WORK_FLOW_UNDERWAY);
		projWeeklyReportService.updateWorkflowStatusAndId(projWeeklyReport);
		return new WFOperationResult("流程启动成功", WFOperationResult.SUCCESSFUL);
	}


	/**
	 * 设置合同总额
	 * @param projWeeklyReport
	 */
	private void setTotalContractMoney(ProjWeeklyReport projWeeklyReport){
		Double amountMoney = jiaContractService.getAmountMoneyOfProject(projWeeklyReport.getProjectId());
		if(amountMoney!=null){
			projWeeklyReport.setContractTotalMoney(amountMoney);
		}
	}


}