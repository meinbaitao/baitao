/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.test.comm;


import java.util.ArrayList;
import java.util.List;

import com.bt.modules.test.basic.BasicTest;

/**
 * DAO接口
 * @author xiaocai
 */

public class CommTest extends BasicTest {
	
	public static void main(String[] args) {
		List<String> ids = new ArrayList<String>();
		ids.add("123");
		ids.add("1234");
		ids.add("12345");
		System.out.println(ids.toString().replace("[", "").replace("]", ""));
	}
}