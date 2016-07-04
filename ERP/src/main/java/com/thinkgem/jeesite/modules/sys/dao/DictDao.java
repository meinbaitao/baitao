/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
	//查询类型和类型描述名称列表 许俊雄201604115
	public List<Dict> findTypeDisNameList(Dict dict);
	
	//查询类型和类型描述名称列表 许俊雄201604115
	public Integer findMaxSort(String type);
	
	//查询用户可见的字典参数值
	public List<Dict> findUserDictList(Dict entity);
	
}
