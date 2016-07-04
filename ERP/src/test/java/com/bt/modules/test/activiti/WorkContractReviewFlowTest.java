package com.bt.modules.test.activiti;


import com.bt.modules.activiti.constants.ActivitiConstants;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

/**
 *  劳务合同评审流程 unit test
 * author fanjinyuan.
 */
@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring-context.xml", "/spring-context-activiti.xml" })
public class WorkContractReviewFlowTest {

    private static final String processDefKey = "workContractReviewFlow";
    private static final String APPROVAL_KEY = "auditApproval";

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
        identityService.setAuthenticatedUserId("admin");
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefKey, "btg_con_laborcontract" + ":" + "1", procVariables);

        Map<String, Object> auditVariables = new HashMap<String, Object>();
        auditVariables.put(APPROVAL_KEY, APPROVAL_VALUE);

        approval_from_first_node_to_ceo(auditVariables, processInstance);

        auditVariables.put(APPROVAL_KEY, REJECT_VALUE);
        //ceo reject
        String currentUser = "liaom";
        executeCandidateTask(currentUser, auditVariables, "ceo_audit", processInstance);

        //财务应付经理驳回
        currentUser = "pengh";
        executeAssigneeTask(currentUser, auditVariables, "finance_should_pay_manager_audit", processInstance);

        //行政专员驳回
        currentUser = procVariables.get("administration_specialist").toString();
        executeAssigneeTask(currentUser, auditVariables, "administration_specialist_audit", processInstance);

        //法务驳回
        currentUser = "liaokain";
        executeCandidateTask(currentUser, auditVariables, "law_dep_audit", processInstance);

        //运营中心负责人驳回
        currentUser = "yuanj";
        executeCandidateTask(currentUser, auditVariables, "oper_center_resp_person_audit", processInstance);

        //运营专员审核通过
        currentUser = "shic";
        executeCandidateTask(currentUser, auditVariables, "operation_specialist_audit", processInstance);

        //区域经理审核通过
        currentUser = procVariables.get("area_manager").toString();
        executeAssigneeTask(currentUser, auditVariables, "area_manager_audit", processInstance);

        //项目负责人审核通过
        currentUser = procVariables.get("project_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "project_responsible_person_audit", processInstance);

        //成本主管审核通过
        currentUser = procVariables.get("costing_director").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_director_audit", processInstance);

        //成本组长通过
        currentUser = procVariables.get("costing_leader").toString();
        executeAssigneeTask(currentUser, auditVariables, "costing_leader_audit", processInstance);

        //成本负责人通过
        currentUser = procVariables.get("cost_responsible_person").toString();
        executeAssigneeTask(currentUser, auditVariables, "cost_responsible_person_audit", processInstance);

        currentUser = "admin";
        executeAssigneeTask(currentUser, auditVariables, "editApplyForm", processInstance);

        //成本负责人 -- 》 总裁办
        auditVariables.put(APPROVAL_KEY, APPROVAL_VALUE);
        approval_from_first_node_to_ceo(auditVariables, processInstance);


        //总裁办 通过
        currentUser = "liaom";
        executeCandidateTask(currentUser, auditVariables, "ceo_audit", processInstance);
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


}
