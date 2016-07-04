package com.bt.modules.activiti.listener;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.activiti.engine.delegate.event.ActivitiEvent;
import org.activiti.engine.delegate.event.BaseEntityEventListener;
import org.activiti.engine.delegate.event.impl.ActivitiEntityEventImpl;
import org.activiti.engine.impl.cmd.GetDeploymentProcessDefinitionCmd;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.ExecutionEntity;
import org.activiti.engine.impl.persistence.entity.HistoricProcessInstanceEntity;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.google.common.base.Strings;

/**
 * 流程启动时，更新流程的标题
 * 
 * @author 许俊雄
 *
 */
public class UpdateProcessInstanceNameEventListener extends
		BaseEntityEventListener {

	protected void onInitialized(ActivitiEvent event) {
		if (!(event instanceof ActivitiEntityEventImpl)) {
			return;
		}

		ActivitiEntityEventImpl activitiEntityEventImpl = (ActivitiEntityEventImpl) event;
		Object entity = activitiEntityEventImpl.getEntity();

		if (!(entity instanceof ExecutionEntity)) {
			return;
		}

		ExecutionEntity executionEntity = (ExecutionEntity) entity;

		if (!executionEntity.isProcessInstanceType()) {
			return;
		}

		String processInstanceId = executionEntity.getId();
		String processDefinitionId = executionEntity.getProcessDefinitionId();
		CommandContext commandContext = Context.getCommandContext();
		ProcessDefinitionEntity processDefinition = new GetDeploymentProcessDefinitionCmd(
				processDefinitionId).execute(commandContext);
		// 获取流程的标题
		String title = (String) executionEntity
				.getVariable(ActivitiConstants.PROC_TITLE);
		// {流程标题:title}-{发起人:startUser}-{发起时间:startTime}
		String processDefinitionName = processDefinition.getName();
		String userId = Authentication.getAuthenticatedUserId();
		
		String processInstanceName = processDefinitionName + "-" + userId + "-"
				+ new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		
		//发起流程的时候，如果流程变量title不为空的话，设置标题为
		if(Strings.isNullOrEmpty(title)){
			processInstanceName = title + "-" + userId + "-"
					+ new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
		}
		
		// runtime
		executionEntity.setName(processInstanceName);

		// history
		HistoricProcessInstanceEntity historicProcessInstanceEntity = commandContext
				.getHistoricProcessInstanceEntityManager()
				.findHistoricProcessInstance(processInstanceId);
		historicProcessInstanceEntity.setName(processInstanceName);
	}
}
