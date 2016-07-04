/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.HeaderStories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.modules.contract.entity.Execution;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.entity.ManufContractBase;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.contract.service.ContractPrintService;
import com.bt.modules.contract.service.ExecutionService;
import com.bt.modules.contract.service.Jacob4word;
import com.bt.modules.contract.service.LaborcontractService;
import com.bt.modules.contract.service.ManufContractBaseService;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.UploadUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 合同台账Controller
 * @author yhh
 * @version 2015-12-01
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/contractPrint")
public class ContractPrintController extends BaseController {

	@Autowired
	private ContractPrintService contractPrintService;
	
	@Autowired
	private ExecutionService executionService;
	
	@Autowired
	private ManufContractBaseService manufContractBaseService;
	
	@Autowired
	private LaborcontractService laborcontractService;
	
	@RequestMapping(value = {"list", ""})
	public String list(ManufContractBase manufContractBase,HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufContractBase> page = manufContractBaseService.findPage(new Page<ManufContractBase>(request, response), manufContractBase);
		model.addAttribute("page", page);
		return "modules/contract/contractPrint";
	}
	
	@RequestMapping(value ="/purchasecontract")
	public String getPurchaseContractById(HttpServletRequest request, HttpServletResponse response, Model model) throws FileNotFoundException, IOException {
		PurchasingContractBase purchasingContractBase = new PurchasingContractBase();
		purchasingContractBase.setId(request.getParameter("id"));
		PurchasingContractBase data = contractPrintService.getPurchaseContractById(purchasingContractBase);
		
		//将dll文件复制进用户的system32目录下
		String jacob64 =  "jacob-1.17-M2-x64.dll";
		String jacob32 =  "jacob-1.17-M2-x86.dll";
		
		String patha = getPrintRootpath();
		String jacob64Path = patha+"/print/dll/"+jacob64;
		String jacob32Path = patha+"/print/dll/"+jacob32;
		String destdir = "C://Windows//System32//";
		
		contractPrintService.copyfiletodir(destdir,jacob64, new File(jacob64Path), new File(destdir));
		contractPrintService.copyfiletodir(destdir,jacob32, new File(jacob32Path), new File(destdir));
		
		model.addAttribute("purchasingcontractbase", data);
		if("1".equals(request.getParameter("type"))){
			model.addAttribute("printType", "1");
			return "modules/contract/purchasePrint_1";
		}else if("2".equals(request.getParameter("type"))){
			model.addAttribute("printType", "2");
			return "modules/contract/purchasePrint_2";
		}else if("3".equals(request.getParameter("type"))){
			model.addAttribute("printType", "3");
			return "modules/contract/purchasePrint_3";
		}else if("4".equals(request.getParameter("type"))){
			model.addAttribute("printType", "4");
			return "modules/contract/purchasePrint_4";
		}else if("5".equals(request.getParameter("type"))){
			model.addAttribute("printType", "5");
			return "modules/contract/purchasePrint_5";
		}
		return "modules/contract/laborPrint_1";
	}

	

	
	@RequestMapping(value ="/purchasePrintWord")
	public void purchasePrintWord(HttpServletRequest request, HttpServletResponse response, Model model) throws FileNotFoundException, IOException {
		//定义map
		Map<String,Object> map = new HashMap<String,Object>();
		//定义返回结果
		boolean result = false;
		
		String patha = getPrintRootpath();
		
		String sourcepath = "";
		String destpath = "";
		String waterMarkPath = patha+"/print/purchase/waterprint.png";
		
		String printType = request.getParameter("printType");
		if("1".equals(printType)){
			sourcepath = patha+"/print/purchase/工程辅料类采购基本合同.doc";
			destpath = patha+"/print/purchaseOut/tempPrint_1.doc";
		}else if("2".equals(printType)){
			sourcepath = patha+"/print/purchase/除工程辅料、生产辅料木箱的其他采购类.doc";
			destpath = patha+"/print/purchaseOut/tempPrint_2.doc";
		}else if("3".equals(printType)){
			sourcepath = patha+"/print/purchase/生产辅料木材类采购基本合同.doc";
			destpath = patha+"/print/purchaseOut/tempPrint_3.doc";
		}else if("4".equals(printType)){
			sourcepath = patha+"/print/purchase/石材成品石材类承揽基本合同.doc";
			destpath = patha+"/print/purchaseOut/tempPrint_4.doc";
		}else if("5".equals(printType)){
			sourcepath = patha+"/print/purchase/加工类石材类承揽基本合同.doc";
			destpath = patha+"/print/purchaseOut/tempPrint_5.doc";
		}
		
		
		PurchasingContractBase purchasingContractBase = new PurchasingContractBase();
		purchasingContractBase.setId(request.getParameter("id"));
		PurchasingContractBase data = contractPrintService.getPurchaseContractById(purchasingContractBase);
		//向word里面写入需要替换的值
		contractPrintService.writeWord(sourcepath, destpath,data);
		
		//调用jacob 动态链接库操作word并添加水印
		Jacob4word j4w = Jacob4word.getInstance();
		result = j4w.addWaterMark(destpath, waterMarkPath);
		
		//写保护对word
		result = j4w.protectFile(destpath,DictUtils.getDictValue("protectPwd", "wordPrint", "123"));
		
		//打印当前的word
		new UploadUtils().downloadFileByPath(destpath, new File(sourcepath).getName(), request, response);;
		
//		result = j4w.printCurrentFile(destpath);
		
		/*if(result){
			 map.put("result", "success");
		}else{
			map.put("result", "failure");
		}
		return map;*/
	}

	public String getPrintRootpath() {
		String patha = ContractPrintController.class.getResource("/").toString();
		patha = patha.substring(0,patha.lastIndexOf("/"));
		patha = patha.substring(0,patha.lastIndexOf("/"));
		patha = patha.substring(patha.indexOf("/")+1,patha.lastIndexOf("/"));
		return patha;
	}
	
	
	@RequestMapping(value ="/laborcontract")
	public String getLaborContractById(HttpServletRequest request, HttpServletResponse response, Model model) {
		Laborcontract laborcontract = new Laborcontract();
		Execution execution = null;
		String contractpriceDX ="";
		String id = request.getParameter("id");
		if(null !=id && !"".equals(id)){
			laborcontract = laborcontractService.get(id);
			
			if (StringUtils.isNotBlank(laborcontract.getCtype())){
				execution = executionService.get(laborcontract.getCtype());
			}
			
			if(StringUtils.isNotBlank(laborcontract.getContractPrice())){
				contractpriceDX = CommonUtils.hangeToBig(Double.parseDouble(laborcontract.getContractPrice()));
			}
			
		}
		model.addAttribute("contractpriceDX", contractpriceDX);
		model.addAttribute("execution", execution);
		model.addAttribute("laborcontract", laborcontract);
		return "modules/contract/laborPrint_1";
	}
	
	@RequestMapping(value ="/print")
	public String getlist(HttpServletRequest request, HttpServletResponse response, Model model) {
		String id = request.getParameter("id");
		ManufContractBase manufcontractbase = contractPrintService.findTestData(id);
		model.addAttribute("manufcontractbase", manufcontractbase);
		return "modules/contract/word2html";
	}
}