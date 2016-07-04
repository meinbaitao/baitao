/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.houseType.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.houseType.dao.HouseTypeDao;
import com.bt.modules.houseType.entity.HouseType;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 户型库管理Service
 * @author xiaocai
 * @version 2016-04-29
 */
@Service
@Transactional(readOnly = true)
public class HouseTypeService extends CrudService<HouseTypeDao, HouseType> {

	@Autowired
	private HouseTypeDao houseTypeDao;
	
	public HouseType get(String id) {
		return super.get(id);
	}
	
	public List<HouseType> findList(HouseType houseType) {
		return super.findList(houseType);
	}
	
	public Page<HouseType> findPage(Page<HouseType> page, HouseType houseType) {
		return super.findPage(page, houseType);
	}
	/**
	 * 验证保存新的户型库数据
	 * @param houseType
	 * @throws BusinessException
	 */
	@Transactional(readOnly = false)
	public void saveHouseType(HouseType houseType) throws BusinessException {
		if (houseType.getIsNewRecord()){
			HouseType vHouseType = this.getOneByHouseType(houseType);
			if(!vHouseType.getIsNewRecord()){
				throw new BusinessException("house.type.duplicate",houseType.getHouseType());
			}
			houseType.preInsert();
			houseTypeDao.insert(houseType);
		}else{
			houseType.preUpdate();
			houseTypeDao.update(houseType);
		}
	}
	/**
	 * 根据户型查询对应的数据
	 * @param houseType
	 * @return
	 */
	public HouseType getOneByHouseType(HouseType houseType){
		if(StringUtils.isBlank(houseType.getHouseType())){
			return new HouseType();
		}
		return this.getOne(houseType);
	}
	/**
	 * 获取单个对象
	 * @param houseType
	 * @return
	 */
	public HouseType getOne(HouseType houseType){
		HouseType vHouseType = houseTypeDao.getOne(houseType);
		if(vHouseType==null){
			return new HouseType();
		}
		return vHouseType;
	}
	
	@Transactional(readOnly = false)
	public void delete(HouseType houseType) {
		super.delete(houseType);
	}
	
}