package com.bt.modules.test.cmd;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.test.activiti.WorkContractReviewDataHandler;
import com.thinkgem.jeesite.modules.act.cmd.JumpCmd;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.ServiceImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

/**
 * author fanjinyuan.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring-context.xml", "/spring-context-activiti.xml" })
public class ActivitJumpNodeTest {

    private static final String processDefKey = "workContractReviewFlow";
    private static final String APPROVAL_KEY = "auditApproval";
    public static final String VERIFY_MARKER = "verifyMarker";

    private static final String APPROVAL_VALUE = "1";
    private static final String REJECT_VALUE = "0";

    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private ActAccessTaskDirectService directService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private HistoryService historyService;

    private static final Map<String, Object> procVariables = new HashMap<String, Object>();

    @BeforeClass
    public static void init(){
        procVariables.put(ActivitiConstants.BUSINESS_TABLE, "btg_con_laborcontract");
        procVariables.put(ActivitiConstants.PERSIST_BEAN_NAME, WorkContractReviewDataHandler.BEAN_NAME);
        procVariables.put("cost_responsible_person", "costingSpecialist");
        procVariables.put("costing_leader", "costingLeader");
        procVariables.put("costing_director", "costingDirector");
        procVariables.put("project_responsible_person", "projResponsiblePerson");
        procVariables.put("area_manager", "areaManager");
        procVariables.put("administration_specialist", "officeAdmin");
    }



    @Test
    public void cover_all_audit_path(){
        String originUser = "admin";
        identityService.setAuthenticatedUserId(originUser);
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefKey, "btg_con_laborcontract" + ":" + "1", procVariables);

        Map<String, Object> auditVariables = new HashMap<String, Object>();
        auditVariables.put(APPROVAL_KEY, APPROVAL_VALUE);

        approval_from_first_node_to_ceo(auditVariables, processInstance);

        auditVariables.put(APPROVAL_KEY, REJECT_VALUE);
        //ceo reject
        String currentUser = "liaom";
        executeCandidateTask(currentUser, auditVariables, "ceo_audit", processInstance);

        //财务应付经理驳回到发起人节点
        currentUser = "pengh";
        rejectToSpecifiedNode(currentUser, "editApplyForm", processInstance);

        Task task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        assertEquals("editApplyForm", task.getTaskDefinitionKey());
        assertEquals(originUser, task.getAssignee());
        //apply user approval
        auditVariables.put(APPROVAL_KEY, APPROVAL_VALUE);
        executeAssigneeTask(originUser, auditVariables, "editApplyForm", processInstance);


        //成本负责人通过
        currentUser = procVariables.get("cost_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "cost_responsible_person_audit", processInstance);

        //成本组长通过
        currentUser = procVariables.get("costing_leader").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_leader_audit", processInstance);

        //成本主管审核通过
        currentUser = procVariables.get("costing_director").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_director_audit", processInstance);

        //项目负责人审核通过
        currentUser = procVariables.get("project_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "project_responsible_person_audit", processInstance);

        //区域经理驳回到发起人
        currentUser = procVariables.get("area_manager").toString();
        rejectToSpecifiedNode(currentUser, "editApplyForm", processInstance);


        task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        assertEquals("editApplyForm", task.getTaskDefinitionKey());
        assertEquals(originUser, task.getAssignee());
        //apply user approval
        auditVariables.put(APPROVAL_KEY, APPROVAL_VALUE);
        executeAssigneeTask(originUser, auditVariables, "editApplyForm", processInstance);


        //成本负责人直接跳到总裁办审核
        currentUser = procVariables.get("cost_responsible_person").toString();
        rejectToSpecifiedNode(currentUser, "ceo_audit", processInstance);


        //总裁办 通过
        currentUser = "liaom";
        auditVariables.put(VERIFY_MARKER, "process execution done.");
        executeCandidateTask(currentUser, auditVariables, "ceo_audit", processInstance);

        HistoricProcessInstance historyInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(processInstance.getProcessInstanceId()).singleResult();
        assertNotNull(historyInstance);
        assertEquals(processInstance.getProcessInstanceId(), historyInstance.getId());
    }



    private void approval_from_first_node_to_ceo(Map<String, Object> auditVariables, ProcessInstance processInstance){
        //成本负责人通过
        String currentUser = procVariables.get("cost_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "cost_responsible_person_audit", processInstance);

        //成本组长通过
        currentUser = procVariables.get("costing_leader").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_leader_audit", processInstance);

        //成本主管审核通过
        currentUser = procVariables.get("costing_director").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_director_audit", processInstance);

        //项目负责人审核通过
        currentUser = procVariables.get("project_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "project_responsible_person_audit", processInstance);

        //区域经理审核通过
        currentUser = procVariables.get("area_manager").toString();
        executeAssigneeTask(currentUser, auditVariables, "area_manager_audit", processInstance);

        //运营专员审核通过
        currentUser = "shic";
        executeCandidateTask(currentUser, auditVariables, "operation_specialist_audit", processInstance);

        //运营中心负责人审核通过
        currentUser = "yuanj";
        executeCandidateTask(currentUser, auditVariables, "oper_center_resp_person_audit", processInstance);

        //法务部审核通过
        currentUser = "liaokain";
        executeCandidateTask(currentUser, auditVariables, "law_dep_audit", processInstance);

        //行政专员审核
        currentUser = procVariables.get("administration_specialist").toString();
        executeAssigneeTask(currentUser, auditVariables, "administration_specialist_audit", processInstance);

        //财务应付经理
        currentUser = "pengh";
        executeAssigneeTask(currentUser, auditVariables, "finance_should_pay_manager_audit", processInstance);
    }


    private void executeAssigneeTask(String currentUser, Map<String, Object> auditVariables, String taskDefKey, ProcessInstance processInstance){
        identityService.setAuthenticatedUserId(currentUser);
        Task task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        assertEquals(taskDefKey, task.getTaskDefinitionKey());
        assertEquals(currentUser, task.getAssignee());
        taskService.complete(task.getId(), auditVariables);
    }

    private void executeCandidateTask(String currentUser, Map<String, Object> auditVariables, String taskDefKey, ProcessInstance processInstance){
        identityService.setAuthenticatedUserId(currentUser);
        Task task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        assertEquals(taskDefKey, task.getTaskDefinitionKey());
        assertNull(task.getAssignee());

        //claim
        taskService.claim(task.getId(), currentUser);
        task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        assertEquals(currentUser, task.getAssignee());
        taskService.complete(task.getId(), auditVariables);
    }

    private void rejectToSpecifiedNode(String currentUser, String destinationNodeId, ProcessInstance processInstance){
        identityService.setAuthenticatedUserId(currentUser);
        Task task = directService.getCurrentTaskByInstanceId(processInstance.getProcessInstanceId());
        JumpCmd jumpCmd = new JumpCmd(task.getExecutionId(), destinationNodeId);
        ((ServiceImpl) repositoryService).getCommandExecutor().execute(jumpCmd);
    }


}
