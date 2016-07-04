/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project2area.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.project2area.dao.Project2areaDao;
import com.bt.modules.project2area.entity.Project2area;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.Area;

/**
 * 主项目信息Service
 * @author xjp
 * @version 2015-07-31
 */
@Service(Project2areaService.BEAN_NAME)
@Transactional(readOnly = true)
public class Project2areaService extends CrudService<Project2areaDao, Project2area>  implements ProcessDataHandler{
    
	public static final String BEAN_NAME = "com.bt.modules.project2area.service.Project2areaService";

	@Autowired
	private Project2areaDao project2areaDao;
	
	
	public Project2area get(String id) {
		Project2area p = super.get(id);
		return p;
	}
	
	
	public Area getArea(String code) {
		Area p = project2areaDao.getArea(code);
		return p;
	}
	
	public List<Project2area> findList(Project2area project2area) {
		return super.findList(project2area);
	}
	
	public Page<Project2area> findPage(Page<Project2area> page, Project2area project2area) {
		return super.findPage(page, project2area);
	}
	
	@Transactional(readOnly = false)
	public void save(Project2area project2area) {
		project2area.setIsNewRecord(true);
		super.save(project2area);
	}
	
	@Transactional(readOnly = false)
	public void update(Project2area project2area) {
		super.dao.update(project2area);
	}
	
	@Transactional(readOnly = false)
	public void delete(Project2area project2area) {
		super.delete(project2area);
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				Project2area project2area = new Project2area();
				project2area.setId(array[i]);
				super.delete(project2area);
			}
		}
	}

	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		// TODO Auto-generated method stub
		
	}
}