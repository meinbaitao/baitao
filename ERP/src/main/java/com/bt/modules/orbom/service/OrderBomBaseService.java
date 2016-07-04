/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.interfaces.ProcessDataHandler;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.orbom.dao.OrderBomBaseDao;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.entity.PurchaseDemandOrderBomDetailMapping;
import com.bt.modules.purchase.service.PurchaseDemandOrderBomDetailMappingService;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 下料单基本表Service
 * 
 * @author ljp
 * @version 2015-08-05
 */
@Service(OrderBomBaseService.BEAN_NAME)
@Transactional(readOnly = true)
public class OrderBomBaseService extends
		CrudService<OrderBomBaseDao, OrderBomBase> implements
		ProcessDataHandler {

	public static final String BEAN_NAME = "com.bt.modules.orbom.service.OrderBomBaseService";

	@Autowired
	private OrderBomBaseDao orderBomBaseDao;
	@Autowired
	private PurchaseDemandService purchaseDemandService; // 申购需求
	@Autowired
	private PurchaseDemandOrderBomDetailMappingService purchaseDemandOrderBomDetailMappingService;
	@Autowired
	private OrderBomDetailService orderBomDetailService;
	@Autowired
	private ProductionService productionService;
	@Autowired
	private OrderBomBoxService orderBomBoxService;
	@Autowired
	private SubProjectService subProjectService; // 二级项目
	@Autowired
	private ProjectService projectService;// 一级项目
	// 附件管理服务
	@Autowired
	private AttachmentService attachService;

	public OrderBomBase get(String id) {
		return super.get(id);
	}

	public List<OrderBomBase> findList(OrderBomBase orderBomBase) {
		orderBomBase.getSqlMap().put("dsf", dataScopeFilter(UserUtils.getUser(), "ud,udl,up,ur,ums,ucs,um,uo,ul"));
		return super.findList(orderBomBase);
	}

	public Page<OrderBomBase> findPage(Page<OrderBomBase> page,
			OrderBomBase orderBomBase) {
		orderBomBase.setPage(page);
		page.setList(this.findList(orderBomBase));
		return page;
	}
	
	/**
	 * 根据下料单查询二级项目和项目信息
	 * @param orderBomBase
	 * @return
	 */
	public List<Map<String, Object>> findSpList(OrderBomBase orderBomBase) {
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		List<OrderBomBase> orlist  =  this.findList(orderBomBase);

		String houseType ="";
		
		if(orlist != null && orlist.size() > 0){
			for(OrderBomBase ord:orlist){
				Map<String,Object> map = new HashMap<String, Object>();
				
				houseType = ord.getHouseType();
				
				if(ord.getSubProjId() != null){
					//获取二级项目信息
					 Subproject sp = subProjectService.get(ord.getSubProjId());
					 if(sp != null){
						//获取一级项目信息
						Project p = projectService.get(sp.getProjectId());
						Subproject sub = new Subproject();
						 sub.setHouseType(houseType);
						 sub.setProjectId(sp.getProjectId());
						 String buildingDisplayName = this.getBuildingDisplayNameByBuildings(ord.getBuilding(), sub);
						 sub.setBuildingDisplayName(buildingDisplayName);
						 ord.setSub(sub);
						 
						map.put("subProject", sp);	
						map.put("project", p);
					}
				}
				map.put("orderBomBase", ord);
				list.add(map);
			}
		}
		return list;
	}
	
	/**
	 * 创建楼栋下料单显示名
	 * @param orderBomDetail
	 * @return
	 */
	public String getBuildingDisplayNameByOrderBomBaseId(String baseId) {
		String houseType ="";
		String oldBuildingDisplayName = "";
		if(StringUtils.isNotBlank(baseId)){
			OrderBomBase ord = this.get(baseId);
			houseType = ord.getHouseType();
			if(ord.getSubProjId() != null){
				//获取二级项目信息
				 Subproject sp = subProjectService.get(ord.getSubProjId());			
				 if(sp != null){
					 Subproject sub = new Subproject();
					 sub.setHouseType(houseType);
					 sub.setProjectId(sp.getProjectId());
					 if (StringUtils.isNotBlank(ord.getBuilding())) {
						 return this.getBuildingDisplayNameByBuildings(ord.getBuilding(), sub);
					}
				}
			}
		}
		return oldBuildingDisplayName;
	}
	/**
	 * 根据楼栋号（building）获取显示楼栋号(buildingDisplayName)
	 * @param buildings
	 * @param sub
	 * @return
	 */
	public String getBuildingDisplayNameByBuildings(String buildings,Subproject sub){
		List<String> nameList = new ArrayList<String>();
		List<String> listBuilding = CommonUtils.stringToList(buildings);
		for(String b:listBuilding){
			sub.setBuilding(b);
			Subproject s = subProjectService.getOneByCondition(sub);
			if(StringUtils.isNotBlank(s.getBuildingDisplayName())){
				nameList.add(s.getBuildingDisplayName());
			}
		}
		return CommonUtils.listToString(nameList);
	}
	
	@Transactional(readOnly = false)
	public void save(OrderBomBase orderBomBase) {
		super.save(orderBomBase);
	}

	@Transactional(readOnly = false)
	public void update(OrderBomBase orderBomBase) {
		orderBomBaseDao.update(orderBomBase);
	}

	/**
	 * 修改流程id和状态
	 * 
	 * @param orderBomBase
	 */
	@Transactional(readOnly = false)
	public void updateWorkflowId(OrderBomBase orderBomBase) {
		orderBomBaseDao.updateWorkflowId(orderBomBase);
	}

	@Transactional(readOnly = false)
	public void insert(OrderBomBase orderBomBase) {
		orderBomBaseDao.insert(orderBomBase);
	}

	@Transactional(readOnly = false)
	public void delete(OrderBomBase orderBomBase) {
		super.delete(orderBomBase);
	}

	/**
	 * 提供给采购单
	 */
	public List<OrderBomBase> findListForPurchase(OrderBomBase orderBomBase) {
		orderBomBase.setOrderType(CommonConstant.OrderBomBase_PURCHASE);
		return orderBomBaseDao.findListForPurchase(orderBomBase);
	}

	/**
	 * 获取当天新增的数据数量
	 * 
	 * @param date
	 * @return
	 */
	public int getTodayCount(Date date) {
		if (date == null)
			date = new Date();
		return orderBomBaseDao.getTodayCount(date);
	}

	@Override
	@Transactional(readOnly = false)
	public void processFinishedNotify(Map<String, Object> variables) {
		String key = (String) variables.get(ActivitiConstants.PRIMARY_KEY);
		OrderBomBase order = this.get(key);
		String copy = order.getCopyNum();
		int copyNum;
		if (StringUtils.isNotBlank(copy)) {
			copyNum = Integer.valueOf(copy).intValue();
		} else {
			copyNum = 0;
		}
		
		
		OrderBomDetail orderBomDetailCopy = new OrderBomDetail();
		orderBomDetailCopy.setOrderBomId(order.getId());
		List<OrderBomDetail> listOBDCopy = orderBomDetailService
				.findList(orderBomDetailCopy);
		
		// 处理批量下单
		if (order != null) {
			
			List<String> oldBoxNo = new ArrayList<String>();
			
			String boxNo = "";
			int no = 0;
			Map<String, OrderBomDetail> map = new HashMap<String, OrderBomDetail>();
			if (copyNum > 1) {

				for (OrderBomDetail oldObd : listOBDCopy) {
					boxNo = oldObd.getBoxNo();
					oldBoxNo.add(boxNo);
				}
				for (int i = 1; i <= copyNum; i++) {
					no=0;
					if (i>1) {
						for (OrderBomDetail newObd : listOBDCopy) {
							newObd.setId(IdGen.uuid());
							newObd.setBoxNo(oldBoxNo.get(no)+"-0"+i);
							orderBomDetailService.insert(newObd);
							no++;
						}
					}else {
						for (OrderBomDetail newObd : listOBDCopy) {
							newObd.setBoxNo(oldBoxNo.get(no)+"-0"+i);
							orderBomDetailService.update(newObd);
							no++;
						}
					}
				}
			}
		}
		// 处理多栋下单
		if (order != null) {
			Subproject subProject = subProjectService.get(order.getSubProjId());
			Project project = null;
			String proId = "";
			if (subProject != null) {
				project = projectService.get(subProject.getProjectId());
			}
			if (project != null) {
				proId = project.getId();
			}
			Subproject subp = new Subproject();
			subp.setProjectId(proId);
			// 根据下料单ID获取附件
			Attachment attachment = new Attachment();
			attachment.setType(order.getId());
			List<Attachment> attachList = attachService
					.findAttachType(attachment);
			// 获取明细
			OrderBomDetail orderBomDetail = new OrderBomDetail();
			orderBomDetail.setOrderBomId(order.getId());
			List<OrderBomDetail> listOBD = orderBomDetailService.findList(orderBomDetail);
	
			// 截取下料单编号
			String orderBomNo = order.getOrderBomNo().substring(0,
					order.getOrderBomNo().indexOf("("));
			String endOrderBomNo = order.getOrderBomNo().substring(
					order.getOrderBomNo().indexOf(")"));
			order.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
			order.setOrderFinishDate(new Date());
			this.updateWorkflowId(order);
			// 将多栋拆开 一栋对应一份下料单
			String[] buildings = null;
			String building = "";
			// if(order.getBuilding() != null && order.getBuilding() != ""){
			if (StringUtils.isNotBlank(order.getBuilding())) {
				if (order.getBuilding().lastIndexOf(",") != -1) {
					buildings = order.getBuilding().split(",");	
				} else {
					buildings = new String[] { order.getBuilding() };	
				}
				
				String buildingDisplayName = "";
				if (buildings != null && buildings.length > 0) {
					// 因为初始的二级也可能存在问题，所以也需要重新替换二级的项目id
					subp.setBuilding(buildings[0]);
					subp.setHouseType(order.getHouseType());
					
					int num = 0;
					String numString = "";
					
					buildingDisplayName = this.getBuildingDisplayNameByBuildings(buildings[0], subp);
					
					String testOrderBomNo = orderBomNo + "(" + buildingDisplayName + endOrderBomNo + numString;
					order.setBuilding(buildings[0]);
					order.setSubProjId(subProjectService.getSubIdByProID(subp));// 根据项目一级id和楼栋号获取项目二级Id
					order.setOrderBomNo(testOrderBomNo);
					while (StringUtils.isNotBlank(this.findOrderBomNo(testOrderBomNo))) {
						num++;
						numString = "."+ num; 
						testOrderBomNo = orderBomNo + "(" + buildingDisplayName + endOrderBomNo + numString;
						order.setOrderBomNo(testOrderBomNo);
						if (StringUtils.isBlank(this.findOrderBomNo(testOrderBomNo))) {
							break;
						}
					}
							
					this.update(order);
					this.pushData(order);// 推送数据
					
					for (int i = 1; i < buildings.length; i++) {
						building = buildings[i];
						String orderId = IdGen.uuid();
						subp.setBuilding(building);
						subp.setHouseType(order.getHouseType());
						
						int num0 = 0;
						String numString0 = "";
						buildingDisplayName = this.getBuildingDisplayNameByBuildings(buildings[i], subp);
						String testOrderBomNo0 = orderBomNo + "(" + buildingDisplayName + endOrderBomNo + numString0;
						
						order.setId(orderId);
						order.setBuilding(building);
						order.setSubProjId(subProjectService
								.getSubIdByProID(subp));// 根据项目一级id和楼栋号获取项目二级Id
						order.setOrderBomNo(testOrderBomNo0);
						while (StringUtils.isNotBlank(this.findOrderBomNo(testOrderBomNo0))) {
							num0++;
							numString0 = "."+ num0; 
							testOrderBomNo0 = orderBomNo + "(" + buildingDisplayName + endOrderBomNo + numString0;
							order.setOrderBomNo(testOrderBomNo0);
							if (StringUtils.isBlank(this.findOrderBomNo(testOrderBomNo0))) {
								testOrderBomNo0 = "";
								break;
							}
						}
						
						this.insert(order);
						// 复制明细内容
						if (listOBD != null && listOBD.size() > 0) {
							for (OrderBomDetail obd : listOBD) {
								obd.setId(IdGen.uuid());
								obd.setOrderBomId(orderId);
								orderBomDetailService.insert(obd);
							}
						}
						// 复制附件内容
						if (attachList != null && attachList.size() > 0) {
							for (Attachment attach : attachList) {
								attach.setId(IdGen.uuid());
								attach.setType(orderId);
								attachService.save(attach);
							}
						}
						// 推送数据
						this.pushData(order);
					}
				}
			}
		}
	}

	/**
	 * 推送数据
	 * 
	 * @param order
	 */
	@Transactional(readOnly = false)
	public void pushData(OrderBomBase order) {
		if (CommonConstant.OrderBomBase_PURCHASE.equals(order.getOrderType())) {
			OrderBomDetail orderBomDetail = new OrderBomDetail();
			List<PurchaseDemand> listPD = new ArrayList<PurchaseDemand>();
			List<PurchaseDemandOrderBomDetailMapping> listPOM = new ArrayList<PurchaseDemandOrderBomDetailMapping>();
			int num = 0;
			orderBomDetail.setOrderBomId(order.getId());
			List<OrderBomDetail> listOBD = orderBomDetailService
					.findList(orderBomDetail);
			String snumber = SeriesNumberUtils
					.getSGDXGCSeriesNumber(purchaseDemandService
							.getToDaysCount(new Date()));
			if (listOBD != null && listOBD.size() > 0) {
				for (OrderBomDetail obd : listOBD) {
					String pid = IdGen.uuid();
					PurchaseDemand pd = new PurchaseDemand();
					pd.setId(pid);
					try {
						num = Integer
								.parseInt((obd.getCount() == null || ""
										.equals(obd.getCount())) ? "0" : obd
										.getCount());
					} catch (NumberFormatException nEx) {
						num = 0;
					}
					if (num <= 0) {
						continue;
					}

					pd.setCount(num);
					pd.setType(obd.getMaterielType());
					pd.setMtype(obd.getMaterielName());
					pd.setStatus(CommonStatus.PURCHASE_DZP_YYZY);
					pd.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
					pd.setSeriesnumber(snumber);

					PurchaseDemandOrderBomDetailMapping pom = new PurchaseDemandOrderBomDetailMapping();
					pom.setId(IdGen.uuid());
					pom.setObdid(obd.getId());
					pom.setPdid(pid);

					listPOM.add(pom);
					listPD.add(pd);
				}
				// 批量插入数据
				if (listPD != null && listPD.size() > 0) {
					purchaseDemandService.batchPurchaseDemand(listPD);
					purchaseDemandOrderBomDetailMappingService
							.batchInsert(listPOM);
				}
			}
		} else {
			OrderBomDetail orderBomDetail = new OrderBomDetail();
			List<OrderBomBox> listOBB = new ArrayList<OrderBomBox>();
			List<Production> listPD = new ArrayList<Production>();

			orderBomDetail.setOrderBomId(order.getId());
			List<OrderBomDetail> listOBD = orderBomDetailService
					.findBoxNo(orderBomDetail);
			Subproject sub = subProjectService.get(order.getSubProjId());
			// 组装一级项目数据
			String proID = sub == null ? "" : sub.getProjectId();
			Project project = new Project();
			project.setId(proID);
			if (listOBD != null && listOBD.size() > 0) {
				for (OrderBomDetail obd : listOBD) {
					// 保存数据到箱表
					OrderBomBox box = new OrderBomBox();
					box.setBoxNo(obd.getBoxNo());
					box.setId(IdGen.uuid());
					box.setOrderBomId(order.getId());
					box.setStatus(CommonStatus.BOX_DRK);// 待入库
					listOBB.add(box);
					// 推送数据到加工单
					Production pd = new Production();
					pd.setId(IdGen.uuid());
					pd.setOrderBomBox(box);
					pd.setProject(project);// 一级项目
					pd.setStatus(CommonStatus.PRODUCTION_DZP_YYZY);
					pd.setWorkflowstatus(CommonStatus.WORK_FLOW_END);
					pd.setUpdateDate(new Date());
					pd.setCreateDate(new Date());
					listPD.add(pd);
				}
			}
			// 插入数据
			if (listOBB != null && listOBB.size() > 0) {
				orderBomBoxService.batchOrderBomBox(listOBB);
				productionService.batchInsert(listPD);
			}
		}
	}

	/**
	 * 获取石材已收货的下料单列表
	 * 
	 * @param subProjId
	 * @return
	 */
	public List<OrderBomBase> findAllOrderBySubProjForSC(String subProjId) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("subProjId", subProjId);
		paramMap.put("excludeOrderType", CommonConstant.OrderBomBase_PURCHASE);
		paramMap.put("status", CommonStatus.PRODUCTION_YSH);
		paramMap.put("DEL_FLAG_NORMAL", BaseEntity.DEL_FLAG_NORMAL);
		return orderBomBaseDao.findAllOrderBySubProjForSC(paramMap);
	}

	/**
	 * 获取钢辅材已收货的下料单列表
	 * 
	 * @param subProjId
	 * @return
	 */
	public List<OrderBomBase> findAllOrderBySubProjForGFL(String subProjId) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("subProjId", subProjId);
		paramMap.put("orderType", CommonConstant.OrderBomBase_PURCHASE);
		paramMap.put("status", CommonStatus.PURCHASE_YSH);
		paramMap.put("DEL_FLAG_NORMAL", BaseEntity.DEL_FLAG_NORMAL);
		return orderBomBaseDao.findAllOrderBySubProjForGFL(paramMap);
	}

	/**
	 * 获取下料单的相应的统计值
	 * 
	 * @param obbIds
	 *            下料单ids
	 * @param boxIds
	 *            箱的ids
	 * @return
	 */
	public Map<String, Object> getOrderBomCountVal(List<String> obbIds,
			List<String> productionIds) {
		Map<String, Object> map = new HashMap<String, Object>();
		if ((obbIds == null || obbIds.size() == 0)
				&& (productionIds == null || productionIds.size() == 0)) {
			map.put("sumWeight", 0);
			map.put("countBox", 0);
			return map;
		}
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setIds(obbIds);
		orderBomBase.setListIds(productionIds);
		map = orderBomBaseDao.getOrderBomCountVal(orderBomBase);
		return map;
	}

	/**
	 * 获取石材进度跟进列表数据
	 * 
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListForStoneSchedule(OrderBomBase orderBomBase) {
		orderBomBase.setLsgtVal(CommonConstant.OrderBomBase_PURCHASE);
		List<OrderBomBase> listOBB = orderBomBaseDao
				.getListForStoneSchedule(orderBomBase);
		if (listOBB == null) {
			listOBB = new ArrayList<OrderBomBase>();
		}
		return listOBB;
	}

	/**
	 * 获取钢辅料的数据
	 * 
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListForGFLToInventory(OrderBomBase orderBomBase) {
		orderBomBase.setOrderType(CommonConstant.OrderBomBase_PURCHASE);
		List<OrderBomBase> listOBB = this.getListForInventory(orderBomBase);
		return listOBB;
	}

	/**
	 * 获取石材的数据
	 * 
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListForSCToInventory(OrderBomBase orderBomBase) {
		orderBomBase.setLsgtVal(CommonConstant.OrderBomBase_PURCHASE);
		List<OrderBomBase> listOBB = this.getListForInventory(orderBomBase);
		return listOBB;
	}

	/**
	 * 获取库存需要的数据
	 * 
	 * @param orderBomBase
	 * @return
	 */
	public List<OrderBomBase> getListForInventory(OrderBomBase orderBomBase) {
		List<OrderBomBase> listOBB = orderBomBaseDao
				.getListToInventory(orderBomBase);
		if (listOBB == null) {
			listOBB = new ArrayList<OrderBomBase>();
		}
		return listOBB;
	}
	
	/**
	 * 获取下料单编号
	 * @param orderBomNo
	 * @return
	 */
	public String findOrderBomNo(String orderBomNo){
		return orderBomBaseDao.findOrderBomNo(orderBomNo);
	}
}