/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.project.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.project.entity.Subproject;

/**
 * 项目二级信息DAO接口
 * @author yhh
 * @version 2015-08-01
 */
@MyBatisDao
public interface SubprojectDao extends CrudDao<Subproject> {
	
	/**
	 * 添加Mapping表关联信息
	 */
	public void addProjectMap(Map<String,Object> map);
	
	/**
	 * 根据一级项目ID关联Map查询二级项目信息
	 */
	public List<Subproject> findByProjectIdList(Subproject subProject);
	
	/**
	 * 根据一级项目ID关联Map查询二级项目信息的施工图文件
	 */
	public List<Subproject> findByPIdAttachmentList(Subproject subProject);
	
	
	/**
	 * 根据项目ID查询二级项目信息与项目进度信息
	 */
	public List<Map<String, Object>> findLeftScheduleList(Subproject subProject);
	
	/**
	 * 如果首次进来没填写进度则直接查询二级项目
	 */
	public List<Map<String, Object>> findSubprojectScheduleList(Subproject subProject);
	
	
	/**
	 * 更新项目状态
	 * @param subProject
	 */
	public void udpateStrtus(Subproject subProject);
	
	/**
	 * 根据一级项目ID统计所有二级项目的楼栋号
	 * @param project
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	public List<Map<String, Object>> countBuilding(Map<String,Object> map);
	
	
	public void delFlag(Subproject subProject);
	

	/**
	 * 根据一级项目ID获取二级项目列表数据
	 * @param proID 一级项目ID
	 * @return
	 */
	public List<Map<String, Object>> getSubByProID(String proID);
	/**
	 * 根据户型获取二级项目列表数据
	 * @param proID 项目ID
	 * @param houseType 户型
	 * @return
	 */
	public List<Map<String, Object>> getSubByHouseType(Map<String,Object> map);
	/**
	 * 根据一级项目名称获取对应的全部的二级项目
	 * @return List<Subproject>
	 */
	public List<Subproject> getSubByConditionForInventory(Subproject sub);
	
	/**
	 * 修改流程状态
	 * @param project
	 */
	public void updateWorkflow(Subproject subproject);
	
	/**
	 * 设计师填写
	 */
	public void adddesigner(Subproject subproject);
	
	/**
	 * 根据项目一级id和项目楼栋获取二级Id
	 * @param proId
	 * @param building
	 * @return
	 */
	public String getSubIdByProID(Subproject subproject);

	/**
	 * 通过项目编号 + 楼栋号查询一条二级项目信息
	 * @param subproject
	 * @return
	 */
	public Subproject getOneByProjectAndBuild(Subproject subproject);
	/**
	 * 根据条件获取二级项目
	 * @param subproject
	 * @return
	 */
	public Subproject getOneByCondition(Subproject subproject);
	public List<Subproject> getByCondition(Subproject subproject);

	/**
	 * 查询项目下所有楼栋的显示名
	 * @param subproject
	 * @return
	 */
	public List<Subproject> findAllBuildingNameByProject(Subproject subproject);

	public void updateStoneExpectDateById(Subproject subProject);
}