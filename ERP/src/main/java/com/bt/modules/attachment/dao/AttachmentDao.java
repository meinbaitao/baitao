/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.attachment.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.bt.modules.attachment.entity.Attachment;

/**
 * 附件信息存放表DAO接口
 * @author xjp
 * @version 2015-08-17
 */
@MyBatisDao
public interface AttachmentDao extends CrudDao<Attachment> {
	
	/**
	 * 根据类型查询附件信息
	 * @param attachment
	 * @return
	 */
	public List<Attachment> findAttachType(Attachment attachment);
	
	/**
	 * 根据类型查询附件信息（项目周报）
	 * @param attachment
	 * @return
	 */
	public List<Attachment> findLikeAttachType(Attachment attachment);
	
	/**
	 * 根据类型删除附件信息（项目周报）
	 * @param attachment
	 * @return
	 */
	
	public int deleteByType(Attachment attachment);
	
}