/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.inventory.dao.StandingBookDetailDao;
import com.bt.modules.inventory.entity.Depot;
import com.bt.modules.inventory.entity.Inventory;
import com.bt.modules.inventory.entity.StandingBook;
import com.bt.modules.inventory.entity.StandingBookDetail;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.DateUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 库存台帐明细表Service
 * @author xiaocai
 * @version 2016-1-13
 */
@Service
@Transactional(readOnly = true)
public class StandingBookDetailService extends CrudService<StandingBookDetailDao, StandingBookDetail> {
	
	@Autowired
	private StandingBookDetailDao standingBookDetailDao;
	@Autowired
	private DepotService depotService;	//仓库
	
	
	/**
	 * 获取已领料数量
	 * @param standingBookDetail
	 * @return
	 */
	@Transactional(readOnly = false)
	public int hasClaimCountQuantity(StandingBookDetail standingBookDetail){
		StandingBook standingBook = new StandingBook();
		standingBook.setTranType(CommonConstant.STANDINGBOOK_LINGLIAO);
		Depot checkDepot = depotService.checkProjectDepot(standingBookDetail.getInventory().getProject(), standingBookDetail.getInventory().getSub());
		standingBook.setDepotIn(checkDepot);
		standingBookDetail.getInventory().setSub(new Subproject());
		standingBookDetail.getInventory().setProject(new Project());
		standingBookDetail.setStandingBook(standingBook);
		return this.countQuantityByCondition(standingBookDetail);
	}
	
	/**
	 * 根据条件统计对应的操作数量
	 * @param standingBookDetail
	 * @return
	 */
	public int countQuantityByCondition(StandingBookDetail standingBookDetail){
		return standingBookDetailDao.countQuantityByCondition(standingBookDetail);
	}
	
	
	/**
	 * 根据表记录查看表明细数据
	 * @param standingBook
	 * @return
	 */
	public List<StandingBookDetail> getByStandingBook(StandingBook standingBook){
		StandingBookDetail standingBookDetail = new StandingBookDetail();
		standingBookDetail.setStandingBook(standingBook);
		standingBookDetail.setGbStr("inv");
		List<StandingBookDetail> listSBDetail = standingBookDetailDao.getStandingBookDetailList(standingBookDetail);
		if(listSBDetail==null){
			listSBDetail = new ArrayList<StandingBookDetail>();
		}
		return listSBDetail;
	}
	/**
	 * 对查询结果进行对项目名称去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateProjectName(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getInventory().getProject().getName(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 对查询结果进行对户型去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateHouseType(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getStandingBook().getSubIn().getHouseType(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 对查询结果进行对楼栋去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateBuilding(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getStandingBook().getSubIn().getBuilding(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 对查询结果进行对施工班组去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateSendee(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getStandingBook().getSendee(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 对查询结果进行对材料名称去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateMaterialName(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getInventory().getMaterialName(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 对查询结果进行对石材名称（即下料单类型）去重
	 * @param listSBD
	 * @return
	 */
	public List<StandingBookDetail> removeDuplicateOrderTypeVal(List<StandingBookDetail> listSBD){
		Map<String,StandingBookDetail> map = new HashMap<String,StandingBookDetail>();
		for(StandingBookDetail s:listSBD){
			map.put(s.getInventory().getOrderBomBase().getOrderTypeVal(), s);
		}
		return this.mapConvertList(map);
	}
	/**
	 * 将map转换成list
	 * @param map
	 * @return
	 */
	private List<StandingBookDetail> mapConvertList(Map<String,StandingBookDetail> map){
		List<StandingBookDetail> listSBDs = new ArrayList<StandingBookDetail>();
		for(String key:map.keySet()){
			listSBDs.add(map.get(key));
		}
		return listSBDs;
	}
	/**
	 * 
	 * @param quantity	数量
	 * @param sbID		记录
	 * @param invID		库存材料
	 */
	public void insertStandingBookDetail(int quantity,String sbID,String invID){
		//数量不能小于0且记录和库存材料不能为空
		if(StringUtils.isBlank(sbID)||StringUtils.isBlank(invID)||quantity<=0){
			return;
		}
		StandingBookDetail sbd = new StandingBookDetail(IdGen.uuid(),quantity,new StandingBook(sbID),new Inventory(invID));
		standingBookDetailDao.insert(sbd);
	}
	/**
	 * 批量插入数据
	 * @param listSBD
	 */
	public void batchInsertStandingBookDetail(List<StandingBookDetail> listSBD){
		for(StandingBookDetail sbd:listSBD){
			standingBookDetailDao.insert(sbd);
		}
	}
	/**
	 * 钢辅料台账列表数据
	 * @param standingBookDetail
	 * @return
	 */
	public List<StandingBookDetail> getStandingBookGFLList(StandingBookDetail standingBookDetail){
		StandingBook standingBook = standingBookDetail.getStandingBook()==null?new StandingBook():standingBookDetail.getStandingBook();
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL);
		standingBook.setCreateBy(UserUtils.getUser());
		standingBookDetail.setStandingBook(standingBook);
		standingBookDetail.setGbStr("standingBook");
		List<StandingBookDetail> listSBDetail = this.getStandingBookDetailList(standingBookDetail);
		return listSBDetail;
	}
	/**
	 * 处理钢辅料台账查询结果
	 * @param listSBD
	 * @param materialName
	 * @param sendee
	 * @return
	 */
	public List<StandingBookDetail> searchGFLListUtils(List<StandingBookDetail> listSBD,String materialName,String sendee){
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();
		if(StringUtils.isNotBlank(materialName)&&StringUtils.isBlank(sendee)){	//只有物料名称没有施工班组
			for(StandingBookDetail standingBookDetail:listSBD){
				String materialNameFlag = standingBookDetail.getInventory().getMaterialName();
				if(materialName.equals(materialNameFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else if(StringUtils.isBlank(materialName)&&StringUtils.isNotBlank(sendee)){	//没有物料名称只有施工班组
			for(StandingBookDetail standingBookDetail:listSBD){
				String sendeeFlag = standingBookDetail.getStandingBook().getSendee();
				if(sendee.equals(sendeeFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else if(StringUtils.isNotBlank(materialName)&&StringUtils.isNotBlank(sendee)){	//两个都有值
			for(StandingBookDetail standingBookDetail:listSBD){
				String sendeeFlag = standingBookDetail.getStandingBook().getSendee();
				String materialNameFlag = standingBookDetail.getInventory().getMaterialName();
				if(sendee.equals(sendeeFlag)&&materialName.equals(materialNameFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else{
			return listSBD;
		}
		return listSBDetail;
	}
	/**
	 * 将详情中对应库存数据抽取出来
	 * @param listSBDetail
	 * @return
	 */
	public List<Inventory> getListInvByListDetail(List<StandingBookDetail> listSBDetail){
		List<Inventory> listInvs = new ArrayList<Inventory>();
		for(StandingBookDetail standingBookDetail:listSBDetail){
			listInvs.add(standingBookDetail.getInventory());
		}
		return listInvs;
	}
	/**
	 * 石材台账列表数据
	 * @param standingBookDetail
	 * @return
	 */
	public List<StandingBookDetail> getStandingBookSCList(StandingBookDetail standingBookDetail){
		StandingBook standingBook = standingBookDetail.getStandingBook()==null?new StandingBook():standingBookDetail.getStandingBook();
		standingBook.setMaterialType(CommonConstant.INVENTORY_MATERIAL_TYPE_SC);
		standingBookDetail.setStandingBook(standingBook);
		standingBook.setCreateBy(UserUtils.getUser());
		standingBookDetail.setGbStr("standingBook");
		List<StandingBookDetail> listSBDetail = this.getStandingBookDetailList(standingBookDetail);
		return listSBDetail;
	}
	/**
	 * 处理石材台账查询结果
	 * @param listSBD
	 * @param orderTypeVal
	 * @param sendee
	 * @return
	 */
	public List<StandingBookDetail> searchSCListUtils(List<StandingBookDetail> listSBD,String orderTypeVal,String sendee){
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();
		if(StringUtils.isNotBlank(orderTypeVal)&&StringUtils.isBlank(sendee)){	//只有物料名称没有施工班组
			for(StandingBookDetail standingBookDetail:listSBD){
				String orderTypeValFlag = standingBookDetail.getInventory().getOrderBomBase().getOrderTypeVal();
				if(orderTypeVal.equals(orderTypeValFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else if(StringUtils.isBlank(orderTypeVal)&&StringUtils.isNotBlank(sendee)){	//没有物料名称只有施工班组
			for(StandingBookDetail standingBookDetail:listSBD){
				String sendeeFlag = standingBookDetail.getStandingBook().getSendee();
				if(sendee.equals(sendeeFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else if(StringUtils.isNotBlank(orderTypeVal)&&StringUtils.isNotBlank(sendee)){	//两个都有值
			for(StandingBookDetail standingBookDetail:listSBD){
				String sendeeFlag = standingBookDetail.getStandingBook().getSendee();
				String orderTypeValFlag = standingBookDetail.getInventory().getOrderBomBase().getOrderTypeVal();
				if(sendee.equals(sendeeFlag)&&orderTypeVal.equals(orderTypeValFlag)){
					listSBDetail.add(standingBookDetail);
				}
			}
		}else{
			return listSBD;
		}
		return listSBDetail;
	}
	/**
	 * 根据相关条件获取对应的列表数据
	 * @param standingBookDetail
	 * @return
	 */
	public List<StandingBookDetail> getStandingBookDetailList(StandingBookDetail standingBookDetail){
		List<StandingBookDetail> listSBDetail = standingBookDetailDao.getStandingBookDetailList(standingBookDetail);
		if(listSBDetail==null){
			listSBDetail = new ArrayList<StandingBookDetail>();
		}
		listSBDetail = this.getLogByList(listSBDetail);
		return listSBDetail;
	}
	/**
	 * 根据对应条件获取数据
	 * @param standingBookDetail
	 * @param imt	INVENTORY_MATERIAL_TYPE
	 * @return
	 */
	public List<StandingBookDetail> getStandingBookListByImt(StandingBookDetail standingBookDetail,String imt){
		List<StandingBookDetail> listSBDetail = new ArrayList<StandingBookDetail>();
		if(CommonConstant.INVENTORY_MATERIAL_TYPE_GFL.equals(imt)){
			listSBDetail = this.getStandingBookGFLList(standingBookDetail);
		}else if(CommonConstant.INVENTORY_MATERIAL_TYPE_SC.equals(imt)){
			listSBDetail = this.getStandingBookSCList(standingBookDetail);
		}
		return listSBDetail;
	}
	/**
	 * 根据列表数据获取对应的操作日志
	 * @param listSBDetail
	 * @return
	 */
	public List<StandingBookDetail> getLogByList(List<StandingBookDetail> listSBDetail){
		List<StandingBookDetail> listSBDs = new ArrayList<StandingBookDetail>();
		//循环组装领料操作记录
		for(StandingBookDetail sbd:listSBDetail){	
			if(StringUtils.isBlank(sbd.getStandingBook().getSendee())){	//施工班组为空直接不查记录
				continue;
			}
			//统计超领料数量
			this.exceedCountUtils(sbd);
			//组装台账记录
			this.logLabUtils(sbd);
			//统计剩余量
			sbd.getInventory().setQuantity(standingBookDetailDao.getSurplusByCondition(sbd));
			
			listSBDs.add(sbd);
		}
		return listSBDs;
	}
	/**
	 * 超领料数量
	 * @param standingBookDetail
	 */
	public void exceedCountUtils(StandingBookDetail standingBookDetail){
		//进行统计相关数值并赋值
		int hasClaimCountQuantity = standingBookDetail.getQuantity();//this.hasClaimCountQuantity(sbd);//已领料数量
		int countOrderBomBase = Integer.parseInt(standingBookDetail.getInventory().getOrderBomDetail().getCount());//orderBomDetailService.countOrderBomBase(obdetail);//下单总量
		int notClaimCountQuantity = countOrderBomBase-hasClaimCountQuantity;//未领料数量
		int exceedCount = 0;//超领料数量
		if(notClaimCountQuantity<0){
			exceedCount = notClaimCountQuantity*-1;
			notClaimCountQuantity=0;
		}
		standingBookDetail.getExtraData().put("hasClaimCountQuantity", hasClaimCountQuantity);	//已领料数量
		standingBookDetail.getExtraData().put("notClaimCountQuantity", notClaimCountQuantity);	//未领料数量
		standingBookDetail.getExtraData().put("exceedCount", exceedCount);				//超领料数量
	}
	/**
	 * 组装台账领料记录
	 * @param standingBookDetail
	 */
	public void logLabUtils(StandingBookDetail standingBookDetail){
		standingBookDetail.setGbStr("standingBookID");
		//查询记录列表
		List<StandingBookDetail> listSBD = standingBookDetailDao.getStandingBookDetailList(standingBookDetail);
		String logStr = "";
		for(StandingBookDetail s:listSBD){	//组装操作出库记录
			String businessDate = DateUtils.getDateStrByPattern(s.getStandingBook().getBusinessDate(), "yyyy-MM-dd");
			logStr += businessDate+",数量："+s.getQuantity()+"<br/>";
		}
		standingBookDetail.setLogLab(logStr);
	}
	
	
	
	public StandingBookDetail get(String id) {
		return super.get(id);
	}
	
	public List<StandingBookDetail> findList(StandingBookDetail standingBookDetail) {
		return super.findList(standingBookDetail);
	}
	
	public Page<StandingBookDetail> findPage(Page<StandingBookDetail> page, StandingBookDetail standingBookDetail) {
		return super.findPage(page, standingBookDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(StandingBookDetail standingBookDetail) {
		super.save(standingBookDetail);
	}
	
	@Transactional(readOnly = false)
	public int insert(StandingBookDetail standingBookDetail) {
		return standingBookDetailDao.insert(standingBookDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(StandingBookDetail standingBookDetail) {
		super.delete(standingBookDetail);
	}
	
}