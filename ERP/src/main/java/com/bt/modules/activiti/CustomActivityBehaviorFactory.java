package com.bt.modules.activiti;

import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.activiti.engine.impl.bpmn.parser.factory.DefaultActivityBehaviorFactory;
import org.activiti.engine.impl.task.TaskDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bt.modules.activiti.behavior.CustomUserTaskActivityBehavior;

public class CustomActivityBehaviorFactory extends
		DefaultActivityBehaviorFactory {
	private static Logger log = LoggerFactory
			.getLogger(CustomUserTaskActivityBehavior.class);

	public UserTaskActivityBehavior createUserTaskActivityBehavior(
			UserTask userTask, TaskDefinition taskDefinition) {
		log.info("change usertask Behavior : {}  ", userTask);
		
		return new CustomUserTaskActivityBehavior(taskDefinition);
	}

}
