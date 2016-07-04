package com.bt.modules.todotask.dao;

import com.bt.modules.todotask.entity.TodoTaskRedirectMapping;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * author fanjinyuan.
 */
@MyBatisDao
public interface TodoTaskRedirectMappingDao {


   public TodoTaskRedirectMapping get(TodoTaskRedirectMapping param);

}
