package com.bt.modules.contract.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.JiaContract;
import com.bt.modules.contract.service.BtgConJiaContractDetailService;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.UploadUtils;

/**
 * 甲方合同Controller
 * @author yhh
 * @version 2015-08-03
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/jiaContract")
public class JiaContractController extends BaseController {

	@Autowired
	private JiaContractService jiaContractService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private  BtgConJiaContractDetailService  btgConJiaContractDetailService ;
	
	@ModelAttribute
	public JiaContract get(@RequestParam(required=false) String id) {
		JiaContract entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jiaContractService.get(id);
		}
		if (entity == null){
			entity = new JiaContract();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JiaContract> page = jiaContractService.findPage(new Page<JiaContract>(request, response), jiaContract); 
		model.addAttribute("page", page);
		return "modules/contract/jiaContractList";
//		Page<JiaContract> page = jiaContractService.findMyJiaContract(new Page<JiaContract>(request, response), jiaContract); 
//		model.addAttribute("page", page);
//		return "modules/contract/findMyJiaContract";
	}
	
	/**
	 * 流程数据
	 * @param jiaContract
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyJiaContract"})
	public String findMyJiaContract(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		jiaContract.setCreateBy(UserUtils.getUser());
		Page<JiaContract> page = jiaContractService.findMyJiaContract(new Page<JiaContract>(request, response), jiaContract); 
		model.addAttribute("page", page);
		return "modules/contract/findMyJiaContract";
	}
	@RequestMapping(value = {"findUnAuditJiaContract"})
	public String findUnAuditJiaContract(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		jiaContract.setCreateBy(UserUtils.getUser());
		Page<JiaContract> page = jiaContractService.findUnAuditJiaContract(new Page<JiaContract>(request, response), jiaContract); 
		model.addAttribute("page", page);
		return "modules/contract/findUnAuditJiaContract";
	}
	@RequestMapping(value = {"findAuditDoneJiaContract"})
	public String findAuditDoneJiaContract(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		jiaContract.setCreateBy(UserUtils.getUser());
		Page<JiaContract> page = jiaContractService.findAuditDoneJiaContract(new Page<JiaContract>(request, response), jiaContract); 
		model.addAttribute("page", page);
		return "modules/contract/findAuditDoneJiaContract";
	}
	
	
	
	@RequestMapping(value = {"financeList"})
	public String financeList(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JiaContract> page = jiaContractService.findPage(new Page<JiaContract>(request, response), jiaContract); 
		
		model.addAttribute("page", page);
		return "modules/finance/jiaContractList";
	}

	@RequestMapping(value = "financeForm")
	public String financeForm(JiaContract jiaContract, Model model) {
		//判断是否新记录
		if(jiaContract.getIsNewRecord()){
			String createId = IdGen.uuid();
			jiaContract.setId(createId);
		}else{
			model.addAttribute("flag","view");
		}
		
		//合同基础信息与明细
		BtgConJiaContractDetail btgConJiaContractDetail = new BtgConJiaContractDetail();
		btgConJiaContractDetail.setContractId(jiaContract.getId());
		List<BtgConJiaContractDetail> contractDetails = btgConJiaContractDetailService.findList(btgConJiaContractDetail);
		btgConJiaContractDetailService.fulfillBuildingDisplayName(contractDetails, jiaContract.getProjectId());
		jiaContract.setDetailList(contractDetails);
		model.addAttribute("jiaContract", jiaContract);
				
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(jiaContract.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);		
		
		return "modules/finance/jiaContractForm";
		
	}
	@RequestMapping(value = "form")
	public String form(JiaContract jiaContract, Model model) {
		//判断是否新记录
		if(jiaContract.getIsNewRecord()){
			String createId = IdGen.uuid();
			jiaContract.setId(createId);
		}else{
			model.addAttribute("flag","view");
		}
		
		//合同基础信息与明细
		BtgConJiaContractDetail btgConJiaContractDetail = new BtgConJiaContractDetail();
		btgConJiaContractDetail.setContractId(jiaContract.getId());
		List<BtgConJiaContractDetail> contractDetails = btgConJiaContractDetailService.findList(btgConJiaContractDetail);
		btgConJiaContractDetailService.fulfillBuildingDisplayName(contractDetails, jiaContract.getProjectId());
		jiaContract.setDetailList(contractDetails);
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
	/**
	 * 新建/更改合同
	 * @param jiaContract
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "save")
	public String save(JiaContract jiaContract, Model model, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		String delId = request.getParameter("delId");
		jiaContractService.save(jiaContract,delId);
		addMessage(redirectAttributes, "保存甲方合同成功");
		String jiaContractId = jiaContract.getId();
		return "redirect:"+Global.getAdminPath()+"/contract/jiaContract/form?id="+jiaContractId;
//		//由合同id获取相关附件
//		Attachment attachment = new Attachment();
//		attachment.setType(jiaContract.getId());
//		List<Attachment> attachList = attachService.findAttachType(attachment);
//		model.addAttribute("attachList", attachList);		
//		
//		//项目列表
//		List<Project> projectList = projectService.findList(new Project());
//		model.addAttribute("projectList", projectList);
//		
//		model.addAttribute("jiaContract", jiaContract);
//		return "modules/contract/jiaContractForm";
	}
	
	@RequestMapping(value = "financeSave")
	public String financeSave(JiaContract jiaContract, Model model, RedirectAttributes redirectAttributes) {
		jiaContractService.save(jiaContract);
		addMessage(redirectAttributes, "保存甲方合同成功");
		String jiaContractId = jiaContract.getId();
		return "redirect:"+Global.getAdminPath()+"/contract/jiaContract/financeForm?id="+jiaContractId;
	}
	
	@RequestMapping(value = "delete")
	public String delete(JiaContract jiaContract, RedirectAttributes redirectAttributes) {
		jiaContractService.delete(jiaContract);
		addMessage(redirectAttributes, "删除甲方合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/jiaContract/list";
	}

//	/**
//	 * 导出甲方合同数据
//	 * @param user
//	 * @param request
//	 * @param response
//	 * @param redirectAttributes
//	 * @return
//	 */
//	@RequiresPermissions("jiaContract:view")
//    @RequestMapping(value = "export", method=RequestMethod.POST)
//    public String exportFile(JiaContract jiaContract, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
//		try {
//            String fileName = "甲方合同数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
//            Page<JiaContract> page = jiaContractService.findPage(new Page<JiaContract>(request, response, -1), jiaContract);
//    		new ExportExcel("甲方合同数据", JiaContract.class).setDataList(page.getList()).write(response, fileName).dispose();
//    		return null;
//		} catch (Exception e) {
//			addMessage(redirectAttributes, "导出甲方合同失败！失败信息："+e.getMessage());
//		}
//		return "redirect:" + adminPath + "/contract/jiaContract/list?repage";
//    }

	/**
	 * 导入甲方合同数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/contract/jiaContract/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<JiaContract> list = ei.getDataList(JiaContract.class);
			for (JiaContract jiaContract : list){
				try{
					if ("true".equals(checkId(jiaContract))){
						BeanValidators.validateWithException(validator, jiaContract);
						jiaContractService.save(jiaContract);
						successNum++;
					}else{
						failureMsg.append("<br/>甲方合同 "+jiaContract.getCid()+" 已存在; ");
						failureNum++;
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>甲方合同 "+jiaContract.getCid()+" 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>甲方合同 "+jiaContract.getCid()+" 导入失败："+ex.getMessage());
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条甲方合同，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入甲方合同失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/jiaContract/list?repage";
    }
	
	/**
	 * 下载导入甲方合同数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "甲方合同数据导入模板.xlsx";
//    		List<JiaContract> list = Lists.newArrayList(); 
//    		list.add(UserUtils.getUser());
    		new ExportExcel("甲方合同数据", JiaContract.class, 2).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/jiaContract/list?repage";
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
	public String upload(@RequestParam(value = "file") MultipartFile file,String uploadContractId, HttpServletRequest request,RedirectAttributes redirectAttributes) throws BusinessException {
		
		//设置文件目录(从数据字典读取)
		String dirName = DictUtils.getDictValue("contract/jia","upload_path_type","contract/jia");
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
	 * 验证合同编号是否有效
	 * @param newID
	 * @return
	 */
	@RequestMapping(value = "checkId")
	public String checkId(JiaContract jiaContract) {
		String result = "false";
		if(jiaContract !=null && jiaContractService.getByContractId(jiaContract) ==null){
			result = "true";
		}
		return result;
	}
	
	/**
	 *	由合同id获取合同
	 * @param jiaContract
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getByContractId")
	public JiaContract getByContractId(JiaContract jiaContract,HttpServletRequest request, HttpServletResponse response){
		jiaContract.setId(request.getParameter("id"));
		return jiaContractService.get(jiaContract);
	}
	
	/**
	 * 由项目id查关联二级项目
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="findSubprojectById")
	public List<Subproject> findSubprojectById(HttpServletRequest request, HttpServletResponse response){
		String projectId = request.getParameter("projectId");
		Subproject entity = new Subproject();
		entity.setProjectId(projectId);
		return subProjectService.findList(entity);
	}
	
	
	
	/**
	 * 提交合同待审
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"startworkflow"})
	@Transactional(readOnly = false)
	@ResponseBody
	public String startworkflow(HttpServletRequest request,HttpServletResponse response,Model model) {
		String contractId = request.getParameter("bindingId");
		
		//提交流程（正式开启流程）
		JiaContract jiaContract = jiaContractService.get(contractId);
		
		//区域中心负责人
		String CostLeaderBid = projectService.get(jiaContract.getProjectId()).getCostLeaderBid();
		String CostLeader = systemService.getUser(CostLeaderBid).getLoginName();
		
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put("costingResponsiblePerson", CostLeader);
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, JiaContractService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY,contractId);
		String actID = actTaskService.startProcess("FirstPartContractAuditFlow", "btg_con_jia_contract", "workflow_id","",variable);
		
		//更新合同工作流
		jiaContract.setWorkflowid(actID);
		jiaContract.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		jiaContract.setIsNewRecord(false);
		jiaContractService.save(jiaContract);
		return contractId;
	}

	@RequestMapping(value = "getContractByBuildAndProject/{buildNo}/{projectId}", method = RequestMethod.GET)
	public @ResponseBody JiaContract getContractByBuildAndProject(@PathVariable String buildNo, @PathVariable String projectId){
		String contractNo = jiaContractService.getContractNOByProjectIdAndBuildNO(buildNo, projectId);
		JiaContract contract = new JiaContract();
		contract.setCid(contractNo);
		return contract;
	}

}