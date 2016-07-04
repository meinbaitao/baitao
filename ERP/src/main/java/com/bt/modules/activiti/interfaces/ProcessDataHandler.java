package com.bt.modules.activiti.interfaces;

import java.util.Map;

/**
 * author fanjinyuan.
 *
 *
 */
public interface ProcessDataHandler {

    /**
     * 把数据写回数据库
     * @param variables
     */
    public void processFinishedNotify(Map<String, Object> variables);


}
