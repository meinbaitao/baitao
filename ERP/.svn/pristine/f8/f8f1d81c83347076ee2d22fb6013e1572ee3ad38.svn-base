/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.project.dao.SubprojectDao;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.utils.CommonUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 子项目信息Service
 * @author xjp
 * @version 2015-07-31
 */
@Service
@Transactional(readOnly = true)
public class SubProjectService extends CrudService<SubprojectDao, Subproject> {

	private static final String SUBPROJ_COMPOSITE_KEY_TEMPLATE = "projectId[%s]:building[%s]";

	//许俊雄
	public static final String SUB_SEQ="subproject_seq";
	
	@Autowired
	private SubprojectDao subprojectDao;
	
	/**
	 * 子项目基础表根据ID查明细信息
	 */
	public Subproject get(String id) {
		return super.get(id);
	}
	
	/**
	 * 子项目基础表信息查询
	 */
	public List<Subproject> findList(Subproject subProject) {
		return super.findList(subProject);
	}
	
	/**
	 * 子项目基础表信息分页查询
	 */
	public Page<Subproject> findPage(Page<Subproject> page, Subproject subProject) {
		return super.findPage(page, subProject);
	}
	
	/**
	 * 子项目基础表信息添加
	 */
	@Transactional(readOnly = false)
	public void save(Subproject subProject) {
		subProject.setIsNewRecord(true);
		super.save(subProject);
	}
	
	/**
	 * 子项目基础表信息修改
	 */
	@Transactional(readOnly = false)
	public void update(Subproject subProject) {
		subprojectDao.update(subProject);
	}
	
	/**
	 * 子项目基础表信息删除
	 */
	@Transactional(readOnly = false)
	public void delete(Subproject subProject) {
		super.delete(subProject);
	}
	
	/**
	 * 子项目基础表信息删除
	 */
	@Transactional(readOnly = false)
	public void delete(String ids) {
		if(StringUtils.isNotEmpty(ids)){
			String[] array =ids.split(",");
			if(array !=null && array.length>0){
				for(int i=0;i<array.length;i++){
					Subproject subproject = new Subproject();
					subproject.setId(array[i]);
					super.dao.delete(subproject);
				}
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delFlag(String ids) {
		String[] array =ids.split(",");
		if(array !=null && array.length>0){
			for(int i=0;i<array.length;i++){
				Subproject subproject = new Subproject();
				subproject.setProjectId(array[i]);
				super.dao.delFlag(subproject);
			}
		}
	}
	
	/**
	 * 添加Mapping表关联信息
	 */
	@Transactional(readOnly = false)
	public void addProjectMap(Map<String,Object> map) {
		subprojectDao.addProjectMap(map);
	}
	/**
	 * 根据id修改石材要求到货时间
	 * @param subProject
	 */
	@Transactional(readOnly = false)
	public void updateStoneExpectDateById(Subproject subProject) {
		subprojectDao.updateStoneExpectDateById(subProject);
	}
	
	/**
	 * 根据一级项目ID关联Map查询二级项目信息
	 */
	public List<Subproject> findByProjectIdList(String projectId) {
		Subproject subProject = new Subproject();
		subProject.setProjectId(projectId);
		return subprojectDao.findByProjectIdList(subProject);
	}
	
	/**
	 * 根据一级项目ID关联Map查询二级项目信息
	 */
	public List<Subproject> findByPIdAttachmentList(String projectId) {
		Subproject subProject = new Subproject();
		subProject.setProjectId(projectId);
		Boolean isJGC = UserUtils.verificationRole("scjgry");
		subProject.setIsJgcry(isJGC);
		return subprojectDao.findByPIdAttachmentList(subProject);
	}
	
	/**
	 * 根据项目ID查询二级项目信息与项目进度信息
	 */
	public List<Map<String, Object>> findLeftScheduleList(String projectId) {
		Subproject subProject = new Subproject();
		subProject.setProjectId(projectId);
		List<Map<String, Object>> list = subprojectDao.findLeftScheduleList(subProject);
		if(list !=null && list.size()<=0){
			return subprojectDao.findSubprojectScheduleList(subProject);
		}
		return list;
	}
	
	/**
	 * 更新项目状态
	 */
	@Transactional(readOnly = false)
	public void udpateStrtus(Subproject subProject) {
		subprojectDao.udpateStrtus(subProject);
	}
	
	/**
	 * 根据一级项目ID统计所有二级项目的楼栋号
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	public List<Map<String, Object>> countBuilding(String projectId,String building) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectId",projectId);
		map.put("building", building);
		return subprojectDao.countBuilding(map);
	}
	/**
	 * 根据一级项目ID获取二级项目列表数据
	 * @param proID 一级项目ID
	 * @return
	 */
	public List<Map<String, Object>> getSubByProID(String proID){
		if(StringUtils.isBlank(proID))
			return new ArrayList<Map<String, Object>>();
		else
			return subprojectDao.getSubByProID(proID);
	}
	/**
	 * 根据户型获取二级项目列表数据
	 * @param proID 项目ID
	 * @param houseType 户型
	 * @return
	 */
	public List<Map<String, Object>> getSubByHouseType(String proID,String houseType){
		if(StringUtils.isBlank(proID)||StringUtils.isBlank(houseType))
			return new ArrayList<Map<String, Object>>();
		else{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("proID", proID);
			map.put("houseType", houseType);
			return subprojectDao.getSubByHouseType(map);
		}
	}
	/**
	 * 根据一级 项目名称获取对应的二级项目信息
	 * @param proName
	 * @return
	 */
	public List<Subproject> getSubsByProjectName(String proName) {
		Project project = new Project();
		project.setName(proName);
		Subproject subProject = new Subproject();
		subProject.setProject(project);
		List<Subproject> listSub = this.getSubByConditionForInventory(subProject);
		return listSub;
	}
	/**
	 * 获得户型分组数据
	 * @param projectName
	 * @return
	 */
	public List<Subproject> getSubHouseTypeByProjectName(String projectName) {
		Project project = new Project();
		project.setName(projectName);
		Subproject subProject = new Subproject();
		subProject.setProject(project);
		subProject.setGbStr("housetype");
		List<Subproject> listSub = this.getSubByConditionForInventory(subProject);
		return listSub;
	}
	/**
	 * 根据条件获取相应的二级项目列表数据
	 * @param subProject
	 * @return
	 */
	public List<Subproject> getSubByConditionForInventory(Subproject subProject) {
		List<Subproject> listSub = subprojectDao.getSubByConditionForInventory(subProject);
		if(listSub==null){
			listSub = new ArrayList<Subproject>();
		}
		return listSub;
	}
	/**
	 * 根据项目名称和户型对楼栋号进行数据分组
	 * @param proName
	 * @param houseType
	 * @return
	 */
	public List<Subproject> getSubsByProNameAndHouseType(String proName,String houseType) {
		Project project = new Project();
		project.setName(proName);
		Subproject subProject = new Subproject();
		subProject.setProject(project);
		subProject.setHouseType(houseType);
		subProject.setGbStr("building");
		List<Subproject> listSub = this.getSubByConditionForInventory(subProject);
		return listSub;
	}
	/**
	 * 修改流程状态
	 * @param project
	 */
	@Transactional(readOnly = false)
	public void updateWorkflow(Subproject subproject) {
		subprojectDao.updateWorkflow(subproject);
	}
	/**
	 * 设计师填写
	 * @param project
	 */
	@Transactional(readOnly = false)
	public void adddesigner(Subproject subproject) {
		subprojectDao.adddesigner(subproject);
	}
	public String getSubIdByProID(Subproject subproject){
	    return subprojectDao.getSubIdByProID(subproject);
	}


	/**
	 * 根据一级项目名称和楼栋获取二级项目
	 * @param subproject
	 * @return
	 */
	public Subproject getOneByProjectNameAndBuild(String projectName,String building){
		Project project = new Project();
		project.setName(projectName);
		Subproject subproject = new Subproject();
		subproject.setBuilding(building);
		subproject.setProject(project);
		return this.getOneByCondition(subproject);
	}
	/**
	 * 根据相应的信息获取单个二级项目信息
	 * @param subproject
	 * @return
	 */
	public Subproject getOneByCondition(Subproject subproject){
		subproject = subprojectDao.getOneByCondition(subproject);
		if(subproject==null){
			subproject = new Subproject();
		}
		return subproject;
	}
	
	public Subproject getOneByProjectAndBuild(Subproject subproject){
		return subprojectDao.getOneByProjectAndBuild(subproject);
	}

	/**
	 * 根据一级项目Id和户型获取相应的二级项目数据
	 * @param houseTypes
	 * @param projectId
	 * @return
	 */
	public List<Subproject> getByHouseTypes(String[] houseTypes,String projectId){
		if(houseTypes==null || houseTypes.length==0){
			return new ArrayList<Subproject>();
		}
		List<Subproject> list = new ArrayList<Subproject>();
		Project project = new Project();
		project.setId(projectId);
		Subproject subproject;
		for(String houseType:houseTypes){
			subproject = new Subproject();
			subproject.setProject(project);
			subproject.setHouseType(houseType);
			list.addAll(this.getByCondition(subproject));
		}
		return list;
	}
	/**
	 * 根据一级项目Id和楼栋获取相应的二级项目详情
	 * @param buildings
	 * @param projectId
	 * @return
	 */
	public List<Subproject> getByBuildings(String[] buildings,String projectId){
		if(buildings==null || buildings.length==0){
			return new ArrayList<Subproject>();
		}
		List<Subproject> list = new ArrayList<Subproject>();
		Project project = new Project();
		project.setId(projectId);
		Subproject subproject;
		for(String building:buildings){
			subproject = new Subproject();
			subproject.setProject(project);
			subproject.setBuilding(building);
			list.addAll(this.getByCondition(subproject));
		}
		return list;
	}
	/**
	 * 抽出集合中的楼栋
	 * @param list
	 * @return
	 */
	public List<String> getBuildingsBySubs(List<Subproject> list){
		List<String> buildings = new ArrayList<String>();
		for(Subproject subproject:list){
			buildings.add(subproject.getBuilding());
		}
		return buildings;
	}
	/**
	 * 根据条件获取相应的二级项目列表
	 * @param subproject
	 * @return
	 */
	private List<Subproject> getByCondition(Subproject subproject){
		List<Subproject> list = subprojectDao.getByCondition(subproject);
		if(list==null){
			list = new ArrayList<Subproject>();
		}
		return list;
	}

	public Map<String, Subproject> findAllBuildingNameByProject(Subproject subproject){
		List<Subproject> subprojects = subprojectDao.findAllBuildingNameByProject(subproject);
		Map<String, Subproject> buildingNameMapping = new HashMap<String, Subproject>();
		for(Subproject sp : subprojects){
			String compositeKey = buildCompositeKey(sp.getProjectId(), sp.getBuilding());
			buildingNameMapping.put(compositeKey, sp);
		}
		return buildingNameMapping;
	}

	/**
	 * 组建二级项目的组合key
	 * @param projectId
	 * @param buildingNO
	 * @return
	 */
	public static String buildCompositeKey(String projectId, String buildingNO){
		return String.format(SUBPROJ_COMPOSITE_KEY_TEMPLATE, projectId, buildingNO);
	}

	/**
	 * 根据项目编号和楼栋编号字符串(1,2,3)
	 * 换算楼栋的显示名称字符串(1#,2#)
	 * @param projectId
	 * @param buildingStr
	 * @return
	 */
	public String getBuilDisplayNameStr(String projectId, String buildingStr){
		if(StringUtils.isEmpty(projectId) || StringUtils.isEmpty(buildingStr)){
			return "";
		}
		//String [] builds = buildingStr.split(",");
		String [] builds = CommonUtils.stringToStringArray(buildingStr);
		StringBuffer str = new StringBuffer();
		
		Subproject subproject = new Subproject();
		
		for(int i = 0; i< builds.length; i++){
			subproject.setProjectId(projectId);
			subproject.setBuilding(builds[i]); 
			Subproject s = this.getOneByProjectAndBuild(subproject);
			
			if(null != s&& StringUtils.
					isNotEmpty(s.getBuildingDisplayName())){
				if(i == (builds.length-1) ){
					str.append(s.getBuildingDisplayName());
				}else{
					str.append(s.getBuildingDisplayName()).append(",");
				}
				
			}
		}
		return str.toString();
	}
}