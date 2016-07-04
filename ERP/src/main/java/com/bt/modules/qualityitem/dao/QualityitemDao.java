/**
] * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.qualityitem.dao;


import com.bt.modules.qualityitem.entity.Qualityitem;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 *质保金信息
 * @author dy
 * @version 2016年4月20日
 */
@MyBatisDao
public interface QualityitemDao extends CrudDao<Qualityitem> {
    /**
     * 根据二级质保金ID反查一级质保金信息
     * @return
     */
	public Qualityitem getbyitem(Qualityitem qualityitem);
	
}