package com.bt.modules.test.activiti;

import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.test.cmd.ActivitJumpNodeTest;
import org.springframework.stereotype.Service;

import java.util.Map;

import static org.junit.Assert.assertEquals;

/**
 * author fanjinyuan.
 */
@Service(value = WorkContractReviewDataHandler.BEAN_NAME)
public class WorkContractReviewDataHandler  implements ProcessDataHandler {

    public static final String BEAN_NAME =  "com.bt.modules.test.activiti.WorkContractReviewDataHandler";


    @Override
    public void processFinishedNotify(Map<String, Object> variables) {
        assertEquals("process execution done.", variables.get(ActivitJumpNodeTest.VERIFY_MARKER));
    }

}
