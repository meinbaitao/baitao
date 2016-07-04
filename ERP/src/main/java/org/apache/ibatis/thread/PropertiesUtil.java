package org.apache.ibatis.thread;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {

	private static String filename = "/mybatis-refresh.properties";
	private static Properties pro = new Properties();
	static {
		InputStream  is = null;
		try {
			is = PropertiesUtil.class.getResourceAsStream(filename);
			pro.load(is);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Load mybatis-refresh “"+filename+"” file error.");
		}finally{
			if(null !=is){
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static int getInt(String key) {
		int i = 0;
		try {
			i = Integer.parseInt(getString(key));
		} catch (Exception e) {
		}
		return i;
	}

	public static String getString(String key) {
		return pro == null ? null : pro.getProperty(key);
	}

}
