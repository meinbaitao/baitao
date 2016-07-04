/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.modules.cost.entity.VolumeControl;
import com.bt.modules.cost.entity.VolumeControlDetail;
import com.bt.modules.cost.service.VolumeControlDetailService;
import com.bt.modules.cost.service.VolumeControlService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.service.PurchaseDemandSubProjectMappingService;
import com.google.common.collect.Lists;

/**
 * 成本控量Controller
 * @author pc
 * @version 2015-09-06
 */
@Controller
@RequestMapping(value = "${adminPath}/cost/volumeControl")
public class VolumeControlController extends BaseController {

	@Autowired
	private VolumeControlService volumeControlService;
	@Autowired
	private VolumeControlDetailService volumeControlDetailService;
	@Autowired
	private PurchaseDemandSubProjectMappingService purchaseDemandSubProjectMappingService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping(value = {"list", ""})
	public String list(VolumeControl volumeControl, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<VolumeControl> page = volumeControlService.findPage(new Page<VolumeControl>(request, response), volumeControl);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		if(page != null){
			List<VolumeControl> vlist = page.getList();
			if(vlist != null && vlist.size() > 0){
				for(VolumeControl vc:vlist){
					Map<String,Object> map = new HashMap<String, Object>();
					if(vc.getSubprojectId() != null){
						//获取二级项目信息
						Subproject sp = subProjectService.get(vc.getSubprojectId());
						if(sp != null){
							//获取一级项目信息
							Project p = projectService.get(sp.getProjectId());
							map.put("project", p);
						}
					}
					map.put("volumeControl", vc);
					list.add(map);
				}
			}
		}
		List<Map<String, Object>> listMap = projectService.gbProByName();
		model.addAttribute("page", page);
		model.addAttribute("listMap", listMap);
		model.addAttribute("list", list);
		return "modules/cost/volumeControlList";
	}
	
	/**
	 * 导出模版
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
    @RequestMapping(value = "templateImport")
    public String templateImport(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "控量表导入模板.xlsx";
    		List<VolumeControlDetail> list = Lists.newArrayList();
    		new ExportExcel("成本控量", VolumeControlDetail.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/cost/volumeControl/list";
    }
	
	
	/**
	 * 导入
	 */
	/**
	 * @param multipartFile
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "volumeControlImport")
	@Transactional(readOnly = false)
	public String volumeControlImport(MultipartFile multipartFile, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String  vcId = IdGen.uuid();
		VolumeControl vc = new VolumeControl();
		vc.setId(vcId);
		vc.setSubprojectId(request.getParameter("subprojectId"));	// 二级项目ID
		vc.setHouseType(request.getParameter("houseTypeTwo"));		//户型
		vc.setBuilding(request.getParameter("buildingTwo"));		// 楼栋
		vc.setCreateDate(new Date());					//创建时间
		vc.setCreateUser(UserUtils.getUser().getName());//创建人
		try {
			ImportExcel ime = new ImportExcel(multipartFile, 1, 0);
			List<VolumeControlDetail> list = ime.getDataList(VolumeControlDetail.class);
			for(VolumeControlDetail vcd : list){
				BeanValidators.validateWithException(validator, vcd);
				vcd.setVolumeControlId(vcId);
				vcd.setId(IdGen.uuid());
				vcd.setQuantityOne(getValueString(vcd.getQuantityOne(),true,false));
				vcd.setQuantityTwo(getValueString(vcd.getQuantityTwo(),true,false));
				vcd.setLossAmount(getValueString(vcd.getLossAmount(),true,false));
				volumeControlDetailService.insert(vcd);
			}
			volumeControlService.insert(vc);
			addMessage(redirectAttributes, "控量表导入成功！");
		}catch(NumberFormatException nEx){
			addMessage(redirectAttributes, "控量表导入失败！失败信息：数据转换出错");
		}catch (Exception e) {
			addMessage(redirectAttributes, "控量表导入失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/cost/volumeControl/list";
	}

	private String getValueString(String value,boolean decimalFormat,boolean isMust) throws Exception{
		value = value.trim();
		if(value==null||value.trim().length()==0){
			return value;
		}
		if(decimalFormat){
			//解析读入的科学技术法
			Double d = null;
			try{
				d = Double.parseDouble(value);
			}catch(NumberFormatException e){
				if(isMust){//如果是必输项
					throw new Exception("格式非法，期望为数值型，但取值为["+value+"]");
				}
			}
			if(d!=null){
				value =new DecimalFormat("#.###").format(d);
			}
		}
		return value; 
	}
	
	@RequestMapping(value = "form")
	public String form(VolumeControl volumeControl, Model model) {
		model.addAttribute("volumeControl", volumeControl);
		return "modules/cost/volumeControlForm";
	}

	@RequestMapping(value = "save")
	public String save(VolumeControl volumeControl, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, volumeControl)){
			return form(volumeControl, model);
		}
		volumeControlService.save(volumeControl);
		addMessage(redirectAttributes, "保存成本控量成功");
		return "redirect:" + adminPath + "/cost/volumeControl/list";
	}
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		//获取前端勾选项
		VolumeControl volumeControl = null;
		String[] vCheckd = request.getParameterValues("vCheckd");
		if(vCheckd != null && vCheckd.length > 0){
			String[] volumeControlId = vCheckd[0].split(",");
			if(volumeControlId != null && volumeControlId.length > 0){
				for (int i = 0; i < volumeControlId.length; i++) {
					volumeControl = volumeControlService.get(volumeControlId[i]);
					if(volumeControl != null){
						volumeControlService.delete(volumeControl);
						VolumeControlDetail vcDetail = new VolumeControlDetail();
						vcDetail.setVolumeControlId(volumeControl.getId());
						volumeControlDetailService.deleteByVId(vcDetail);
						addMessage(redirectAttributes, "删除成本控量成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "删除成本控量失败");
		}
		return "redirect:" + adminPath + "/cost/volumeControl/list";
	}

}