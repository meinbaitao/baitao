/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.purchase;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.project.entity.Project;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.test.basic.BasicTest;
import com.bt.modules.utils.CommonStatus;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 采购需求	service接口
 * @author xiaocai
 */

public class PurchaseDemandServiceTest extends BasicTest {
	@Autowired
	private PurchaseDemandService purchaseDemandService;	//申购需求
	
	@Test
	public void getListForYYZY(){	//运营专员查看列表数据
		Project project = new Project("8f28c42d4a8c401597244e20958a8750");
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obbase");
		purchaseDemand.setProject(project);
		purchaseDemand.setIsStatus(CommonStatus.PURCHASE_DZP_YYZY);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(), purchaseDemand);
		List<PurchaseDemand> listPD = page.getList();
		System.out.println("运营专员");
		for(PurchaseDemand obj:listPD){
			if(obj.getExtraData().containsKey("aCount")&&obj.getExtraData().containsKey("pCount"))
				System.out.print(obj.getExtraData().get("aCount")+"-"+obj.getExtraData().get("pCount")+"->");
			System.out.print(obj.getOrderBomBase().getOrderBomNo());
			System.out.print("【"+obj.getOrderBomBase().getOrderTypeVal()+"】");
			System.out.print("【"+obj.getOrderBomBase().getStatus()+"】");
			System.out.println();
		}
	}
	
	@Test
	public void getListForYYZG(){	//运营主管
		Project project = new Project("8f28c42d4a8c401597244e20958a8750");
		PurchaseDemand purchaseDemand = new PurchaseDemand();
		purchaseDemand.setGlfpGB("obbase");
		purchaseDemand.setProject(project);
		purchaseDemand.setIsStatus(CommonStatus.PURCHASE_DZP_YYZG);
		Page<PurchaseDemand> page = purchaseDemandService.getListForProject(new Page<PurchaseDemand>(), purchaseDemand);
		List<PurchaseDemand> listPD = page.getList();
		System.out.println("运营主管");
		for(PurchaseDemand obj:listPD){
			if(obj.getExtraData().containsKey("aCount")&&obj.getExtraData().containsKey("pCount"))
				System.out.print(obj.getExtraData().get("aCount")+"-"+obj.getExtraData().get("pCount")+"->");
			System.out.print(obj.getOrderBomBase().getOrderBomNo());
			System.out.print("【"+obj.getOrderBomBase().getOrderTypeVal()+"】");
			System.out.print("【"+obj.getOrderBomBase().getStatus()+"】");
			System.out.println();
		}
	}
	
}