/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.material.entity.Material;
import com.bt.modules.material.dao.MaterialDao;

/**
 * 物料信息Service
 * @author pc
 * @version 2015-08-20
 */
@Service
@Transactional(readOnly = true)
public class MaterialService extends CrudService<MaterialDao, Material> {

	
	@Autowired
	private MaterialDao materialDao;
	
	/**
	 * 插入数据
	 * @param supp
	 */
	@Transactional(readOnly = false)
	public void insert(Material ma){
		materialDao.insert(ma);
	}
	public Material get(String id) {
		return super.get(id);
	}
	
	public List<Material> findList(Material material) {
		return super.findList(material);
	}
	
	public List<Material> findAllMaterialList(){
		return materialDao.findAllMaterialList();
	}
	
	public List<Material> getTopLevelTypeMaterials(){
		return materialDao.getTopLevelTypeMaterials();
	}
	
	public Page<Material> findPage(Page<Material> page, Material material) {
		return super.findPage(page, material);
	}
	
	@Transactional(readOnly = false)
	public void save(Material material) {
		super.save(material);
	}
	
	@Transactional(readOnly = false)
	public void delete(Material material) {
		super.delete(material);
	}
	
	public Material getBySeriesNumber(Material material){
		if(materialDao.findListBySeriesNumber(material) != null && materialDao.findListBySeriesNumber(material).size() > 0){
			return materialDao.findListBySeriesNumber(material).get(0);
		}else{
			return new Material();
		}
	}
	/**
	 * 根据物料编号查询
	 * @param material
	 * @return
	 */
	public List<Material> findListBySeriesNumber(Material material){
		return materialDao.findListBySeriesNumber(material);
	}
}