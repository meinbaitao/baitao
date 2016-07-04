/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.contract.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.contract.entity.ContractAccount;
import com.bt.modules.contract.dao.ContractAccountDao;

/**
 * 合同台账Service
 * @author yhh
 * @version 2015-12-01
 */
@Service
@Transactional(readOnly = true)
public class ContractAccountService extends CrudService<ContractAccountDao, ContractAccount> {

	private static final String Valid_almost = "即将到期";
	private static final String Valid_already = "已到期";
	private static final String Valid_notYet = "未到期";
	
	@Autowired
	private ContractAccountDao contractAccountDao;
	
	public List<ContractAccount> findList(ContractAccount contractAccount) {
		List<ContractAccount> contractAccountList = new ArrayList<ContractAccount>();
		
		//判断查询条件是否为日期过滤条件,否则正常查询
		String valid = contractAccount.getSearch();
		if(StringUtils.isNotBlank(valid)){
			if(valid.equals(Valid_almost)|| valid.equals(Valid_already)|| valid.equals(Valid_notYet)){
				contractAccount.setSearch(null);
				contractAccountList = super.findList(contractAccount);
				contractAccountList = checkValid(contractAccountList);
				contractAccountList = validFilter(contractAccountList, valid);
				return contractAccountList;
			}
		}
		contractAccountList = super.findList(contractAccount);
		contractAccountList = checkValid(contractAccountList);
		return contractAccountList;
	}
	
	public Page<ContractAccount> findPage(Page<ContractAccount> page, ContractAccount contractAccount) {
		contractAccount.setPage(page);
		page.setList(findList(contractAccount));
		return page;
	}
	
	/**
	 * 过滤到期,未到期,即将到期合同记录
	 * @param contractAccountList
	 * @param valid
	 * @return
	 */
	public List<ContractAccount> validFilter(List<ContractAccount> contractAccountList, String valid){
		Iterator<ContractAccount> contractAccount = contractAccountList.iterator();
		while(contractAccount.hasNext()){
			ContractAccount entity = contractAccount.next();
			if(!entity.getIsValid().equals(valid)){
				contractAccount.remove();
			}
		}
		
		return contractAccountList;
	}

	/**
	 * 检查合同有效期
	 * @param contractAccountList
	 * @return
	 */
	public List<ContractAccount> checkValid(List<ContractAccount> contractAccountList) {
		
		//遍历合同,确定是否有效期内
		Date now = new Date();
		for(ContractAccount con : contractAccountList){
			String endDate = con.getEndTime();
			Date end = DateUtils.parseDate(endDate);
			if(null != end){
				double gapDays = DateUtils.getDistanceOfTwoDate(now,end);
				if(gapDays > 0 && gapDays<30){
					con.setIsValid(Valid_almost);
				}
				else if(gapDays>= 30){
					con.setIsValid(Valid_notYet);
				}
				else if(gapDays<=0){
					con.setIsValid(Valid_already);
				}
			}
		}
		return contractAccountList;
	}
	
	/**
	 * 由上级id获取分类列表
	 * @param parentId
	 * @return
	 */
	public List<Map<String,Object>> findTypeByParentId(String parentId){
		return contractAccountDao.findTypeByParentId(parentId);
	}
	
}

