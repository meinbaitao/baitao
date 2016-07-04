package com.bt.modules.qualityitem.entity;

import java.util.List;
import java.util.Map;

import org.hibernate.validator.constraints.Length;

import com.bt.modules.contract.entity.JiaContract;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.User;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 一级项目信息Entity
 * @author dy
 * @version 2016年4月20日
 */
public class Qualityitem extends DataEntity<Qualityitem> {
	
	private static final long serialVersionUID = 1L;
	private String id;		//主键ID
	private String item;             //质保金条款
	private String scheduleRatio;		// 合同进度款比例
	private String exscheduleRatio;		// 进度款最高发放比例
	private String accountRatio;		// 结算款最高支付比例
	private String qualityRatioFrist;		// 保质金比例1
	private String qualityRatioSecond;		// 保质金比例2
	private String qualityPayDateFrist;		// 保质金比例支付时间1
	private String qualityPayDateSecond;		// 保质金比例支付时间2
	private String itemExplain;             //质保金条款说明
	private String flag;             //添加或者更新标志
	
	
	public String getItem() {
		return item;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getItemExplain() {
		return itemExplain;
	}
	public void setItemExplain(String itemExplain) {
		this.itemExplain = itemExplain;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScheduleRatio() {
		return scheduleRatio;
	}
	public void setScheduleRatio(String scheduleRatio) {
		this.scheduleRatio = scheduleRatio;
	}
	public String getExscheduleRatio() {
		return exscheduleRatio;
	}
	public void setExscheduleRatio(String exscheduleRatio) {
		this.exscheduleRatio = exscheduleRatio;
	}
	public String getAccountRatio() {
		return accountRatio;
	}
	public void setAccountRatio(String accountRatio) {
		this.accountRatio = accountRatio;
	}
	public String getQualityRatioFrist() {
		return qualityRatioFrist;
	}
	public void setQualityRatioFrist(String qualityRatioFrist) {
		this.qualityRatioFrist = qualityRatioFrist;
	}
	public String getQualityRatioSecond() {
		return qualityRatioSecond;
	}
	public void setQualityRatioSecond(String qualityRatioSecond) {
		this.qualityRatioSecond = qualityRatioSecond;
	}
	public String getQualityPayDateFrist() {
		return qualityPayDateFrist;
	}
	public void setQualityPayDateFrist(String qualityPayDateFrist) {
		this.qualityPayDateFrist = qualityPayDateFrist;
	}
	public String getQualityPayDateSecond() {
		return qualityPayDateSecond;
	}
	public void setQualityPayDateSecond(String qualityPayDateSecond) {
		this.qualityPayDateSecond = qualityPayDateSecond;
	}
	
}