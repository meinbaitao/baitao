/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.Exceptions;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.DataHandleDao;
import com.thinkgem.jeesite.modules.sys.dao.MenuDao;
import com.thinkgem.jeesite.modules.sys.entity.DataHandle;
import com.thinkgem.jeesite.modules.sys.entity.Menu;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 数据操作记录
 * @author yhh
 */
public class DataHandleUtils {
	
	public static final String CACHE_MENU_NAME_PATH_MAP = "menuPathNameMap";
	
	public static final String METHOD_SAVE = "/save";
	public static final String METHOD_UPDATE = "/update";
	public static final String METHOD_DELETE = "/delete";
	
	public static final String SAVE = "保存";
	public static final String UPDATE = "更新";
	public static final String DELETE = "删除";
	
	private static DataHandleDao dataHandleDao = SpringContextHolder.getBean(DataHandleDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	
	public static void save(HttpServletRequest request, String manu){
		save(request, null, null, manu);
	}
	
	public static void save(HttpServletRequest request, Object handler, Exception ex, String menu){
		User user = UserUtils.getUser();
		if (user != null && user.getId() != null){
			DataHandle handle = new DataHandle();
			handle.setMenu(menu);
			handle.setRemoteAddr(StringUtils.getRemoteAddr(request));
			handle.setRequestUri(request.getRequestURI());
			handle.setParams(request.getParameterMap());
			handle.setMethod(getMethod(request.getRequestURI()));
			
			new SaveThread(handle, handler, ex).start();
		}
	}

	public static class SaveThread extends Thread{
		
		private DataHandle handle;
		private Object handler;
		private Exception ex;
		
		public SaveThread(DataHandle handle, Object handler, Exception ex){
			super(SaveThread.class.getSimpleName());
			this.handle = handle;
			this.handler = handler;
			this.ex = ex;
		}
		
		@Override
		public void run() {
			// 获取标题
			if (StringUtils.isBlank(handle.getMenu())){
				handle.setMenu(getMenuNamePath(handle.getRequestUri()));
			}
			// 如果有异常，设置异常信息
			handle.setException(Exceptions.getStackTraceAsString(ex));
			//	无标题无异常则不保存
			if (StringUtils.isBlank(handle.getMenu()) && StringUtils.isBlank(handle.getException())){
				return;
			}
			// 保存
			handle.preInsert();
			dataHandleDao.insert(handle);
		}
	}

	/**
	 * 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
	 */
	public static String getMenuNamePath(String requestUri){
		String menuName = null;
		requestUri = subRequestUri(requestUri);
		String href = StringUtils.substringAfter(requestUri, Global.getAdminPath());
		@SuppressWarnings("unchecked")
		Map<String, String> menuMap = (Map<String, String>)CacheUtils.get(CACHE_MENU_NAME_PATH_MAP);
		if (menuMap == null){
			menuMap = Maps.newHashMap();
			List<Menu> menuList = menuDao.findAllList(new Menu());
			for (Menu menu : menuList){
				// 获取菜单名称路径（如：系统设置-机构用户-用户管理-编辑）
				String namePath = "";
				if (menu.getParentIds() != null){
					List<String> namePathList = Lists.newArrayList();
					for (String id : StringUtils.split(menu.getParentIds(), ",")){
						if (Menu.getRootId().equals(id)){
							continue; // 过滤跟节点
						}
						for (Menu m : menuList){
							if (m.getId().equals(id)){
								namePathList.add(m.getName());
								break;
							}
						}
					}
					namePathList.add(menu.getName());
					namePath = StringUtils.join(namePathList, "-");
				}
				// 设置菜单名称路径
				if (StringUtils.isNotBlank(menu.getHref())){
					menuMap.put(menu.getHref(), namePath);
				}else if (StringUtils.isNotBlank(menu.getPermission())){
					for (String p : StringUtils.split(menu.getPermission())){
						menuMap.put(p, namePath);
					}
				}
				
			}
			CacheUtils.put(CACHE_MENU_NAME_PATH_MAP, menuMap);
		}
		
		for (String key : menuMap.keySet()) {
			if(key.contains(href)){
				menuName = menuMap.get(key);
			}
		}
		
		return menuName;
	}

	public static String subRequestUri(String requestUri){
		if(requestUri.endsWith(METHOD_SAVE)){
			int endIndex = requestUri.indexOf(METHOD_SAVE);
			return requestUri.substring(0, endIndex);
		}else if(requestUri.endsWith(METHOD_DELETE)){
			int endIndex = requestUri.indexOf(METHOD_DELETE);
			return requestUri.substring(0, endIndex);
		}else if(requestUri.endsWith(METHOD_UPDATE)){
			int endIndex = requestUri.indexOf(METHOD_UPDATE);
			return requestUri.substring(0, endIndex);
		}else{
			return requestUri;
		}
	}
	
	public static String getMethod(String requestUri){
		if(requestUri.endsWith(METHOD_SAVE) ){
			return SAVE;
		}else if(requestUri.endsWith(METHOD_UPDATE)){
			return UPDATE;
		}else if(requestUri.endsWith(METHOD_DELETE)){
			return DELETE;
		}else{
			return null;
		}
	}
	
	
}
