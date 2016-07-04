/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.finance.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.contract.dao.StoneCarriageContractDetailDao;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.finance.entity.TransportationSettlement;
import com.bt.modules.finance.entity.TransportationSettlementDetail;
import com.bt.modules.logistics.dao.LogisticsSendDao;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.MathUtil;
import com.bt.modules.finance.dao.TransportationSettlementDao;

/**
 * 运费结算Service
 * @author yhh
 * @version 2015-09-28
 */
@Service(TransportationSettlementService.BEAN_NAME)
@Transactional(readOnly = true)
public class TransportationSettlementService extends CrudService<TransportationSettlementDao,
		TransportationSettlement> implements ProcessDataHandler{
	
	public static final String BEAN_NAME = "com.bt.modules.finance.service.TransportationSettlementService";
	
	@Autowired
	private TransportationSettlementDao transportationSettlementDao;
	
	@Autowired
	private StoneCarriageContractDetailDao stoneCarriageContractDetailDao;
	
	@Autowired
	private LogisticsSendDao logisticSendDao;

	public TransportationSettlement get(String id) {
		return super.get(id);
	}
	
	public List<TransportationSettlement> findList(TransportationSettlement transportationSettlement) {
		return super.findList(transportationSettlement);
	}
	
	public Page<TransportationSettlement> findPage(Page<TransportationSettlement> page, TransportationSettlement transportationSettlement) {
		return super.findPage(page, transportationSettlement);
	}
	
	@Transactional(readOnly = false)
	public void save(TransportationSettlement transportationSettlement) {
		super.save(transportationSettlement);
	}
	
	@Transactional(readOnly = false)
	public void delete(TransportationSettlement transportationSettlement) {
		super.delete(transportationSettlement);
	}
	
	
	/**
	 * 由发货通知单id获取结算单(未匹配合同价)
	 * @param logisticSend
	 * @return TransportationSettlement
	 */
	public TransportationSettlement createSettlement(String logisticSendId){
		return transportationSettlementDao.getSettlementByLogisticSendId(logisticSendId);
	}
	
	/**
	 * 由发货通知单号获取结算明细 
	 * @param logisticSend
	 * @return List<TransportationSettlementDetail>
	 */
	public List<TransportationSettlementDetail> createSettlementDetail(String logisticSendId){
		return transportationSettlementDao.findSettlementDetailByLogisticSendId(logisticSendId);
	}
	
//	/**
//	 * 由结算单id获取结算明细列表
//	 * @param transportationSettlement
//	 * @return List<TransportationSettlementDetail>
//	 */
//	public List<TransportationSettlementDetail> findDetailList(TransportationSettlement transportationSettlement){
//		TransportationSettlementDetail entity = new TransportationSettlementDetail();
//		entity.setFatherId(transportationSettlement.getId());
//		return transportationSettlementDetailDao.findList(entity);
//	}
	/**
	 * 生成结算单[带合同价(整车,零担,轻货),带卸货次数]
	 * @param logisticSendId
	 * @return TransportationSettlement
	 */
	public TransportationSettlement createSettlementWithPrice(String logisticSendId){
		//判断是否已结算
		TransportationSettlement transSettlement = new TransportationSettlement();
		transSettlement.setLogisticSend(logisticSendId);
		List<TransportationSettlement> testList = findList(transSettlement);
		if(testList.size()>0){
			return null;
		}
		
		//拼接收货地址,收货人
//		String receiver = "";
//		String receivePlace = "";
		List<String> receiver = new ArrayList<String>();
		List<String> receivePlace = new ArrayList<String>();
		
		//获取结算单,结算明细
		TransportationSettlement settlement = createSettlement(logisticSendId);
		List<TransportationSettlementDetail> detailList = createSettlementDetail(logisticSendId);
		
		for(TransportationSettlementDetail detail: detailList){
			//拼接收货地址,收货人
			if(StringUtils.isNotBlank(detail.getReceiverName())){
//				if(StringUtils.isNotBlank(receiver)){
//					receiver = receiver + "," + detail.getReceiverName();
//				}else{
//					receiver = detail.getReceiverName();
//				}
				if(!receiver.contains(detail.getReceiverName())){	
					receiver.add(detail.getReceiverName());
				}
			}
			if(StringUtils.isNotBlank(detail.getProjectAddress())){
//				if(StringUtils.isNotBlank(receivePlace)){
//					receivePlace = receivePlace + "," + detail.getProjectAddress();
//				}else{
//					receivePlace = detail.getProjectAddress();
//				}
				if(!receivePlace.contains(detail.getProjectAddress())){
					receivePlace.add(detail.getProjectAddress());
				}
			}
			
		}
		
		//确定合同价,保存到结算单
//		settlement.setReceiver(receiver);
//		settlement.setReceivePlace(receivePlace);
		settlement.setReceiver(CommonUtils.listToString(receiver));
		settlement.setReceivePlace(CommonUtils.listToString(receivePlace));
		
		//卸货次数
//		int unloadTime = detailList.size() - 1;
		//卸货次数=收货地址-1
		int unloadTime = receivePlace.size() - 1;
		if(unloadTime<0){
			unloadTime = 0;
		}
		settlement.setUnloadTimes(unloadTime);
		
		return settlement;
	}
	
	/**
	 * 匹配价格
	 * @param settlement
	 * @return
	 */
	public TransportationSettlement matchContractPrice(TransportationSettlement settlement){
		
		//合同价
		String fullCarPrice = "0";
		String splitPrice = "0";
		String lightPrice = "0";
		
		//获取结算单,结算明细
		String logisticSendId = settlement.getLogisticSend();
		List<TransportationSettlementDetail> detailList = createSettlementDetail(logisticSendId);
		
		//获取关联合同明细
		String carriageContractId = settlement.getSupplier(); 
		StoneCarriageContractDetail entity = new StoneCarriageContractDetail();
		entity.setContractId(carriageContractId);
		List<StoneCarriageContractDetail> contractPriceList = stoneCarriageContractDetailDao.findList(entity);
		
		//遍历所有关联下料单,匹配合同价
		String startArea = settlement.getStartArea();
		for(TransportationSettlementDetail detail: detailList){
			//收货项目省市
//			String projectProvince = detail.getProjectProvince();
//			String projectCity = detail.getProjectCity();
			String projectProvince = detail.getProvinceName();
			String projectCity = detail.getCityName();
			for(StoneCarriageContractDetail contractPrice: contractPriceList){
				String conStartArea = contractPrice.getStartAddr();
				String conProvince = contractPrice.getProvince();
				String conCity = contractPrice.getCity();
				if(startArea.contains(conStartArea) && projectProvince.contains(conProvince)
						&& projectCity.contains(conCity)){
//				if(conStartArea.equals(startArea) && conProvince.equals(projectProvince) 
//						&& conCity.equals(projectCity)){
					//匹配价
					String fullCarPriceTem = contractPrice.getAfterTaxFullCarPrice();
					String splitPriceTem = contractPrice.getAfterTaxSplitPrice();
					String lightPriceTem = contractPrice.getAfterTaxLightPrice();
					//若匹配价格更高,则替换返回价
					if(Double.parseDouble(fullCarPriceTem) > Double.parseDouble(fullCarPrice)){
						fullCarPrice = fullCarPriceTem;
					}
					if(Double.parseDouble(splitPriceTem) > Double.parseDouble(splitPrice)){
						splitPrice = splitPriceTem;
					}
					if(Double.parseDouble(lightPriceTem) > Double.parseDouble(lightPrice)){
						lightPrice = lightPriceTem;
					}
					break;
				}
			}
			
			
		}
		
		//确定合同价,保存到结算单
		settlement.setSingleCarPrice(fullCarPrice);
		settlement.setSplitPrice(splitPrice);
		settlement.setSplitLightPrice(lightPrice);
		
		return settlement;
	}
	
	/**
	 * 计算分摊运费
	 * @param TransportationSettlement
	 * @return List<TransportationSettlementDetail>
	 */
	public List<TransportationSettlementDetail> countDividePrice(TransportationSettlement transportationSettlement){
		//获取总运费,理论重量
		String logisticSendId = transportationSettlement.getLogisticSend();
		
		String sumTheoryWeight = createSettlement(logisticSendId).getTheoryWeight();
		String sumPrice = transportationSettlement.getSumPrice();
		
		//转化double计算
		double ddSumTheoryWeight = 0;
		double ddSumPrice = 0;
		if(StringUtils.isNotBlank(sumTheoryWeight)){
			ddSumTheoryWeight = Double.parseDouble(sumTheoryWeight);
		}
		if(StringUtils.isNotBlank(sumPrice)){
			ddSumPrice = Double.parseDouble(sumPrice);
		}
		
		//遍历,计算分摊运费
		List<TransportationSettlementDetail> detailList = createSettlementDetail(logisticSendId);
		if(ddSumTheoryWeight != 0){
			for(TransportationSettlementDetail detail : detailList){
				double dividePrice = 0;
				String weight =  detail.getTheoryWeight();
				
				if(StringUtils.isNotBlank(weight)){
					dividePrice = Double.parseDouble(weight)/ddSumTheoryWeight*ddSumPrice;
					dividePrice = MathUtil.round(dividePrice, 2, BigDecimal.ROUND_HALF_UP);
					
					detail.setDividePrice(String.valueOf(dividePrice));
				}
				
			}
		}
		
		return detailList;
	} 
	
	/**
	 *  流程结束回调函数
	 * @param variables
	 */
	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String bindingId = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		TransportationSettlement jc = get(bindingId);
		jc.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
		jc.setIsNewRecord(false);
		save(jc);
		
	}
	
	
	/**
	 * 显示全部，因为数据为自动生成，所以没有创建人
	 * @param page
	 * @param transportationSettlement
	 * @return
	 */
	public Page<TransportationSettlement> findMyTransportationSettlement(Page<TransportationSettlement> page, TransportationSettlement transportationSettlement) {
		transportationSettlement.setPage(page);
		page.setList(transportationSettlementDao.findMyTransportationSettlement(transportationSettlement));
		return page;
	}
	/**
	 * 流程数据
	 * @param page
	 * @param transportationSettlement
	 * @return
	 */
	public Page<TransportationSettlement> findUnAuditTransportationSettlement(Page<TransportationSettlement> page, TransportationSettlement transportationSettlement) {
		transportationSettlement.setPage(page);
		page.setList(transportationSettlementDao.findUnAuditTransportationSettlement(transportationSettlement));
		return page;
	}
	public Page<TransportationSettlement> findAuditDoneTransportationSettlement(Page<TransportationSettlement> page, TransportationSettlement transportationSettlement) {
		transportationSettlement.setPage(page);
		page.setList(transportationSettlementDao.findAuditDoneTransportationSettlement(transportationSettlement));
		return page;
	}
	
}