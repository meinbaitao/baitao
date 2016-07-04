package com.bt.modules.contract.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.entity.BtgConJiaContractDetail;
import com.bt.modules.contract.entity.JiaContract;
import com.bt.modules.contract.dao.BtgConJiaContractDetailDao;
import com.bt.modules.contract.dao.JiaContractDao;
import com.bt.modules.utils.CommonStatus;

/**
 * Service
 * @author yhh
 * @version 2015-08-01
 */
@Service(JiaContractService.BEAN_NAME)
@Transactional(readOnly = true)
public class JiaContractService extends CrudService<JiaContractDao, JiaContract> implements ProcessDataHandler {
	
	public static final String BEAN_NAME = "com.bt.modules.contract.service.JiaContractService";
	
	@Autowired
	private JiaContractDao jiaContractDao;
	
	@Autowired
	private BtgConJiaContractDetailDao detailDao;
	
//	@Autowired
//	private LaborcontractAccountService accountService;
	
	/**
	 * 判断合同记录是否存在
	 * @param id
	 * @return
	 */
	public boolean isExist(String id){
		JiaContract entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = get(id);
		}
		if(entity == null){
			return false;
		}
		return true;
		
	}
	/**
	 * 判断价格记录是否存在
	 * @param id
	 * @return
	 */
	public boolean isExistDetail(String id){
		BtgConJiaContractDetail entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = detailDao.get(id);
		}
		if(entity == null){
			return false;
		}
		return true;
		
	}
	
	/**
	 * 批量删除价格明细
	 * @param ids
	 */
	@Transactional(readOnly = false)
	public void batchDeleteDetails(String ids){
		if(StringUtils.isNotEmpty(ids)){
			String[] array =ids.split(",");
			if(array !=null && array.length>0){
				for(int i=0;i<array.length;i++){
					String id = array[i];
					detailDao.delete(id);
				}
			}
		}
	}
	
	public List<JiaContract> findList(JiaContract jiaContract) {
		return super.findList(jiaContract);
	}
	
	public Page<JiaContract> findPage(Page<JiaContract> page, JiaContract jiaContract) {
		return super.findPage(page, jiaContract);
	}
	
	@Transactional(readOnly = false)
	public void save(JiaContract jiaContract, String delId) {
		//判断对象是否已存在
		if(isExist(jiaContract.getId())){
			jiaContract.setIsNewRecord(false);
			super.save(jiaContract);
		}else{
			jiaContract.setIsNewRecord(true);
			super.save(jiaContract);
		}
		//添加明细
		List<BtgConJiaContractDetail> list = jiaContract.getDetailList();
		if(list != null && list.size() > 0){
			for(BtgConJiaContractDetail detail:list){
				if(null != detail){
					if(isExistDetail(detail.getId())){
						detail.setContractId(jiaContract.getId());
					}
					if(!isExistDetail(detail.getId())){
						detail.setId(IdGen.uuid());
						detail.setContractId(jiaContract.getId());
					}
					saveDetail(detail);
				}
				
			}
		}
		
		//保存编辑时删除的行
		batchDeleteDetails(delId);
		
//		//更新劳务台账
//		LaborContract laborContract = accountService.getJiaContractByLaborContract(laborContract);
//		accountService.updateFromJiaContract(laborContract, finishDate);
	}
	
	@Transactional(readOnly = false)
	public void saveDetail(BtgConJiaContractDetail jiaContractDetail){
		if(isExistDetail(jiaContractDetail.getId())){
			detailDao.update(jiaContractDetail);
		}else{
			detailDao.insert(jiaContractDetail);
		}
		
//		//更新劳务台账
//		accountService.updateFromJiaContract(jiaContractDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(JiaContract jiaContract) {
		super.delete(jiaContract);
	}
	
	@Transactional(readOnly = false)
	public JiaContract get(JiaContract jiaContract){
		return super.get(jiaContract);
	}
	
	/**
	 * 由合同编号获取合同
	 * @param cid
	 * @return
	 */
	public JiaContract getByContractId(JiaContract jiaContract){
		//JiaContract jc = new JiaContract();
		//jc.setCid(cid);
		return jiaContractDao.getByContractId(jiaContract);
	}

	/**
	 *  流程结束回调函数
	 * @param variables
	 */
	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String contractId = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		JiaContract jc = get(contractId);
		jc.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		jc.setIsNewRecord(false);
		save(jc);
	}

	public String getContractNOByProjectIdAndBuildNO(String buildNo, String projectId){
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("delFlag", JiaContract.DEL_FLAG_NORMAL);
		paramMap.put("buildNo", buildNo);
		paramMap.put("projectId", projectId);
		return jiaContractDao.getContractNOByProjectIdAndBuildNO(paramMap);
	}

	public Double getAmountMoneyOfProject(String projectId){
		JiaContract contract = new JiaContract();
		contract.setProjectId(projectId);
		return jiaContractDao.getAmountMoneyOfProject(contract);
	}

	
	/**
	 * 流程数据
	 * @param page
	 * @param jiaContract
	 * @return
	 */
	public Page<JiaContract> findMyJiaContract(Page<JiaContract> page, JiaContract jiaContract) {
		jiaContract.setPage(page);
		page.setList(jiaContractDao.findMyJiaContract(jiaContract));
		return page;
	}
	public Page<JiaContract> findUnAuditJiaContract(Page<JiaContract> page, JiaContract jiaContract) {
		jiaContract.setPage(page);
		page.setList(jiaContractDao.findUnAuditJiaContract(jiaContract));
		return page;
	}
	public Page<JiaContract> findAuditDoneJiaContract(Page<JiaContract> page, JiaContract jiaContract) {
		jiaContract.setPage(page);
		page.setList(jiaContractDao.findAuditDoneJiaContract(jiaContract));
		return page;
	}
}