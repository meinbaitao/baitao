/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.accident.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.bt.modules.accident.entity.AccidentManage;
import com.bt.modules.accident.entity.AccidentManageDetail;
import com.bt.modules.accident.dao.AccidentManageDao;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;

/**
 * 事故管理Service
 * @author pc
 * @version 2015-10-14
 */
@Service(AccidentManageService.BEAN_NAME)
@Transactional(readOnly = true)
public class AccidentManageService extends CrudService<AccidentManageDao, AccidentManage> implements ProcessDataHandler{
	
	public static final String BEAN_NAME = "com.bt.modules.accident.service.AccidentManageService";
	
	@Autowired
	private AccidentManageDao accidentManageDao;
	@Autowired
	private AccidentManageDetailService accidentManageDetailService;
	@Autowired
	private OrderBomDetailService orderBomDetailService;
	@Autowired
	private OrderBomBaseService orderBomBaseService;
	
	public AccidentManage get(String id) {
		return super.get(id);
	}
	
	public List<AccidentManage> findList(AccidentManage accidentManage) {
		return super.findList(accidentManage);
	}
	
	public Page<AccidentManage> findPage(Page<AccidentManage> page, AccidentManage accidentManage) {
		return super.findPage(page, accidentManage);
	}
	
	@Transactional(readOnly = false)
	public void insert(AccidentManage accidentManage) {
		accidentManageDao.insert(accidentManage);
	}
	
	@Transactional(readOnly = false)
	public void save(AccidentManage accidentManage) {
		super.save(accidentManage);
	}
	
	@Transactional(readOnly = false)
	public void delete(AccidentManage accidentManage) {
		super.delete(accidentManage);
	}
	/**
	 * 修改流程id和状态
	 * @param orderBomBase
	 */
	@Transactional(readOnly = false)
	public void updateWorkflowId(AccidentManage accidentManage) {
		accidentManageDao.updateWorkflowId(accidentManage);
	}

	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String primaryKey = (String)variables.get(ActivitiConstants.PRIMARY_KEY);
		AccidentManage am = this.get(primaryKey);
		Map<String,List<OrderBomDetail>> map = new HashMap<String, List<OrderBomDetail>>();
		List<AccidentManageDetail> amdList = new ArrayList<AccidentManageDetail>();
		if(am != null){
			AccidentManageDetail accidentManageDetail = new AccidentManageDetail();
			accidentManageDetail.setAccidentManageId(am.getId());
			amdList = accidentManageDetailService.findList(accidentManageDetail);
			//修改流程状态
			am.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
			this.updateWorkflowId(am);
			//石材收货事故和钢辅材收货事故
			if(CommonConstant.ACCIDENT_SC_COLLECT.equals(am.getType()) || CommonConstant.ACCIDENT_GFC_COLLECT.equals(am.getType())){
				//遍历事故单明细
				if(amdList != null && amdList.size() > 0){
					//明细信息
					for(AccidentManageDetail amd:amdList){
						if(amd != null){
							//判断解决方案是否为补料0-补料 1-罚款
							if("0".equals(amd.getSolvePlan())){
								List<OrderBomDetail> list = map.get(amd.getOrderBomBaseId());
								OrderBomDetail orderBomDetail = new OrderBomDetail();
								orderBomDetail.setOrderBomId(amd.getOrderBomBaseId());
								orderBomDetail.setBoxNo(amd.getBoxNo());//箱号 --> 石材
								orderBomDetail.setMaterielNo(amd.getMaterielNo());//材料编号-->石材/钢辅材
								orderBomDetail.setMaterielName(amd.getMaterielName());//材料名称-->钢辅材
								orderBomDetail.setStandardDesc(amd.getStandardDesc());//材料规格-->钢辅材
								OrderBomDetail obd = orderBomDetailService.getOrderBomDetail(orderBomDetail);
								obd.setCount(amd.getCount() + "");
								if(list == null){
									list = new ArrayList<OrderBomDetail>();
									list.add(obd);
									map.put(amd.getOrderBomBaseId(), list);
								}else if(list != null & list.size() > 0){
									map.get(amd.getOrderBomBaseId()).add(obd);
								}
							}
						}
					}

					//遍历map 保存数据
					 Iterator<Map.Entry<String,List<OrderBomDetail>>> it = map.entrySet().iterator();  
					 while (it.hasNext()){  
			            //将键值关系取出存入Map.Entry这个映射关系集合接口中  
						 Map.Entry<String,List<OrderBomDetail>>  me = it.next();  
			            //使用Map.Entry中的方法获取键和值  
			            String key = me.getKey();  
			            List<OrderBomDetail> value = me.getValue();  
			            OrderBomBase obb =  orderBomBaseService.get(key);
			            String orderId = IdGen.uuid();

						if(value != null && value.size() > 0){
							for(OrderBomDetail detail : value){
								if(detail != null){
									detail.setId(IdGen.uuid());
									detail.setOrderBomId(orderId);
									orderBomDetailService.insert(detail);
								}
							}

							//生成补料单主体信息
							obb.setOrderBomNo(obb.getOrderBomNo()+"-补");
							obb.setOriginalNo(obb.getId());//原下料单ID
							obb.setId(orderId);
							obb.setOrderMadeTime(new Date());
							obb.setWorkflowid("");
							obb.setWorkflowstatus("");
							orderBomBaseService.insert(obb);

						}
			        }  
				}
				
			}

			//石材销售事故和钢辅材销售事故
			if(CommonConstant.ACCIDENT_SC_SELL.equals(am.getType()) || CommonConstant.ACCIDENT_GFC_SELL.equals(am.getType())){
				OrderBomBase obb = orderBomBaseService.get(am.getOrderId());
				if(obb != null){
					String orderId = IdGen.uuid();
					obb.setId(orderId);
					obb.setOriginalNo(am.getOrderId());
					obb.setOrderBomNo(obb.getOrderBomNo() + "-补");
					obb.setOrderMadeTime(new Date());
					obb.setWorkflowid("");
					obb.setWorkflowstatus("");

					boolean patch_flag = false; //是否补料标记, false 不补料，true 补料
					//遍历事故单明细
					if(amdList != null && amdList.size() > 0){
						//明细信息
						for(AccidentManageDetail amd:amdList){
							if(amd != null){
								//判断解决方案是否为补料0-补料 1-罚款
								if("0".equals(amd.getSolvePlan())){
									OrderBomDetail orderBomDetail = new OrderBomDetail();
									orderBomDetail.setOrderBomId(am.getOrderId());
									orderBomDetail.setBoxNo(amd.getBoxNo());//箱号 --> 石材
									orderBomDetail.setMaterielNo(amd.getMaterielNo());//材料编号-->石材/钢辅材
									orderBomDetail.setMaterielName(amd.getMaterielName());//材料名称-->钢辅材
									orderBomDetail.setStandardDesc(amd.getStandardDesc());//材料规格-->钢辅材
									OrderBomDetail obd = orderBomDetailService.getOrderBomDetail(orderBomDetail);
									obd.setId(IdGen.uuid());
									obd.setOrderBomId(orderId);
									obd.setCount(amd.getCount() + "");
									orderBomDetailService.insert(obd);

									patch_flag=true;
								}
							}
						}
					}

					if(patch_flag){
						orderBomBaseService.insert(obb);  //插入补料主体信息
					}

				}
			}
		}
	}
}