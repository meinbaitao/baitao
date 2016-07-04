/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.material.dao.MaterialProcDao;
import com.bt.modules.material.entity.MaterialProc;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 物料信息表Service
 * @author xiaocai
 * @version 2015-07-24
 */
@Service
@Transactional(readOnly = true)
public class MaterialProcService extends CrudService<MaterialProcDao, MaterialProc> {

	@Autowired
	private MaterialProcDao materialProcDao;
	
	/**
	 * 读取相应的列表数据
	 * @param material
	 * @return
	 */
	public List<MaterialProc> selectList(MaterialProc material){
		return materialProcDao.selectList(material);
	}
	/**
	 * 保存数据
	 */
	@Transactional(readOnly = false)
	public void save(MaterialProc material) {
		
		//检测新增时间和修改时间是否为空。位置则添加当前时间。
		if(material.getCreatedts()==null)
			material.setCreatedts(new Date());
		if(material.getUpdatedts()==null)
			material.setUpdatedts(new Date());
		super.save(material);
	}
	public MaterialProc get(String id) {
		return super.get(id);
	}
	
	public List<MaterialProc> findList(MaterialProc materialProc) {
		return super.findList(materialProc);
	}
	
	public Page<MaterialProc> findPage(Page<MaterialProc> page, MaterialProc materialProc) {
		return super.findPage(page, materialProc);
	}
	
	
	@Transactional(readOnly = false)
	public void delete(MaterialProc materialProc) {
		super.delete(materialProc);
	}
	
}