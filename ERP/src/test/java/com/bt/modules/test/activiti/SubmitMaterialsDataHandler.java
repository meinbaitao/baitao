package com.bt.modules.test.activiti;

import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * author fanjinyuan.
 */
@Service(SubmitMaterialsDataHandler.BEAN_NAME)
public class SubmitMaterialsDataHandler implements ProcessDataHandler {

    public static final String BEAN_NAME = "SubmitMaterialsDataHandlerTest";

    @Override
    public void processFinishedNotify(Map<String, Object> variables) {

    }
}
