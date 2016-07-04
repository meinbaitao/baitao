package com.bt.modules.contract.web;

import java.util.List;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.ConYearContract;
import com.bt.modules.contract.entity.Execution;
import com.bt.modules.contract.service.ConYearContractService;
import com.bt.modules.contract.service.ExecutionService;
import com.bt.modules.utils.UploadUtils;

/**
 * 年度合同Controller
 * @author yhh
 * @version 2015-08-14
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/conYearContract")
public class ConYearContractController extends BaseController {

	@Autowired
	private ConYearContractService conYearContractService;
	
	@Autowired
	private ExecutionService	 executionService;
	
	@Autowired
	private AttachmentService attachService;
	
	@ModelAttribute
	public ConYearContract get(@RequestParam(required=false) String id) {
		ConYearContract entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = conYearContractService.get(id);
		}
		if (entity == null){
			entity = new ConYearContract();
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(ConYearContract conYearContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		String status = "1";
		Execution execution = new Execution();
		execution.setStatus(status);
		
		Page<ConYearContract> page = conYearContractService.findPage(new Page<ConYearContract>(request, response), conYearContract); 
		List<Execution> executionList = executionService.findList(execution);
		model.addAttribute("executionList", executionList);
		model.addAttribute("page", page);
		return "modules/contract/conYearContractList";
	}

	@RequestMapping(value = "form")
	public String form(ConYearContract conYearContract, Model model) {
		//判断是否新记录
		if(conYearContract.getIsNewRecord()){
			String createId = IdGen.uuid();
			conYearContract.setId(createId);
		}else{
			model.addAttribute("flag","view");
		}
		
		//获取施工班组白名单列表
		Execution execution = new Execution();
		execution.setStatus("executionStatus_white");
		List<Execution> executionList = executionService.findList(execution);
		model.addAttribute("executionList", executionList);
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(conYearContract.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		
		model.addAttribute("conYearContract", conYearContract);
		return "modules/contract/conYearContractForm";
	}

	@RequestMapping(value = "save")
	public String save(ConYearContract conYearContract, Model model, RedirectAttributes redirectAttributes) {
		conYearContractService.save(conYearContract);
		addMessage(redirectAttributes, "保存年度合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/conYearContract/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(ConYearContract conYearContract, RedirectAttributes redirectAttributes) {
		conYearContractService.delete(conYearContract);
		addMessage(redirectAttributes, "删除年度合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/conYearContract/list";
	}

	@ResponseBody
	@RequestMapping("getContractById")
	public ConYearContract geContractById(ConYearContract yearContract, HttpServletRequest request, HttpServletResponse response){
		yearContract.setId(request.getParameter("id"));
		return conYearContractService.get(yearContract);
	}
	
	@ResponseBody
	@RequestMapping(value="getExecutionByType")
	public List<ConYearContract> getExecutionByType(ConYearContract yearContract, HttpServletRequest request, HttpServletResponse response){
		yearContract.setExeType(request.getParameter("type"));
		return conYearContractService.findList(yearContract);
		
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
		String dirName = DictUtils.getDictValue("contract/year","upload_path_type","contract/year");
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
	
}