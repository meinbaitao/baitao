/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.inventory.dao.DepotDao;
import com.bt.modules.inventory.entity.Depot;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.utils.CommonConstant;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.service.ServiceException;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 仓库信息Service
 * @author xiaocai
 * @version 2016-1-13
 */
@Service
@Transactional(readOnly = true)
public class DepotService extends CrudService<DepotDao, Depot> {

	@Autowired
	private DepotDao depotDao;
	
	/**
	 * 检测项目仓库相关数据
	 * 现场工地库存	
	 * @return
	 */
	@Transactional(readOnly = false)
	public Depot checkProjectDepot(Project project,Subproject sub) {
		//获取唯一的库存数据
		Depot depot = depotDao.getOne(new Depot(project,sub,null));
		if(depot==null){	//数据不存在的情况则新增仓库数据
			if(project==null){	
				throw new ServiceException("仓库地址不存在");
			}
			depot = new Depot(IdGen.uuid(),"",CommonConstant.DEPOT_TYPE_PROJECT,project,sub,null);
			depotDao.insert(depot);
		}
		return depot;
	}
	/**
	 * 根据用户ID获取对应的钢辅料列表数据
	 * @param userID
	 * @return
	 */
	public List<Depot> getGFLListByUserID(String userID){
		List<String> materialTypes = new ArrayList<String>();
			materialTypes.add(CommonConstant.MATERIAL_GANGCAI);
			materialTypes.add(CommonConstant.MATERIAL_FULIAO);
		Depot depot = new Depot();
		depot.setDepotUser(new User(userID));
		depot.setListMaterialTypes(materialTypes);
		depot.setOrderType(CommonConstant.OrderBomBase_PURCHASE);
		List<Depot> listDepot = this.getListByCondition(depot);
		return listDepot;
	}
	/**
	 * 根据库存列表数据对项目名称进行java逻辑去重处理
	 * @param listDepot
	 * @return
	 */
	public List<Project> getProjectByDepotUtils(List<Depot> listDepot){
		List<Project> listProject = new ArrayList<Project>();
		Map<String,Project> map = new HashMap<String, Project>();
		for(Depot d:listDepot){
			if(d.getProject()==null){
				continue;
			}
			map.put(d.getProject().getName(), d.getProject());
		}
		for(String key:map.keySet()){
			listProject.add(map.get(key));
		}
		return listProject;
	}
	/**
	 * 根据库存列表数据对户型进行java逻辑去重处理
	 * @param listDepot
	 * @return
	 */
	public List<Subproject> getHouseTypeByDepotUtils(List<Depot> listDepot){
		List<Subproject> listSub = new ArrayList<Subproject>();
		Map<String,Subproject> map = new HashMap<String, Subproject>();
		for(Depot d:listDepot){
			if(d.getSub()==null){
				continue;
			}
			map.put(d.getSub().getHouseType(), d.getSub());
		}
		for(String key:map.keySet()){
			listSub.add(map.get(key));
		}
		return listSub;
	}
	/**
	 * 根据库存列表数据对楼栋号进行java逻辑去重处理
	 * @param listDepot
	 * @return
	 */
	public List<Subproject> getBuildingByDepotUtils(List<Depot> listDepot){
		List<Subproject> listSub = new ArrayList<Subproject>();
		Map<String,Subproject> map = new HashMap<String, Subproject>();
		for(Depot d:listDepot){
			if(d.getSub()==null){
				continue;
			}
			map.put(d.getSub().getBuilding(), d.getSub());
		}
		for(String key:map.keySet()){
			listSub.add(map.get(key));
		}
		return listSub;
	}
	/**
	 * 获取项目的相关列表数据
	 * @param listDepot
	 * @return
	 */
	public Map<String,Object> getProjectData(List<Depot> listDepot){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Project> listProject = this.getProjectByDepotUtils(listDepot);
		List<Subproject> listHouseType = this.getHouseTypeByDepotUtils(listDepot);
		List<Subproject> listBuilding = this.getBuildingByDepotUtils(listDepot);
		map.put("listProject", listProject);
		map.put("listHouseType", listHouseType);
		map.put("listBuilding", listBuilding);
		return map;
	}
	/**
	 * 除项目信息其余只返回第一条信息
	 * @param listDepot
	 * @return
	 */
	public Map<String,Object> getOneProjectData(List<Depot> listDepot){
		Map<String,Object> map = new HashMap<String, Object>();
		List<Project> listProject = this.getProjectByDepotUtils(listDepot);
		List<Depot> listDepots = new ArrayList<Depot>();
		if(listDepot.size()==0){
			return map;
		}
		listDepots.add(listDepot.get(0));
		List<Subproject> listHouseType = this.getHouseTypeByDepotUtils(listDepots);
		List<Subproject> listBuilding = this.getBuildingByDepotUtils(listDepots);
		map.put("listProject", listProject);
		map.put("listHouseType", listHouseType);
		map.put("listBuilding", listBuilding);
		return map;
	}
	/**
	 * 根据用户ID获取对应的石材列表数据
	 * @param userID
	 * @return
	 */
	public List<Depot> getSCListByUserID(String userID){
		List<String> materialTypes = new ArrayList<String>();
			materialTypes.add(CommonConstant.MATERIAL_SHICAI);
		Depot depot = new Depot();
		depot.setDepotUser(new User(userID));
		depot.setListMaterialTypes(materialTypes);
		depot.setLsgtVal(CommonConstant.OrderBomBase_PURCHASE);
		List<Depot> listDepot = this.getListByCondition(depot);
		return listDepot;
	}
	/**
	 * 查询相应的仓库列表数据
	 * @param depot
	 * @return
	 */
	public List<Depot> getListByCondition(Depot depot){
		List<Depot> listDepot = depotDao.getListByCondition(depot);
		if(listDepot==null){
			listDepot = new ArrayList<Depot>();
		}
		return listDepot;
	}
	
	public Depot get(String id) {
		return super.get(id);
	}
	
	public List<Depot> findList(Depot depot) {
		return super.findList(depot);
	}
	
	public Page<Depot> findPage(Page<Depot> page, Depot depot) {
		return super.findPage(page, depot);
	}
	
	@Transactional(readOnly = false)
	public void save(Depot depot) {
		super.save(depot);
	}
	
	@Transactional(readOnly = false)
	public void delete(Depot depot) {
		super.delete(depot);
	}
	
}