/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.cost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.cost.entity.VolumeControl;
import com.bt.modules.cost.dao.VolumeControlDao;

/**
 * 成本控量Service
 * @author pc
 * @version 2015-09-06
 */
@Service
@Transactional(readOnly = true)
public class VolumeControlService extends CrudService<VolumeControlDao, VolumeControl> {

	
	@Autowired
	private VolumeControlDao volumeControlDao;
	public VolumeControl get(String id) {
		return super.get(id);
	}
	
	public List<VolumeControl> findList(VolumeControl volumeControl) {
		return super.findList(volumeControl);
	}
	
	public Page<VolumeControl> findPage(Page<VolumeControl> page, VolumeControl volumeControl) {
		return super.findPage(page, volumeControl);
	}
	
	@Transactional(readOnly = false)
	public void save(VolumeControl volumeControl) {
		super.save(volumeControl);
	}
	
	@Transactional(readOnly = false)
	public void insert(VolumeControl volumeControl) {
		volumeControlDao.insert(volumeControl);
	}
	
	@Transactional(readOnly = false)
	public void delete(VolumeControl volumeControl) {
		super.delete(volumeControl);
	}
	
}