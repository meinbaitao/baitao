/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;
import java.util.Map;

import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.SubProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.ManufContractDetail;
import com.bt.modules.contract.dao.BtgConJiaContractDetailDao;

/**
 * 甲方合同拆成楼栋Service
 * @author lky
 * @version 2015-12-21
 */
@Service
@Transactional(readOnly = true)
public class BtgConJiaContractDetailService extends CrudService<BtgConJiaContractDetailDao, BtgConJiaContractDetail> {

	@Autowired
	private SubProjectService subProjectService;

	public BtgConJiaContractDetail get(String id) {
		return super.get(id);
	}
	
	public List<BtgConJiaContractDetail> findList(BtgConJiaContractDetail btgConJiaContractDetail) {
		return super.findList(btgConJiaContractDetail);
	}
	
	public Page<BtgConJiaContractDetail> findPage(Page<BtgConJiaContractDetail> page, BtgConJiaContractDetail btgConJiaContractDetail) {
		return super.findPage(page, btgConJiaContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(BtgConJiaContractDetail btgConJiaContractDetail) {
		btgConJiaContractDetail.setIsNewRecord(true);
		super.save(btgConJiaContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(BtgConJiaContractDetail btgConJiaContractDetail) {
		super.delete(btgConJiaContractDetail);
	}
	@Transactional(readOnly = false)
	public void update(BtgConJiaContractDetail btgConJiaContractDetail) {
		btgConJiaContractDetail.setIsNewRecord(false);
		super.save(btgConJiaContractDetail);
	}
	
	
	/**
	 * 由劳务合同id获取
	 * @param laborContractId
	 * @return
	 */
	public BtgConJiaContractDetail getByLaborContractId(String laborContractId){
		return dao.getByLaborContractId(laborContractId);
	}

	/**
	 * 封装楼栋显示名
	 * @param jiaContractDetails
	 * @param projectId
	 */
	public void fulfillBuildingDisplayName(List<BtgConJiaContractDetail> jiaContractDetails, String projectId){
		Subproject subproject = new Subproject();
		subproject.setProjectId(projectId);
		Map<String, Subproject> buildingNameMapping = subProjectService.findAllBuildingNameByProject(subproject);
		for(BtgConJiaContractDetail detail : jiaContractDetails){
			String key = SubProjectService.buildCompositeKey(projectId, detail.getSubprojectId());
			detail.setBuildingDisplayName(buildingNameMapping.get(key) == null ? "" : buildingNameMapping.get(key).getBuildingDisplayName());
		}
	}

}