package com.thinkgem.jeesite.system;
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */


import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.test.basic.BasicTest;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * DAO接口
 * @author xiaocai
 */

public class SystemServiceTest extends BasicTest {
	@Autowired
	private SystemService systemService;

	@Test
	public void selByCondition(){
		systemService.validatePassword("3", "02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032");
	}
	
}