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
import com.bt.modules.contract.entity.OtherContractDetail;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.contract.entity.PurchasingContractDetail;
import com.bt.modules.contract.dao.OtherContractDetailDao;
import com.bt.modules.contract.dao.PurchasingContractBaseDao;
import com.bt.modules.contract.dao.PurchasingContractDetailDao;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * purchasingService
 * @author yhh
 * @version 2015-08-11
 */
@Service(PurchasingContractBaseService.BEAN_NAME)
@Transactional(readOnly = true)
public class PurchasingContractBaseService extends ConContainDetailService<PurchasingContractBaseDao,
		PurchasingContractDetailDao, PurchasingContractBase, PurchasingContractDetail> implements ProcessDataHandler{

	public static final String BEAN_NAME = "com.bt.modules.contract.service.PurchasingContractBaseService";
	
	@Autowired
	private PurchasingContractBaseDao purchasingContractBaseDao;
	@Autowired
	private OtherContractDetailDao otherContractDetailDao;
	
	@Transactional(readOnly = false)
	public void save(PurchasingContractBase purchasingContractBase) {
		super.save(purchasingContractBase);
		
		//添加明细
		List<OtherContractDetail> list = purchasingContractBase.getDetailListX();
		if(null != list){
			for(OtherContractDetail detail:list){
				if(StringUtils.isNotBlank(detail.getId())){
					detail.setContractId(purchasingContractBase.getId());
					otherContractDetailDao.update(detail);
				}
				if(!StringUtils.isNotBlank(detail.getId())){
					detail.setId(IdGen.uuid());
					detail.setContractId(purchasingContractBase.getId());
					otherContractDetailDao.insert(detail);
				}
				
			}
		}
		
		//保存编辑时删除的行
		batchDeleteDetailsX(purchasingContractBase.getDelIdsX());
	}
	
	/**
	 * 批量删除明细
	 * @param ids
	 */
	@Transactional(readOnly = false)
	public void batchDeleteDetailsX(String ids){
		if(StringUtils.isNotEmpty(ids)){
			String[] array =ids.split(",");
			if(array !=null && array.length>0){
				for(int i=0;i<array.length;i++){
					String id = array[i];
					otherContractDetailDao.delete(id);
				}
			}
		}
	}
	
	/**
	 *  流程结束回调函数
	 * @param variables
	 */
	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String contractId = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		PurchasingContractBase jc = get(contractId);
		jc.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		save(jc);
		
	}
	
	
	/**===================================================================*/
	
	/**
	 * start 2015年11月10日
	 * xiaocai
	 */
	/**
	 * 对名字进行分组	get list group by name
	 * @param pcb
	 * @return
	 */
	public List<PurchasingContractBase> getListGBName(){
		PurchasingContractBase pcb = new PurchasingContractBase();
//		pcb.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		List<PurchasingContractBase> listPCB = purchasingContractBaseDao.getListGBName(pcb);
		if(listPCB==null){
			listPCB = new ArrayList<PurchasingContractBase>();
		}
		return listPCB;
	}
	
	/**
	 * 根据条件获取对应生效中的合同
	 * @return
	 */
	public List<PurchasingContractBase> getValidListByCondition(PurchasingContractBase pcb){
//		pcb.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
//		有效时间
		pcb.setStartTime(DateUtils.getDate());
		pcb.setEndTime(DateUtils.getDate());
		List<PurchasingContractBase> listPCB = this.getListByCondition(pcb);
		return listPCB;
	}
	/**
	 * 根据供应商获取相应数据
	 * @param pcb
	 * @return
	 */
	public PurchasingContractBase getOneBySupp(PurchasingContractBase pcb){
		List<PurchasingContractBase> listPCB = this.getListByCondition(pcb);
		if(listPCB.size()>0){
			return listPCB.get(0);
		}
		return new PurchasingContractBase();
	}
	/**
	 * 根据条件获取相应合同列表数据
	 * @param pcb
	 * @return
	 */
	public List<PurchasingContractBase> getListByCondition(PurchasingContractBase pcb){
		List<PurchasingContractBase> listPCB = purchasingContractBaseDao.getListByCondition(pcb);
		if(listPCB==null){
			listPCB = new ArrayList<PurchasingContractBase>();
		}
		return listPCB;
	}
	/**
	 * end 2015年11月10日
	 */
	
	public Page<PurchasingContractBase> findMyPurchasingContractBase(Page<PurchasingContractBase> page, PurchasingContractBase purchasingContractBase) {
		purchasingContractBase.setPage(page);
		page.setList(purchasingContractBaseDao.findMyPurchasingContractBase(purchasingContractBase));
		return page;
	}
	public Page<PurchasingContractBase> findUnAuditPurchasingContractBase(Page<PurchasingContractBase> page, PurchasingContractBase purchasingContractBase) {
		purchasingContractBase.setPage(page);
		page.setList(purchasingContractBaseDao.findUnAuditPurchasingContractBase(purchasingContractBase));
		return page;
	}
	public Page<PurchasingContractBase> findAuditDonePurchasingContractBase(Page<PurchasingContractBase> page, PurchasingContractBase purchasingContractBase) {
		purchasingContractBase.setPage(page);
		page.setList(purchasingContractBaseDao.findAuditDonePurchasingContractBase(purchasingContractBase));
		return page;
	}
	
}