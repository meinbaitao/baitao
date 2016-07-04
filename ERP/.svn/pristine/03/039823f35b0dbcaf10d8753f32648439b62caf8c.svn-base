package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.service.DictService;

/**
 * 用户字典维护Controller
 * 
 * @author 许俊雄
 * @version 2016-04-14
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/userdict")
public class DictUserController extends BaseController {

	@Autowired
	private DictService dictService;

	@ModelAttribute
	public Dict get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return dictService.get(id);
		} else {
			return new Dict();
		}
	}

	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = { "list", "" })
	public String list(Dict dict, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		List<Dict> typeList = dictService.findTypeDisNameList();
		model.addAttribute("typeList", typeList);
		/*
		 * Page<Dict> page = dictService.findPage( new Page<Dict>(request,
		 * response), dict);
		 */
		Page<Dict> page = dictService.findPageFlag(new Page<Dict>(request,
				response), dict, dictService.findUserDictList(dict));
		model.addAttribute("page", page);
		return "modules/sys/dictUserList";
	}

	@RequiresPermissions("sys:dict:view")
	@RequestMapping(value = "form")
	public String form(Dict dict, Model model, HttpServletRequest request) {
		String op = request.getParameter("operation") == null ? "" : request
				.getParameter("operation");
		if ("new".equals(op)) {
			model.addAttribute("dict", dictService.getNewUserDict(dict.getId()));
		} else {
			model.addAttribute("dict", dict);
		}
		return "modules/sys/dictUserForm";
	}

	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "save")
	// @Valid
	public String save(Dict dict, Model model, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, dict)) {
			return form(dict, model, request);
		}
		dictService.save(dict);
		addMessage(redirectAttributes, "保存参数'" + dict.getLabel() + "'成功");
//		return "redirect:" + adminPath + "/sys/userdict/?repage&type="
//				+ dict.getType();
		return "redirect:" + adminPath + "/sys/userdict/?repage";
	}

	@RequiresPermissions("sys:dict:edit")
	@RequestMapping(value = "delete")
	public String delete(Dict dict, RedirectAttributes redirectAttributes) {
		dictService.delete(dict);
		addMessage(redirectAttributes, "删除字典成功");
//		return "redirect:" + adminPath + "/sys/userdict/?repage&type="
//				+ dict.getType();
		return "redirect:" + adminPath + "/sys/userdict/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(
			@RequestParam(required = false) String type,
			HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Dict dict = new Dict();
		dict.setType(type);
		List<Dict> list = dictService.findList(dict);
		for (int i = 0; i < list.size(); i++) {
			Dict e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", e.getParentId());
			map.put("name", StringUtils.replace(e.getLabel(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}

}
