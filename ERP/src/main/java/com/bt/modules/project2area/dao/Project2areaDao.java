/**
] * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project2area.dao;


import com.bt.modules.project2area.entity.Project2area;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;

/**
 *质保金信息
 * @author dy
 * @version 2016年4月20日
 */
@MyBatisDao
public interface Project2areaDao extends CrudDao<Project2area> {
    /**
     * 根据二级质保金ID反查一级质保金信息
     * @return
     */
	public Area getArea(String code);
	
}