package com.thinkgem.jeesite.modules.dataQuery.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * 获取数据库连接
 * @author zhoujs
 * @version 2016-3-10
 */
public class DataQueryGetConn {

	// 数据库连接url
	private static String url;
	// 用户名
	private static String user;
	// 数据库密码
	private static String password;
	// properties对象
	private static Properties ps;
	// 输入流
	private static InputStream fis;

	public static Connection getMysqlConn() {
		Connection conn = null;
		try {

			// 获取输入流
			// 这种获取输入流的方式是最好的，无论你把配置文件放在什么地方，它都会去自动的查找它的
			// 因此无论是开发j2se项目还是j2ee的项目都应该使用这种加载的方式。
			fis = DataQueryGetConn.class.getClassLoader()
					.getResourceAsStream("jeesite.properties");

			ps = new Properties();

			// 把流加载到内存中
			ps.load(fis);

			// 关闭流
			fis.close();

			// 获取数据库url
			url = ps.getProperty("jdbc.url");
			// 获取用户名
			user = ps.getProperty("jdbc.username");
			// 获取密码
			password = ps.getProperty("jdbc.password");
			// 获取连接
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
