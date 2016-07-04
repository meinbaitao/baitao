package com.bt.common.messages;

import java.text.MessageFormat;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import com.google.common.base.Strings;

/**
 * 
 * @Description:系统资源文件读取器
 * @author 许俊雄
 */
public class ErrorResources {

	protected static Logger logger = Logger.getLogger(ErrorResources.class
			.toString());

	private final static String MESSAGE_BUNDLE_NAME = "ErrorCode";

	private ResourceBundle res;

	// singleton
	protected static ErrorResources instance = new ErrorResources();

	public static ErrorResources getInstance() {
		return instance;
	}

	// 无参构造方法
	private ErrorResources() {
		loadResourceBundle();
	}

	public void loadResourceBundle() {
		res = ResourceBundle.getBundle(MESSAGE_BUNDLE_NAME);
		if (res == null) {
			logger.warn("No resource bundle is found: " + MESSAGE_BUNDLE_NAME);
		}
	}

	public String getMessage(String key, String defVal) {
		if (!Strings.isNullOrEmpty(res.getString(key))) {
			return res.getString(key);
		} else {
			return defVal;
		}
	}

	public String getMessage(String key) {
		if (!Strings.isNullOrEmpty(res.getString(key))) {
			return res.getString(key);
		} else {
			return String.format("请在%s中定义异常信息%s", MESSAGE_BUNDLE_NAME, key);
		}
	}
	
	public String getFormateMessage(String key, String param){
		return this.getFormateMessage(key, new String[]{param});
	}

	public String getFormateMessage(String key, String[] params){
		String msg = getMessage(key);
		if(!Strings.isNullOrEmpty(msg)){
			MessageFormat messageFormat = new MessageFormat(msg);
			msg =  messageFormat.format(params);
		}
		return msg;
	}
}
