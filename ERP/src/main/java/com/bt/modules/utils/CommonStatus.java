/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.utils;


/**
 * 状态基础类
 * @version 2015年9月8日09:29:00
 */
public class CommonStatus {
//	1-新建流程、2-流程进行中、3-流程被驳回结束、4-流程正常结束workflowstatus
	/**
	 * 流程初始状态
	 */
	public static final String WORK_FLOW_INIT = "0";		
	/**
	 * 开启流程
	 */
	public static final String WORK_FLOW_OPEN = "1";			
	/**
	 * 流程正常进行中
	 */
	public static final String WORK_FLOW_UNDERWAY = "2";		
	/**
	 * 流程驳回结束
	 */
	public static final String WORK_FLOW_REBUT_END = "3";		
	/**
	 * 流程正常执行结束
	 */
	public static final String WORK_FLOW_END = "4";			
	
	/**
	 * 修改日志-普通修改
	 */
	public static final String UPDATE_LOG_UPDATE = "update";
	/**
	 * 修改日志-变更（流程走完后进行修改的记录）
	 */
	public static final String UPDATE_LOG_CHANGE = "change";
	
	
	//采购状态  1-待提交 2-待审核 3-待指派 4-待下单 5-已下单(进入流程) 6-待发货 7-已发货 8-已收货
	/**
	 * 运营专员指派被运营主管驳回数据
	 */
	public static final String PURCHASE_ASSIGN_BH = "0";
	/**
	 * 待提交
	 */
	public static final String PURCHASE_DTJ = "10";
	/**
	 * 待审核
	 */
	public static final String PURCHASE_DSH = "20";
	/**
	 * 待运营专员指派
	 */
	public static final String PURCHASE_DZP_YYZY = "30";
	/**
	 * 待运营主管指派
	 */
	public static final String PURCHASE_DZP_YYZG = "40";
	/**
	 * 待运营经理指派
	 */
	public static final String PURCHASE_DZP_YYJL = "50";
	/**
	 * 待采购主管指派
	 */
	public static final String PURCHASE_DZP_CGZG = "60";
	/**
	 * 待下单
	 */
	public static final String PURCHASE_DXD = "70";
	/**
	 * 已下单(进入流程)
	 */
	public static final String PURCHASE_YXD = "80";
	/**
	 * 待签收（供应商签收）
	 */
	public static final String PURCHASE_DQS = "90";	
	/**
	 * 待发货
	 */
	public static final String PURCHASE_DFH = "100";	
	/**
	 * 已发货
	 */
	public static final String PURCHASE_YFH = "110";	
	/**
	 * 已收货
	 */
	public static final String PURCHASE_YSH = "120";	
	
	//生产状态 1-待运营主管指派 2-待采购经理指派 3-待生产
	/**
	 * 待运营专员指派
	 */
	public static final String PRODUCTION_DZP_YYZY = "10";
	/**
	 * 待运营主管指派
	 */
	public static final String PRODUCTION_DZP_YYZG = "20";
	/**
	 * 运营经理
	 */
	public static final String PRODUCTION_DZP_YYJL = "30";
	/**
	 * 待生产经理指派
	 */
	public static final String PRODUCTION_DZP_SCJL = "40";
	/**
	 * 待签收
	 */
	public static final String PRODUCTION_DQS = "50";
	/**
	 * 待生产
	 */
	public static final String PRODUCTION_DSC = "60";
	/**
	 * 生产中
	 */
//	public static final String PRODUCTION_SCZ = "70";
	/**
	 * 待入库
	 */
	public static final String PRODUCTION_DRK = "80";
	/**
	 * 已入库
	 */
	public static final String PRODUCTION_YRK = "90";
	/**
	 * 待出库	2015年12月2日
	 */
	public static final String PRODUCTION_DCK = "100";
	/**
	 * 待发货	2015年12月2日
	 */
	public static final String PRODUCTION_DFH = "110";
	/**
	 * 待派车
	 */
	public static final String PRODUCTION_DPC = "120";
	/**
	 * 已派车未发
	 */
	public static final String PRODUCTION_YPCWF = "130";
	/**
	 * 待收货（已发货）
	 */
	public static final String PRODUCTION_DSH = "140";
	/**
	 * 已收货
	 */
	public static final String PRODUCTION_YSH = "150";
	
	//物流
	/**
	 * 通知发货
	 */
	public static final String LOGISTICS_TZFH = "5";
	/**
	 * 待发货
	 */
	public static final String LOGISTICS_DFH = "10";
	/**
	 * 部分发货
	 */
	public static final String LOGISTICS_BFFH = "20";
	/**
	 * 完全发货
	 */
	public static final String LOGISTICS_YFH = "30";
	/**
	 * 部分收货
	 */
	public static final String LOGISTICS_BFSH = "40";
	/**
	 * 完全收货
	 */
	public static final String LOGISTICS_YSH = "50";
	/**
	 * 已结算
	 */
	public static final String LOGISTICS_YJS = "60";
	
	//箱状态：1-待入库，2-已入库，3-应发未发，4-待发货，5-待收货，6-已收货,
	/**
	 * 1待入库
	 */
	public static final String BOX_DRK = "1";
	/**
	 *2 已入库
	 */
	public static final String BOX_YRK = "2";
	/**
	 * 3应发未发
	 */
	public static final String BOX_YFWF = "3";
	/**
	 * 4待发货
	 */
	public static final String BOX_DFH = "4";
	/**
	 * 5待收货
	 */
	public static final String BOX_DSH = "5";
	/**
	 *6已收货
	 */
	public static final String BOX_YSH = "6";	

	/**
	 * 指标型
	 */
	public static final String QUOTA_STATUS = "2";
	/**
	 * 任务型
	 */
	public static final String TASK_STATUS = "1";
	
	//==============================================================================
	/**
	 * 待审批(草稿)
	 */
	public static final String TEAK_WAIT_ONE = "1";
	
	/**
	 * 执行中
	 */
	public static final String TASK_DOING = "2";
	
	/**
	 * 待审批(延期申请)
	 */
	public static final String TASK_WAIT_TWO = "3";
	
	/**
	 * 待审批(复评申请)
	 */
	public static final String TASK_WAIT_THREE = "4";
	
	/**
	 * 已完成
	 */
	public static final String TASK_END = "5";
	
	/**
	 * 下料单状态
	 */
	public static final String Order_BOM_BASE_STATUS_LAB_DZP = "待指派";
	public static final String Order_BOM_BASE_STATUS_LAB_ZPWC = "指派完成";
	
//	 * search Status
//	 * 搜索状态
	public static final String SEARCH_STATUS_DZP="待指派";
	public static final String SEARCH_STATUS_YZP="已指派";
}
