/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.jiaContract;


import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.contract.entity.StoneCarriageContractBase;
import com.bt.modules.contract.service.JiaContractService;
import com.bt.modules.contract.service.StoneCarriageContractBaseService;
import com.bt.modules.test.basic.BasicTest;

/**
 * @author xiaocai
 */

public class StoneContractServiceTest extends BasicTest {
	@Autowired
	private StoneCarriageContractBaseService stoneCarriageContractBaseService;

	@Test
	public void getByPBName(){
		List<StoneCarriageContractBase> list =  stoneCarriageContractBaseService.getByPBName("");
		for(StoneCarriageContractBase s:list){
			System.out.println(s.getPartyBName());
		}
	}
	@Test
	public void groupByPBName(){
		List<StoneCarriageContractBase> list =  stoneCarriageContractBaseService.groupByPBName();
		for(StoneCarriageContractBase s:list){
			System.out.println(s.getPartyBName());
		}
	}
	
}