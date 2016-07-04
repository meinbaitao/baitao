package com.bt.modules.test.activiti;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.HistoricProcessInstanceEntity;
import org.activiti.engine.impl.persistence.entity.HistoricProcessInstanceEntityManager;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import static org.junit.Assert.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 *  下料单流程 unit test
 * author fanjinyuan.
 */
@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring-context.xml", "/spring-context-activiti.xml" })
public class SubmitMaterialsFormFlowTest {

    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private IdentityService identityService;

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private ActAccessTaskDirectService directService;

    @Autowired
    private ProcessEngine processEngine;


    private String processDefinitionId = "SubmitMaterialsFormFlow:7:75568eb31f0c4d25928f9b95bf941ed8";
    private static final String APPROVAL_KEY = "auditApproval";

    @Ignore
    @Test
    public void coverRepeatRejectSituation(){
        identityService.setAuthenticatedUserId("luweit");

        ProcessInstance instance = formService.submitStartFormData(processDefinitionId, new HashMap<String, String>());

        Map<String, Object> variables = new HashMap<String,Object>();
        variables.put(ActivitiConstants.PERSIST_BEAN_NAME, SubmitMaterialsDataHandler.BEAN_NAME);

        //设计主管驳回
        Task task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("design_master_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "0");
        taskService.complete(task.getId(), variables);

        //重新导入明细
        identityService.setAuthenticatedUserId("admin");
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("reimportDetail", task.getTaskDefinitionKey());
        taskService.complete(task.getId(), variables);

        //设计主管通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("design_master_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);

        //设计经理通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("design_manager_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);


        //陈本负责人驳回
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("costing_project_master", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "0");
        taskService.complete(task.getId(), variables);


        //设计经理通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("design_manager_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);

        //陈本负责人通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("costing_project_master", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);


        //运营专员驳回
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("oper_dedicator_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "0");
        taskService.complete(task.getId(), variables);


        //陈本负责人通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("costing_project_master", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);

        //运营专员通过
        task = directService.getCurrentTaskByInstanceId(instance.getProcessInstanceId());
        assertEquals("oper_dedicator_audit", task.getTaskDefinitionKey());
        taskService.claim(task.getId(), "admin");
        variables.put(APPROVAL_KEY, "1");
        taskService.complete(task.getId(), variables);

        TaskQuery query = taskService.createTaskQuery().processInstanceId(instance.getProcessInstanceId()).includeProcessVariables();
        task = query.singleResult();
        assertNull(task);
    }



}
