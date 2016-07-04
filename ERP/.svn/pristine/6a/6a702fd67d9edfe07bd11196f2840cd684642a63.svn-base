package com.thinkgem.jeesite.modules.act.web;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.constants.AuditResult;
import com.thinkgem.jeesite.modules.act.cmd.HistoryProcessInstanceDiagramCmd;
import com.thinkgem.jeesite.modules.act.entity.CompleteTaskParam;
import com.thinkgem.jeesite.modules.act.entity.DisplayTask;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.impl.ServiceImpl;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * author fanjinyuan.
 */
@Controller
@RequestMapping(value = "${adminPath}/act/access/task/direct")
public class ActAccessTaskDirectController {

    @Autowired
    private ActAccessTaskDirectService actService;
    @Autowired
    private ProcessEngine processEngine;

    /**
     * 签收任务
     * @param processInstanceId 流程ID
     */
    @RequestMapping(value = "claim/{processInstanceId}")
    @ResponseBody
    public String claim(@PathVariable("processInstanceId") String processInstanceId) {
        actService.claim(processInstanceId,getUserId());
        return "true";
    }



    /**
     * 读取Task的表单
     */
    @RequestMapping(value = "getTaskForm/{processInstanceId}")
    @ResponseBody
    public String getTaskForm(@PathVariable("processInstanceId") String processInstanceId) {
        String formKey = actService.getForm(processInstanceId);
    	return formKey;
    }


    /**
     * 完成task
     * @return
     */
    @RequestMapping(value = "complete", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String completeTask(@RequestBody CompleteTaskParam param){
        String userId = getUserId();
        actService.completeTask(param.getProcessInstanceId(),param.getApproval(),param.getRejectBackReason(),userId);
        return "true";
    }

    /**
     * 针对当前task
     * 判断是否已经签收了或者直接分配给了当前用户
     * @param processInstanceId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "isAssigneeUser/{processInstanceId}")
    @ResponseBody
    public String isAssigneeUser(@PathVariable("processInstanceId") String processInstanceId)throws Exception{
        boolean checkResult = actService.isAssigneeUser(processInstanceId, getUserId());
        if(checkResult) {
            return "true";
        }else{
            return "false";
        }
    }


    /**
     * 针对当前task
     * 判断当前用户是否在候选人或者候选组范围之内
     * @param processInstanceId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "isCandidateUser/{processInstanceId}")
    @ResponseBody
    public String isCandidateUser(@PathVariable("processInstanceId") String processInstanceId)throws Exception{
        boolean checkResult = actService.isCandidateUser(processInstanceId, getUserId());
        if(checkResult) {
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping(value = "getCurrentTask/{processInstanceId}")
    @ResponseBody
    public DisplayTask getCurrentTask(@PathVariable("processInstanceId") String processInstanceId){
        TaskInfo task = actService.getCurrentTaskByInstanceId(processInstanceId);

        if(task == null)
            return null;

        DisplayTask displayTask = new DisplayTask();
        displayTask.setTaskId(task.getId());
        displayTask.setProcessDefinitionId(task.getProcessDefinitionId());
        displayTask.setExecutionId(task.getExecutionId());
        displayTask.setProcessInstanceId(processInstanceId);
        return displayTask;
    }

    @RequestMapping(value = "graphHistoryProcessInstance/{processInstanceId}")
    public void graphHistoryProcessInstance(@PathVariable("processInstanceId") String processInstanceId, HttpServletResponse response) throws Exception {
        RepositoryService repositoryService = processEngine.getRepositoryService();
        Command<InputStream> cmd = null;
        InputStream is =null;
        try{
        	 cmd = new HistoryProcessInstanceDiagramCmd(processInstanceId, processEngine);
             is = ((ServiceImpl) repositoryService).getCommandExecutor().execute(cmd);
             response.setContentType("image/png");

             int len = 0;
             byte[] b = new byte[1024];

             while ((len = is.read(b, 0, 1024)) != -1) {
                 response.getOutputStream().write(b, 0, len);
             }
        }catch(Exception e){
        	e.printStackTrace();
        }finally{
        	if(null !=is){
        		is.close();
        	}
        }
       
    }

    protected String getUserId(){
        return UserUtils.getUser().getLoginName();
    }

    @RequestMapping(value = "getCurrentExecutor/{processInstanceId}")
    public @ResponseBody
    User getCurrentExecutor(@PathVariable("processInstanceId") String processInstanceId){
        User user = actService.getAssigneeUser(processInstanceId);
        return user;
    }


    @RequestMapping(value = "rejectToSpecifyNode", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
     String rejectToSpecifyNode(@RequestBody CompleteTaskParam param){
        Map<String, String> variables = new HashMap<String, String>();
        variables.put(ActivitiConstants.APPROVAL_RESULT_VARIABLE, AuditResult.REJECT.getValue());
        variables.put(ActivitiConstants.REJECT_BACK_REASON, param.getRejectBackReason());
        actService.jumpToSpecifyNode(param.getProcessInstanceId(), getUserId(), variables, param.getRejectToNode());
        return "true";
    }

}
