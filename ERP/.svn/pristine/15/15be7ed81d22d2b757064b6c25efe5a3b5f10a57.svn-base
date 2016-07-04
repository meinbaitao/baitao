/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.entity.ManufContractDetailPrice;
import com.bt.modules.contract.service.ManufContractDetailPriceService;
import com.bt.modules.contract.service.ManufContractDetailService;
import com.bt.modules.material.service.MaterialService;

/**
 * 生产合同明细表Controller
 * @author ljp
 * @version 2015-08-01		
 */
@Controller
@RequestMapping(value = "${adminPath}/contract/manufContractDetail")
public class ManufContractDetailController extends BaseController {

	@Autowired
	private ManufContractDetailService manufContractDetailService;
	
	@Autowired
	private ManufContractDetailPriceService manufContractDetailPriceService;
	
	@Autowired
	private MaterialService materialService;
	
	/**
	 * 执行其他方法前先获取对象
	 * @param id
	 * @return
	 */
	@ModelAttribute
	public ManufContractDetail get(@RequestParam(required=false) String id) {
		ManufContractDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = manufContractDetailService.get(id);
		}
		if (entity == null){
			entity = new ManufContractDetail();
		}
		return entity;
	}
	
	/**
	 * 对象列表查询
	 * @param manufContractDetail
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(ManufContractDetail manufContractDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ManufContractDetail> page = manufContractDetailService.findPage(new Page<ManufContractDetail>(request, response), manufContractDetail); 
		model.addAttribute("pageDetail", page);
		return "modules/contract/manufContractDetailList";
	}
	
	/**
	 * 对象信息
	 * @param manufContractDetail
	 * @param model
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:view")
	@RequestMapping(value = "form")
	public String form(ManufContractDetail manufContractDetail, Model model) {
		ManufContractDetailPrice mcdp = new ManufContractDetailPrice();
		List<ManufContractDetailPrice> mcdpList = manufContractDetailPriceService.findList(mcdp);
		model.addAttribute("mcdpList", mcdpList);
		model.addAttribute("manufContractDetail", manufContractDetail);
		return "modules/contract/manufContractDetailForm";
	}

	/**
	 * 创建、更新
	 * @param ManufContractDetial
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:edit")
	@RequestMapping(value = "save")
	public String save(ManufContractDetail mcd, Model model, RedirectAttributes redirectAttributes) {
		manufContractDetailService.save(mcd);
		addMessage(redirectAttributes, "保存生产合同明细表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/manufContractBase/list";
	}
	
	/**
	 * 删除
	 * @param manufContractDetail
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(ManufContractDetail manufContractDetail, RedirectAttributes redirectAttributes) {
		manufContractDetailService.delete(manufContractDetail);
		addMessage(redirectAttributes, "删除生产合同明细表成功");
		return "redirect:"+Global.getAdminPath()+"/contract/manufContractBase/list";
	}

	/**
	 * 导入生产合同明细表数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
//		if(Global.isDemoMode()){
//			addMessage(redirectAttributes, "演示模式，不允许操作！");
//			return "redirect:" + adminPath + "/contract/manufContractDetail/list?repage";
//		}
//		try {
//			int successNum = 0;
//			int failureNum = 0;
//			StringBuilder failureMsg = new StringBuilder();
//			ImportExcel ei = new ImportExcel(file, 1, 0);
//			List<JiaContract> list = ei.getDataList(JiaContract.class);
//			for (JiaContract manufContractDetail : list){
//				try{
//					if ("true".equals(checkId(manufContractDetail.getCid()))){
//						BeanValidators.validateWithException(validator, manufContractDetail);
//						manufContractDetail.save(manufContractDetail);
//						successNum++;
//					}else{
//						failureMsg.append("<br/>生产合同明细表 "+manufContractDetail.getCid()+" 已存在; ");
//						failureNum++;
//					}
//				}catch(ConstraintViolationException ex){
//					failureMsg.append("<br/>生产合同明细表 "+manufContractDetail.getCid()+" 导入失败：");
//					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
//					for (String message : messageList){
//						failureMsg.append(message+"; ");
//						failureNum++;
//					}
//				}catch (Exception ex) {
//					failureMsg.append("<br/>生产合同明细表 "+manufContractDetail.getCid()+" 导入失败："+ex.getMessage());
//				}
//			}
//			if (failureNum>0){
//				failureMsg.insert(0, "，失败 "+failureNum+" 条生产合同明细表，导入信息如下：");
//			}
//			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
//		} catch (Exception e) {
//			addMessage(redirectAttributes, "导入生产合同明细表失败！失败信息："+e.getMessage());
//		}
		return "redirect:" + adminPath + "/contract/manufContractDetail/list?repage";
    }
	
	/**
	 * 下载导入生产合同明细表数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("manufContractDetail:view")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
//		try {
//            String fileName = "生产合同明细表数据导入模板.xlsx";
//    		List<JiaContract> list = Lists.newArrayList(); 
////    		list.add(UserUtils.getUser());
//    		new ExportExcel("生产合同明细表数据", JiaContract.class, 2).setDataList(list).write(response, fileName).dispose();
//    		return null;
//		} catch (Exception e) {
//			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
//		}
		return "redirect:" + adminPath + "/contract/manufContractDetail/list?repage";
    }
	
	/**
	 * 合同价计算	标准价*（1+浮动比例）
	 * @param standardPrice
	 * @param radio
	 * @return
	 */
	public double countContractPrice(Double standardPrice , Double radio){
		double result = standardPrice * (radio+1);
		return result;
	}

	
	@ResponseBody
	@RequestMapping(value="getDetail")
	public List<ManufContractDetail> getDetail(ManufContractDetail manufC, HttpServletRequest request, HttpServletResponse response){
		manufC.setContractId(request.getParameter("contractId"));
		return manufContractDetailService.findList(manufC);
	}
	
	@ResponseBody
	@RequestMapping(value="getSingleDetail")
	public ManufContractDetail getSingleDeatil(ManufContractDetail manufC, HttpServletRequest request, HttpServletResponse response){
		manufC.setId(request.getParameter("id"));
		return manufContractDetailService.get(manufC);
	}
	
}