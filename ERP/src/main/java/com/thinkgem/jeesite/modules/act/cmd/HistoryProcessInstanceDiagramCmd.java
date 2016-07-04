package com.thinkgem.jeesite.modules.act.cmd;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.impl.cmd.GetBpmnModelCmd;
import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;
import org.activiti.engine.impl.persistence.entity.*;
import org.activiti.image.ProcessDiagramGenerator;

import java.io.InputStream;
import java.util.Collections;
import java.util.List;

public class HistoryProcessInstanceDiagramCmd implements Command<InputStream> {

    protected String historyProcessInstanceId;
    protected ProcessEngine processEngine;

    public HistoryProcessInstanceDiagramCmd(String historyProcessInstanceId , ProcessEngine processEngine) {
        this.historyProcessInstanceId = historyProcessInstanceId;
        this.processEngine = processEngine;
    }

    public InputStream execute(CommandContext commandContext) {
        HistoricProcessInstanceEntityManager historicProcessInstanceEntityManager = commandContext
                .getHistoricProcessInstanceEntityManager();
        HistoricProcessInstanceEntity historicProcessInstanceEntity = historicProcessInstanceEntityManager
                .findHistoricProcessInstance(historyProcessInstanceId);

        List<String> activityIds = this
                .getActivityIdsFromHistoricProcessInstanceEntity(
                        historicProcessInstanceEntity, commandContext);
        String processDefinitionId = historicProcessInstanceEntity
                .getProcessDefinitionId();

        GetBpmnModelCmd getBpmnModelCmd = new GetBpmnModelCmd(
                processDefinitionId);
        BpmnModel bpmnModel = getBpmnModelCmd.execute(commandContext);

        ProcessDiagramGenerator diagramGenerator = processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator();

        InputStream imageStream = diagramGenerator.generateDiagram(bpmnModel, "png", activityIds,
                Collections.<String> emptyList(), processEngine
                        .getProcessEngineConfiguration().getActivityFontName(),
                processEngine.getProcessEngineConfiguration().getLabelFontName(),
                null, 1.0);

        return imageStream;
    }

    protected List<String> getActivityIdsFromHistoricProcessInstanceEntity(
            HistoricProcessInstanceEntity historicProcessInstanceEntity,
            CommandContext commandContext) {
        if (historicProcessInstanceEntity.getEndActivityId() == null) {
            String processInstanceId = historicProcessInstanceEntity.getId();
            ExecutionEntityManager executionEntityManager = commandContext
                    .getExecutionEntityManager();
            ExecutionEntity executionEntity = executionEntityManager
                    .findExecutionById(processInstanceId);
			List<String> activityIds;
			if (executionEntity != null) {
	            activityIds = executionEntity.findActiveActivityIds();
			} else {
				activityIds = Collections.EMPTY_LIST;
			}

            return activityIds;
        } else {
            return Collections.singletonList(historicProcessInstanceEntity
                    .getEndActivityId());
        }
    }
}
