/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.entity.StoneCarriageContractBase;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.dao.StoneCarriageContractBaseDao;
import com.bt.modules.contract.dao.StoneCarriageContractDetailDao;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * stonecarry1Service
 * @author yhh
 * @version 2015-08-11
 */
@Service(StoneCarriageContractBaseService.BEAN_NAME)
@Transactional(readOnly = true)
public class StoneCarriageContractBaseService extends ConContainDetailService<StoneCarriageContractBaseDao,
		StoneCarriageContractDetailDao, StoneCarriageContractBase, StoneCarriageContractDetail> implements ProcessDataHandler{

	public static final String BEAN_NAME = "com.bt.modules.contract.service.StoneCarriageContractBaseService";
	
	@Autowired
	private StoneCarriageContractBaseDao stoneCarriageContractBaseDao;
	
	/**
	 * 对乙方名称进行分组
	 * @return
	 */
	public List<StoneCarriageContractBase> groupByPBName(){
		StoneCarriageContractBase sccb = new StoneCarriageContractBase();
//		sccb.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		return dao.groupByPBName(sccb);
	}
	
	/**
	 * 根据物流名称读取相应的合同数据列表
	 * @param pbName
	 * @return
	 */
	public List<StoneCarriageContractBase> getByPBName(String pbName){
		Supplier supp = new Supplier();
		supp.setName(pbName);
		StoneCarriageContractBase sccb = new StoneCarriageContractBase();
		sccb.setSupp(supp);
//		sccb.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		List<StoneCarriageContractBase> list = dao.getByPBName(sccb);
		if(list==null){
			list = new ArrayList<StoneCarriageContractBase>();
		}
		return list;
	}
	
	/**
	 *  流程结束回调函数
	 * @param variables
	 */
	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String contractId = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		StoneCarriageContractBase jc = get(contractId);
		jc.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		save(jc);
		
	}
	
	/**
	 * 获取合同中有效的供应商列表
	 * @return
	 */
	public List<Map<String, Object>> findSuppliersInContract(){
		return dao.findSuppliersInContract();
	}
	
	/**
	 * 由供应商名获取付款信息
	 * @return
	 */
	public Map<String, Object> getSupplierByName(String supplierName){
		return dao.getSupplierByName(supplierName);
	}
	
	public Page<StoneCarriageContractBase> findMyStoneCarriageContractBase(Page<StoneCarriageContractBase> page, StoneCarriageContractBase stoneCarriageContractBase) {
		stoneCarriageContractBase.setPage(page);
		page.setList(stoneCarriageContractBaseDao.findMyStoneCarriageContractBase(stoneCarriageContractBase));
		return page;
	}
	public Page<StoneCarriageContractBase> findUnAuditStoneCarriageContractBase(Page<StoneCarriageContractBase> page, StoneCarriageContractBase stoneCarriageContractBase) {
		stoneCarriageContractBase.setPage(page);
		page.setList(stoneCarriageContractBaseDao.findUnAuditStoneCarriageContractBase(stoneCarriageContractBase));
		return page;
	}
	public Page<StoneCarriageContractBase> findAuditDoneStoneCarriageContractBase(Page<StoneCarriageContractBase> page, StoneCarriageContractBase stoneCarriageContractBase) {
		stoneCarriageContractBase.setPage(page);
		page.setList(stoneCarriageContractBaseDao.findAuditDoneStoneCarriageContractBase(stoneCarriageContractBase));
		return page;
	}
	
	
}