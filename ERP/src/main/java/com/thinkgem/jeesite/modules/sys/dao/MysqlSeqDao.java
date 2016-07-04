package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * MysqlSequence自增序列 DAO接口
 * @author 许俊雄
 * @version 2015-04-01
 */
@MyBatisDao
public interface MysqlSeqDao {
	
	public Integer getNextVal(String seqName);
	
	public Integer getCurrentVal(String seqName);
}
