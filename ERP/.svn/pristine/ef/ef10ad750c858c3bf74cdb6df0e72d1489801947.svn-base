/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.area.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.area.entity.Province;
import com.bt.modules.area.dao.ProvinceDao;

/**
 * 省市区基础表Service
 * @author xjp
 * @version 2015-08-18
 */
@Service
@Transactional(readOnly = true)
public class ProvinceService extends CrudService<ProvinceDao, Province> {

	@Autowired
	private ProvinceDao provinceDao;
	
	public Province get(String id) {
		return super.get(id);
	}
	
	public Province getProvince(String provinceid) {
		return provinceDao.getProvince(provinceid);
	}
	
	public List<Province> findList(Province province) {
		return super.findList(province);
	}
	
	public Page<Province> findPage(Page<Province> page, Province province) {
		return super.findPage(page, province);
	}
	
	@Transactional(readOnly = false)
	public void save(Province province) {
		super.save(province);
	}
	
	@Transactional(readOnly = false)
	public void delete(Province province) {
		super.delete(province);
	}
}