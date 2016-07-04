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
import com.bt.modules.cost.entity.VolumeControlDetail;
import com.bt.modules.cost.dao.VolumeControlDetailDao;

/**
 * 成本控量明细Service
 * @author pc
 * @version 2015-09-06
 */
@Service
@Transactional(readOnly = true)
public class VolumeControlDetailService extends CrudService<VolumeControlDetailDao, VolumeControlDetail> {

	
	@Autowired 
	private VolumeControlDetailDao volumeControlDetailDao;
	
	public VolumeControlDetail get(String id) {
		return super.get(id);
	}
	
	public List<VolumeControlDetail> findList(VolumeControlDetail volumeControlDetail) {
		return super.findList(volumeControlDetail);
	}
	
	public Page<VolumeControlDetail> findPage(Page<VolumeControlDetail> page, VolumeControlDetail volumeControlDetail) {
		return super.findPage(page, volumeControlDetail);
	}
	
	@Transactional(readOnly = false)
	public void save(VolumeControlDetail volumeControlDetail) {
		super.save(volumeControlDetail);
	}
	
	@Transactional(readOnly = false)
	public void insert(VolumeControlDetail volumeControlDetail) {
		volumeControlDetailDao.insert(volumeControlDetail);
	}
	
	@Transactional(readOnly = false)
	public void update(VolumeControlDetail volumeControlDetail) {
		volumeControlDetailDao.update(volumeControlDetail);
	}
	
	@Transactional(readOnly = false)
	public void delete(VolumeControlDetail volumeControlDetail) {
		super.delete(volumeControlDetail);
	}
	
	@Transactional(readOnly = false)
	public void deleteByVId(VolumeControlDetail volumeControlDetail) {
		volumeControlDetailDao.deleteByVId(volumeControlDetail);
	}
	
}