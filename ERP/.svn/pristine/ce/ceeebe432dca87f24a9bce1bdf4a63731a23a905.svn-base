/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.bt.modules.cost.entity.VolumeControl;
import com.bt.modules.cost.entity.VolumeControlDetail;
import com.bt.modules.cost.service.VolumeControlDetailService;
import com.bt.modules.cost.service.VolumeControlService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.service.PurchaseDemandSubProjectMappingService;

/**
 * 成本控量明细Controller
 * @author pc
 * @version 2015-09-06
 */
@Controller
@RequestMapping(value = "${adminPath}/cost/volumeControlDetail")
public class VolumeControlDetailController extends BaseController {

	@Autowired
	private VolumeControlDetailService volumeControlDetailService;
	@Autowired
	private PurchaseDemandSubProjectMappingService purchaseDemandSubProjectMappingService;
	@Autowired
	private VolumeControlService volumeControlService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private ProjectService projectService;
	
	
	@RequiresPermissions("volumeControlDetail:view")
	@RequestMapping(value = {"list", ""})
	public String list(VolumeControlDetail volumeControlDetail, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<VolumeControlDetail> page = volumeControlDetailService.findPage(new Page<VolumeControlDetail>(request, response), volumeControlDetail); 
		List<Map<String, Object>> listMap = projectService.gbProByName();
		VolumeControl vc = volumeControlService.get(volumeControlDetail.getVolumeControlId());
		Project p = null;
		if(vc.getSubprojectId() != null){
			//获取二级项目信息
			Subproject sp = subProjectService.get(vc.getSubprojectId());
			if(sp != null){
				//获取一级项目信息
				p = projectService.get(sp.getProjectId());
			}
		}
		model.addAttribute("project", p);
		model.addAttribute("volumeControl", vc);
		model.addAttribute("page", page);
		model.addAttribute("listMap", listMap);
		return "modules/cost/volumeControlDetailList";
	}

	@RequiresPermissions("volumeControlDetail:view")
	@RequestMapping(value = "form")
	public String form(VolumeControlDetail volumeControlDetail, Model model) {
		model.addAttribute("volumeControlDetail", volumeControlDetail);
		return "modules/cost/volumeControlDetailForm";
	}

	@RequiresPermissions("volumeControlDetail:edit")
	@RequestMapping(value = "save")
	public String save(VolumeControlDetail volumeControlDetail, Model model, RedirectAttributes redirectAttributes) {
		//List<VolumeControlDetail> list = volumeControlDetail.getList();
		volumeControlDetailService.save(volumeControlDetail);
		addMessage(redirectAttributes, "保存成本控量明细成功");
		return "redirect:" + adminPath + "/cost/volumeControlDetail/list/";
	}
	
	@RequiresPermissions("volumeControlDetail:edit")
	@RequestMapping(value = "update")
	public String update(VolumeControlDetail volumeControlDetail, Model model, RedirectAttributes redirectAttributes) {
		List<VolumeControlDetail> list = volumeControlDetail.getList();
		if(list != null){
			for(VolumeControlDetail vcd:list){
				volumeControlDetailService.update(vcd);
			}
		}
		addMessage(redirectAttributes, "修改成本控量明细成功");
		return "redirect:" + adminPath + "/cost/volumeControlDetail/list?volumeControlId="+volumeControlDetail.getVolumeControlId();
	}
	
	@RequiresPermissions("volumeControlDetail:edit")
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request,RedirectAttributes redirectAttributes) {
		VolumeControlDetail volumeControlDetail = new VolumeControlDetail();
		String[] vCheckd = request.getParameterValues("vCheckd");
		if(vCheckd != null && vCheckd.length > 0){
			String[] volumeControlDetailId = vCheckd[0].split(",");
			if(volumeControlDetailId != null && volumeControlDetailId.length > 0){
				for (int i = 0; i < volumeControlDetailId.length; i++) {
					volumeControlDetail = volumeControlDetailService.get(volumeControlDetailId[i]);
					if(volumeControlDetail != null){
						volumeControlDetailService.delete(volumeControlDetail);
						addMessage(redirectAttributes, "删除成本控量明细成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "删除成本控量明细失败");
		}
		return "redirect:" + adminPath + "/cost/volumeControlDetail/list?volumeControlId="+volumeControlDetail.getVolumeControlId();
	}

}