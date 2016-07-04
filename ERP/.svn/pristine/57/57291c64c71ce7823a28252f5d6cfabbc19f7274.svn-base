package com.thinkgem.jeesite.modules.sys.utils;

import java.util.List;

import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.WhitelistsDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.Whitelists;

/**
 * 白名单工具类
 * @author xujianpeng
 * @version 2016-04-28
 */
public class WhitelistsUtils {
	
	private static WhitelistsDao whitelistsDao = SpringContextHolder.getBean(WhitelistsDao.class);

	public static final String CACHE_WHITELISTS_MAP = "whitelistsMap";
	
	/**
	 * 根据白名单查找对应的角色英文名
	 * @param name
	 * @return
	 */
	public static String getWhitelistsList(String name){
		
		String roleEnName = (String)CacheUtils.get(CACHE_WHITELISTS_MAP+"_"+name);
		if (roleEnName==null){
			Whitelists w = new Whitelists();
			w.setName(name);
			Whitelists white = whitelistsDao.findWhitelistByName(w);
			if(null ==white) return "";
			//如果白名单设置为关闭状态，则所有人都能看
			if(StringUtils.equals(white.getStatus(), "0")){
				String enNames = getRolesEnName();
				CacheUtils.put(CACHE_WHITELISTS_MAP+"_"+name, enNames);
				return enNames;
			}
			//根据白名单设置的角色查看对应信息
			CacheUtils.put(CACHE_WHITELISTS_MAP+"_"+name, white.getRoleEnName());
			return white.getRoleEnName();
		}
		return roleEnName;
	}
	
	/**
	 * 获取或有角色的英文名称
	 * @return
	 */
	private static String getRolesEnName() {
		StringBuilder sb = new StringBuilder(); 
		List<Role> roleList =UserUtils.getRoleList();
		for (Role role : roleList) {
			sb.append(role.getEnname()+",");
		}
		return StringUtils.substringBeforeLast(sb.toString(),",");
	}
	
}
