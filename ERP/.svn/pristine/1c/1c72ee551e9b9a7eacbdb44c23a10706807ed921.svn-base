package com.thinkgem.jeesite.modules.act.service;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.constants.TaskType;
import com.bt.modules.activiti.support.VariablesBuilder;
import com.thinkgem.jeesite.modules.act.cmd.JumpCmd;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActCurrentTask;
import com.thinkgem.jeesite.modules.taskmapping.service.RecordMappingFacedService;

import org.activiti.engine.*;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.ServiceImpl;
import org.activiti.engine.impl.persistence.entity.SuspensionState;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.NativeTaskQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author fanjinyuan.
 */
@Service
public class ActAccessTaskDirectService {
	
	private static Logger logger = LoggerFactory
			.getLogger(ActAccessTaskDirectService.class);

    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private HistoryService historyService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private RecordMappingFacedService mappingFacedService;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private ActAuditTraceService auditTraceService;

    @Transactional(readOnly = false)
    public void completeTask(String processInstanceId, String approval, String rejectBackReason, String userId){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);
        Map<String, Object> traceVariables = runtimeService.getVariables(theTask.getExecutionId());
        Map<String, String> variables = new HashMap<String, String>();

        variables.put(ActivitiConstants.APPROVAL_RESULT_VARIABLE,approval);
        variables.put(ActivitiConstants.REJECT_BACK_REASON, rejectBackReason);
        try {
            identityService.setAuthenticatedUserId(userId);
            formService.submitTaskFormData(theTask.getId(), variables);
        } finally {
            identityService.setAuthenticatedUserId(null);
        }

        traceCompleteTask(theTask.getProcessInstanceId(), traceVariables);
        auditTraceService.traceAudit(theTask, processInstanceId, variables);
    }


    @Transactional(readOnly = false)
    public void completeTask(String processInstanceId, String userId, Map<String, String> variables){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);
        Map<String, Object> traceVariables = runtimeService.getVariables(theTask.getExecutionId());
        try {
            identityService.setAuthenticatedUserId(userId);
            formService.submitTaskFormData(theTask.getId(), variables);
        } finally {
            identityService.setAuthenticatedUserId(null);
        }

        traceCompleteTask(theTask.getProcessInstanceId(), traceVariables);
        auditTraceService.traceAudit(theTask, processInstanceId, variables);
    }



    @Transactional(readOnly = true)
    public boolean isAssigneeUser(String processInstanceId, String userId){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);

        if(theTask == null)
            return false;

        String assigneeSql = "select RES.* from ACT_RU_TASK RES inner join ACT_RE_PROCDEF D on RES.PROC_DEF_ID_ = D.ID_ WHERE RES.ASSIGNEE_ = #{userId}"
                + " and RES.SUSPENSION_STATE_ = #{suspensionState} and RES.EXECUTION_ID_= #{executionId} ";

        NativeTaskQuery query = taskService.createNativeTaskQuery().sql(assigneeSql)
                .parameter("suspensionState", SuspensionState.ACTIVE.getStateCode())
                .parameter("userId", userId)
                .parameter("executionId", theTask.getExecutionId());
        return query.list().size() > 0;
    }

    @Transactional(readOnly = true)
    public boolean isCandidateUser(String processInstanceId , String userId){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);

        if(theTask == null)
            return false;

        //关闭activiti的人员ACT_ID_*(identity) 表，使用自己的人员池来做查询 许俊雄2010518
        /*String candidateSql = "select RES1.* from ACT_RU_TASK RES1 inner join ACT_RU_IDENTITYLINK I on I.TASK_ID_ = RES1.ID_ inner join ACT_RE_PROCDEF D1 on RES1.PROC_DEF_ID_ = D1.ID_ WHERE"
                + " RES1.ASSIGNEE_ is null and I.TYPE_ = 'candidate'"
                + " and ( I.USER_ID_ = #{userId} or I.GROUP_ID_ IN (select g.GROUP_ID_ from ACT_ID_MEMBERSHIP g where g.USER_ID_ = #{userId} ) )"
                + " and RES1.SUSPENSION_STATE_ = #{suspensionState} and RES1.EXECUTION_ID_= #{executionId} ";*/
        String candidateSql = "select RES1.* from ACT_RU_TASK RES1 inner join ACT_RU_IDENTITYLINK I on I.TASK_ID_ = RES1.ID_ inner join ACT_RE_PROCDEF D1 on RES1.PROC_DEF_ID_ = D1.ID_ WHERE"
        		+ " RES1.ASSIGNEE_ is null and I.TYPE_ = 'candidate'"
        		+ " and ( I.USER_ID_ = #{userId} or I.GROUP_ID_ IN (select r.enname from sys_user_role ur,sys_user u,sys_role r "
				+ " where   ur.role_id = r.id "
				+ " and ur.user_id = u.id  and u.login_name = #{userId} ) ) "
        		+ " and RES1.SUSPENSION_STATE_ = #{suspensionState} and RES1.EXECUTION_ID_= #{executionId} ";
        
        logger.debug("查询用户{}是否在任务{}组里面的sql：{}",userId,theTask.getName(),candidateSql);
        NativeTaskQuery query = taskService.createNativeTaskQuery().sql(candidateSql)
                .parameter("suspensionState", SuspensionState.ACTIVE.getStateCode())
                .parameter("userId", userId)
                .parameter("executionId", theTask.getExecutionId());
        
        logger.debug("查询结果为：{}",query.list().size() > 0);
        return query.list().size() > 0;
    }

    @Transactional(readOnly = false)
    public void claim(String processInstanceId, String userId){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);
        taskService.claim(theTask.getId(), userId);

        traceClaimTask(theTask, userId);
        auditTraceService.traceClaim(theTask, processInstanceId);
    }

    @Transactional(readOnly = true)
    public String getForm(String processInstanceId){
        Task theTask = getCurrentTaskByInstanceId(processInstanceId);
        String formKey = formService.getTaskFormKey(theTask.getProcessDefinitionId(), theTask.getTaskDefinitionKey());
        return formKey;
    }

    @Transactional(readOnly = true)
    public Task getCurrentTaskByInstanceId(String processInstanceId){
        TaskQuery query = taskService.createTaskQuery().processInstanceId(processInstanceId).includeProcessVariables();
        Task theTask = query.singleResult();
        if(theTask == null){
            ProcessInstance instance = runtimeService.createProcessInstanceQuery().active().superProcessInstanceId(processInstanceId).
                    includeProcessVariables().singleResult();
            query = taskService.createTaskQuery().processInstanceId(instance.getId()).includeProcessVariables();
            theTask = query.singleResult();
        }
        return theTask;
    }

    public HistoricTaskInstance getCompletedTaskByInstanceId(String processInstanceId){
        HistoricTaskInstance task = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId).includeProcessVariables().singleResult();
        return task;
    }

    public User getAssigneeUser(String processInstanceId){
        String sql = "select assignee_ from act_ru_task where proc_inst_id_= #{procInsId} ";
        NativeTaskQuery query = taskService.createNativeTaskQuery().sql(sql)
                .parameter("procInsId", processInstanceId);
        List result =query.list();
        if(result.size()>0 && null != result.get(0)){
            Task task = (Task)result.get(0);
            String loginName = task.getAssignee();
            return UserUtils.getByLoginName(loginName);
        }else{
            return null;
        }
    }

    @Transactional(readOnly = false)
    public void jumpToSpecifyNode(String processInstanceId, String userId, Map<String, String> variables, String destinationNodeId){
        identityService.setAuthenticatedUserId(userId);
        Task task = this.getCurrentTaskByInstanceId(processInstanceId);
        Map<String, Object> traceVariables = runtimeService.getVariables(task.getExecutionId());

        JumpCmd jumpCmd = new JumpCmd(task.getExecutionId(), destinationNodeId);
        ((ServiceImpl) repositoryService).getCommandExecutor().execute(jumpCmd);

        traceCompleteTask(task.getProcessInstanceId(), traceVariables);
        auditTraceService.traceAudit(task, processInstanceId, variables);
    }


    private void traceClaimTask(Task task, String loginName){
        //delete previous current task record
        Map<String, Object> variables = runtimeService.getVariables(task.getExecutionId());
        String entryId = (String)variables.get(ActivitiConstants.PRIMARY_KEY);
        String businessTable = (String)variables.get(ActivitiConstants.BUSINESS_TABLE);
        mappingFacedService.deleteCurrentTask(entryId, businessTable);

        //insert new current task record
        ActCurrentTask newCurrentTask = new ActCurrentTask();
        newCurrentTask.setUserId(UserUtils.getByLoginName(loginName).getId());
        newCurrentTask.setBusinessTable(businessTable);
        newCurrentTask.setEntryId(entryId);
        newCurrentTask.setTaskType(TaskType.Audit.getValue());
        mappingFacedService.recordCurrentTask(newCurrentTask);
    }

    private void traceCompleteTask(String procInstId, Map<String, Object> variables){
        String entryId = (String)variables.get(ActivitiConstants.PRIMARY_KEY);
        String businessTable = (String)variables.get(ActivitiConstants.BUSINESS_TABLE);
        //insert to done task record
        mappingFacedService.recordDoneTask(entryId, businessTable);

        //delete previous current task record
        mappingFacedService.deleteCurrentTask(entryId, businessTable);

        //insert new current task record
        mappingFacedService.recordCurrentTasks(procInstId, entryId, businessTable);
    }

}
