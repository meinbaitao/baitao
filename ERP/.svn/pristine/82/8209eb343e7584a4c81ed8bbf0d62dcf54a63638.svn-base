/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.labour;


import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.labour.dao.LabStaPriceDao;
import com.bt.modules.labour.entity.LabStaPrice;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * DAO接口
 * @author xiaocai
 */

public class LabStaPriceDaoTest extends BasicTest {
	@Autowired
	private LabStaPriceDao LabStaPriceDao;

	@Test
	public void insert(){
		String id = IdGen.uuid();
		
		LabStaPrice LabStaPrice = new LabStaPrice();
		LabStaPrice.setLabStaPriceId(id);
		LabStaPrice.setCreatets(new Date());
		LabStaPrice.setUpdatets(new Date());
		
		LabStaPriceDao.insert(LabStaPrice);
	}
	
	@Test
	public void update(){
		List<LabStaPrice> pcs = LabStaPriceDao.findAllList();
		String id = "";
		id = pcs.size()>0?pcs.get(0).getLabStaPriceId():"";
		LabStaPrice LabStaPrice = new LabStaPrice();
		LabStaPrice.setLabStaPriceId(id);
		LabStaPrice = LabStaPriceDao.get(LabStaPrice);
		System.out.println("修改前："+LabStaPrice);
		LabStaPrice.setUpdatets(new Date());
		LabStaPriceDao.update(LabStaPrice);
		LabStaPrice = LabStaPriceDao.get(LabStaPrice);
		System.out.println("修改后："+LabStaPrice);
	}
}