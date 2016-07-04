/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.receiving;


import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.receiving.dao.ReceivingAccidentDao;
import com.bt.modules.receiving.entity.ReceivingAccident;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * DAO接口
 * @author xiaocai
 */

public class ReceivingAccidentDaoTest extends BasicTest {
	@Autowired
	private ReceivingAccidentDao receivingAccidentDao;

	@Test
	public void insert(){
		String receivingAccidentId = IdGen.uuid();
		
		ReceivingAccident receivingAccident = new ReceivingAccident();
		receivingAccident.setReceivingAccidentId(receivingAccidentId);
		receivingAccident.setIsinfluence("y");
		receivingAccident.setDescription("");
		
		receivingAccidentDao.insert(receivingAccident);
	}
	
	@Test
	public void update(){
		String manageId = "903f93403b044fe3b6da609692de3d2f";
		ReceivingAccident receivingAccident = new ReceivingAccident();
		receivingAccident.setReceivingAccidentId(manageId);
		receivingAccident = receivingAccidentDao.get(receivingAccident);
		System.out.println("修改前："+receivingAccident);
		receivingAccident.setIsinfluence("n");
		receivingAccident.setDescription(new Date().toString());
		receivingAccidentDao.update(receivingAccident);
		receivingAccident = receivingAccidentDao.get(receivingAccident);
		System.out.println("修改后："+receivingAccident);
	}
}