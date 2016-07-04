package com.bt.modules.test.activiti;


import java.util.HashMap;
import java.util.Map;

import org.activiti.engine.FormService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActAuditTraceService;
import com.thinkgem.jeesite.modules.taskmapping.service.RecordMappingFacedService;


public class CompleteTaskTest extends BasicTest {

	@Autowired
    private FormService formService;
	@Autowired
    private ActAccessTaskDirectService actAccessTaskDirectService;
	@Autowired
    private RuntimeService runtimeService;
    @Autowired
    private RecordMappingFacedService mappingFacedService;
    @Autowired
    private ActAuditTraceService auditTraceService;
    
    
    
    @Test
    public void completeTask(){
    	String wfID = "cf27c2c9256b4ad196b319978283cf3d";
    	Map<String, String> variables = new HashMap<String, String>();
    	variables.put(ActivitiConstants.APPROVAL_RESULT_VARIABLE,"1");
        variables.put(ActivitiConstants.REJECT_BACK_REASON, "junit-commit");
    	for(int i=0;i<=50;i++){
    		Task theTask = actAccessTaskDirectService.getCurrentTaskByInstanceId(wfID);
        	formService.submitTaskFormData(theTask.getId(), variables);
    	}
    }
}
