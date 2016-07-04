package com.thinkgem.jeesite.modules.sys.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.WhitelistsDao;
import com.thinkgem.jeesite.modules.sys.entity.Whitelists;
import com.thinkgem.jeesite.modules.sys.utils.WhitelistsUtils;

/**
 * 白名单Service
 * @author xujianpeng
 * @version 2016-04-28
 */
@Service
@Transactional(readOnly = true)
public class WhitelistsService extends CrudService<WhitelistsDao, Whitelists> {
	
	@Autowired
	private WhitelistsDao whitelistsDao;
	
	@Transactional(readOnly = false)
	public void save(Whitelists whitelists) {
		
		//如果当前是创建白名单则为默认为启用
		if(StringUtils.isBlank(whitelists.getId())){
			whitelists.setStatus("1");
		}
		super.save(whitelists);
		CacheUtils.remove(WhitelistsUtils.CACHE_WHITELISTS_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Whitelists whitelists) {
		super.delete(whitelists);
		CacheUtils.remove(WhitelistsUtils.CACHE_WHITELISTS_MAP);
	}

	
	/**
	 * 根据白名单名称查找对应的角色英文名 
	 * @param name
	 * @return
	 */
	public Whitelists findWhitelistByName(Whitelists whitelists){
		return whitelistsDao.findWhitelistByName(whitelists);
	}
	
	/**
	 * 设置启用、停用白名单
	 * @param whitelists
	 * @return
	 */
	@Transactional(readOnly = false)
	public void setting(Whitelists whitelists) {
		whitelistsDao.setting(whitelists);
		CacheUtils.remove(WhitelistsUtils.CACHE_WHITELISTS_MAP);
	}
}
