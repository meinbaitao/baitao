/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.dao.LaborcontractBillDao;
import com.bt.modules.contract.dao.LaboritemsDao;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.entity.Laboritems;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 劳务合同 日志 Service
 * @author xiaocai
 * @version 2016-5-5
 */
@Service
@Transactional(readOnly = true)
public class LaborcontractBillService extends ConContainDetailService<LaborcontractBillDao,
		LaboritemsDao, Laborcontract, Laboritems> implements ProcessDataHandler {

	@Autowired
	private LaborcontractBillDao laborcontractBillDao;
	@Autowired
	private SubProjectService subProjectService;	//二级项目信息
	
	/**
	 * 插入修改数据
	 * @param laborcontract
	 */
	@Transactional(readOnly = false)
	public void insertUpdateLog(Laborcontract laborcontract) {
		laborcontract.getExtraData().put("opertType", CommonStatus.UPDATE_LOG_UPDATE);
		this.insertLog(laborcontract);
	}
	/**
	 * 插入变更记录数据数据
	 * @param laborcontract
	 */
	public void insertChangeLog(Laborcontract laborcontract) {
		laborcontract.getExtraData().put("opertType", CommonStatus.UPDATE_LOG_CHANGE);
		this.insertLog(laborcontract);
	}
	/**
	 * 插入日志
	 * @param laborcontract
	 */
	@Transactional(readOnly = false)
	public void insertLog(Laborcontract laborcontract){
		String parentId = laborcontract.getId();
		laborcontract.setId(IdGen.uuid());
		laborcontract.setParentid(parentId);
		laborcontractBillDao.insert(laborcontract);
		laborcontract.setId(parentId);
	}
	/**
	 * 查看分页数据
	 */
	public Page<Laborcontract> findPage(Page<Laborcontract> page, Laborcontract laborcontract) {
		laborcontract.setPage(page);
		List<Laborcontract> list = laborcontractBillDao.findList(laborcontract);
		for(Laborcontract l : list){
			l.getExtraData().put("buildings",subProjectService
					.getBuilDisplayNameStr(l.getProjectId(), l.getBuildings()));
			l.getExtraData().put("hurrybuildings",subProjectService
					.getBuilDisplayNameStr(l.getProjectId(), l.getHurrybuildings()));
		}
		page.setList(list);
		return page;
//		return super.findPage(page, laborcontract);
	}
	
	
	
	
	
	
	
	public Laborcontract get(String id) {
		return super.get(id);
	}
	
	public List<Laborcontract> findList(Laborcontract laborcontract) {
		return super.findList(laborcontract);
	}
	
	@Transactional(readOnly = false)
	public void save(Laborcontract laborcontract, String delId) {
		super.save(laborcontract);
	}
	
	@Transactional(readOnly = false)
	public void delete(Laborcontract laborcontract) {
		super.delete(laborcontract);
	}









	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		// TODO Auto-generated method stub
		
	}
	

}