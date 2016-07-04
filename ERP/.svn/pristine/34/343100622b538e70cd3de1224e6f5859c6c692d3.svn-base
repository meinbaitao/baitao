/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.entity.Laborcontract;
import com.bt.modules.contract.service.LaborcontractAccountService;
import com.bt.modules.contract.service.LaborcontractService;
import com.bt.modules.finance.entity.LaborSettlement;
import com.bt.modules.finance.entity.LaborSettlementDetail;
import com.bt.modules.finance.dao.LaborSettlementDao;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.SeriesNumberUtils;

/**
 * 劳务结算Service
 * @author yhh
 * @version 2015-12-15
 */
@Service(value = LaborSettlementService.BEAN_NAME)
@Transactional(readOnly = true)
public class LaborSettlementService extends CrudService<LaborSettlementDao, LaborSettlement> implements ProcessDataHandler {

	public static final String BEAN_NAME = "com.bt.modules.finance.service.LaborSettlementService";
	
	@Autowired
	private LaborSettlementDao dao;
	
	@Autowired
	private LaborSettlementDetailService detailService;
	
	@Autowired
	private LaborcontractService contractService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private LaborcontractAccountService accountService;
	
	public LaborSettlement get(String id) {
		LaborSettlement base = dao.get(id);
		LaborSettlementDetail detail = new LaborSettlementDetail();
		detail.setSettlementId(id);
		List<LaborSettlementDetail> detailList = detailService.findList(detail);
		if(detailList.size()>0){
			base.setDetailList(detailList);
		}
		return base;
	}
	
	public List<LaborSettlement> findList(LaborSettlement laborSettlement) {
		return super.findList(laborSettlement);
	}
	
	public Page<LaborSettlement> findPage(Page<LaborSettlement> page, LaborSettlement laborSettlement) {
		return super.findPage(page, laborSettlement);
	}
	
	@Transactional(readOnly = false)
	public void save(LaborSettlement base) {
		//判断对象是否已存在
		if(isExist(base.getId())){
			base.setIsNewRecord(false);
//			String seriesnumber = createSeriesnumber(base);
//			base.setContractNo(seriesnumber);
			super.save(base);
		}else{
			base.setIsNewRecord(true);
			String seriesnumber = createSeriesnumber(base);
			base.setSeriesnumber(seriesnumber);
			base.setCreateBy(UserUtils.getUser());
			super.save(base);
		}
		
		//添加明细
		List<LaborSettlementDetail> list = base.getDetailList();
		if(null != list){
			for(LaborSettlementDetail detail:list){
				if(null != detail){
					if(isExistDetail(detail.getId())){
						detail.setSettlementId(base.getId());
						detail.setIsNewRecord(false);
						detailService.save(detail);
					}
					if(!isExistDetail(detail.getId())){
						detail.setId(IdGen.uuid());
						detail.setSettlementId(base.getId());
						detail.setIsNewRecord(true);
						detailService.save(detail);
					}
				}
				
			}
		}
		
		//更新劳务台账信息
		accountService.updateFromLaborSettlement(base);
	}
	
	@Transactional(readOnly = false)
	public void update(LaborSettlement laborSettlement){
		dao.update(laborSettlement);
	}
	
	@Transactional(readOnly = false)
	public void delete(LaborSettlement laborSettlement) {
		super.delete(laborSettlement);
	}
	
	
	/**
	 * 判断表头是否存在
	 * @param id
	 * @return
	 */
	public boolean isExist(String id){
		LaborSettlement entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = get(id);
		}
		if(entity == null){
			return false;
		}
		return true;
	}
	
	/**
	 * 判断明细是否存在
	 * @param id
	 * @return
	 */
	public boolean isExistDetail(String id){
		LaborSettlementDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = detailService.get(id);
		}
		if(entity == null){
			return false;
		}
		return true;
	}
	
	
	/**
	 * 生成合同编号
	 * @param entity
	 * @return
	 */
	public String createSeriesnumber(LaborSettlement entity){
		String contractId = entity.getLaborContract().getId();
		Laborcontract contract = contractService.get(contractId);
		String scope = contract.getContractscopeadjust();
		String projectId = contract.getProjectId();
		String projectCode ="";
		if(StringUtils.isNotBlank(projectId)){
			projectCode = projectService.get(projectId).getCode();
		}
		
		String prefix = "JS-";
		if(StringUtils.isNotBlank(scope)){
			prefix = prefix + scope + "-";
		}
		if(StringUtils.isNotBlank(projectCode)){
			prefix = prefix + projectCode + "-";
		}
		
		String date = DateUtils.getDate("yyyyMMdd");
		int count = dao.getTodayCount(date);
		String number = SeriesNumberUtils.createSeriesNumber(prefix,date, count);
		return number;
	}
	
	/**
	 * 查询可选项目
	 * @param aboutUser
	 * @return
	 */
	public List<LaborSettlement> findProject(User aboutUser){
		return dao.findProject(aboutUser);
	}
	
	/**
	 * 查询我创建的
	 * @param page
	 * @param laborSettlement
	 * @return
	 */
	public Page<LaborSettlement> findMylaborSettlement(Page<LaborSettlement> page, LaborSettlement laborSettlement) {
		laborSettlement.setPage(page);
		laborSettlement.setCreateBy(UserUtils.getUser());
		laborSettlement.setWorkflowstatus(CommonStatus.WORK_FLOW_INIT);
		List<LaborSettlement> list = dao.findList(laborSettlement);
		page.setList(list);
		return page;
	}
	/**
	 * 查看待我审批的列表数据
	 * @param page
	 * @param laborSettlement
	 * @return
	 */
	public Page<LaborSettlement> findUnAuditLaborSettlement(Page<LaborSettlement> page, LaborSettlement laborSettlement) {
		laborSettlement.setPage(page);
		laborSettlement.getExtraData().put("wfInit", CommonStatus.WORK_FLOW_INIT);
		laborSettlement.getExtraData().put("wfEnd", CommonStatus.WORK_FLOW_END);
		page.setList(dao.findUnAuditLaborSettlement(laborSettlement));
		return page;
	}
	/**
	 * 查看已完成
	 * @param page
	 * @param laborSettlement
	 * @return
	 */
	public Page<LaborSettlement> findAuditDoneLaborSettlement(Page<LaborSettlement> page, LaborSettlement laborSettlement) {
		laborSettlement.setPage(page);
//		page.setList(laborcontractDao.findAuditDoneLaborcontract(laborcontract));
		laborSettlement.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		page.setList(dao.findList(laborSettlement));
		return page;
	}

	@Override
	public void processFinishedNotify(Map<String, Object> variables) {
		// TODO Auto-generated method stub
		String primaryKey = (String)variables.get(ActivitiConstants.PRIMARY_KEY);
		LaborSettlement laborSettlement = this.get(primaryKey);
		laborSettlement.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		dao.update(laborSettlement);
	}	
}