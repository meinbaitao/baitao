/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.entity.AccCarriageContractBase;
import com.bt.modules.contract.entity.AccCarriageContractDetail;
import com.bt.modules.contract.dao.AccCarriageContractBaseDao;
import com.bt.modules.contract.dao.AccCarriageContractDetailDao;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 辅料运输合同Service
 * @author yhh
 * @version 2015-08-11
 */
@Service(AccCarriageContractBaseService.BEAN_NAME)
@Transactional(readOnly = true)
public class AccCarriageContractBaseService extends ConContainDetailService< AccCarriageContractBaseDao,
 AccCarriageContractDetailDao,  AccCarriageContractBase,  AccCarriageContractDetail> implements ProcessDataHandler{

	public static final String BEAN_NAME = "com.bt.modules.contract.service.AccCarriageContractBaseService";

	@Autowired
	private AccCarriageContractBaseDao accCarriageContractBaseDao;
	/**
	 *  流程结束回调函数
	 * @param variables
	 */
	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String contractId = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		AccCarriageContractBase jc = get(contractId);
		jc.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		save(jc);
		
	}
	
	public Page<AccCarriageContractBase> findMyAccCarriageContractBase(Page<AccCarriageContractBase> page, AccCarriageContractBase accCarriageContractBase) {
		accCarriageContractBase.setPage(page);
		page.setList(accCarriageContractBaseDao.findMyAccCarriageContractBase(accCarriageContractBase));
		return page;
	}
	public Page<AccCarriageContractBase> findUnAuditAccCarriageContractBase(Page<AccCarriageContractBase> page, AccCarriageContractBase accCarriageContractBase) {
		accCarriageContractBase.setPage(page);
		page.setList(accCarriageContractBaseDao.findUnAuditAccCarriageContractBase(accCarriageContractBase));
		return page;
	}
	public Page<AccCarriageContractBase> findAuditDoneAccCarriageContractBase(Page<AccCarriageContractBase> page, AccCarriageContractBase accCarriageContractBase) {
		accCarriageContractBase.setPage(page);
		page.setList(accCarriageContractBaseDao.findAuditDoneAccCarriageContractBase(accCarriageContractBase));
		return page;
	}
	
	
}