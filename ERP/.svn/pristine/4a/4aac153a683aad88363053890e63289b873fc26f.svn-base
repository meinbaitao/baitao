/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.supplier.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.supplier.dao.UserSuppMappingDao;
import com.bt.modules.supplier.entity.UserSuppMapping;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 供应商-生产经理关联Service
 * @author xiaocai
 * @version 2015-10-27
 */
@Service
@Transactional(readOnly = true)
public class UserSuppMappingService extends CrudService<UserSuppMappingDao, UserSuppMapping> {

	@Autowired
	private UserSuppMappingDao userSuppMappingDao;
	
	/**
	 * 插入数据
	 * @param userSuppMapping
	 */
	@Transactional(readOnly = false)
	public void insert(UserSuppMapping userSuppMapping) {
		userSuppMappingDao.insert(userSuppMapping);
	}
	/**
	 * 批量插入数据
	 * @param userSuppMapping
	 */
	@Transactional(readOnly = false)
	public void batchInsert(List<UserSuppMapping> listUSM) {
		for(UserSuppMapping usm:listUSM){
			UserSuppMapping u = userSuppMappingDao.getOne(usm);
			if(u==null){	//数据不存在的情况下新增新的数据
				userSuppMappingDao.insert(usm);
			}else{
				userSuppMappingDao.update(usm);
			}
		}
	}
	
	public Page<UserSuppMapping> userSuppMappingList(Page<UserSuppMapping> page, UserSuppMapping userSuppMapping) {
		userSuppMapping.setPage(page);
		page.setList(dao.userSuppMappingListPage(userSuppMapping));
		return page;
	}
	/**
	 * 获取列表数据
	 * @param userSuppMapping
	 * @return
	 */
	public List<UserSuppMapping> getUSMList(UserSuppMapping userSuppMapping) {
		List<UserSuppMapping> listUSM =  dao.userSuppMappingList(userSuppMapping);
		if(listUSM==null||listUSM.size()==0){
			listUSM = new ArrayList<UserSuppMapping>();
		}
		return listUSM;
	}
	
	
	public UserSuppMapping get(String id) {
		return super.get(id);
	}
	
	public List<UserSuppMapping> findList(UserSuppMapping userSuppMapping) {
		return super.findList(userSuppMapping);
	}
	
	public Page<UserSuppMapping> findPage(Page<UserSuppMapping> page, UserSuppMapping userSuppMapping) {
		return super.findPage(page, userSuppMapping);
	}
	
	@Transactional(readOnly = false)
	public void save(UserSuppMapping userSuppMapping) {
		super.save(userSuppMapping);
	}
	
	@Transactional(readOnly = false)
	public void delete(UserSuppMapping userSuppMapping) {
		super.delete(userSuppMapping);
	}
	
}