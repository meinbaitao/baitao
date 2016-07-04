/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.attachment.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.dao.AttachmentDao;

/**
 * 附件信息存放表Service
 * @author xjp
 * @version 2015-08-17
 */
@Service
@Transactional(readOnly = true)
public class AttachmentService extends CrudService<AttachmentDao, Attachment> {

	public Attachment get(String id) {
		return super.get(id);
	}
	
	public List<Attachment> findList(Attachment attachment) {
		return super.findList(attachment);
	}
	
	public Page<Attachment> findPage(Page<Attachment> page, Attachment attachment) {
		return super.findPage(page, attachment);
	}
	
	@Transactional(readOnly = false)
	public void save(Attachment attachment) {
		attachment.setIsNewRecord(true);
		super.save(attachment);
	}
	
	@Transactional(readOnly = false)
	public void delete(Attachment attachment) {
		super.delete(attachment);
	}
	
	/**
	 * 根据类型查询附件信息
	 * @param attachment
	 * @return
	 */
	public List<Attachment> findAttachType(Attachment attachment) {
		return super.dao.findAttachType(attachment);
	}
	
	/**
	 * 根据类型查询附件信息(项目周报)
	 * @param attachment
	 * @return
	 */
	public List<Attachment> findLikeAttachType(Attachment attachment) {
		return super.dao.findLikeAttachType(attachment);
	}
	
	/**
	 * 根据类型删除附件信息(项目周报)
	 * @param attachment
	 * @return
	 */
	@Transactional(readOnly = false)
	public int deleteByType(String type) {
		Attachment attachment = new Attachment();
		attachment.setType(type);
		return super.dao.deleteByType(attachment);
	}
}