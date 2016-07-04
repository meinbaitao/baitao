/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.bt.modules.purchase.dao.PurchaseDemandDao;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

/**
 * 用户工具类
 * @author ThinkGem
 * @version 2013-12-05
 */
public class CommonUtils {

	public static final String DICT_YES = "1";
	public static final String DICT_NO = "0";
	
	
	private static PurchaseDemandDao purchaseDemandDao = SpringContextHolder.getBean(PurchaseDemandDao.class);
	

	public static final String PurchaseDemand_Type_CACHE = "purchaseDemandType";
	
	
	
	/**
	 * 根据采购类型进行分组
	 * @return 取不到返回null
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String,Object>> groupByType(){
		List<Map<String,Object>> listMap = (List<Map<String, Object>>) CacheUtils.get(PurchaseDemand_Type_CACHE);
		if (listMap ==  null){
			listMap = purchaseDemandDao.groupByType();
			if (listMap == null){
				return null;
			}
			CacheUtils.put(PurchaseDemand_Type_CACHE, listMap);
		}
		return listMap;
	}
	/**
	 * 将以逗号分隔型字符串转成List<String>型
	 * @param str
	 * @return
	 */
	public static List<String> stringToList(String str){
		List<String> listIDs=new ArrayList<String>();
		if(StringUtils.isNotBlank(str)){	//判断数据不为空
			String[] idArr = str.split(",");
			for(String id:idArr){
				listIDs.add(id);
			}
		}
		return listIDs;
	}
	/**
	 * 将数组转成List<String>型
	 * @param str
	 * @return
	 */
	public static List<String> stringsToList(String[] str){
		List<String> listIDs=new ArrayList<String>();
		if(str!=null&&str.length>0){	//判断数据不为空
			for(String s:str){
				listIDs.add(s);
			}
		}
		return listIDs;
	}
	/**
	 * 将以逗号分隔型字符串转成Map型
	 * @param str
	 * @return
	 */
	public static Map<String,Object> getMaps(String str){
		Map<String,Object> map = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(str)){	//判断数据不为空
			String[] strArr = str.split(",");
			for(String s:strArr){
				map.put(s, s);
			}
		}
		return map;
	}
	/**
	 * 根据字符串获取对应的首写字母（大写）
	 * @param str
	 * @return
	 */
	public static String getPYIndex(String str){
		return ChinaInitialUtils.getPYIndexStr(str, true);
	}
	/**
	 * 钢辅料的材料类型
	 */
	public static Map<String,Object> purchaseUniformMaterielTypeMap(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put(CommonConstant.OrderBomBase_MATERIAL_STONE, "挂石材料");
		map.put(CommonConstant.OrderBomBase_MATERIAL_FRAME, "骨架材料");
		return map;
	}
	/**
	 * 下料单石材的类型
	 * @return
	 */
	public static Map<String,Object> stoneOrderTypeMap(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put(CommonConstant.OrderBomBase_SLAB, "平板");
		map.put(CommonConstant.OrderBomBase_WINDOW, "门窗套线");
		map.put(CommonConstant.OrderBomBase_WAIST, "腰线");
		map.put(CommonConstant.OrderBomBase_MOULD, "造型板");
		map.put(CommonConstant.OrderBomBase_COLUMN, "圆柱");
		map.put(CommonConstant.OrderBomBase_CARVING, "雕花");
		map.put(CommonConstant.OrderBomBase_ARC, "弧形板");
		map.put(CommonConstant.OrderBomBase_EAVE, "屋檐板");
		map.put(CommonConstant.OrderBomBase_REVEAL, "窗侧板");
		return map;
	}
	
	/**
	 * double数组冒泡排序(从小到大)
	 * @return
	 */
	public static double[] bubbleSort(double[] array){  
	    double temp=0;  
	    for(int i=0;i<array.length;i++){
	       for(int j=i+1;j<array.length;j++){
		       if(array[i]>array[j]){
		           temp=array[i];  
		           array[i]=array[j];  
		           array[j]=temp;  
		       }  
	       }  
	    }  
	    return array;
	}
	
	/**
	 * 字符串数字转double
	 * @param arg
	 * @return
	 */
	public static double stringToDouble(String arg){
		double result;
		try{
			result = Double.valueOf(arg);
		}catch(Exception e){
			result = 0;
		}
		return result;
	}
	/**
	 * 将列表数据转换成以逗号分隔的字符串数据
	 * @param listString
	 * @return
	 */
	public static String listToString(List<String> listString){
		String str="";
		if(listString.size()>0){
			str = listString.toString().replace("[", "").replace("]", "");
		}
		return str;
	}
	/**
	 * 将，分隔开的字符串拆成数组
	 * @param str
	 * @return
	 */
	public static String[] stringToStringArray(String str){
		String[] strArr = new String[0];
		if(StringUtils.isNotBlank(str)){	//判断数据不为空
			strArr = str.split(",");
		}
		String[] returnArr = new String[strArr.length];
		for(int i=0;i<strArr.length;i++){
			returnArr[i]=strArr[i].trim();
		}
		return returnArr;
	}
	
	
	/**
     * 人民币转成大写
     * 
     * @param value
     * @return String
     */
    public static String hangeToBig(double value)
    {
        char[] hunit = { '拾', '佰', '仟' }; // 段内位置表示
        char[] vunit = { '万', '亿' }; // 段名表示
        char[] digit = { '零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖' }; // 数字表示
        long midVal = (long) (value * 100); // 转化成整形
        String valStr = String.valueOf(midVal); // 转化成字符串
        String head = valStr.substring(0, valStr.length() - 2); // 取整数部分
        String rail = valStr.substring(valStr.length() - 2); // 取小数部分
        String prefix = ""; // 整数部分转化的结果
        String suffix = ""; // 小数部分转化的结果
        // 处理小数点后面的数
        if (rail.equals("00"))
        { // 如果小数部分为0
            suffix = "整";
        }
        else
        {
            suffix = digit[rail.charAt(0) - '0'] + "角" + digit[rail.charAt(1) - '0'] + "分"; // 否则把角分转化出来
        }
        // 处理小数点前面的数
        char[] chDig = head.toCharArray(); // 把整数部分转化成字符数组
        char zero = '0'; // 标志'0'表示出现过0
        byte zeroSerNum = 0; // 连续出现0的次数
        for (int i = 0; i < chDig.length; i++)
        { // 循环处理每个数字
            int idx = (chDig.length - i - 1) % 4; // 取段内位置
            int vidx = (chDig.length - i - 1) / 4; // 取段位置
            if (chDig[i] == '0')
            { // 如果当前字符是0
                zeroSerNum++; // 连续0次数递增
                if (zero == '0')
                { // 标志
                    zero = digit[0];
                }
                else if (idx == 0 && vidx > 0 && zeroSerNum < 4)
                {
                    prefix += vunit[vidx - 1];
                    zero = '0';
                }
                continue;
            }
            zeroSerNum = 0; // 连续0次数清零
            if (zero != '0')
            { // 如果标志不为0,则加上,例如万,亿什么的
                prefix += zero;
                zero = '0';
            }
            prefix += digit[chDig[i] - '0']; // 转化该数字表示
            if (idx > 0)
                prefix += hunit[idx - 1];
            if (idx == 0 && vidx > 0)
            {
                prefix += vunit[vidx - 1]; // 段结束位置应该加上段名如万,亿
            }
        }
        if (prefix.length() > 0)
            prefix += '圆'; // 如果整数部分存在,则有圆的字样
        return prefix + suffix; // 返回正确表示
    }
}
