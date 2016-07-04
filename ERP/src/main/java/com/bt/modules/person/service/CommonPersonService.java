/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.person.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.person.dao.CommonPersonDao;
import com.bt.modules.person.entity.CommonPerson;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 常用联系人表Service
 * @author pc
 * @version 2015-08-11
 */
@Service
@Transactional(readOnly = true)
public class CommonPersonService extends CrudService<CommonPersonDao, CommonPerson> {

	@Autowired
	private CommonPersonDao commonPersonDao;
	/**
	 * 插入单条数据
	 */
	@Transactional(readOnly = false)
	public void insert(CommonPerson commonPerson){
		commonPersonDao.insert(commonPerson);
	}
	
	public CommonPerson get(String id) {
		return super.get(id);
	}
	
	public List<CommonPerson> findList(CommonPerson commonPerson) {
		return super.findList(commonPerson);
	}
	
	public Page<CommonPerson> findPage(Page<CommonPerson> page, CommonPerson commonPerson) {
		return super.findPage(page, commonPerson);
	}
	
	@Transactional(readOnly = false)
	public void save(CommonPerson commonPerson) {
		super.save(commonPerson);
	}
	
	@Transactional(readOnly = false)
	public void delete(CommonPerson commonPerson) {
		super.delete(commonPerson);
	}
	
}