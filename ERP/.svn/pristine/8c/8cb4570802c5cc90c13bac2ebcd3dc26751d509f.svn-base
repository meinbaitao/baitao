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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.bt.modules.contract.entity.AccCarriageContractBase;
import com.bt.modules.contract.entity.AccCarriageContractDetail;
import com.bt.modules.contract.service.AccCarriageContractBaseService;
import com.bt.modules.contract.service.AccCarriageContractDetailService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.service.SupplierService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.UploadUtils;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 辅料运输合同Controller
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/accCarriageContractBase")
public class AccCarriageContractBaseController extends BaseController {

	@Autowired
	private AccCarriageContractBaseService accCarriageContractBaseService;
	
	@Autowired
	private AccCarriageContractDetailService accCarriageContractDetailService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	private ActTaskService actTaskService;

	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;
	
	@ModelAttribute
	public AccCarriageContractBase get(@RequestParam(required=false)String id,@RequestParam(required=false)String contractType,
			@RequestParam(required=false)String fristType, @RequestParam(required=false)String secondType) {
		AccCarriageContractBase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = accCarriageContractBaseService.get(id);
		}
		if (entity == null){
			entity = new AccCarriageContractBase();
			entity.setContractType(contractType);
			entity.setFristType(fristType);
			entity.setSecondType(secondType);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "list")
	public String list(AccCarriageContractBase accCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {

		Page<AccCarriageContractBase> page = accCarriageContractBaseService.findPage(new Page<AccCarriageContractBase>(request, response), accCarriageContractBase); 
		
		model.addAttribute("page", page);		
		return "modules/contract/accCarriageContractBaseList";
	}
	/**
	 * 
	 * @param accCarriageContractBase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "findMyAccCarriageContractBase")
	public String findMyAccCarriageContractBase(AccCarriageContractBase accCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		accCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<AccCarriageContractBase> page = accCarriageContractBaseService.findMyAccCarriageContractBase(new Page<AccCarriageContractBase>(request, response), accCarriageContractBase); 
		model.addAttribute("page", page);		
		return "modules/contract/findMyAccCarriageContractBase";
	}
	@RequestMapping(value = "findUnAuditAccCarriageContractBase")
	public String findUnAuditAccCarriageContractBase(AccCarriageContractBase accCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		accCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<AccCarriageContractBase> page = accCarriageContractBaseService.findUnAuditAccCarriageContractBase(new Page<AccCarriageContractBase>(request, response), accCarriageContractBase); 
		model.addAttribute("page", page);		
		return "modules/contract/findUnAuditAccCarriageContractBase";
	}
	@RequestMapping(value = "findAuditDoneAccCarriageContractBase")
	public String findAuditDoneAccCarriageContractBase(AccCarriageContractBase accCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		accCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<AccCarriageContractBase> page = accCarriageContractBaseService.findAuditDoneAccCarriageContractBase(new Page<AccCarriageContractBase>(request, response), accCarriageContractBase); 
		model.addAttribute("page", page);		
		return "modules/contract/findAuditDoneAccCarriageContractBase";
	}

	@RequestMapping(value = "form")
	public String form(AccCarriageContractBase accCarriageContractBase, Model model) {
		//判断是否为新纪录
		if(accCarriageContractBase.getIsNewRecord()){
			accCarriageContractBase.setId(IdGen.uuid());
		}else{
			model.addAttribute("flag","view");
		}
		
		//供应商
		Supplier supplier = new Supplier();
		supplier.setSupplierType(CommonConstant.Supp_WL);
		List<Supplier> supplierList = supplierService.findList(supplier);
		model.addAttribute("supplierList", supplierList);
		
		//基础与明细
		AccCarriageContractDetail accCarriageContractDetail = new AccCarriageContractDetail();
		accCarriageContractDetail.setContractId(accCarriageContractBase.getId());
		accCarriageContractBase.setDetailList(accCarriageContractDetailService.findList(accCarriageContractDetail));
		model.addAttribute("accCarriageContractBase", accCarriageContractBase);
		
		//运输价库
		List<AccCarriageContractBase> accbList = accCarriageContractBaseService.findList(new AccCarriageContractBase());
		model.addAttribute("accbList", accbList);
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(accCarriageContractBase.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		
		return "modules/contract/accCarriageContractBaseForm";
	}

	@RequestMapping(value = "save", method ={RequestMethod.POST})
	@ResponseBody
	public AccCarriageContractBase save(@RequestBody String jsonStr,HttpServletRequest request,
			HttpServletResponse response) {
		AccCarriageContractBase base =  (AccCarriageContractBase) JsonMapper
				.fromJsonString(jsonStr, AccCarriageContractBase.class);
		accCarriageContractBaseService.save(base);
		return base;
	}
	
	@RequestMapping(value = "delete")
	public String delete(AccCarriageContractBase accCarriageContractBase, RedirectAttributes redirectAttributes) {
		accCarriageContractBaseService.delete(accCarriageContractBase);
		addMessage(redirectAttributes, "删除辅料运输合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/accCarriageContractBase/list";
	}

	@ResponseBody
	@RequestMapping(value="changeFromSupplier")
	public AccCarriageContractBase changeFromSupplier(@RequestBody AccCarriageContractBase contract,
			HttpServletRequest request, HttpServletResponse response){
		String partyBCode = supplierService.get(contract.getPartyBName()).getCode();
		contract.setPartyBCode(partyBCode);
		String contractNo = accCarriageContractBaseService.createSeriesnumber(contract);
		contract.setContractNo(contractNo);
		return contract;
	}
	
	/**
	 * 导入明细
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "importDetail",method=RequestMethod.POST)
    public List<AccCarriageContractDetail> importDetail(@RequestParam(value = "importFile") MultipartFile importFile, HttpServletRequest request) {
		List<AccCarriageContractDetail> returnList = new ArrayList<AccCarriageContractDetail>();
		try {
			ImportExcel ei = new ImportExcel(importFile, 1, 0);
			List<AccCarriageContractDetail> list = ei.getDataList(AccCarriageContractDetail.class);
			returnList = list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnList;
    }

	
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "辅料运输合同明细导入模板.xlsx";
    		List<AccCarriageContractDetail> list = Lists.newArrayList();
    		new ExportExcel("辅料运输合同明细", AccCarriageContractDetail.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/accCarriageContractBase/list";
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
		String dirName = DictUtils.getDictValue("contract/accCarriage","upload_path_type","contract/accCarriage");
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
	
	
	
	@ResponseBody
	@RequestMapping(value="getById")
	public AccCarriageContractBase getById(AccCarriageContractBase accb, HttpServletRequest request, HttpServletResponse response){
		accb.setId(request.getParameter("id"));
		return accCarriageContractBaseService.get(accb);
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
	public String startworkflow(HttpServletRequest request,HttpServletResponse response,Model model) {
		String contractId = request.getParameter("bindingId");
		
		//提交流程（正式开启流程）
		AccCarriageContractBase accCarriageContractBase = accCarriageContractBaseService.get(contractId);
		
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, AccCarriageContractBaseService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, contractId);
		String actID = actTaskService.startProcess("transportContractFlow", "btg_acc_carriage_contract_base", "workflow_id","",variable);
		
		//更新合同工作流
		accCarriageContractBase.setWorkflowid(actID);
		accCarriageContractBase.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		accCarriageContractBaseService.save(accCarriageContractBase);
		return null;
	}
	 
	 /**
	  * ajax 由供应商id获取供应商
	  * @param request
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="getSupplierById")
	 public Supplier getSupplierById(HttpServletRequest request){
		String supplierId = request.getParameter("id");
		return supplierService.get(supplierId);
	 }
	 
}