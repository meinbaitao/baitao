/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.inventory.dao.InventoryDao;
import com.bt.modules.inventory.entity.Depot;
import com.bt.modules.inventory.entity.Inventory;
import com.bt.modules.inventory.entity.StandingBook;
import com.bt.modules.inventory.entity.StandingBookDetail;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.purchase.entity.Purchase;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 库存表Service
 * @author xiaocai
 * @version 2016-1-13
 */
@Service
@Transactional(readOnly = true)
public class InventoryService extends CrudService<InventoryDao, Inventory> {
	
	@Autowired
	private InventoryDao inventoryDao;	//库存
	@Autowired
	private OrderBomBoxService orderBomBoxService;	//箱
	@Autowired
	private DepotService depotService;	//仓库
	@Autowired
	private StandingBookDetailService standingBookDetailService;	//入库详情
	@Autowired	
	private StandingBookService standingBookService;	//入库表头记录
	@Autowired	
	private PurchaseService purchaseService;	//采购单
	@Autowired	
	private ProductionService productionService;	//加工单

	/**
	 * 根据条件获取对应的库存数据
	 * @param projectName	项目名称
	 * @param building		楼栋
	 * @param materialNos	物料编号
	 * @return
	 */
	public List<Inventory> getByMaterialNos(String projectName,String building,List<String> materialNos){
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		Inventory inventory = new Inventory();
		inventory.setListMaterialNos(materialNos);
		inventory.setProject(project);
		inventory.setSub(sub);
		return this.getGFLInvDataByCondition(inventory);
	}
	/**
	 * 根据组装的条件列表获取相应的石材数据
	 * @param projectName
	 * @param building
	 * @param listInv
	 * @return
	 */
	public List<Inventory> getSCBylist(String projectName,String building,List<Inventory> listInv){
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		List<Inventory> listInvs = new ArrayList<Inventory>();
		for(Inventory inventory:listInv){
			inventory.setProject(project);
			inventory.setSub(sub);
			listInvs.addAll(this.getSCInvDataByCondition(inventory));
		}
		return listInvs;
	}
	
	/**
	 * 采购钢辅料	收货	库存入库操作
	 * @param listPSF
	 * @param tranType
	 */
	@Transactional(readOnly = false)
	public void batchIntoForPurchase(List<PurchaseSFDetail> listPSF,String tranType){
		if(listPSF==null||listPSF.size()==0){
			return;
		}
		List<String> ids = new ArrayList<String>();
		List<Inventory> listInventory = new ArrayList<Inventory>();
		Map<String,Integer> mapQuantity = new HashMap<String,Integer>();	//对应采购单明细的收货数量   采购单ID-收货数量
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();	//批量的详情数据
		for(PurchaseSFDetail psf:listPSF){
			String key = psf.getPurchase().getId();
			ids.add(key);
			mapQuantity.put(key, psf.getScount());	//记录对应采购单明细的收货数量
		}
		//根据ids获取对应的列表数据
		List<Purchase> listP = purchaseService.getDetailForInv(ids);
		if(listP!=null&&listP.size()>0){	//数据存在才进行库存管理操作
			PurchaseDemand purchaseDemand = listP.get(0).getPurchaseDemand();
			Depot checkDepot = depotService.checkProjectDepot(purchaseDemand.getProject(), purchaseDemand.getSub());
			//入库记录
			int count = standingBookService.getTodayCount(new Date(), tranType);	//统计当天对应类型的日志数据
			String seriesNumber = SeriesNumberUtils.getStandingBookSeriesNumber(count, tranType,CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);	//组装生成对应的编号
			StandingBook standingBook = new StandingBook(IdGen.uuid(),seriesNumber,"",tranType,checkDepot,null,CommonConstant.INVENTORY_MATERIAL_TYPE_GFL,new Date());
			standingBook = standingBookService.insertStandingBook(standingBook);
			//详情实体
			StandingBookDetail sbdetail;
			for(Purchase p:listP){	//循环处理对应的采购订单数据
				//获取相应的库存位置
				Depot depot = depotService.checkProjectDepot(p.getPurchaseDemand().getProject(), p.getPurchaseDemand().getSub());
				
				OrderBomDetail orderBomDetail = new OrderBomDetail();
				orderBomDetail = p.getPurchaseDemand().getOrderBomDetail();
				
				//MaterielID(下料详情ID)、MaterielNo、MaterielType、MaterielName、Depot、Quantity、
				Inventory inv = new Inventory(orderBomDetail.getId(),orderBomDetail.getMaterielNo(),orderBomDetail.getMaterielType(),
						orderBomDetail.getMaterielName(),depot,mapQuantity.get(p.getId()));
				listInventory.add(inv);
			}
			//检验是否重复。
			List<Inventory> listUpdate = new ArrayList<Inventory>();	//库存已存在，进行数量修改的数据
			List<Inventory> listInsert = new ArrayList<Inventory>();	//库存中没有，需要增加的数据
			for(Inventory inventory : listInventory){	//循环处理入库数据
				Inventory inv = inventoryDao.getByOne(inventory);
				//判断应该执行操作还是执行修改
				if(inv!=null){
					inv.setQuantity(inv.getQuantity()+inventory.getQuantity());	//累加库存数量
					listUpdate.add(inv);
				}else{
					inventory.setId(IdGen.uuid());
					listInsert.add(inventory);
				}
				//组装操作记录详情
				sbdetail = new StandingBookDetail(IdGen.uuid(),inventory.getQuantity(),standingBook,inventory);
				listSBDetail.add(sbdetail);
			}
			//批量修改库存数量
			if(listUpdate.size()>0){
				for(Inventory inventory : listUpdate){
					inventoryDao.update(inventory);
				}
			}
			//批量保存库存数据
			if(listInsert.size()>0){
				for(Inventory inventory : listInsert){
					inventory.setCreateDate(new Date());
					inventoryDao.insert(inventory);
				}
			}
			//批量插入详情数据
			standingBookDetailService.batchInsertStandingBookDetail(listSBDetail);
		}
	}
	/**
	 * 石材
	 * 生产加工单 	收货	库存入库管理
	 * @param ids	加工单的ids集合
	 * @param tranType
	 */
	@Transactional(readOnly = false)
	public void batchIntoForProduction(List<String> ids,String tranType){
		if(ids==null||ids.size()==0){
			return;
		}
		Production production = new Production();
		production.setIds(ids);
		//根据ids获取对应的列表数据
		List<Production> listP = productionService.getListGBBoxDetail(production);
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();	//批量的详情数据
		List<Inventory> listInventory = new ArrayList<Inventory>();
		if(listP!=null && listP.size()>0){	//对数据进行相应的入库处理
			Production production0 = listP.get(0);
			Depot checkDepot = depotService.checkProjectDepot(production0.getProject(), production0.getSub());
			//入库记录
			int count = standingBookService.getTodayCount(new Date(), tranType);	//统计当天对应类型的日志数据
			String seriesNumber = SeriesNumberUtils.getStandingBookSeriesNumber(count, tranType,CommonConstant.INVENTORY_MATERIAL_TYPE_SC);	//组装生成对应的编号
			StandingBook standingBook = new StandingBook(IdGen.uuid(),seriesNumber,"",tranType,checkDepot,null,CommonConstant.INVENTORY_MATERIAL_TYPE_SC,new Date());
			standingBook = standingBookService.insertStandingBook(standingBook);
			//详情实体
			StandingBookDetail sbdetail;
			for(Production p:listP){	//循环处理加工单数据转成待入库数据
				//检索箱里面的物料详情
				OrderBomDetail orderBomDetail = new OrderBomDetail();
				orderBomDetail = p.getOrderBomDetail();
				if(StringUtils.isBlank(orderBomDetail.getCount())||Integer.parseInt(orderBomDetail.getCount())<=0){
					continue;
				}
				//获取相应的库存位置
				Depot depot = depotService.checkProjectDepot(p.getProject(), p.getSub());
				
				//下料详情(箱里面的详情ID)、MaterielNo、MaterielType、MaterielName、Depot、Quantity、
				Inventory inv = new Inventory(orderBomDetail.getId(),orderBomDetail.getMaterielNo(),CommonConstant.MATERIAL_SHICAI,
						orderBomDetail.getMaterielName(),depot,Integer.parseInt(orderBomDetail.getCount()));
				
				listInventory.add(inv);
			}
			//检验是否重复。
			List<Inventory> listUpdate = new ArrayList<Inventory>();	//库存已存在，进行数量修改的数据
			List<Inventory> listInsert = new ArrayList<Inventory>();	//库存中没有，需要增加的数据
			for(Inventory inventory : listInventory){	//对待入库数据进行相应处理进行入库
				Inventory inv = inventoryDao.getByOne(inventory);
				//判断应该执行操作还是执行修改
				if(inv!=null){
					inv.setQuantity(inv.getQuantity()+inventory.getQuantity());	//累加库存数量
					listUpdate.add(inv);
				}else{
					inventory.setId(IdGen.uuid());
					listInsert.add(inventory);
				}
				//组装操作记录详情
				sbdetail = new StandingBookDetail(IdGen.uuid(),inventory.getQuantity(),standingBook,inventory);
				listSBDetail.add(sbdetail);
			}
			//批量修改库存数量
			if(listUpdate.size()>0){
				for(Inventory inventory : listUpdate){
					inventoryDao.update(inventory);
				}
			}
			//批量保存库存数据
			if(listInsert.size()>0){
				for(Inventory inventory : listInsert){
					inventory.setCreateDate(new Date());
					inventoryDao.insert(inventory);
				}
			}
			//批量插入详情数据
			standingBookDetailService.batchInsertStandingBookDetail(listSBDetail);
		}
	}
	/**
	 * 批量出库对应数据
	 * @param listInventory
	 * @param project
	 * @param sub
	 * @param sendee	接收对象
	 * @param tranType
	 * @param materialType
	 * @throws BusinessException 
	 */
	@Transactional(readOnly = false)
	public void batchOutInventory(List<Inventory> listInventory,Project project,Subproject subIn,Subproject subOut,
							String sendee,String tranType,String materialType,Date businessDate,String remarks) throws BusinessException{
		//验证获取对应的仓库数据
		Depot depotOut = depotService.checkProjectDepot(project, subOut);	//出料对象
		Depot depotIn = depotService.checkProjectDepot(project, subIn);		//领用对象
		List<Inventory> listUpdate = new ArrayList<Inventory>();	//库存已存在，进行数量修改的数据
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();	//批量的详情数据
		//出库记录
		int count = standingBookService.getTodayCount(new Date(), tranType);	//统计当天对应类型的日志数据
		String seriesNumber = SeriesNumberUtils.getStandingBookSeriesNumber(count, tranType,materialType);	//组装生成对应的编号
		StandingBook standingBook = new StandingBook(IdGen.uuid(),seriesNumber,sendee,tranType,depotIn,depotOut,materialType,businessDate,remarks);
		standingBook = standingBookService.insertStandingBook(standingBook);
		//详情实体
		StandingBookDetail sbdetail;
		Map<String,Integer> mapQuantity = this.getInvQuantity(listInventory);
		//检验是否重复。
		for(Inventory inventory : listInventory){
			String id = inventory.getId();
			if(mapQuantity.containsKey(id)){
				//库存剩余量=库存数量-出库数量
				int num = mapQuantity.get(id)-inventory.getQuantity();
				if(num<0){
					throw new BusinessException("出库失败：出库数量不能比库存数量大");
				}
				//组装操作记录详情
				sbdetail = new StandingBookDetail(IdGen.uuid(),inventory.getQuantity(),standingBook,inventory);
				listSBDetail.add(sbdetail);
				//库存修改数量
				inventory.setQuantity(num);	//累加库存数量
				listUpdate.add(inventory);
			}else{
				throw new BusinessException("出库失败：数据不存在");
			}
		}
		//批量修改库存数量
		for(Inventory inventory : listUpdate){
			inventoryDao.update(inventory);
		}
		//批量插入实体数据
		standingBookDetailService.batchInsertStandingBookDetail(listSBDetail);
	}
	/**
	 * 获取送进来的对应数据在数据库中的库存余量
	 * @param listInvs
	 * @return	map<id,quantity>
	 */
	public Map<String,Integer> getInvQuantity(List<Inventory> listInvs){
		Map<String,Integer> map = new HashMap<String,Integer>();
		List<String> ids = new ArrayList<String>();
		List<String> listMaterialNos = new ArrayList<String>();
		for(Inventory inv:listInvs){
			ids.add(inv.getId());
			listMaterialNos.add(inv.getMaterialNo());
		}
		if(ids.size()>0||listMaterialNos.size()>0){
			Inventory inventory = new Inventory();
			inventory.setIds(ids);
			inventory.setListMaterialNos(listMaterialNos);
			List<Inventory> listInv = inventoryDao.getPageData(inventory);	//获取全部的数据库中的数据
			for(Inventory inv:listInv){
				map.put(inv.getId(), inv.getQuantity());	//将数据存储格式转换
			}
		}
		return map;
	}
	/**
	 * 获取钢辅料的库存统计
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getStatisticList(Inventory inventory,String imt){
		List<Inventory> listInv = this.getInvDataByConditionAndImt(inventory, imt);
		if(listInv==null){
			listInv = new ArrayList<Inventory>();
		}
		if(listInv.size()>0){	//数据不为空	
			for(Inventory inv:listInv){ 
				inv.setTranType(CommonConstant.STANDINGBOOK_LINGLIAO);
				Inventory invOutQuantity = inventoryDao.getInventoryOutQuantity(inv);
				if(invOutQuantity==null){
					inv.setOutQuantity(0);
				}else{
					inv.setOutQuantity(invOutQuantity.getOutQuantity());
				}
				
			}
		}
		
		return listInv;
	}
	/**
	 * 根据物料名称进行相应的分组
	 * @param listInv
	 * @return
	 */
	public List<Inventory> groupByMaterialName(List<Inventory> listInv){
		List<Inventory> listInvs = new ArrayList<Inventory>();
		Map<String,Inventory> map = new HashMap<String, Inventory>();
		for(Inventory inv:listInv){
			map.put(inv.getMaterialName(), inv);
		}
		for(String key:map.keySet()){
			listInvs.add(map.get(key));
		}
		return listInvs;
	}
	/**
	 * 对下料单类型进行分组
	 */
	public List<Inventory> groupByObbaseOrderType(List<Inventory> listInv){
		List<Inventory> listInvs = new ArrayList<Inventory>();
		Map<String,Inventory> map = new HashMap<String, Inventory>();
		for(Inventory inv:listInv){
			map.put(inv.getOrderBomBase().getOrderTypeVal(), inv);
		}
		for(String key:map.keySet()){
			listInvs.add(map.get(key));
		}
		return listInvs;
	}
	
	/**
	 * 获取当天新增的数据数量
	 * @param date
	 * @return
	 */
	public int getTodayCount(Date date){
		if(date==null)
			date = new Date();
		return inventoryDao.getTodayCount(date);
	}
	/**
	 * 石材领料界面项目列表
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getSCInvDataByCondition(Inventory inventory){
		//补充物料类型条件
		List<String> materialTypes = new ArrayList<String>();
			materialTypes.add(CommonConstant.MATERIAL_SHICAI);
		inventory.setListMaterialTypes(materialTypes);
		List<Inventory> listInventory = inventoryDao.getSCInvDataByCondition(inventory);
		if(listInventory==null||listInventory.size()==0){
			listInventory = new ArrayList<Inventory>();
		}
		return listInventory;
	}
	/**
	 * 钢辅料
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getGFLInvDataByCondition(Inventory inventory){
		//补充物料类型条件
		List<String> materialTypes = new ArrayList<String>();
			materialTypes.add(CommonConstant.MATERIAL_GANGCAI);
			materialTypes.add(CommonConstant.MATERIAL_FULIAO);
		inventory.setListMaterialTypes(materialTypes);
		//根据条件获取对应的数据
		List<Inventory> listInventory = inventoryDao.getGFLInvDataByCondition(inventory);
		if(listInventory==null){
			listInventory = new ArrayList<Inventory>();
		}else{
			for(Inventory inv:listInventory){ 
				Inventory invs = inventoryDao.getObbaseDataByID(inv);
				inv.setOrderBomDetail(invs.getOrderBomDetail());
			}
		}
		return listInventory;
	}
	/**
	 * 根据条件、类型查询对应的数据
	 * @param inventory	条件
	 * @param imt		INVENTORY_MATERIAL_TYPE
	 * @return
	 */
	public List<Inventory> getInvDataByConditionAndImt(Inventory inventory,String imt){
		List<Inventory> listInv = new ArrayList<Inventory>();
		if(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL.equals(imt)){
			listInv = this.getGFLInvDataByCondition(inventory);
		}else if(CommonConstant.INVENTORY_MATERIAL_TYPE_SC.equals(imt)){
			listInv = this.getSCInvDataByCondition(inventory);
		}
		return listInv;
	}
	/**
	 * 根据出库楼栋获取相应的库存数量
	 * @return
	 */
	public Map<String,Object> getQuantityByOutBuilding(String projectName,String building,String orderType,String imt){
		Project project = new Project();
		project.setName(projectName);
		Subproject sub = new Subproject();
		sub.setBuilding(building);
		OrderBomBase obb = new OrderBomBase();
		obb.setOrderType(orderType);
		Inventory inventory = new Inventory();
		inventory.setProject(project);
		inventory.setSub(sub);
		inventory.setOrderBomBase(obb);
		inventory.setMaterialType(imt);
		inventory.setGroupByStr("materialNo");
		return this.getQuantityByConditionToMap(inventory);
	}
	/**
	 * 根据条件获取相应的库存数量
	 * @param inventory
	 * @return	Map<String,Object> key-materialNo value-quantity
	 */
	public Map<String,Object> getQuantityByConditionToMap(Inventory inventory){
		List<Inventory> listInv = this.getQuantityByCondition(inventory);
		Map<String,Object> map = new HashMap<String, Object>();
		for(Inventory inv:listInv){
			map.put(inv.getMaterialNo(), inv.getQuantity());
		}
		return map;
	}
	/**
	 * 根据相应的条件获取库存量
	 * @param inventory
	 * @return
	 */
	public List<Inventory> getQuantityByCondition(Inventory inventory){
		List<Inventory> listInv = inventoryDao.getQuantityByCondition(inventory);
		if(listInv==null){
			listInv = new ArrayList<Inventory>();
		}
		return listInv;
	}
	/**
	 * 根据物料类型获取相应的列表数据
	 * @param materialType	库存物料类型
	 * @param inv			条件对象
	 * @return
	 */
	public List<Inventory> getListByMaterialType(String materialType,Inventory inv){
		List<Inventory> listInv = new ArrayList<Inventory>();
		if(CommonConstant.INVENTORY_MATERIAL_TYPE_SC.equals(materialType)){
			listInv = this.getSCInvDataByCondition(inv);
		}else if(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL.equals(materialType)){
			listInv = this.getGFLInvDataByCondition(inv);
		}
		return listInv;
	}
	/**
	 * 查询库存项目条件组装方法
	 * @return
	 */
	public Inventory getInvDataByConditionUtils(){
		Inventory inv = new Inventory();
		Depot depot = new Depot();
		depot.setDepotUser(UserUtils.getUser());
		inv.setDepot(depot);
		return inv;
	}
	/**
	 * 项目名称去重
	 * group by Project Name
	 * @return
	 */
	public Inventory getInvDataByConditionGBPNUtils(){
		Inventory inv = this.getInvDataByConditionUtils();
		inv.setGroupByStr("projectName");
		return inv;
	}
	/**
	 * 户型去重
	 * group by Project HouseType
	 * @return
	 */
	public Inventory getInvDataByConditionHouseTypeUtils(){
		Inventory inv = this.getInvDataByConditionUtils();
		inv.setGroupByStr("houseType");
		return inv;
	}
	/**
	 * 楼栋号去重
	 * group by Project Building
	 * @return
	 */
	public Inventory getInvDataByConditionBuildingUtils(){
		Inventory inv = this.getInvDataByConditionUtils();
		inv.setGroupByStr("building");
		return inv;
	}
	/**
	 * 材料去重
	 * @return
	 */
	public Inventory getInvDataByConditionInvUtils(){
		Inventory inv = this.getInvDataByConditionUtils();
		inv.setGroupByStr("inv");
		return inv;
	}
	/**
	 * 箱号去重
	 * group by OrderBomBox box_no
	 * @return
	 */
	public Inventory getInvDataByConditionOBBoxUtils(){
		Inventory inv = this.getInvDataByConditionUtils();
		inv.setGroupByStr("box_no");
		return inv;
	}

	
	
	public Inventory get(String id) {
		return super.get(id);
	}
	
	public List<Inventory> findList(Inventory inventory) {
		return super.findList(inventory);
	}
	
	public Page<Inventory> findPage(Page<Inventory> page, Inventory inventory) {
		return super.findPage(page, inventory);
	}
	
	@Transactional(readOnly = false)
	public void save(Inventory inventory) {
		super.save(inventory);
	}
	
	@Transactional(readOnly = false)
	public void update(Inventory inventory){
		super.dao.update(inventory);
	}
	
	public void updateQuantity(Inventory inventory){
		inventoryDao.updateQuantity(inventory);
	}
	
	@Transactional(readOnly = false)
	public void delete(Inventory inventory) {
		super.delete(inventory);
	}
}