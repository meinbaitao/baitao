package com.bt.modules.test.process;

import java.util.Map;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ProcessDefinitionKeyEnum;
import com.bt.modules.activiti.support.VariablesBuilder;
import com.bt.modules.test.basic.ActivitiBasicTest;

/**
 * 
 * 劳务结算流程测试
 * @author 许俊雄
 * @since 20160517
 */
public class LaborSettlementProcessTest extends ActivitiBasicTest {
	
	
	
	public void startFlow() throws BusinessException{
		Map<String, Object> variableMap = new VariablesBuilder()
		.putAreaManager("","projNameTest").
		putCostRespon("","projNameTest")
		.putPrimaryKey("").putPersistBeanName("").build();
		
		actTaskService.startProcess(ProcessDefinitionKeyEnum.PD_LARBOR_CONTACT_CAL.toString()
				, "", "1", "", variableMap);
	}
}