package com.bt.modules.project2area.web;

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

import com.bt.modules.project.entity.Project;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project2area.entity.Project2area;
import com.bt.modules.project2area.service.Project2areaService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.service.AreaService;

/**
 * 一级项目信息
 * 
 * @author xjp
 * @version 2015-8-1
 */
@Controller
@RequestMapping(value = "${adminPath}/project2area")
public class Project2areaController extends BaseController {

	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);

	public static final String CACHE_DICT_MAP = "dictMap";

	/**
	 * 一级项目Service
	 */
	@Autowired
	private Project2areaService project2areaService;
	
	@Autowired
	private AreaService areaService;
	
	@Autowired
	private ProjectService projectService;

	/**
	 * 分页查询一级项目信息
	 * 
	 * @param project2area
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	// @RequiresPermissions("project2area:view")
	@RequestMapping(value = { "list", "" })
	public String list(Project2area project2area, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 查询主项列表，如果有名称参数则带入名称参数查询列表
		Page<Project2area> page = project2areaService.findPage(new Page<Project2area>(request,
				response), project2area);
		model.addAttribute("page", page);
		model.addAttribute("areaList", areaService.findAll());
		return "modules/project2area/project2areaList";
	}

	/**
	 * 添加
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "save")
	public String add(Project2area project2area, Model model) {
		if("update".equals(project2area.getFlag())){
			project2areaService.update(project2area);
			return "redirect:" + adminPath + "/project2area/list";
		}else{
			project2area.setId(IdGen.uuid());
			project2areaService.save(project2area);
			return "redirect:" + adminPath + "/project2area/list";
		}
	}
	
	
	
	/**
	 * update
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update")
	public String update(Project2area project2area, Model model,HttpServletRequest request) {
		project2area.setId(request.getParameter("id"));
		Project2area data = project2areaService.get(project2area);
		data.setFlag("update");
		
		model.addAttribute("flag", "update");
		model.addAttribute("project2area", data);
		return "modules/project2area/project2areaForm";
	}
	
	
	
	/**
	 * get
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getAreaList")
	@ResponseBody
	public Map<String,Object> getAreaList(Model model,HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("areaList", areaService.findAll());
		
		return map;
	}
	
	
	
	/**
	 * get
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getbyNo")
	@ResponseBody
	public Map<String,Object> getbyNo(Project2area project2area, Model model,HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		String areaNo = request.getParameter("areaNo");
		Area data = null;
		if(null != areaNo && !"".equals(areaNo)){
			data = project2areaService.getArea(areaNo);
		}
		map.put("project2area", data);
		return map;
	}
	
	
	/**
	 * get
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getProjectcode")
	@ResponseBody
	public Map<String,Object> getProjectcode(Model model,HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Project> list = projectService.gbProjectByCode(new Project());
		map.put("list", list);
		return map;
	}

	/**
	 * 跳转添加页面
	 * 
	 * @param project2area
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "form")
	public String form(Project2area project2area, Model model) {
		project2area.setId(IdGen.uuid());
		model.addAttribute("project2area", project2area);
		model.addAttribute("flag", "add");
		return "modules/project2area/project2areaForm";
	}


	/**
	 * 删除一级项目信息、二级项目信息
	 * 
	 * @param project2area
	 * @param redirectAttributes
	 * @return
	 */
	@Transactional(readOnly = false)
	@RequestMapping(value = "delete")
	public String delete(Project2area project2area, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		project2area.setId(request.getParameter("id"));
		project2areaService.delete(project2area);

		addMessage(redirectAttributes, "删除项目成功");
		return "redirect:" + adminPath + "/project2area/list";
	}

}
