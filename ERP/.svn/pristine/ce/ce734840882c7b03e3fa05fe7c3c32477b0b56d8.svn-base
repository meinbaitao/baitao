/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * @author ThinkGem
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = false)
public class DictService extends CrudService<DictDao, Dict> {
	
	
	@Autowired
	private SystemService systemService;
	
	//许俊雄
	public static final String SUB_SEQ="dict_val_seq";
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}
	
	/**
	 * 查询字段类型、类型显示名称列表 许俊雄
	 * @return
	 */
	public List<Dict> findTypeDisNameList(){
		Dict dictquery = new Dict();
		//用户操作级别
		dictquery.setOpLevel(DictUtils.getDictValue("op_level_user", "dict_op_level", "1"));
		return dao.findTypeDisNameList(dictquery);
	}
	
	/**
	 * 查询用户可操作的字典值
	 * @return
	 */
	public List<Dict> findUserDictList(Dict dictquery){
		//用户操作级别
		dictquery.setOpLevel(DictUtils.getDictValue("op_level_user", "dict_op_level", "1"));
		return dao.findUserDictList(dictquery);
	}
	
	/**
	 * 计算获取用户新增参数项目的字典model
	 * 许俊雄 2016-04-15
	 * readOnly = false 不能设置为类的事务，否则无法获取系统
	 * 序列
	 * @param id
	 * @return
	 */
	@Transactional(readOnly = false)
	public Dict getNewUserDict(String id){
		Dict dict = this.get(id);
		//获取排序和类型显示值填充给用户
		Integer maxSort = dao.findMaxSort(dict.getType());
		if(null != maxSort){
			dict.setSort(maxSort+10);
		}
		//生成val（U+Seq）给页面隐藏
		String newVal = "U" + systemService
				.getSeqNextVal(DictService.SUB_SEQ);
		
		dict.setValue(newVal);
		
		//去掉值lable
		dict.setLabel("");
		dict.setId("");	//去掉id让系统识别新增
		dict.setRemarks("");	//情况备注
		return dict;
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

}
