package com.bt.modules.contract.web;

import java.util.ArrayList;
import java.util.List;

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
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.common.exceptions.BusinessException;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.contract.entity.Execution;
import com.bt.modules.contract.entity.ManufContractBase;
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.service.ExecutionService;
import com.bt.modules.contract.service.ManufContractBaseService;
import com.bt.modules.contract.service.ManufContractDetailPriceService;
import com.bt.modules.contract.service.ManufContractDetailService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.service.SupplierService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.UploadUtils;
import com.google.common.collect.Lists;

/**
 * 生产合同基本表Controller
 * @author yhh
 * @version 2015-08-01	
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/manufContractBase")
public class ManufContractBaseController extends BaseController {

	@Autowired
	private ManufContractBaseService manufContractBaseService;
	@Autowired
	private ManufContractDetailService manufContractDetailService;
	@Autowired
	private ManufContractDetailPriceService manufContractDetailPriceService;
	@Autowired
	private SupplierService  supplierService;
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private ExecutionService executionService;
	
	@ModelAttribute
	public ManufContractBase get(@RequestParam(required=false)String id,@RequestParam(required=false)String contractType,
			@RequestParam(required=false)String fristType, @RequestParam(required=false)String secondType) {
		ManufContractBase entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manufContractBaseService.get(id);
		}
		if (entity == null){
			entity = new ManufContractBase();
			entity.setContractType(contractType);
			entity.setFristType(fristType);
			entity.setSecondType(secondType);
		}
		return entity;
	}
	

	
	@RequestMapping(value = {"list", ""})
	public String list(ManufContractBase manufContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufContractBase> page = manufContractBaseService.findPage(new Page<ManufContractBase>(request, response), manufContractBase);
		model.addAttribute("page", page);
		return "modules/contract/manufContractBaseList";
//		manufContractBase.setCreateBy(UserUtils.getUser());
//		Page<ManufContractBase> page = manufContractBaseService.findMyManufContractBase(new Page<ManufContractBase>(request, response), manufContractBase);
//		model.addAttribute("page", page);
//		return "modules/contract/findMyManufContractBase";
	}
	
	/**
	 * 
	 * @param manufContractBase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyManufContractBase"})
	public String findMyManufContractBase(ManufContractBase manufContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		manufContractBase.setCreateBy(UserUtils.getUser());
		Page<ManufContractBase> page = manufContractBaseService.findMyManufContractBase(new Page<ManufContractBase>(request, response), manufContractBase);
		model.addAttribute("page", page);
		return "modules/contract/findMyManufContractBase";
	}
	@RequestMapping(value = {"findUnAuditManufContractBase"})
	public String findUnAuditManufContractBase(ManufContractBase manufContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		manufContractBase.setCreateBy(UserUtils.getUser());
		Page<ManufContractBase> page = manufContractBaseService.findUnAuditManufContractBase(new Page<ManufContractBase>(request, response), manufContractBase);
		model.addAttribute("page", page);
		return "modules/contract/findUnAuditManufContractBase";
	}
	@RequestMapping(value = {"findAuditDoneManufContractBase"})
	public String findAuditDoneManufContractBase(ManufContractBase manufContractBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		manufContractBase.setCreateBy(UserUtils.getUser());
		Page<ManufContractBase> page = manufContractBaseService.findAuditDoneManufContractBase(new Page<ManufContractBase>(request, response), manufContractBase);
		model.addAttribute("page", page);
		return "modules/contract/findAuditDoneManufContractBase";
	}

	@RequestMapping(value = "form")
	public String form(ManufContractBase manufContractBase, Model model) {
		//判断是否为新记录
		if(manufContractBase.getIsNewRecord()){
			manufContractBase.setId(IdGen.uuid());
		}else{
			model.addAttribute("flag","view");
		}
		
		//供应商列表
		Supplier supplier = new Supplier();
		supplier.setSupplierType(CommonConstant.Supp_JGC);
		List<Supplier> supplierList = supplierService.findList(supplier);
		model.addAttribute("supplierList", supplierList);
		List<Execution> executionList = executionService.findList(new Execution());
		model.addAttribute("executionList",executionList);

		//合同基础信息与明细
		ManufContractDetail manufContractDetail = new ManufContractDetail();
		manufContractDetail.setContractId(manufContractBase.getId());
		manufContractBase.setDetailList(manufContractDetailService.findList(manufContractDetail));
		model.addAttribute("manufContractBase", manufContractBase);
		
		//由合同id获取相关附件
		Attachment attachment = new Attachment();
		attachment.setType(manufContractBase.getId());
		List<Attachment> attachList = attachService.findAttachType(attachment);
		model.addAttribute("attachList", attachList);
		
		return "modules/contract/manufContractBaseForm";
	}

	@RequestMapping(value = "save", method ={RequestMethod.POST})
	@ResponseBody
	public ManufContractBase save(@RequestBody String jsonStr,HttpServletRequest request,
			HttpServletResponse response) {
		ManufContractBase base =  (ManufContractBase) JsonMapper
				.fromJsonString(jsonStr, ManufContractBase.class);
		manufContractBaseService.save(base);
		return base;
	}
	
	@RequestMapping(value = "delete")
	public String delete(ManufContractBase manufContractBase, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		manufContractBaseService.delete(manufContractBase);
		addMessage(redirectAttributes, "删除生产合同基本表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/manufContractBase/list";
	}
	
	@ResponseBody
	@RequestMapping(value="changeFromSupplier")
	public ManufContractBase changeFromSupplier(@RequestBody ManufContractBase contract,
			HttpServletRequest request, HttpServletResponse response){
		String partyBCode = null;
		Supplier supplier= supplierService.get(contract.getPartyBName());
		if(null == supplier){
			partyBCode = executionService.get(contract.getPartyBName()).getCode();
		}else{
			partyBCode = supplier.getCode();
		}
		contract.setPartyBCode(partyBCode);
		String contractNo = manufContractBaseService.createSeriesnumber(contract);
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
            String fileName = "生产合同明细导入模板.xlsx";
    		List<ManufContractDetail> list = Lists.newArrayList();
    		new ExportExcel("生产合同明细", ManufContractDetail.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/contract/manufContractBase/list";
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
		String dirName = DictUtils.getDictValue("contract/manuf","upload_path_type","contract/manuf");
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
	public ManufContractBase getById(ManufContractBase mcb, HttpServletRequest request, HttpServletResponse response){
		mcb.setId(request.getParameter("id"));
		return manufContractBaseService.get(mcb);
	}

	/**
	 * 导入明细,回显明细到页面
	 * @param importFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "importDetail",method=RequestMethod.POST)
    public List<ManufContractDetail> importDetail(@RequestParam(value = "importFile") MultipartFile importFile, HttpServletRequest request) {
		List<ManufContractDetail> returnList = new ArrayList<ManufContractDetail>();
		try {
			ImportExcel ei = new ImportExcel(importFile, 1, 0);
			List<ManufContractDetail> list = ei.getDataList(ManufContractDetail.class);
			returnList = list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnList;
    }
	
	
}