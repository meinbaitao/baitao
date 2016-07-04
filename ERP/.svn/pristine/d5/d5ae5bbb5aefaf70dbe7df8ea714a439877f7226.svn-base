/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.labour;


import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.labour.dao.LabStaDao;
import com.bt.modules.labour.entity.LabSta;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * DAO接口
 * @author xiaocai
 */

public class LabStaDaoTest extends BasicTest {
	@Autowired
	private LabStaDao LabStaDao;

	@Test
	public void insert(){
		String id = IdGen.uuid();
		
		LabSta LabSta = new LabSta();
		LabSta.setLabStaId(id);
		LabSta.setCreatets(new Date());
		LabSta.setUpdatets(new Date());
		
		LabStaDao.insert(LabSta);
	}
	
	@Test
	public void update(){
		List<LabSta> pcs = LabStaDao.findAllList();
		String id = "";
		id = pcs.size()>0?pcs.get(0).getLabStaId():"";
		LabSta LabSta = new LabSta();
		LabSta.setLabStaId(id);
		LabSta = LabStaDao.get(LabSta);
		System.out.println("修改前："+LabSta);
		LabSta.setUpdatets(new Date());
		LabStaDao.update(LabSta);
		LabSta = LabStaDao.get(LabSta);
		System.out.println("修改后："+LabSta);
	}
}