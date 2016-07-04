package com.bt.modules.test.basic;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.junit.After;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;

import com.thinkgem.jeesite.modules.act.service.ActTaskService;

/**
 * activiti测试类
 * @author pc
 *
 */
public class ActivitiBasicTest extends BasicTest{
	@Autowired
	protected ProcessEngine processEngine;
	@Autowired
	protected RuntimeService runtimeService;
	@Autowired
	protected TaskService taskService;
	@Autowired
	protected FormService formService;
	@Autowired
	protected HistoryService historyService;
	@Autowired
	protected RepositoryService repositoryService;
	@Autowired
	protected IdentityService identityService;
	
	//作者自定义封装发起流程的类
	@Autowired
	protected ActTaskService actTaskService;
	
	
	@Before
	public void testBefore(){
		System.out.println("@Before----------");
	}
	
	@After
	public void testAfter(){
		System.out.println("@After----------");
	}

}
