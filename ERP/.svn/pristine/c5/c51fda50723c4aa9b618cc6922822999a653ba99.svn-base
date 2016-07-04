package com.bt.modules.todotask.service;

import com.bt.modules.todotask.dao.TodoTaskRedirectMappingDao;
import com.bt.modules.todotask.entity.TodoTaskRedirectMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * author fanjinyuan.
 */
@Service
@Transactional(readOnly = true)
public class TodoTaskRedirectMappingService {

    @Autowired
    private TodoTaskRedirectMappingDao redirectMappingDao;

    public TodoTaskRedirectMapping get(String businessKey, String subType){
        TodoTaskRedirectMapping param = new TodoTaskRedirectMapping();
        param.setBusinessKey(businessKey);
        param.setSubType(subType);
        return redirectMappingDao.get(param);
    }


}
