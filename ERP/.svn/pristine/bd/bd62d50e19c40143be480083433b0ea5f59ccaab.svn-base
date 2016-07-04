/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.financereport.service;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.apache.ibatis.io.Resources;    

import com.bt.modules.finance.dao.LaborSettlementDao;
import com.bt.modules.financereport.entity.BtgFinancereport;
import com.bt.modules.financereport.dao.BtgFinancereportDao;

/**
 * 分项目财务报表Service
 * @author lky
 * @version 2015-12-21
 */
@Service
@Transactional(readOnly = true)
public class BtgFinancereportService extends CrudService<BtgFinancereportDao, BtgFinancereport> {
	@Autowired
	private BtgFinancereportDao dao;
	public BtgFinancereport get(String id) {
		return super.get(id);
	}
	
	public List<BtgFinancereport> findList(BtgFinancereport btgFinancereport) {
		return super.findList(btgFinancereport);
	}
	
	public Page<BtgFinancereport> findPage(Page<BtgFinancereport> page, BtgFinancereport btgFinancereport) {
		return super.findPage(page, btgFinancereport);
	}
	public Page<BtgFinancereport> findPageFlag(Page page, BtgFinancereport btgFinancereport,List<BtgFinancereport> list) {
		return super.findPageFlag(page, btgFinancereport,list);
	}
	
	@Transactional(readOnly = false)
	public void save(BtgFinancereport btgFinancereport) {
		super.save(btgFinancereport);
	}
	
	@Transactional(readOnly = false)
	public void delete(BtgFinancereport btgFinancereport) {
		super.delete(btgFinancereport);
	}
	@Transactional(readOnly = false)
	public List<BtgFinancereport> addList(Map<String, Integer> map) 
	{
	  List<BtgFinancereport> list=(List<BtgFinancereport>)dao.getTestProc(map);;	 
      return list;
      
  }

}