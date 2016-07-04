/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.inventory.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.inventory.dao.StandingBookDao;
import com.bt.modules.inventory.entity.StandingBook;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 库存台帐表Service
 * @author xiaocai
 * @version 2016-1-13
 */
@Service
@Transactional(readOnly = true)
public class StandingBookService extends CrudService<StandingBookDao, StandingBook> {

	@Autowired
	private StandingBookDao standingBookDao;
	/**
	 * 获取接收分组数据
	 * @return
	 */
	public List<StandingBook> getGBSendee(StandingBook standingBook){
		List<StandingBook> listSB = standingBookDao.getGBSendee(standingBook);
		if(listSB==null){
			listSB = new ArrayList<StandingBook>();
		}
		List<StandingBook> reSBs = new ArrayList<StandingBook>();
		for(StandingBook s:listSB){
			if(StringUtils.isBlank(s.getSendee())){
				continue;
			}
			reSBs.add(s);
		}
		return reSBs;
	}
	/**
	 * 插入日志记录
	 */
	public StandingBook insertStandingBook(StandingBook standingBook){
		standingBook.setOperateUser(UserUtils.getUser());
		standingBook.setCreateBy(UserUtils.getUser());
		standingBook.setCreateDate(new Date());
		standingBook.setUpdateBy(UserUtils.getUser());
		standingBook.setUpdateDate(new Date());
		//插入数据
		standingBookDao.insert(standingBook);
		return standingBook;
	}
	/**
	 * 根据日志类型统计当天相应的日志类型数据
	 * @param date
	 * @param tranType
	 * @return
	 */
	public int getTodayCount(Date date,String tranType){
		if(date==null){
			date = new Date();
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("date", date);
		map.put("tranType", tranType);
		return standingBookDao.getTodayCount(map);
	}
	/**
	 * 查看相关列表数据
	 */
	public Page<StandingBook> findPage(Page<StandingBook> page, StandingBook standingBook) {
		return super.findPage(page, standingBook);
	}
	
	public StandingBook get(String id) {
		return super.get(id);
	}
	
	public List<StandingBook> findList(StandingBook standingBook) {
		return super.findList(standingBook);
	}
	
	@Transactional(readOnly = false)
	public void save(StandingBook standingBook) {
		super.save(standingBook);
	}
	
	@Transactional(readOnly = false)
	public void insert(StandingBook standingBook){
		standingBookDao.insert(standingBook);
	}
	
	@Transactional(readOnly = false)
	public void delete(StandingBook standingBook) {
		super.delete(standingBook);
	}
	
}