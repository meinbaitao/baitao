package com.bt.modules.material.service;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.material.dao.SettlementMaterialDao;
import com.bt.modules.material.entity.SettlementMaterial;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 可配置加工项物料信息Service
 * 
 * @author zjs
 * @version 2016-05-06
 */
@Service
@Transactional(readOnly = true)
public class SettlementMaterialService extends
		CrudService<SettlementMaterialDao, SettlementMaterial> {
	@Autowired
	private SettlementMaterialDao settlementMaterialDao;
	
	public SettlementMaterial get(String id) {
		SettlementMaterial p = super.get(id);
		return p;
	}
		
	public List<SettlementMaterial> findList(SettlementMaterial settlementMaterial) {
		return super.findList(settlementMaterial);
	}
	
	public Page<SettlementMaterial> findPage(Page<SettlementMaterial> page, SettlementMaterial settlementMaterial) {
		return super.findPage(page, settlementMaterial);
	}
	
	@Transactional(readOnly = false)
	public void save(SettlementMaterial settlementMaterial) {
		settlementMaterial.setIsNewRecord(true);
		super.save(settlementMaterial);
	}
	
	@Transactional(readOnly = false)
	public void update(SettlementMaterial settlementMaterial) {
		super.dao.update(settlementMaterial);
	}
	
	@Transactional(readOnly = false)
	public void delete(SettlementMaterial settlementMaterial) {
		super.delete(settlementMaterial);
	}
	
	/**
	 * 查询加工类别
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<String> selectSettlementType(){
		return settlementMaterialDao.selectSettlementType();
	}
	
	/**
	 * 根据物料编号查询对应的数据
	 * @param settlementMaterial
	 * @return
	 */
	public boolean getOneByMaterialNo(SettlementMaterial settlementMaterial){
		if(StringUtils.isBlank(settlementMaterial.getMaterialNo())){
			return false;
		}
		List<SettlementMaterial> settlementMaterial2 = settlementMaterialDao.getOne(settlementMaterial);
		if(settlementMaterial2!=null&&settlementMaterial2.size()>0){
			return false;
		}
		return true;
	}
}
