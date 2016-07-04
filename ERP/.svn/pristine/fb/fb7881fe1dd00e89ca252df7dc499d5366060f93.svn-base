package com.bt.modules.material.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.material.entity.SettlementMaterial;
import com.bt.modules.material.entity.SettlementMaterialMapping;
import com.bt.modules.material.service.SettlementMaterialMappingService;
import com.bt.modules.material.service.SettlementMaterialService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 可配置加工项物料表Controller
 * @author zjs
 * @version 2016-05-06
 */
@Controller
@RequestMapping(value = "${adminPath}/material/settlementMaterial")
public class SettlementMaterialController extends BaseController{
	/**
	 * 一级项目Service
	 */
	@Autowired
	private SettlementMaterialService settlementMaterialService;
	@Autowired
	private SettlementMaterialMappingService settlementMaterialMappingService;
	
	/**
	 * 分页查询一级项目信息
	 * @param settlementMaterial
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(SettlementMaterial settlementMaterial, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SettlementMaterial> page = settlementMaterialService.findPage(new Page<SettlementMaterial>(request, response), settlementMaterial); 
		model.addAttribute("page", page);
		return "modules/material/settlementMaterialList";
	}
	
	/**
	 * 跳转添加页面
	 * @param settlementMaterial
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(SettlementMaterial settlementMaterial,HttpServletRequest request, HttpServletResponse response, Model model) throws BusinessException{
		settlementMaterial.setId(IdGen.uuid());
		List<String> settlementTypeList = settlementMaterialService.selectSettlementType();
		List<SettlementMaterialMapping> settlementMaterialMappingList = settlementMaterialMappingService.findSettlementItemList(settlementMaterial.getId());
		model.addAttribute("settlementMaterial", settlementMaterial);
		model.addAttribute("settlementTypeList",settlementTypeList);
		model.addAttribute("settlementMaterialMappingList",settlementMaterialMappingList);
		return "modules/material/settlementMaterialForm";
	}
	
	
	/**
	 * 添加
	 * @param settlementMaterial
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save")
	public String add(SettlementMaterial settlementMaterial,HttpServletRequest request, HttpServletResponse response, Model model) {

		String materialNo = request.getParameter("materialNo");
		String materialName = request.getParameter("materialName");
		String settlementType = request.getParameter("settlementType");
		String flag = request.getParameter("flag");
		settlementMaterial.setMaterialNo(materialNo);
		settlementMaterial.setMaterialName(materialName);
		settlementMaterial.setSettlementType(settlementType);
		if("update".equals(flag)){
			String id = request.getParameter("id");
			settlementMaterial.setId(id);
			settlementMaterialService.update(settlementMaterial);
			return "redirect:" + adminPath + "/material/settlementMaterial/list";
		}else{
			settlementMaterial.setId(IdGen.uuid());
			settlementMaterialService.save(settlementMaterial);
			return "redirect:" + adminPath + "/material/settlementMaterial/list";
		}
	}
	
	/**
	 * 详细添加
	 * @param settlementMaterial
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "detailsave")
	public String detailadd(SettlementMaterial settlementMaterial
			,SettlementMaterialMapping settlementMaterialMapping,HttpServletRequest request, HttpServletResponse response, Model model) {
		String id = "";
		if (StringUtils.isNotBlank(settlementMaterial.getId())) {
			id = settlementMaterial.getId();	
		}
		String materialNo = settlementMaterial.getMaterialNo();
		String materialName = settlementMaterial.getMaterialName();
		String settlementType = settlementMaterial.getSettlementType();
		String flag = settlementMaterial.getFlag();
		String returnUrl = "";
		String vCheckd = request.getParameter("vCheckd");
		String[] str = vCheckd.split(","); 	
		if (str!=null) {
			settlementMaterialMapping.setPid(settlementMaterial.getId());
			if (StringUtils.isNotBlank(settlementMaterial.getId())) {
				settlementMaterialMappingService.delete(settlementMaterialMapping);
			}	
			for (int i = 0; i < str.length; i++) {
				settlementMaterialMapping.setId(IdGen.uuid());
				settlementMaterialMapping.setSettlementItem(str[i]);
				settlementMaterialMappingService.save(settlementMaterialMapping);
				}
			}
		returnUrl = "redirect:" + adminPath + "/material/settlementMaterial/save?materialNo="
			+materialNo+"&materialName="+materialName+"&settlementType="+settlementType+"&flag="+flag
			+"&id="+id;
		return returnUrl;
	}
	
	/**
	 * 更新
	 * @param settlementMaterial
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = "update")
	public String update(SettlementMaterial settlementMaterial, Model model,HttpServletRequest request) throws BusinessException {
		settlementMaterial.setId(request.getParameter("id"));
		SettlementMaterial data = settlementMaterialService.get(settlementMaterial);
		List<String> settlementTypeList = settlementMaterialService.selectSettlementType();
		List<SettlementMaterialMapping> settlementMaterialMappingList = settlementMaterialMappingService.findSettlementItemList(settlementMaterial.getId());
		data.setFlag("update");
		model.addAttribute("flag", "update");
		model.addAttribute("settlementMaterial", data);
		model.addAttribute("settlementTypeList",settlementTypeList);
		model.addAttribute("settlementMaterialMappingList",settlementMaterialMappingList);
		return "modules/material/settlementMaterialForm";
	}
	
	/**
	 * 删除一级项目信息、二级项目信息
	 * @param settlementMaterial
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "delete")
	public String delete(SettlementMaterial settlementMaterial, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		String id = request.getParameter("id");
		settlementMaterial.setId(id);
		settlementMaterialService.delete(settlementMaterial);
		SettlementMaterialMapping settlementMaterialMapping = new SettlementMaterialMapping();
		settlementMaterialMapping.setPid(id);
		settlementMaterialMappingService.delete(settlementMaterialMapping);
		addMessage(redirectAttributes, "删除物料成功");
		return "redirect:" + adminPath + "/material/settlementMaterial/list";
	}
	
	/**
	 * 验证物料编号是否存在
	 * @param settlementMaterial
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "validateMaterialNo")
	@ResponseBody
	public Map<String,Object> validateMaterialNo(SettlementMaterial settlementMaterial, RedirectAttributes redirectAttributes) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("materialNo", settlementMaterialService.getOneByMaterialNo(settlementMaterial));
		return map;
	}
	
	/**
	 * 加工类型改变搜索加工项
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "typeChange")
	@ResponseBody
	public List<SettlementMaterialMapping> typeChange( HttpServletRequest request) {
		String settlementType = request.getParameter("type");
		return settlementMaterialMappingService.findAllSettlementItemList(settlementType);
	}
	
	/**
	 * 默认已选加工项
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "defaultItem")
	@ResponseBody
	public List<SettlementMaterialMapping> defaultItem(HttpServletRequest request) {
		String id = request.getParameter("id");
		return settlementMaterialMappingService.findSettlementItemList(id);
	}
}
