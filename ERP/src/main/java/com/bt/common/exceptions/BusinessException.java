package com.bt.common.exceptions;

import java.text.MessageFormat;

import com.bt.common.messages.ErrorResources;

/**
 * 自定义系统业务异常处理
 * @author 许俊雄
 *
 */
public class BusinessException extends Exception {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4971883064557160511L;

	private String msgCode;
	private String[] params;
	private String msg;

	public BusinessException() {
		super();
	}

	public BusinessException(String code) {
		this(code, "");
	}

	public BusinessException(String code, String param) {
		this(code, new String[] { param });
	}

	public BusinessException(String code, String param1, String param2) {
		this(code, new String[] { param1, param2 });
	}

	public BusinessException(String code, String[] params) {
		super(code);
		this.msgCode = code;
		this.params = params;

		// 获取资源代码对应描述
		this.msg = getMsgFromCfg(code, params);
	}

	/**
	 * 从配置文件中获取错误信息
	 * 
	 * @param errcode
	 * @param params
	 * @return
	 */
	public static String getMsgFromCfg(String errcode, String[] params) {
		String message = ErrorResources.getInstance().getMessage(errcode);
		return params == null ? message : MessageFormat.format(message,
				 params);
	}

	public String getMessageCode() {
		return this.msgCode;
	}

	public String[] getParams() {
		return params;
	}

	public String getMessage() {
		return msg;
	}

}
