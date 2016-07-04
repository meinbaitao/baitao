
package com.thinkgem.jeesite.modules.taskmapping.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActDoneTask;
import com.thinkgem.jeesite.modules.taskmapping.service.ActDoneTaskService;


/**
 * 审批过任务Controller
 * @author fjy
 * @version 2016-03-09
 */
@Controller
@RequestMapping(value = "${adminPath}/mapping/taskmapping/actDoneTask")
public class ActDoneTaskController extends BaseController {

	@Autowired
	private ActDoneTaskService actDoneTaskService;
	

	@RequestMapping(value = {"list", ""})
	public String list(ActDoneTask actDoneTask, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ActDoneTask> page = actDoneTaskService.findPage(new Page<ActDoneTask>(request, response), actDoneTask); 
		model.addAttribute("page", page);
		return "modules/mapping/taskmapping/actDoneTaskList";
	}


}