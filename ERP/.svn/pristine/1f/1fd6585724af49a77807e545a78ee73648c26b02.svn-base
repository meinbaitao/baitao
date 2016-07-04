package com.bt.modules.todotask.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bt.modules.todotask.entity.TaskCategory;
import com.bt.modules.todotask.service.TodoTaskService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActCurrentTask;

/**
 * author fanjinyuan.
 */
@Controller
@RequestMapping(value = "${adminPath}/todo/task")
public class TodoTaskController extends BaseController {


    @Autowired
    private TodoTaskService todoTaskService;

    @RequestMapping(value = "todoTasks")
     public String todoTasks(ActCurrentTask currentTask, HttpServletRequest request, HttpServletResponse response, Model model){
        Page page = new Page(request, response);
        currentTask.setUserId(UserUtils.getUser().getId());
        Page<TaskCategory> todoTaskPage = todoTaskService.findPage(page, currentTask);
        model.addAttribute("page", todoTaskPage);
        model.addAttribute("currentTask", currentTask);
        return "modules/todo/todoTasks";
    }

}
