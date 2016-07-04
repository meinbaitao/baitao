package com.bt.modules.test.activiti;

import com.thinkgem.jeesite.modules.act.entity.CompleteTaskParam;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.web.ActAccessTaskDirectController;
import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * author fanjinyuan.
 */
@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/spring-context.xml", "/spring-context-activiti.xml" })
public class ActAccessTaskDirectControllerTest {

    public static final String USER_LOGIN_NAME = "majuns";

    @Autowired
    private TaskService taskService;
    @Autowired
    private FormService formService;
    @Autowired
    private IdentityService identityService;

    @Autowired
    private ActAccessTaskDirectService actService;

    private ActAccessTaskDirectController controller;

    private String proInstanceId = "39b34f1cd4734af9bed72e2255294a80";
    private String processDefinitionId = "ApplyProcureFlow:4:02fcf42bd1794948a5072a8daff15ea0";

    @Ignore
    @Before
    public void init() throws Exception{
        controller = new ActAccessTaskDirectControllerMock();
        Field actServiceField = ActAccessTaskDirectController.class.getDeclaredField("actService");
        actServiceField.setAccessible(true);
        actServiceField.set(controller, actService);

        identityService.setAuthenticatedUserId(USER_LOGIN_NAME);
        Map<String, String> formProperties = new HashMap<String, String>();
        ProcessInstance processInstance = formService.submitStartFormData(processDefinitionId, formProperties);
        proInstanceId = processInstance.getProcessInstanceId();
    }

    @Ignore
    @Test
    public void testProcessWholeCycle()throws Exception{
        testIsCandidateUser();

        testIsAssigneeUser_expect_false();

        testIsAssigneeUser_expect_false();

        testClaim();

        testIsAssigneeUser_expect_true();

        testGetTaskForm();

        testCompleteTask();
    }

    public void testIsCandidateUser() throws Exception {
        String result = controller.isCandidateUser(proInstanceId);
        assertEquals("true", result);
    }

    public void testIsAssigneeUser_expect_false() throws Exception {
        String result = controller.isAssigneeUser(proInstanceId);
        assertEquals("false", result);
    }


    public void testClaim() throws Exception {
        String result = controller.claim(proInstanceId);
        assertEquals("true", result);
    }


    public void testIsAssigneeUser_expect_true() throws Exception {
        String result = controller.isAssigneeUser(proInstanceId);
        assertEquals("true", result);
    }

    public void testGetTaskForm() throws Exception {
        String result = controller.getTaskForm(proInstanceId);
        assertEquals("modules/actcommon/audit", result);
    }

    public void testCompleteTask() throws Exception {
        CompleteTaskParam param = new CompleteTaskParam();
        param.setProcessInstanceId(proInstanceId);
        param.setApproval("0");
        param.setRejectBackReason("价格太贵");
        String result = controller.completeTask(param);
        assertEquals("true", result);
    }

}