/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.entity.DataHandle;
import com.thinkgem.jeesite.modules.sys.dao.DataHandleDao;

/**
 * 数据操作记录Service
 * @author yhh
 * @version 2016-03-11
 */
@Service
@Transactional(readOnly = true)
public class DataHandleService extends CrudService<DataHandleDao, DataHandle> {

public Page<DataHandle> findPage(Page<DataHandle> page, DataHandle handle) {
		
		// 设置默认时间范围，默认当前月
		if (handle.getBeginDate() == null){
			handle.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
		}
		if (handle.getEndDate() == null){
			handle.setEndDate(DateUtils.addMonths(handle.getBeginDate(), 1));
		}
		
		return super.findPage(page, handle);
		
	}
	
}