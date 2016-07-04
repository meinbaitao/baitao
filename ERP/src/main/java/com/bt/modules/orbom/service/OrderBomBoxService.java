/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bt.modules.orbom.dao.OrderBomBoxDao;
import com.bt.modules.orbom.entity.OrderBomBox;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 下料单箱信息表Service
 * @author ljp
 * @version 2015-08-07
 */
@Service
@Transactional(readOnly = true)
public class OrderBomBoxService extends CrudService<OrderBomBoxDao, OrderBomBox> {

	@Autowired
	private OrderBomBoxDao orderBomBoxDao;
	
	public OrderBomBox get(String id) {
		return super.get(id);
	}
	
	public List<OrderBomBox> findList(OrderBomBox orderBomBox) {
		return super.findList(orderBomBox);
	}
	
	public Page<OrderBomBox> findPage(Page<OrderBomBox> page, OrderBomBox orderBomBox) {
		return super.findPage(page, orderBomBox);
	}
	
	@Transactional(readOnly = false)
	public void save(OrderBomBox orderBomBox) {
		super.save(orderBomBox);
	}
	
	@Transactional(readOnly = false)
	public void delete(OrderBomBox orderBomBox) {
		super.delete(orderBomBox);
	}
	
	/**
	 * 更改一个箱号的状态
	 * @param val
	 * @return
	 */
	@Transactional(readOnly = false)
	public boolean changeStatus(String boxId, String val){
		boolean OK_flag = false;
		try{
			OrderBomBox oBomBox = new OrderBomBox();
			oBomBox.setId(boxId);
			oBomBox.setStatus(val);
			orderBomBoxDao.updateOneBoxStatus(oBomBox);
			OK_flag = true;
		}catch(Exception e){
			e.printStackTrace();
			OK_flag = false;
		}
		return OK_flag;
	}
	/**
	 * 插入单条数据
	 * @param orderBomBox
	 */
	@Transactional(readOnly = false)
	public void insert(OrderBomBox orderBomBox) {
		super.dao.insert(orderBomBox);
	}
	/**
	 * 批量插入数据
	 * @param orderBomBox
	 */
	@Transactional(readOnly = false)
	public void batchOrderBomBox(List<OrderBomBox> orderBomBox) {
		for(OrderBomBox o:orderBomBox){
			super.dao.insert(o);
		}
	}
}