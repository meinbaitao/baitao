/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.qualityitem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.qualityitem.dao.QualityitemDao;
import com.bt.modules.qualityitem.entity.Qualityitem;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 主项目信息Service
 * @author xjp
 * @version 2015-07-31
 */
@Service(QualityitemService.BEAN_NAME)
@Transactional(readOnly = true)
public class QualityitemService extends CrudService<QualityitemDao, Qualityitem>  implements ProcessDataHandler{
    
	public static final String BEAN_NAME = "com.bt.modules.qualityitem.service.QualityitemService";

	@Autowired
	private QualityitemDao qualityitemDao;
	
	
	public Qualityitem get(String id) {
		Qualityitem p = super.get(id);
		return p;
	}
	
	
	public Qualityitem getbyitem(Qualityitem qualityitem) {
		Qualityitem p = qualityitemDao.getbyitem(qualityitem);
		return p;
	}
	
	
	public List<Qualityitem> findList(Qualityitem qualityitem) {
		return super.findList(qualityitem);
	}
	
	public Page<Qualityitem> findPage(Page<Qualityitem> page, Qualityitem qualityitem) {
		return super.findPage(page, qualityitem);
	}
	
	@Transactional(readOnly = false)
	public void save(Qualityitem qualityitem) {
		qualityitem.setIsNewRecord(true);
		super.save(qualityitem);
	}
	
	@Transactional(readOnly = false)
	public void update(Qualityitem qualityitem) {
		super.dao.update(qualityitem);
	}
	
	@Transactional(readOnly = false)
	public void delete(Qualityitem qualityitem) {
		super.delete(qualityitem);
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				Qualityitem qualityitem = new Qualityitem();
				qualityitem.setId(array[i]);
				super.delete(qualityitem);
			}
		}
	}

	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		// TODO Auto-generated method stub
		
	}
}