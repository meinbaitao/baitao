package com.bt.modules.utils;

import org.apache.commons.lang3.StringUtils;


/**
 * 编号工具类
 * @author Administrator
 *
 */
public class SeriesNumberUtils  {
	
	/**
	 * 编号递增方法
	 * @param count
	 * @return
	 */
	public static String getCount(int count){
		String c;
		count+=1;
		if(count>9)
			c=""+count;
		else
			c="0"+count;
		return c;
	}

	/**
	 * 黑材申购
	 * @param count
	 * @return
	 */
	public static String getSGHCSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "SG-HC"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+"-"+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 镀锌钢材申购
	 * @param count
	 * @return
	 */
	public static String getSGDXGCSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "SG-DXGC"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+"-"+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 采购需求编号
	 * @return
	 */
	public static String getSGSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "SG-"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 生产需求单编号
	 * @return
	 */
	public static String getSCDemandSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "SC"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 指派需求量记录编号
	 * @param count
	 * @return
	 */
	public static String getPurchaseDemandAssignSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 采购订单编号
	 * @param count
	 * @return
	 */
	public static String getCGSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = DateUtils.getDateByPattern("yyMMdd")+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 生产发货通知
	 * @param count
	 * @return
	 */
	public static String getPurchaseLogisticsSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "FH-"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 生成生产编号
	 * @param count
	 * @return
	 */
	public static String getProductionSeriesNumber(int count){
		String seriesnumber = "";
		seriesnumber = "SC-"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 生成物流编号
	 * @param count
	 * @return
	 */
	public static String getLogisticsSendSeriesNumber(String sendAddress,int count){
		if(StringUtils.isBlank(sendAddress)){
			return "";
		}
		String seriesnumber = "";
		String pyIndex = CommonUtils.getPYIndex(sendAddress);//获取字符的对应首写字母
		seriesnumber = pyIndex+"FH-"+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+"-"+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
	/**
	 * 合同编号
	 * @param prefix
	 * @param count
	 * @return
	 */
	public static String createSeriesNumber(String prefix,String dateStr,int count){  
		if(StringUtils.isBlank(dateStr)){
			dateStr = DateUtils.getDateByPattern(DateUtils.yyyyMMdd);
		}
    	String countStr = SeriesNumberUtils.getCount(count);
		return (prefix+dateStr+countStr);  
//		SimpleDateFormat format= new SimpleDateFormat("yyyyMMdd");  
//        String date=format.format(new Date());  
//        String lastNo="";  
//    	count+=1;
//		if(count<10){
//    		lastNo = prefix+date+"0"+count;
//    	}else{
//    		lastNo = prefix+date+count;
//    	}
//		return lastNo; 
	}  
	/**
	 * 修改合同编号
	 * 流水编号不改变
	 * @param prefix
	 * @param oldSeriesNumber
	 * @return
	 */
	public static String updateContractSeriesNumber(String prefix,String oldSeriesNumber){
		if(StringUtils.isBlank(oldSeriesNumber)){
			return prefix;
		}
		String seriesNumber = oldSeriesNumber.substring((oldSeriesNumber.lastIndexOf("-")+1));
		prefix = prefix.substring(0, (prefix.lastIndexOf("-")+1));
		return (prefix+seriesNumber);
	}  
	/**
	 * 下料单编号
	 * @param count
	 * @return
	 */
	public static String createOrderBomBaseNumber(String cityName,String proCode,String provinceName,String houseType,String building,String orderType,String uniformMaterielType){
		String seriesnumber = "";
		
		if(CommonConstant.OrderBomBase_PURCHASE.equals(orderType)){
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(uniformMaterielType)){
				seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-01";
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(uniformMaterielType)){
				seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-00";
			}
//			returnUrl = "modules/orbom/orderBomPurchaseDetailList";
		}else if(CommonConstant.OrderBomBase_SLAB.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-02";
		}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-03";
		}else if(CommonConstant.OrderBomBase_WAIST.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-04";
		}else if(CommonConstant.OrderBomBase_MOULD.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-05";
		}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-06";
		}else if(CommonConstant.OrderBomBase_CARVING.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-07";
		}else if(CommonConstant.OrderBomBase_ARC.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-10";
		}else if(CommonConstant.OrderBomBase_EAVE.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-08";
		}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-09";
		}else if(CommonConstant.OrderBomBase_SEAM.equals(orderType)){
			seriesnumber = "NO."+provinceName+"-"+cityName+"-"+proCode+"-"+houseType+"("+building+")"+"-11";
		}
		
		return seriesnumber;
	}
	/**
	 * 库存记录编号生成
	 * @param count	数量
	 * @param tranType	材料类型
	 * @return
	 */
	public static String getStandingBookSeriesNumber(int count,String tranType,String materialType){
		String seriesnumber = "";
		String tranTypeStr="";
		String materialTypeStr="";
		if(CommonConstant.STANDINGBOOK_CHUKU.equals(tranType)){
			tranTypeStr="CK-";
		}else if(CommonConstant.STANDINGBOOK_RUKU.equals(tranType)){
			tranTypeStr="RK-";
		}else if(CommonConstant.STANDINGBOOK_LINGLIAO.equals(tranType)){
			tranTypeStr="LL-";
		}else if(CommonConstant.STANDINGBOOK_DIAOBO.equals(tranType)){
			tranTypeStr="DB-";
		}else if(CommonConstant.STANDINGBOOK_PANDIAN.equals(tranType)){
			tranTypeStr="PD-";
		}else if(CommonConstant.STANDINGBOOK_PINGCANG.equals(tranType)){
			tranTypeStr="PC-";
		}
		if(CommonConstant.MATERIAL_HEICAI.equals(materialType)){
			materialTypeStr="HC-";
		}else if(CommonConstant.MATERIAL_FULIAO.equals(materialType)||CommonConstant.MATERIAL_GANGCAI.equals(materialType)){
			materialTypeStr="FL-";
		}else if(CommonConstant.MATERIAL_SHICAI.equals(materialType)){
			materialTypeStr="SC-";
		}
		seriesnumber = "GC-"+materialTypeStr+tranTypeStr+DateUtils.getDateByPattern(DateUtils.yyyyMMdd)+SeriesNumberUtils.getCount(count);
		return seriesnumber;
	}
}
