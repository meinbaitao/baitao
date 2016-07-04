/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.project.entity.Problem;
import com.bt.modules.project.dao.ProblemDao;

/**
 * 项目问题明细Service
 * @author xjp
 * @version 2015-09-14
 */
@Service
@Transactional(readOnly = true)
public class ProblemService extends CrudService<ProblemDao, Problem> {

	public Problem get(String id) {
		return super.get(id);
	}
	
	public List<Problem> findList(Problem problem) {
		return super.findList(problem);
	}
	
	public Page<Problem> findPage(Page<Problem> page, Problem problem) {
		return super.findPage(page, problem);
	}
	
	@Transactional(readOnly = false)
	public void save(Problem problem) {
		super.save(problem);
	}
	
	@Transactional(readOnly = false)
	public void delete(Problem problem) {
		super.delete(problem);
	}
	
}