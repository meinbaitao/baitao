/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.factory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.factory.entity.ManufPerson;
import com.bt.modules.factory.dao.ManufPersonDao;

/**
 * 加工厂人员Service
 * @author yhh
 * @version 2015-11-11
 */
@Service
@Transactional(readOnly = true)
public class ManufPersonService extends CrudService<ManufPersonDao, ManufPerson> {

	@Autowired
	private ManufPersonDao manufPersonDao;
	
	public ManufPerson get(String id) {
		return super.get(id);
	}
	
	public List<ManufPerson> findList(ManufPerson manufPerson) {
		return super.findList(manufPerson);
	}
	
	public Page<ManufPerson> findPage(Page<ManufPerson> page, ManufPerson manufPerson) {
		return super.findPage(page, manufPerson);
	}
	
	@Transactional(readOnly = false)
	public void save(ManufPerson manufPerson) {
		super.save(manufPerson);
	}
	
	@Transactional(readOnly = false)
	public void delete(ManufPerson manufPerson) {
		super.delete(manufPerson);
	}
	
	/**
	 * 由工厂名获取对象
	 * @param factory
	 * @return
	 */
	public ManufPerson getByFactoryName(String factory){
		return manufPersonDao.getByFactoryName(factory);
	}
	
	/**
	 * 获取所有的生产经理
	 * @return
	 */
	public List<String> findManagers(){
		return manufPersonDao.findManagers();
	}
}