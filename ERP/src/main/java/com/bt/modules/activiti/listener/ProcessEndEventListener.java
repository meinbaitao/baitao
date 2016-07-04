package com.bt.modules.activiti.listener;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * author fanjinyuan.
 */
@Component("processEndEventListener")
public class ProcessEndEventListener implements ExecutionListener,BeanFactoryAware {

    @Autowired
    private BeanFactory beanFactory;

    @Autowired
    private TaskService taskService;

    @Override
    public void notify(DelegateExecution execution) throws Exception {
        Map<String, Object> variables = execution.getVariables();
        ProcessDataHandler dataHandler = (ProcessDataHandler)beanFactory.getBean(variables.get(ActivitiConstants.PERSIST_BEAN_NAME)+"");
        dataHandler.processFinishedNotify(variables);
    }

    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        this.beanFactory = beanFactory;
    }
}
