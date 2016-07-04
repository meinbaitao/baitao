/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.material.dao;

import java.util.List;

import com.bt.modules.material.entity.Material;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 物料信息DAO接口
 * @author pc
 * @version 2015-08-20
 */
@MyBatisDao
public interface MaterialDao extends CrudDao<Material> {
	
	public List<Material> findListBySeriesNumber(Material material);
	
	public List<Material> findAllMaterialList();
	
	public List<Material> getTopLevelTypeMaterials();
}