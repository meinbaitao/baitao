/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
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
import com.bt.modules.contract.entity.StoneCarriageContractBase;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.service.StoneCarriageContractBaseService;
import com.bt.modules.contract.service.StoneCarriageContractDetailService;
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
 * stoneCarriagecarry1Controller
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/stoneCarriageContractBase")
public class StoneCarriageContractBaseController extends BaseController {

	@Autowired
	private StoneCarriageContractBaseService stoneCarriageContractBaseService;
	
	@Autowired
	private StoneCarriageContractDetailService stoneCarriageContractDetailService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	private ActTaskService actTaskService;

	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;
	
//	@InitBinder
//	public void initListBinder(WebDataBinder binder) {
//		// 设置需要包裹的元素个数，默认为256
//		binder.setAutoGrowCollectionLimit(1024);
//	}
	
	@ModelAttribute
	public StoneCarriageContractBase get(@RequestParam(required=false)String id,@RequestParam(required=false)String contractType,
			@RequestParam(required=false)String fristType, @RequestParam(required=false)String secondType) {
		StoneCarriageContractBase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = stoneCarriageContractBaseService.get(id);
		}
		if (entity == null){
			entity = new StoneCarriageContractBase();
			entity.setContractType(contractType);
			entity.setFristType(fristType);
			entity.setSecondType(secondType);
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(StoneCarriageContractBase stoneCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<StoneCarriageContractBase> page = stoneCarriageContractBaseService.findPage(new Page<StoneCarriageContractBase>(request, response), stoneCarriageContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/stoneCarriageContractBaseList";
//		stoneCarriageContractBase.setCreateBy(UserUtils.getUser());
//		Page<StoneCarriageContractBase> page = stoneCarriageContractBaseService.findMyStoneCarriageContractBase(new Page<StoneCarriageContractBase>(request, response), stoneCarriageContractBase); 
//		model.addAttribute("page", page);
//		return "modules/contract/findMyStoneCarriageContractBase";
	}
	/**
	 * 
	 * @param stoneCarriageContractBase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyStoneCarriageContractBase"})
	public String findMyStoneCarriageContractBase(StoneCarriageContractBase stoneCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		stoneCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<StoneCarriageContractBase> page = stoneCarriageContractBaseService.findMyStoneCarriageContractBase(new Page<StoneCarriageContractBase>(request, response), stoneCarriageContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findMyStoneCarriageContractBase";
	}
	@RequestMapping(value = {"findUnAuditStoneCarriageContractBase"})
	public String findUnAuditStoneCarriageContractBase(StoneCarriageContractBase stoneCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		stoneCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<StoneCarriageContractBase> page = stoneCarriageContractBaseService.findUnAuditStoneCarriageContractBase(new Page<StoneCarriageContractBase>(request, response), stoneCarriageContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findUnAuditStoneCarriageContractBase";
	}
	@RequestMapping(value = {"findAuditDoneStoneCarriageContractBase"})
	public String findAuditDoneStoneCarriageContractBase(StoneCarriageContractBase stoneCarriageContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		stoneCarriageContractBase.setCreateBy(UserUtils.getUser());
		Page<StoneCarriageContractBase> page = stoneCarriageContractBaseService.findAuditDoneStoneCarriageContractBase(new Page<StoneCarriageContractBase>(request, response), stoneCarriageContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findAuditDoneStoneCarriageContractBase";
	}

	@RequestMapping(value = "form")
	public String form(StoneCarriageContractBase stoneCarriageContractBase, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		//判断是否为新纪录
		if(stoneCarriageContractBase.getIsNewRecord()){
			stoneCarriageContractBase.setId(IdGen.uuid());
		}else{
			model.addAttribute("flag","view");
		}
		
		//供应商
		Supplier supplier = new Supplier();
		supplier.setSupplierType(CommonConstant.Supp_WL);
		List<Supplier> supplierList = supplierService.findList(supplier);
		model.addAttribute("supplierList", supplierList);
		
		//基础与明细
		StoneCarriageContractDetail stoneCarriageContractDetail = new StoneCarriageContractDetail();
		stoneCarriageContractDetail.setContractId(stoneCarriageContractBase.getId());
		stoneCarriageContractBase.setDetailList(stoneCarriageContractDetailService.findList(stoneCarriageContractDetail));
		model.addAttribute("stoneCarriageContractBase", stoneCarriageContractBase);
		
		//运输价库
		List<StoneCarriageContractBase> sccbList = stoneCarriageContractBaseService.findList(new StoneCarriageContractBase());
		model.addAttribute("sccbList", sccbList);
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(stoneCarriageContractBase.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		
		model.addAttribute("stoneCarriageContractDetail", new StoneCarriageContractDetail());
		return "modules/contract/stoneCarriageContractBaseForm";
	}

//	@InitBinder("StoneCarriageContractDetail")  
//    public void initBinderFormBean1(WebDataBinder binder) {    
//        binder.setFieldDefaultPrefix("StoneCarriageContractDetail.");    
//    }  
	
	@RequestMapping(value = "save", method ={RequestMethod.POST})
	@ResponseBody
	public StoneCarriageContractBase save(@RequestBody String jsonStr,HttpServletRequest request,
			HttpServletResponse response) {
		StoneCarriageContractBase base =  (StoneCarriageContractBase) JsonMapper
				.fromJsonString(jsonStr, StoneCarriageContractBase.class);
		stoneCarriageContractBaseService.save(base);
		return base;
	}
	
	@RequestMapping(value = "delete")
	public String delete(StoneCarriageContractBase stoneCarriageContractBase, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		stoneCarriageContractBaseService.delete(stoneCarriageContractBase);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:"+Global.getAdminPath()+"/contract/stoneCarriageContractBase/list";
	}

	@ResponseBody
	@RequestMapping(value="changeFromSupplier")
	public StoneCarriageContractBase changeFromSupplier(@RequestBody StoneCarriageContractBase contract,
			HttpServletRequest request, HttpServletResponse response){
		String partyBCode = supplierService.get(contract.getPartyBName()).getCode();
		contract.setPartyBCode(partyBCode);
		String contractNo = stoneCarriageContractBaseService.createSeriesnumber(contract);
		contract.setContractNo(contractNo);
		return contract;
	}
	
	/**
	 * 下载导入数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "石材运输合同明细导入模板.xlsx";
    		List<StoneCarriageContractDetail> list = Lists.newArrayList();
    		new ExportExcel("石材运输合同明细", StoneCarriageContractDetail.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/stoneCarriageContractBase/list";
    }
	
	/**
	 * 导入明细,回显明细到页面
	 * @param importFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "importDetail",method=RequestMethod.POST)
    public List<StoneCarriageContractDetail> importDetail(@RequestParam(value = "importFile") MultipartFile importFile, HttpServletRequest request) {
		List<StoneCarriageContractDetail> returnList = new ArrayList<StoneCarriageContractDetail>();
		try {
			ImportExcel ei = new ImportExcel(importFile, 1, 0);
			List<StoneCarriageContractDetail> list = ei.getDataList(StoneCarriageContractDetail.class);
			returnList = list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnList;
    }
	
	/**
	 * 上传附件
	 * xujianpeng
	 * @param file
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws BusinessException 
	 */
	@ResponseBody
	@RequestMapping(value = "upload",method=RequestMethod.POST)
	public String upload(@RequestParam(value = "file") MultipartFile file,String uploadContractId, HttpServletRequest request,RedirectAttributes redirectAttributes) throws BusinessException {
		//设置合同文件目录(从数据字典读取)
		String dirName = DictUtils.getDictValue("contract/stoneCarriage","upload_path_type","contract/stoneCarriage");
		UploadUtils utils = new UploadUtils();
		return utils.uploadFile(file, request,dirName,uploadContractId);
	}
	
	/**
	 * 下载附件
	 * xujianpeng
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
	public StoneCarriageContractBase getById(StoneCarriageContractBase scb, HttpServletRequest request, HttpServletResponse response){
		scb.setId(request.getParameter("id"));
		return stoneCarriageContractBaseService.get(scb);
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
		StoneCarriageContractBase stoneCarriageContractBase = stoneCarriageContractBaseService.get(contractId);
		
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, StoneCarriageContractBaseService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, contractId);
		String actID = actTaskService.startProcess("transportContractFlow", "btg_stone_carriage_contract_base", "workflow_id","",variable);
		
		//更新合同工作流
		stoneCarriageContractBase.setWorkflowid(actID);
		stoneCarriageContractBase.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		stoneCarriageContractBaseService.save(stoneCarriageContractBase);
		return null;
	}
	
}