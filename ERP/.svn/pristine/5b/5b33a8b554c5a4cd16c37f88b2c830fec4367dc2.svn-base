package com.bt.modules.test.performance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.stoneSchedule.service.StoneScheduleService;
import com.bt.modules.test.basic.BasicTest;


/**
 * 简单的性能测试
 * @author xiaocai
 *
 */
public class PerformanceTest extends BasicTest{

	@Autowired
	private StoneScheduleService stoneScheduleService;	//石材进度跟进
	@Autowired
	private OrderBomBaseService orderBomBaseService;	//下料单
	@Autowired
	private ProductionService productionService;		//加工单
	
	@Test
	public void getListForProject1(){
		long s1 = System.currentTimeMillis();
		stoneScheduleService.getListForProject(null);
		long e1 = System.currentTimeMillis();
		System.out.println("getListForProject1:"+(e1-s1));
	}
	@Test
	public void getListForProject2(){
		long s2 = System.currentTimeMillis();
		Project project = new Project();
		project.setName("");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setProject(project);
		
		List<OrderBomBase> listOBB = orderBomBaseService.getListForStoneSchedule(orderBomBase);
		//循环获取汇总数据
		for(OrderBomBase obb:listOBB){
			Production p = new Production();
			p.setProject(obb.getProject());
			p.setStatus("");
			obb.getExtraData().put("countOrderBase", productionService.countOrderBase(p));				//设计下料总量
			obb.getExtraData().put("waitIntakeCount", productionService.waitIntakeCount(p));			//待入库量
			obb.getExtraData().put("hasIntakeCount", productionService.hasIntakeCount(p));				//已入库量
			obb.getExtraData().put("waitSendCount", productionService.waitSendCount(p));				//待发货量
			obb.getExtraData().put("waitCarCount", productionService.waitCarCount(p));					//待派车量
			obb.getExtraData().put("hasCarWaitSendCount", productionService.hasCarWaitSendCount(p));	//已派车未发量
			obb.getExtraData().put("sendCount", productionService.sendCount(p));						//在途箱数
		}
		long e2 = System.currentTimeMillis();
		System.out.println("getListForProject2:"+(e2-s2));
	}
	
}
