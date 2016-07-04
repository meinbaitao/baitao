/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.labor.dao;

import java.util.List;

import com.bt.modules.report.labor.entity.LaborReport;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 劳务报表
 * @author xiaocai
 * @version 2016-4-28
 */
@MyBatisDao
public interface LaborReportDao extends CrudDao<LaborReport> {

    /**
     * 通过楼栋号、第几周、项目ID 查询一条在建进度记录
     * @param paramMap
     * @return
     */
    public List<LaborReport> findList(LaborReport laborReport);

	
}