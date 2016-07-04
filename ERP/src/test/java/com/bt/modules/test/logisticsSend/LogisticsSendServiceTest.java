/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.logisticsSend;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bt.modules.logistics.dao.LogisticsSendDao;
import com.bt.modules.logistics.entity.LogisticsSend;
import com.bt.modules.logistics.service.LogisticsSendService;
import com.bt.modules.test.basic.BasicTest;
import com.bt.modules.utils.CommonStatus;

/**
 * @author xiaocai
 */
public class LogisticsSendServiceTest extends BasicTest {
	@Autowired
	private LogisticsSendService logisticsSendService;

	@Test
	public void logisticsSendStatusUtils(){
		List<String> ids = new ArrayList<String>();
		ids.add("55ef297d2a4244f3ab74aec81bb92981");
		ids.add("4a004336398e4256b82b0d6b8d0ebe00");
		ids.add("b5c564bcbdd54685839545f46c9c3c9d");
//		List<LogisticsSend> list = logisticsSendService.logisticsSendStatusUtils(ids, CommonStatus.PRODUCTION_DSH, CommonStatus.LOGISTICS_YFH);
//		for(LogisticsSend ls:list){
//			System.out.println("\n"+ls.getSeriesnumber());
//		}
		
	}
	
	
}