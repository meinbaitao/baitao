/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.commperson;


import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.person.dao.CommonPersonDao;
import com.bt.modules.person.entity.CommonPerson;
import com.bt.modules.person.service.CommonPersonService;
import com.bt.modules.purchase.dao.PurchaseDao;
import com.bt.modules.purchase.entity.Purchase;
import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * DAO接口
 * @author xiaocai
 */

public class CommonPersonServiceTest extends BasicTest {
	@Autowired
	private CommonPersonService commonPersonService;

	@Test
	public void insert(){
		CommonPerson commonPerson = new CommonPerson();
		commonPerson.setId(IdGen.uuid());
		commonPerson.setAddress("广州天河");
		commonPerson.setPhone("13800138000");
		commonPerson.setName("陈好");
		commonPersonService.insert(commonPerson);
		commonPerson = new CommonPerson();
		commonPerson.setId(IdGen.uuid());
		commonPerson.setAddress("广州天河");
		commonPerson.setPhone("13800138000");
		commonPerson.setName("夏天");
		commonPersonService.insert(commonPerson);
	}
	
	@Test
	public void find(){
		List<CommonPerson> listCP = commonPersonService.findList(null);
		for(CommonPerson cp:listCP){
			System.out.println(cp.getAddress());
		}
	}
}