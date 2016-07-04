/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.Laboritems;
import com.bt.modules.contract.dao.LaboritemsDao;
import com.bt.modules.project.entity.Subproject;

/**
 * 劳务清单Service
 * @author yhh
 * @version 2015-11-30
 */
@Service
@Transactional(readOnly = true)
public class LaboritemsService extends CrudService<LaboritemsDao, Laboritems> {

	@Autowired
	private LaboritemsDao laboritemsDao;
	
	/**
	 * 获取对应二级下面的全部数据
	 * @param subId
	 * @return
	 */
	public List<Laboritems> getBySubId(String subId){
		Laboritems laboritems = new Laboritems();
		Subproject sub = new Subproject();
		sub.setId(subId);
		laboritems.setSub(sub);
		return this.getByCondition(laboritems);
	}
	/**
	 * 根据条件获取相应的列表数据
	 * @param laboritems
	 * @return
	 */
	public List<Laboritems> getByCondition(Laboritems laboritems){
		List<Laboritems> list = laboritemsDao.getByCondition(laboritems);
		if(list==null){
			list = new ArrayList<Laboritems>();
		}
		return list;
	}
	/**
	 * 批量插入数据
	 * @param list
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<Laboritems> list){
		for(Laboritems lab : list){
			super.dao.insert(lab);
		}
	}
	/**
	 * 批量保存数据
	 * @param list
	 */
	@Transactional(readOnly = false)
	public void batchSave(List<Laboritems> list){
		for(Laboritems lab : list){
			super.save(lab);
		}
	}
	/**
	 * 根据二级项目Id删除全部的清单数据
	 * @param subId
	 */
	@Transactional(readOnly = false)
	public void deleteBySubId(String subId){
		if(StringUtils.isNotBlank(subId)){
			Subproject sub = new Subproject();
			sub.setId(subId);
			Laboritems laboritems = new Laboritems();
			laboritems.setSub(sub);
			laboritemsDao.deleteBySubId(laboritems);
		}
	}
	
	public Laboritems get(String id) {
		return super.get(id);
	}
	
	public List<Laboritems> findList(Laboritems laboritems) {
		return super.findList(laboritems);
	}
	
	public Page<Laboritems> findPage(Page<Laboritems> page, Laboritems laboritems) {
		return super.findPage(page, laboritems);
	}
	
	@Transactional(readOnly = false)
	public void save(Laboritems laboritems) {
		super.save(laboritems);
	}
	
	@Transactional(readOnly = false)
	public void delete(Laboritems laboritems) {
		super.delete(laboritems);
	}
	
}