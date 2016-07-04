/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.viewcontractprogress.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.project.dao.SubprojectDao;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.viewcontractprogress.entity.ViewSubprojectProgress;
import com.bt.modules.viewcontractprogress.dao.ViewSubprojectProgressDao;


/**
 * 二级项目信息Service
 * @author lky
 * @version 2015-11-30
 */


@Service
@Transactional(readOnly = true)
public class ViewSubprojectProgressService extends CrudService<ViewSubprojectProgressDao, ViewSubprojectProgress> {
	@Autowired
	private ViewSubprojectProgressDao viewSubprojectProgressDao;
	public ViewSubprojectProgress get(String id) {
		return super.get(id);
	}
	
	public List<ViewSubprojectProgress> findList(ViewSubprojectProgress viewSubprojectProgress) {
		return super.findList(viewSubprojectProgress);
	}
	
	public Page<ViewSubprojectProgress> findPage(Page<ViewSubprojectProgress> page, ViewSubprojectProgress viewSubprojectProgress) {
		return super.findPage(page, viewSubprojectProgress);
	}
	
	@Transactional(readOnly = false)
	public void save(ViewSubprojectProgress viewSubprojectProgress) {
		super.save(viewSubprojectProgress);
	}
	
	@Transactional(readOnly = false)
	public void delete(ViewSubprojectProgress viewSubprojectProgress) {
		super.delete(viewSubprojectProgress);
	}
	/**
	 * 根据一级项目ID关联Map查询二级项目信息
	 */
	public List<ViewSubprojectProgress> findByProjectIdList(String projectId) {
		ViewSubprojectProgress subProject = new ViewSubprojectProgress();
		subProject.setProjectid(projectId);
		return viewSubprojectProgressDao.findByProjectIdList(subProject);
	}
	
	
}