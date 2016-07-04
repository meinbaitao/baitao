package com.bt.modules.test.activiti;

import org.activiti.engine.*;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipInputStream;

import static org.junit.Assert.assertEquals;

/**
 * author fanjinyuan.
 */
@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring-context.xml", "/spring-context-activiti.xml" })
public class SubProcessIntegrationTest {

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


    private String processDefinitionId="procureContractFlow:2:95019";

    @Ignore
    @Test
    public void deployTest() throws FileNotFoundException {
        ZipInputStream inputStream = new ZipInputStream(new FileInputStream(new File("D:\\bars\\ContractAuditSubFlow.bar")));
        processDefinitionId = repositoryService.createDeployment()
                .name("ContractAuditSubFlow.bar")
                .addZipInputStream(inputStream)
                .deploy().getId();
    }

    @Ignore
    @Test
    public void startInstance(){
        identityService.setAuthenticatedUserId("luweit");
        ProcessInstance instance = formService.submitStartFormData(processDefinitionId, new HashMap<String, String>());

        String instanceId = instance.getProcessInstanceId();
        identityService.setAuthenticatedUserId("admin");
        Task task = this.getCurrentTaskByInstanceId(instanceId);

        Map<String,Object> variables = new HashMap<String, Object>();
        variables.put("auditApproval", "1");

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);


        task = this.getCurrentTaskByInstanceId(instanceId);
        String taskDefinitionKey = task.getTaskDefinitionKey();

        assertEquals("contract_costing_team_leader_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("contract_costing_director_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("contract_costing_manager", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("agreement_auditor_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("agreement_check_teamleader_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("jcswbsd_member_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("finance_auditor_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("finance_director_audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("CEO_Audit", taskDefinitionKey);

        taskService.claim(task.getId(), "admin");
        taskService.complete(task.getId(), variables);

        task = getCurrentTaskByInstanceId(instanceId);
        taskDefinitionKey = task.getTaskDefinitionKey();
        assertEquals("end", taskDefinitionKey);

    }


    private Task getCurrentTaskByInstanceId(String processInstanceId){
        TaskQuery query = taskService.createTaskQuery().processInstanceId(processInstanceId).includeProcessVariables();
        Task theTask = query.singleResult();

        if(theTask==null) {
            ProcessInstance instance = runtimeService.createProcessInstanceQuery().active().superProcessInstanceId(processInstanceId).
                    includeProcessVariables().singleResult();
            query = taskService.createTaskQuery().processInstanceId(instance.getId()).includeProcessVariables();
            theTask = query.singleResult();
        }

        return theTask;
    }

}
