package com.bt.modules.orbom.impl;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.orbom.entity.OrderBomDetail;

public interface OrderBomDetailImpl {
	
	/**
	 * 计算面积
	 * @param standardLong  长
	 * @param standardWidth 宽
	 * @param count         数量
	 * @return
	 * @throws BusinessException 
	 */
	public String area(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算圆柱面积
	 * @param standardLong  长
	 * @param standardWidth 宽
	 * @param count         数量
	 * @return
	 */
	public String yzarea(OrderBomDetail orderBomDetail) throws BusinessException;
	/**
	 * 计算体积
	 * @param standardLong  长
	 * @param standardWidth 宽
	 * @param standardDepth 厚
	 * @param count         数量
	 * @return
	 */
	public String volume(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算胚料面积
	 * @param rohlingLong  长
	 * @param rohlingWidth 宽
	 * @param count         数量
	 * @return
	 */
	public String rohlingArea(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算胚料体积
	 * @param rohlingLong  长
	 * @param rohlingWidth 宽
	 * @param rohlingDepth 厚
	 * @param count         数量
	 * @return
	 */
	public String rohlingVolume(OrderBomDetail orderBomDetail) throws BusinessException;
	/**
	 * 计算开角米数A/B
	 * @param standardWidth 宽
	 * @param count			数量
	 * @param leftopenAngle	左开角
	 * @param rightopenAngle右开角
	 * @return
	 */
	public String openAngleOne(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算开角米数C/D
	 * @param standardWidth 宽
	 * @param count			数量
	 * @param leftopenAngle	左开角
	 * @param rightopenAngle右开角
	 * @return
	 */
	public String openAngleTwo(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算开槽米数1
	 * @param standardLong 长
	 * @param count		         数量
	 * @param remark	         备注
	 * @return
	 */
	public String openSlotM1(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算开槽米数2
	 * @param standardLong  长
	 * @param standardWidth 宽
	 * @param count		            数量
	 * @param remark	   	加工图     
	 * @return
	 */
	public String openSlotM2(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算重量1
	 * @param standardLong  长
	 * @param standardWidth 宽
	 * @param standardDepth 厚
	 * @param count         数量
	 * @return
	 */
	public String wdight1(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算重量2
	 * @param standardLong  长
	 * @param lineDensity 线密度
	 * @param count         数量
	 * @return
	 */
	public String wdight2(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算重量3
	 * @param rohlingLong  胚料长
	 * @param lineDensity 线密度
	 * @param count         数量
	 * @return
	 */
	public String wdight3(OrderBomDetail orderBomDetail) throws BusinessException;
	/**
	 * 计算切角个数
	 * @param count			数量
	 * @param cutLeft		左切角
	 * @param cutRight		右切角
	 * @return
	 */
	public String cutAngleCount(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算转头个数
	 * @param count			数量
	 * @param cutLeft		左切角
	 * @param cutRight		右切角
	 * @return
	 */
	public String turnAngleCount(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 是否是弧形线条
	 * @param standardRadius 半径
	 * @return
	 */
	public String isFamilyLine(String standardRadius);
	
	/**
	 * 计算倒角边
	 * @param standardLong    		长度  
	 * @param reversedAngleCount	倒角边数量
	 * @param count					数量
	 * @return
	 */
	public String reversedAngleLong(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算滴水槽
	 * @param standardLong    		长度  
	 * @param count					数量
	 * @return
	 */
	public String waterSlotM(OrderBomDetail orderBomDetail) throws BusinessException;
	
	/**
	 * 计算背切长度
	 * @param standardLong    		长度  
	 * @param count					数量
	 * @return
	 */
	public String backCutCount(OrderBomDetail orderBomDetail) throws BusinessException;
}
