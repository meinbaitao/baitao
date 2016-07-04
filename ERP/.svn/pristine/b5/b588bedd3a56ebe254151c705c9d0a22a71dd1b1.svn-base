package com.bt.modules.contract.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.Execution;
import com.bt.modules.contract.entity.JiaContract;
import com.bt.modules.contract.entity.LaborDemand;
import com.bt.modules.contract.service.ExecutionService;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.contract.service.LaborDemandService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.UploadUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 劳务需求Controller
 * @author yhh
 * @version 2015-09-08
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/laborDemand")
public class LaborDemandController extends BaseController {

	@Autowired
	private LaborDemandService laborDemandService;
	@Autowired
	private ExecutionService executionService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private SubProjectService subPorjectService;
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private JiaContractService jiaContractService;
	
	@ModelAttribute
	public LaborDemand get(@RequestParam(required=false) String id) {
		LaborDemand entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = laborDemandService.get(id);
		}
		if (entity == null){
			entity = new LaborDemand();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(LaborDemand laborDemand, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LaborDemand> page = laborDemandService.findPage(new Page<LaborDemand>(request, response), laborDemand); 
		model.addAttribute("page", page);
		return "modules/contract/laborDemandList";
//		laborDemand.setCreateBy(UserUtils.getUser());
//		Page<LaborDemand> page = laborDemandService.findMyLaborDemand(new Page<LaborDemand>(request, response), laborDemand); 
//		model.addAttribute("page", page);
//		return "modules/contract/findMyLaborDemand";
	}
	/**
	 * 查我创建的
	 * @param laborDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyLaborDemand"})
	public String findMyLaborDemand(LaborDemand laborDemand, HttpServletRequest request, HttpServletResponse response, Model model) {
		laborDemand.setCreateBy(UserUtils.getUser());
		Page<LaborDemand> page = laborDemandService.findMyLaborDemand(new Page<LaborDemand>(request, response), laborDemand); 
		model.addAttribute("page", page);
		return "modules/contract/findMyLaborDemand";
	}
	/**
	 * 查询待审批
	 * @param laborDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findUnAuditLaborDemand"})
	public String findUnAuditLaborDemand(LaborDemand laborDemand, HttpServletRequest request, HttpServletResponse response, Model model) {
		laborDemand.setCreateBy(UserUtils.getUser());
		Page<LaborDemand> page = laborDemandService.findUnAuditLaborDemand(new Page<LaborDemand>(request, response), laborDemand); 
		model.addAttribute("page", page);
		return "modules/contract/findUnAuditLaborDemand";
	}
	/**
	 * 查询所有操作过的
	 * @param laborDemand
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findAuditDoneLaborDemand"})
	public String findAuditDoneDemand(LaborDemand laborDemand, HttpServletRequest request, HttpServletResponse response, Model model) {
		laborDemand.setCreateBy(UserUtils.getUser());
		Page<LaborDemand> page = laborDemandService.findAuditDoneLaborDemand(new Page<LaborDemand>(request, response), laborDemand); 
		model.addAttribute("page", page);
		return "modules/contract/findAuditDoneLaborDemand";
	}

	@RequestMapping(value = "form")
	public String form(LaborDemand laborDemand, Model model) {
		//判断是否新记录
		if(laborDemand.getIsNewRecord()){
			String createId = IdGen.uuid();
			laborDemand.setId(createId);
		}else{
			model.addAttribute("flag","view");
			
			//由项目名,获取项目ID,获取二级项目列表
//			Project proBean =new Project();
//			proBean.setName(laborDemand.getProName());
//			proBean = projectService.getByProjectName(proBean);
//			if(null != proBean){
//			String projectId = proBean.getId();
			String projectId = laborDemand.getProjectId();
			List<Subproject> subProjectList = subPorjectService.findByProjectIdList(projectId);
			model.addAttribute("subProjectList", subProjectList);
//			}
			
			if(null != laborDemand){
				//添加一个楼栋显示名称来做显示 许俊雄 20160406
				laborDemand.setBuildingsName(subPorjectService
						.getBuilDisplayNameStr(projectId, laborDemand.getBuildings()).replace(",", "、"));
			}
			
			if(null != laborDemand.getHouse()){
				String[] houseType= laborDemand.getHouse().split(",");
				model.addAttribute("houseTypeSelected", houseType);
			}
			if(null != laborDemand.getBuildings()){
				String[] building = laborDemand.getBuildings().split(",");
				model.addAttribute("buildingSelected", building);
			}
			if(null != laborDemand.getHurrybuildings()){
				String[] hurryBuilding = laborDemand.getHurrybuildings().split(",");
				model.addAttribute("hurryBuildingSelected", hurryBuilding);
			}
			
		}
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(laborDemand.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		//施工班组		
		List<Execution> cycList = executionService.findList(new Execution());
		model.addAttribute("cycList", cycList);
		//项目
		Project project = new Project();
		project.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		List<Project> projectList = projectService.findList(project);
		model.addAttribute("projectList", projectList);
		//甲方合同
		JiaContract jiaContract = new JiaContract();
		List<JiaContract> jiaContractList = jiaContractService.findList(jiaContract);
		model.addAttribute("jiaContractList",jiaContractList);
		
		model.addAttribute("laborDemand", laborDemand);
		return "modules/contract/laborDemandForm";
	}

	@RequestMapping(value = "save")
	public String save(LaborDemand laborDemand, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		String[] houseTypeBox = request.getParameterValues("houseTypeBox");
		String projectId = request.getParameter("projectId");
		//1.根据户型获取楼栋号信息
		List<Subproject> listSub = subPorjectService.getByHouseTypes(houseTypeBox, projectId);
		List<String> buildings = subPorjectService.getBuildingsBySubs(listSub);
		//2.获取界面传过来的楼栋号信息
		String[] buildingBox = request.getParameterValues("buildingBox");
		//3.将选中的户型的已经获取的楼栋进行楼栋号数据整合
		if(StringUtils.isNoneBlank(buildingBox)){
			for(String building:buildingBox){
				if(!buildings.contains(building)){
					buildings.add(building);
				}
			}
		}
		//4.将数据串连起来填充字段
		if(buildings.size()>0){
			laborDemand.setBuildings(CommonUtils.listToString(buildings));
		}
		laborDemandService.save(laborDemand);
		
		addMessage(redirectAttributes, "保存劳务需求成功");
		String contractId = laborDemand.getId();
		return "redirect:"+Global.getAdminPath()+"/contract/laborDemand/form?id="+contractId;
	}
	
	@RequestMapping(value = "delete")
	public String delete(LaborDemand laborDemand, RedirectAttributes redirectAttributes) {
		laborDemandService.delete(laborDemand);
		addMessage(redirectAttributes, "删除劳务需求成功");
		return "redirect:"+Global.getAdminPath()+"/contract/laborDemand/?repage";
	}

	/**
	 * 上传附件
	 * @param file
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws BusinessException 
	 */
	@ResponseBody
	@RequestMapping(value = "upload",method=RequestMethod.POST)
	public String upload(String uploadContractId, MultipartFile file,HttpServletRequest request,RedirectAttributes redirectAttributes) throws BusinessException {
		
		//设置文件目录(从数据字典读取)
		String dirName = DictUtils.getDictValue("contract/laborDemand","upload_path_type","contract/laborDemand");
		UploadUtils utils = new UploadUtils();
		return utils.uploadFile(file, request,dirName,uploadContractId);
	}
	
	/**
	 * 下载附件
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="download")
	public void download(HttpServletRequest request, HttpServletResponse response) {
		UploadUtils utils = new UploadUtils();
		utils.download(request,response);
	}
	
	/**
	 * 由项目id获取对象
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getProjectById")
	public Map<String,Object> getProjectById(HttpServletRequest request,HttpServletResponse response){
		String projectId = request.getParameter("projectId");
		Project project =laborDemandService.getProjecctById(projectId);
		List<Subproject> subProjectList = subPorjectService.findByProjectIdList(projectId);	
		if(null != subProjectList){
			project.setSubList(subProjectList);	//项目关联二级项目
		}
		JiaContract jiaContract = new JiaContract();
		jiaContract.setProjectId(projectId);
		List<JiaContract> jiaContractList = jiaContractService.findList(jiaContract);
		if(null != jiaContractList){
			project.setJiaContractList(jiaContractList);	//关联甲方合同
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("project", project);
		map.put("houseTypes", this.houseTypeRemoveDuplicate(subProjectList));
		return map;
	}
	/**
	 * 户型去重
	 * @param subs
	 * @return
	 */
	private List<Subproject> houseTypeRemoveDuplicate(List<Subproject> subs){
		if(subs==null||subs.size()==0){
			return new ArrayList<Subproject>();
		}
		Map<String,Subproject> map = new HashMap<String,Subproject>();
		for(Subproject sub:subs){
			map.put(sub.getHouseType(), sub);
		}
		List<Subproject> list = this.mapConvertToList(map);
		return list;
	}
	/**
	 * 将map数据转成楼栋号
	 * @param map
	 * @return
	 */
	private List<Subproject> mapConvertToList(Map<String,Subproject> map){
		List<Subproject> list = new ArrayList<Subproject>();
		for(String key:map.keySet()){
			list.add(map.get(key));
		}
		return list;
	}
	
	/**
	 * 由施工合同获取需求
	 * @param laborcontract
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getDemandByNum")
	public LaborDemand getDemandByNum(LaborDemand laborDemand, HttpServletRequest request, HttpServletResponse response){
		laborDemand.setLaborcontract(request.getParameter("laborcontract"));
		return laborDemandService.getByNum(laborDemand);
	}
	
	
	/**
	 * 提交合同待审
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	 @RequestMapping(value = {"startworkflow"})
	@ResponseBody
	public StringBuffer startworkflow(HttpServletRequest request,HttpServletResponse response,Model model) {
		String contractId = request.getParameter("bindingId");

		StringBuffer info = new StringBuffer("提交失败:");
		//提交流程（正式开启流程）
		LaborDemand laborDemand = laborDemandService.get(contractId);
		
		Project project = projectService.get(laborDemand.getProjectId());
		//甲方项目总经理
		String projectManagerId = project.getProjectManagerBid();
		if(StringUtils.isBlank(projectManagerId)){
			info.append(" 甲方项目总经理未填写! ");
		}
		//区域经理
		String regionalManagerId = project.getRegionalManagerBid();
		if(StringUtils.isBlank(regionalManagerId)){
			info.append(" 区域经理未填写! ");
		}
		//成本工程师
		String costManagerId = project.getCostManagerBid();
		if(StringUtils.isBlank(costManagerId)){
			info.append(" 成本工程师未填写! ");
		}
		
		//创建一个新的流程
		if(StringUtils.isNotBlank(projectManagerId) && StringUtils.isNotBlank(regionalManagerId) && 
				StringUtils.isNotBlank(costManagerId)){
			String projectManager = systemService.getUser(projectManagerId).getLoginName();
			String regionalManager = systemService.getUser(regionalManagerId).getLoginName();
			String costManager = systemService.getUser(costManagerId).getLoginName();
			Map<String,Object> variable = new HashMap<String, Object>();
			variable.put("project_manager", projectManager);
			variable.put("area_manager", regionalManager);
			variable.put("costing_engineer", costManager);
			variable.put(ActivitiConstants.PERSIST_BEAN_NAME, LaborDemandService.BEAN_NAME);
			variable.put(ActivitiConstants.PRIMARY_KEY, contractId);
			String actID = actTaskService.startProcess("workingRequirementFlow", "btg_con_labor_demand", "workflow_id","",variable);
			
			//更新合同工作流
			laborDemand.setWorkflowid(actID);
			laborDemand.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
			laborDemandService.save(laborDemand);
			return null;
		}else{
			return info;
		}
		
	}
	 
}