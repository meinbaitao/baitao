/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 机构Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

	public List<Office> findAll(){
		List<Office> list = UserUtils.findAllOffice();
		return list;
	}

	public List<Office> findByType(){
		List<Office> list = UserUtils.getOfficeList();
		List<Office> find = new ArrayList<Office>();
		for (Office o : list) {
			if("2".equals(o.getType())){
				find.add(o);
			}
		}
		return find;
	}
		
	public List<Office> findAllOffice(){
		List<Office> list = UserUtils.getOfficeList();
		List<Office> listVo = new ArrayList<Office>();
		
		for (Office o : list) {
			Office renwu = new Office();
			renwu.setName(CommonConstant.TASK);
			renwu.setParent(o);
			renwu.setGrade(CommonStatus.TASK_STATUS);
			
			Office zhibiao = new Office();
			zhibiao.setName(CommonConstant.QUOTA);
			zhibiao.setParent(o);
			zhibiao.setGrade(CommonStatus.QUOTA_STATUS);
			
			if(StringUtils.isEmpty(o.getTaskType())){
				o.setGrade(CommonStatus.TASK_STATUS);
			}
			
			listVo.add(o);
			listVo.add(renwu);
			listVo.add(zhibiao);
		}
		return listVo;
	}
	
	public List<Office> adminFindAllOffice(){
		List<Office> list = findAll();
		List<Office> listVo = new ArrayList<Office>();
		
		for (Office o : list) {
			Office renwu = new Office();
			renwu.setName(CommonConstant.TASK);
			renwu.setParent(o);
			renwu.setGrade(CommonStatus.TASK_STATUS);
			
			Office zhibiao = new Office();
			zhibiao.setName(CommonConstant.QUOTA);
			zhibiao.setParent(o);
			zhibiao.setGrade(CommonStatus.QUOTA_STATUS);
			
			if(StringUtils.isEmpty(o.getTaskType())){
				o.setGrade(CommonStatus.TASK_STATUS);
			}
			
			listVo.add(o);
			listVo.add(renwu);
			listVo.add(zhibiao);
		}
		return listVo;
	}
	
	
	public List<Office> findList(Boolean isAll){
		if (isAll != null && isAll){
			return UserUtils.getOfficeAllList();
		}else{
			return UserUtils.getOfficeList();
		}
	}
	
	@Transactional(readOnly = true)
	public List<Office> findList(Office office){
		office.setParentIds(office.getParentIds()+"%");
		return dao.findByParentIdsLike(office);
	}
	
	@Transactional(readOnly = false)
	public void save(Office office) {
		super.save(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
	@Transactional(readOnly = false)
	public void delete(Office office) {
		super.delete(office);
		UserUtils.removeCache(UserUtils.CACHE_OFFICE_LIST);
	}
	
}
