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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.OtherContractDetail;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.contract.entity.PurchasingContractDetail;
import com.bt.modules.contract.service.OtherContractDetailService;
import com.bt.modules.contract.service.PurchasingContractBaseService;
import com.bt.modules.contract.service.PurchasingContractDetailService;
import com.bt.modules.material.entity.Material;
import com.bt.modules.material.service.MaterialService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.service.SupplierService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.UploadUtils;
import com.google.common.collect.Lists;

/**
 * purchasingController
 * @author yhh
 * @version 2015-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/purchasingContractBase")
public class PurchasingContractBaseController extends BaseController {

	@Autowired
	private PurchasingContractBaseService purchasingContractBaseService;
	@Autowired
	private PurchasingContractDetailService purchasingContractDetailService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private MaterialService materialService;
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private ActTaskService actTaskService;
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;
	@Autowired
	private OtherContractDetailService otherContractDetailService;
	
	
	@ModelAttribute
	public PurchasingContractBase get(@RequestParam(required=false)String id,@RequestParam(required=false)String contractType,
			@RequestParam(required=false)String fristType, @RequestParam(required=false)String secondType) {
		PurchasingContractBase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = purchasingContractBaseService.get(id);
		}
		if (entity == null){
			entity = new PurchasingContractBase();
			entity.setContractType(contractType);
			entity.setFristType(fristType);
			entity.setSecondType(secondType);
		}
		return entity;
	}
	
	@RequestMapping(value = {"list", ""})
	public String list(PurchasingContractBase purchasingContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PurchasingContractBase> page = purchasingContractBaseService.findPage(new Page<PurchasingContractBase>(request, response), purchasingContractBase); 

		model.addAttribute("page", page);
		return "modules/contract/purchasingContractBaseList";
//		purchasingContractBase.setCreateBy(UserUtils.getUser());
//		Page<PurchasingContractBase> page = purchasingContractBaseService.findMyPurchasingContractBase(new Page<PurchasingContractBase>(request, response), purchasingContractBase); 
//		model.addAttribute("page", page);
//		return "modules/contract/findMyPurchasingContractBase";
	}
	
	/**
	 * 流程状态数据
	 * @param purchasingContractBase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyPurchasingContractBase"})
	public String findMyPurchasingContractBase(PurchasingContractBase purchasingContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		purchasingContractBase.setCreateBy(UserUtils.getUser());
		Page<PurchasingContractBase> page = purchasingContractBaseService.findMyPurchasingContractBase(new Page<PurchasingContractBase>(request, response), purchasingContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findMyPurchasingContractBase";
	}
	@RequestMapping(value = {"findUnAuditPurchasingContractBase"})
	public String findUnAuditPurchasingContractBase(PurchasingContractBase purchasingContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		purchasingContractBase.setCreateBy(UserUtils.getUser());
		Page<PurchasingContractBase> page = purchasingContractBaseService.findUnAuditPurchasingContractBase(new Page<PurchasingContractBase>(request, response), purchasingContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findUnAuditPurchasingContractBase";
	}
	@RequestMapping(value = {"findAuditDonePurchasingContractBase"})
	public String findAuditDonePurchasingContractBase(PurchasingContractBase purchasingContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		purchasingContractBase.setCreateBy(UserUtils.getUser());
		Page<PurchasingContractBase> page = purchasingContractBaseService.findAuditDonePurchasingContractBase(new Page<PurchasingContractBase>(request, response), purchasingContractBase); 
		model.addAttribute("page", page);
		return "modules/contract/findAuditDonePurchasingContractBase";
	}

	@RequestMapping(value = "form")
	public String form(PurchasingContractBase purchasingContractBase, Model model) {
		//判断是否为新记录
		if(purchasingContractBase.getIsNewRecord()){
			purchasingContractBase.setId(IdGen.uuid());
		}else{
			model.addAttribute("flag","view");
		}
		
		//供应商列表
		Supplier supplier = new Supplier();
		supplier.setSupplierType(CommonConstant.Supp_GYS);
		List<Supplier> supplierList = supplierService.findList(supplier);
		supplier.setSupplierType(CommonConstant.Supp_DXC);
		supplierList.addAll(supplierService.findList(supplier));
		model.addAttribute("supplierList", supplierList);
		
		//基础与明细
		PurchasingContractDetail PurchasingContractDetail = new PurchasingContractDetail();
		PurchasingContractDetail.setContractId(purchasingContractBase.getId());
		purchasingContractBase.setDetailList(purchasingContractDetailService.findList(PurchasingContractDetail));
		OtherContractDetail otherContractDetail = new OtherContractDetail();
		otherContractDetail.setContractId(purchasingContractBase.getId());
		purchasingContractBase.setDetailListX(otherContractDetailService.findList(otherContractDetail));
		model.addAttribute("purchasingContractBase", purchasingContractBase);
		
		//物料,物料价
		List<Material> materialList = materialService.findList(new Material());
		model.addAttribute("materialList", materialList);
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(purchasingContractBase.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		
		return "modules/contract/purchasingContractBaseForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "save", method ={RequestMethod.POST})
	public PurchasingContractBase save(@RequestBody String jsonStr,HttpServletRequest request,
			HttpServletResponse response) {
		PurchasingContractBase base =  (PurchasingContractBase) JsonMapper
				.fromJsonString(jsonStr, PurchasingContractBase.class);
		purchasingContractBaseService.save(base);
		return base;
	}
	
	@ResponseBody
	@RequestMapping(value="changeFromSupplier")
	public PurchasingContractBase changeFromSupplier(@RequestBody PurchasingContractBase contract,
			HttpServletRequest request, HttpServletResponse response){
		String partyBCode = supplierService.get(contract.getPartyBName()).getCode();
		contract.setPartyBCode(partyBCode);
		String contractNo = purchasingContractBaseService.createSeriesnumber(contract);
		contract.setContractNo(contractNo);
		return contract;
	}
	
	@RequestMapping(value = "delete")
	public String delete(PurchasingContractBase purchasingContractBase, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		purchasingContractBaseService.delete(purchasingContractBase);
		addMessage(redirectAttributes, "删除采购合同成功");
		return "redirect:"+Global.getAdminPath()+"/contract/purchasingContractBase/list";
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
            String fileName = "采购合同明细导入模板.xlsx";
    		List<PurchasingContractDetail> list = Lists.newArrayList();
    		new ExportExcel("采购合同明细", PurchasingContractDetail.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/purchasingContractBase/list";
    }
	
	/**
	 * 导入明细,回显明细到页面
	 * @param importFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "importDetail",method=RequestMethod.POST)
    public List<PurchasingContractDetail> importDetail(@RequestParam(value = "importFile") MultipartFile importFile, HttpServletRequest request) {
		int sheet = 3;
		List<PurchasingContractDetail> returnList = new ArrayList<PurchasingContractDetail>();
		try {
			for(int i =0; i<sheet; i++){
				ImportExcel ei = new ImportExcel(importFile, 1, i);
				List<PurchasingContractDetail> list = ei.getDataList(PurchasingContractDetail.class);
				returnList.addAll(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnList;
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
		String dirName = DictUtils.getDictValue("contract/purchasing","upload_path_type","contract/purchasing");
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
	public PurchasingContractBase getById(PurchasingContractBase pcb, HttpServletRequest request, HttpServletResponse response){
		pcb.setId(request.getParameter("id"));
		return purchasingContractBaseService.get(pcb);
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
		PurchasingContractBase purchasingContractBase = purchasingContractBaseService.get(contractId);
		
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, PurchasingContractBaseService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, contractId);
		String actID = actTaskService.startProcess("procureContractFlow", "btg_purchasing_contract_base", "workflow_id","",variable);
		
		//更新合同工作流
		purchasingContractBase.setWorkflowid(actID);
		purchasingContractBase.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		purchasingContractBaseService.save(purchasingContractBase);
		return null;
	}
		
		
		
}