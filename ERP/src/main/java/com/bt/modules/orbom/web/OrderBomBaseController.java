/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.area.entity.Province;
import com.bt.modules.area.service.ProvinceService;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.material.service.MaterialService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.bt.modules.utils.UploadUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 下料单基本表Controller
 * @author ljp
 * @version 2015-08-05
 */
@Controller
@RequestMapping(value = "${adminPath}/orbom/orderBomBase")
public class OrderBomBaseController extends BaseController {
	@Autowired
	private OrderBomBaseService orderBomBaseService;//下料单基本服务
	@Autowired
	private OrderBomDetailService orderBomDetailService;
	@Autowired
	private ProjectService projectService;//一级项目Service
	@Autowired
	private SubProjectService subProjectService;// 二级项目Service
	@Autowired
	private MaterialService materialService;// 物料信息Service
	@Autowired
	private OrderBomBoxService boxService;//箱Service
	@Autowired
	private ActTaskService actTaskService;		//流程
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;		//流程
	@Autowired
	private ProvinceService provinceService;//省市
	//附件管理服务
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private AttachmentService attachmentService;
	
	private HSSFRow row;
	/**
	 * 下料单
	 * @param orderBomBase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"list", ""})
	public String list(OrderBomBase orderBomBase, HttpServletRequest request, HttpServletResponse response, Model model) {
		String returnUrl = "";
		if(CommonConstant.OrderBomBase_PURCHASE.equals(orderBomBase.getOrderType())){
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(orderBomBase.getUniformMaterielType())){
				returnUrl = "modules/orbom/orderBomPurchaseStoneList";
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(orderBomBase.getUniformMaterielType())){
				returnUrl = "modules/orbom/orderBomPurchaseFrameList";
			}
		}else if(CommonConstant.OrderBomBase_SLAB.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomSlabList";
		}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomWindowList";
		}else if(CommonConstant.OrderBomBase_WAIST.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomWaistList";
		}else if(CommonConstant.OrderBomBase_MOULD.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomMouldList";
		}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomColumnList";
		}else if(CommonConstant.OrderBomBase_CARVING.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomCarvingList";
		}else if(CommonConstant.OrderBomBase_ARC.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomArcList";
		}else if(CommonConstant.OrderBomBase_EAVE.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomEaveList";
		}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomRevealList";
		}else if(CommonConstant.OrderBomBase_SEAM.equals(orderBomBase.getOrderType())){
			returnUrl = "modules/orbom/orderBomSeamList";
		}else{
			returnUrl = "modules/orbom/orderBomBaseList";
		}
		orderBomBase.setDesigner(UserUtils.getUser().getId());
		orderBomBase.setDesignLeaderBid(UserUtils.getUser().getId());
		orderBomBase.setIsDesignerManager(UserUtils.verificationRole("sjjl"));
		Page<OrderBomBase> page = orderBomBaseService.findPage(new Page<OrderBomBase>(request, response), orderBomBase);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = orderBomBaseService.findSpList(orderBomBase);
		List<Map<String, Object>> listMap = projectService.gbProByName();
		model.addAttribute("page", page);
		model.addAttribute("listMap", listMap);
		model.addAttribute("list", list);
		model.addAttribute("orderType", orderBomBase.getOrderType());
		
		return returnUrl;
		
	}
	
	/**
	 * 补料/变更 
	 * @param orderBomDetail
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "changeForm")
	public String changeForm(HttpServletRequest request, HttpServletResponse response, Model model) {
		String orderType = request.getParameter("orderType");
		String isChange = request.getParameter("isChange");//是否补料或变更；1-补料 2-变更
		String orderId = request.getParameter("orderId");
		String returnUrl = "";
		if(CommonConstant.OrderBomBase_PURCHASE.equals(orderType)){
			String uniformMaterielType = request.getParameter("uniformMaterielType");
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(uniformMaterielType)){
				returnUrl = "modules/orbom/orderBomPurchaseStoneDetailList";
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(uniformMaterielType)){
				returnUrl = "modules/orbom/orderBomPurchaseFrameDetailList";
			}
//			returnUrl = "modules/orbom/orderBomPurchaseDetailList";
		}else if(CommonConstant.OrderBomBase_SLAB.equals(orderType)){
			returnUrl = "modules/orbom/orderBomSlabDetailList";
		}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderType)){
			returnUrl = "modules/orbom/orderBomWindowDetailList";
		}else if(CommonConstant.OrderBomBase_WAIST.equals(orderType)){
			returnUrl = "modules/orbom/orderBomWaistDetailList";
		}else if(CommonConstant.OrderBomBase_MOULD.equals(orderType)){
			returnUrl = "modules/orbom/orderBomMouldDetailList";
		}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderType)){
			returnUrl = "modules/orbom/orderBomColumnDetailList";
		}else if(CommonConstant.OrderBomBase_CARVING.equals(orderType)){
			returnUrl = "modules/orbom/orderBomCarvingDetailList";
		}else if(CommonConstant.OrderBomBase_ARC.equals(orderType)){
			returnUrl = "modules/orbom/orderBomArcDetailList";
		}else if(CommonConstant.OrderBomBase_EAVE.equals(orderType)){
			returnUrl = "modules/orbom/orderBomEaveDetailList";
		}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderType)){
			returnUrl = "modules/orbom/orderBomRevealDetailList";
		}else if(CommonConstant.OrderBomBase_SEAM.equals(orderType)){
			returnUrl = "modules/orbom/orderBomSeamDetailList";
		}else{
			returnUrl = "modules/orbom/orderBomBaseList";
		}
		Project p = null;
		Subproject sp = null;
		OrderBomBase order = orderBomBaseService.get(orderId);
		String oldBuildingDisplayName = orderBomBaseService.getBuildingDisplayNameByOrderBomBaseId(orderId);
		if(order != null){
			order.setId(IdGen.uuid());
    		order.setWorkflowid("");
    		order.setWorkflowstatus("");
			if("1".equals(isChange)){
				//补料
				order.setOrderBomNo("补-"+order.getOrderBomNo());
			}else if("2".equals(isChange)){
				//变更
				order.setOrderBomNo("BG-"+order.getOrderBomNo());
			}
			if(order.getSubProjId() != null){
				//获取二级项目信息
				sp = subProjectService.get(order.getSubProjId());
				sp.setBuildingDisplayName(oldBuildingDisplayName);
				if(sp != null){
					//获取一级项目信息
					p = projectService.get(sp.getProjectId());
				}
			}
		}
		if(p == null || order == null){
			p = new Project();
			order = new OrderBomBase();
		}
		order.setSub(sp);
//		model.addAttribute("attachList", new ArrayList());
		model.addAttribute("project", p);
		model.addAttribute("subProject",sp);
		model.addAttribute("orderBomBase", order);
		model.addAttribute("isChange", isChange);
		model.addAttribute("originalNo",orderId);//原下料单id
		List<Map<String, Object>> listMap = projectService.gbProByName();
		model.addAttribute("listMap", listMap);
		return returnUrl;
	}
	
	public String createOrderBomBaseNumber(OrderBomBase orderBomBase){
//		int count  = orderBomBaseService.getTodayCount(new Date());
	    String proCode = "";
	    String provinceName = "";
	    String cityName = "";
	    //二级项目信息
	    Subproject sp = subProjectService.get(orderBomBase.getSubProjId());
	    Project p = null;
	    if(sp != null){
			//获取一级项目信息
			p = projectService.get(sp.getProjectId());
		}
	    if(p != null){
	    	proCode = p.getCode();
	    	provinceName = p.getProvince();
	    	cityName = p.getCity();
	    }
	    if(StringUtils.isNoneBlank(provinceName) && StringUtils.isNoneBlank(cityName)){
	    	Province pro1 = provinceService.getProvince(cityName);
	    	if(pro1 != null){
	    		cityName = pro1.getCode();
	    	}
	    	Province pro2 = provinceService.getProvince(provinceName);
	    	if(pro2 != null){
	    		provinceName = pro2.getCode();
	    	}
	    }
	    String building = orderBomBaseService.getBuildingDisplayNameByBuildings(orderBomBase.getBuilding(), sp);
		return SeriesNumberUtils.createOrderBomBaseNumber(cityName, proCode, provinceName,orderBomBase.getHouseType(), building,orderBomBase.getOrderType(),orderBomBase.getUniformMaterielType());
	}
	
	/**
	 * 钢辅材下料单（挂石/骨架）导入  
	 * @param multipartFile
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "importPurchase")
	@Transactional(readOnly = false)
	public String importPurchase(OrderBomBase orderBomBase,MultipartFile multipartFile, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		orderBomBase.setOrderType(CommonConstant.OrderBomBase_PURCHASE);//下料单类型 1-钢辅材
		String orderBomNo = this.createOrderBomBaseNumber(orderBomBase);
		String uniformMaterielType=orderBomBase.getUniformMaterielType();
		orderBomBase.setId(IdGen.uuid());
		orderBomBase.setOrderBomNo(orderBomNo);
		orderBomBase.setOrderMadeTime(new Date());
		orderBomBase.setCreateUser(UserUtils.getUser().getName());
		
		StringBuilder errorString = new StringBuilder();
		InputStream inputstream = null;
		//FileInputStream fis = null;
		HSSFWorkbook workBook = null;
		
		int i = 2;
		int cellColNum = 0;
		try{
			try {
				inputstream = multipartFile.getInputStream();
				workBook = new HSSFWorkbook(inputstream);
			} catch (FileNotFoundException e) {
				errorString.append(e.getMessage());
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
			} catch (IOException e) {
				if(e.getMessage().startsWith("Invalid header signature")){
					errorString.append("系统无法解析此Excel文件。");
				}else{
					errorString.append(e.getMessage());
				}
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
			}finally{
				try {
					if(inputstream!=null){
						inputstream.close();
					}
				} catch (IOException e) {
					addMessage(redirectAttributes, "导入失败："+e.getMessage());
					return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
				}
			}
			
			HSSFSheet sheet = workBook.getSheetAt(0);// 第一个工作表
			int rowNum = sheet.getPhysicalNumberOfRows();
			if (rowNum < 3) {
				errorString.append("Excel工作薄的记录为空，无法导入数据");
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
			}
			//校验模板是否正确
			try {
				HSSFRow row = sheet.getRow(0);// 取行信息
				String cellValue = this.getCellString(row.getCell(0));
				if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(orderBomBase.getUniformMaterielType())){
					//挂石下料单
					if(!"挂石下料单".equals(cellValue.trim())){
						addMessage(redirectAttributes, "导入失败：模版错误请重新下载模版！");
						return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
					}
				}
				if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(orderBomBase.getUniformMaterielType())){
					//骨架下料单
					if(!"骨架下料单".equals(cellValue.trim())){
						addMessage(redirectAttributes, "导入失败：模版错误请重新下载模版！");
						return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
					}
				}
			} catch (Exception e) {
				addMessage(redirectAttributes, "导入失败："+e.getMessage());
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
			}
			try {
				List<OrderBomDetail> obdList = new ArrayList<OrderBomDetail>();
				for (i = 2; i < rowNum; i++) {
					OrderBomDetail obd = new OrderBomDetail();
					HSSFRow row = sheet.getRow(i);// 取行信息
					cellColNum = 0; //材料编号
					String matnr = null;
					String cellValue = this.getCellString(row.getCell(cellColNum),false,true);// 
					if (cellValue == null || cellValue.trim().length() == 0) {
						errorString.append("第" + (i+1) + "行的材料编号为空，系统无法导入");
						addMessage(redirectAttributes, "导入失败："+errorString);
						return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
					}else{
						matnr = cellValue;
//						//匹配查询是否为已经存在的物料
//						Material material = new Material();
//						material.setSeriesNumber(cellValue);
//						List<Material> matList = materialService.findListBySeriesNumber(material);
//						if(matList != null && matList.size() > 0){
						obd.setId(IdGen.uuid());
						obd.setOrderBomId(orderBomBase.getId());
						obd.setMaterielNo(cellValue);
//						}else{
//							errorString.append("第" + (i+1) + "行的材料编号："+matnr+" 不存在物料基础库，无法导入！<br/>");
//							 continue;
//						}
					}
					cellColNum = 1;// 材料名称
					cellValue = getCellString(row.getCell(cellColNum));
					if (cellValue == null || cellValue.trim().length() == 0) {
						errorString.append("第" + (i+1) + "行,材料编号["+matnr+"]的材料名称为空，系统无法导入");
						addMessage(redirectAttributes, "导入失败："+errorString);
						return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
					} else {
						obd.setMaterielName(cellValue);
					}
					cellColNum = 2;// 材料类型
					obd.setMaterielType(getCellString(row.getCell(cellColNum),false,false));
					cellColNum = 3;// 材质
					obd.setMaterials(getCellString(row.getCell(cellColNum),false,false));
					cellColNum = 4;// 规格尺寸
					obd.setStandardDesc(getCellString(row.getCell(cellColNum),false,false));
					cellColNum = 5;//数量
					obd.setCount(getCellString(row.getCell(cellColNum),true,false));
					cellColNum = 6;// 单位
					obd.setUnit(getCellString(row.getCell(cellColNum),false,false));
					cellColNum = 7;// 单位重量
					obd.setUnitWeight(getCellString(row.getCell(cellColNum),true,false));
					cellColNum = 8;// 总重量
					obd.setWdight(getCellString(row.getCell(cellColNum),true,false));
					cellColNum = 9;// 备注
					obd.setRemark(getCellString(row.getCell(cellColNum),false,false));
					
					obdList.add(obd);
				}
				int num = 0;
				for(OrderBomDetail o :obdList){
//					if(StringUtils.isNotBlank(o.getId())) {
//						//update
//					} else {
//						//save
//					}
					orderBomDetailService.insert(o);
					num++;
				}
				if(obdList.size() > 0){
					orderBomBaseService.insert(orderBomBase);
					addMessage(redirectAttributes, "成功导入"+num+"条！");
					if(errorString.length() > 0){
						addMessage(redirectAttributes, "成功导入"+num+"条！<br/>"+errorString);
					}
				}else{
					addMessage(redirectAttributes, "导入失败！"+errorString);
				}
			} catch (IllegalStateException e) {
				if("Cannot get a text value from a numeric cell".equalsIgnoreCase(e.getMessage())){
					errorString.append("第" + i + "行,系统尝试读取文本型数据，但被错误的设置为数值型");
				}else{
					errorString.append("第"+i+"行，第"+(cellColNum+1)+"列数据的单元格格式设置有错误");
				}
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
			}
		} catch (Throwable t) {
			if(t.getMessage()!=null && t.getMessage().trim().length()>0) {
				errorString.append("第" + (i+1) +"行，第"+(cellColNum+1)+"列数据，异常：["+t.getMessage()+"]");
			}else{
				errorString.append("系统执行Excel导入时发生未知异常");
			}
			t.printStackTrace();
			addMessage(redirectAttributes, "导入失败："+errorString);
		}
		return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType="+uniformMaterielType;
	}
	
	/**
	 * 平板下料单 
	 */
	public OrderBomDetail importSlab(OrderBomDetail obd) throws Exception{
		int  cellColNum;
		cellColNum = 2;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 3;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;//规格-高
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 左开角
		obd.setLeftOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 7;// 右开角
		obd.setRightOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 8;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 9;// 开角米数A/B
		String openAngleOne = orderBomDetailService.openAngleOne(obd);
		//obd.setOpenAngleMOne(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMOne(openAngleOne);
		cellColNum = 10;// 开角米数C/D
		String openAngleTwo;
		openAngleTwo = orderBomDetailService.openAngleTwo(obd);
		//obd.setOpenAngleMTwo(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMTwo(openAngleTwo);
		cellColNum = 11;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 12;// 开槽米数
		String openSlotM = orderBomDetailService.openSlotM1(obd);
		//obd.setOpenSlotM(getCellString(row.getCell(cellColNum)));
		obd.setOpenSlotM(openSlotM);
		cellColNum = 13;//重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 14;//抛光米数
		obd.setPolish(getCellString(row.getCell(cellColNum)));
		return obd;
	}
	/**
	 * 门窗套线下料单  
	 */
	public OrderBomDetail importWindow(OrderBomDetail obd) throws Exception{

		int cellColNum;
		cellColNum = 2;// 规格-半径
		obd.setStandardRadius(getCellString(row.getCell(cellColNum),true,false));
		String standardRadius = obd.getStandardRadius();
		cellColNum = 3;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;//规格-厚
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 切角转头左
		obd.setCutTurnLeft(getCellString(row.getCell(cellColNum)));
		cellColNum = 8;// 切角转头右
		obd.setCutTurnRight(getCellString(row.getCell(cellColNum)));
		cellColNum = 9;// 组装图
		obd.setAssemblyDiagramNo(getCellString(row.getCell(cellColNum),false,false));
		cellColNum = 10;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 11;// 体积
		String volume = orderBomDetailService.volume(obd);
		//obd.setVolume(getCellString(row.getCell(cellColNum)));
		obd.setVolume(volume);
		cellColNum = 12;// 切角个数
		String cutAngleCount = orderBomDetailService.cutAngleCount(obd);
		//obd.setCutAngleCount(getCellString(row.getCell(cellColNum)));
		obd.setCutAngleCount(cutAngleCount);
		cellColNum = 13;// 转头个数
		String turnAngleCount = orderBomDetailService.turnAngleCount(obd);
		//obd.setTurnAngleCount(getCellString(row.getCell(cellColNum)));
		obd.setTurnAngleCount(turnAngleCount);
		cellColNum = 14;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 15;// 滴水槽
		String waterSlotM = orderBomDetailService.waterSlotM(obd);
		//obd.setWaterSlotM(getCellString(row.getCell(cellColNum)));
		obd.setWaterSlotM(waterSlotM);
		cellColNum = 16;//饰面面积
		//obd.setFacingArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setFacingArea(area);
		cellColNum = 17;// 防水面积
		//obd.setWaterproofArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setWaterproofArea(area);
		cellColNum = 18;// 胚料面积
		//obd.setRohlingArea(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 19;// 重量
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		cellColNum = 20;// 线密度
		obd.setLineDensity(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 21;// 胚料尺寸-长
		obd.setRohlingLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 22;// 胚料尺寸-宽
		obd.setRohlingWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 23;// 胚料尺寸-厚
		obd.setRohlingDepth(getCellString(row.getCell(cellColNum),true,false));
		String wdight = orderBomDetailService.wdight3(obd);
		obd.setWdight(wdight);
		cellColNum = 24;// 是否是弧形线条
		String isFamilyLine = orderBomDetailService.isFamilyLine(standardRadius);
		//obd.setIsFamilyLine(getCellString(row.getCell(cellColNum)));
		obd.setIsFamilyLine(isFamilyLine);
		cellColNum = 25;//背切数量
		//obd.setBackCutCount(getCellString(row.getCell(cellColNum),true,false));
		String backCutCount = orderBomDetailService.backCutCount(obd);
		obd.setBackCutCount(backCutCount);
		String rohlingArea = orderBomDetailService.rohlingArea(obd);
		obd.setRohlingArea(rohlingArea);
		String rohlingVolume = orderBomDetailService.rohlingVolume(obd);
		obd.setRohlingVolume(rohlingVolume);
		return obd;
	}
	/**
	 * 腰线下料单  
	 */
	public OrderBomDetail importWaist(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-半径
		obd.setStandardRadius(getCellString(row.getCell(cellColNum),true,false));
		String standardRadius = obd.getStandardRadius();
		cellColNum = 3;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;//规格-厚
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 切角转头左
		obd.setCutTurnLeft(getCellString(row.getCell(cellColNum)));
		cellColNum = 8;// 切角转头右
		obd.setCutTurnRight(getCellString(row.getCell(cellColNum)));
		cellColNum = 9;// 组装图
		obd.setAssemblyDiagramNo(getCellString(row.getCell(cellColNum),false,false));
		cellColNum = 10;// 面积
		String area = orderBomDetailService.area(obd);
		obd.setArea(area);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		cellColNum = 11;// 体积
		String volume = orderBomDetailService.volume(obd); 
		obd.setVolume(volume);
		//obd.setVolume(getCellString(row.getCell(cellColNum)));
		cellColNum = 12;// 切角个数
		String cutAngleCount = orderBomDetailService.cutAngleCount(obd);
		obd.setCutAngleCount(cutAngleCount);
		//obd.setCutAngleCount(getCellString(row.getCell(cellColNum)));
		cellColNum = 13;// 转头个数
		String turnAngleCount = orderBomDetailService.turnAngleCount(obd);
		obd.setTurnAngleCount(turnAngleCount);
		//obd.setTurnAngleCount(getCellString(row.getCell(cellColNum)));
		cellColNum = 14;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 15;// 滴水槽
		String waterSlotM = orderBomDetailService.waterSlotM(obd);
		//obd.setWaterSlotM(getCellString(row.getCell(cellColNum)));
		obd.setWaterSlotM(waterSlotM);
		cellColNum = 16;// 重量
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		cellColNum = 17;// 线密度
		obd.setLineDensity(getCellString(row.getCell(cellColNum),true,false));
		String wdight = orderBomDetailService.wdight2(obd);
		obd.setWdight(wdight);
		cellColNum = 18;//饰面面积
		//obd.setFacingArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setFacingArea(area);
		cellColNum = 19;// 防水面积
		//obd.setWaterproofArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setWaterproofArea(area);
		cellColNum = 20;// 胚料面积
		//obd.setRohlingArea(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 21;// 胚料尺寸-长
		obd.setRohlingLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 22;// 胚料尺寸-宽
		obd.setRohlingWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 23;// 胚料尺寸-厚
		obd.setRohlingDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 24;// 是否是弧形线条
		String isFamilyLine = orderBomDetailService.isFamilyLine(standardRadius);
		//obd.setIsFamilyLine(getCellString(row.getCell(cellColNum)));
		obd.setIsFamilyLine(isFamilyLine);
		cellColNum = 25;//背切数量
		//obd.setBackCutCount(getCellString(row.getCell(cellColNum),true,false));
		String backCutCount = orderBomDetailService.backCutCount(obd);
		obd.setBackCutCount(backCutCount);
		String rohlingArea = orderBomDetailService.rohlingArea(obd);
		obd.setRohlingArea(rohlingArea);
		String rohlingVolume = orderBomDetailService.rohlingVolume(obd);
		obd.setRohlingVolume(rohlingVolume);
		return obd;
	}
	/**
	 * 造型板下料单  
	 */
	public OrderBomDetail importMould(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-半径
		obd.setStandardRadius(getCellString(row.getCell(cellColNum),true,false));
		String standardRadius = obd.getStandardRadius();
		cellColNum = 3;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;//规格-厚
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 加工图
		obd.setProcessChartNo(getCellString(row.getCell(cellColNum),false,false));
		cellColNum = 8;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 9;// 体积
		String volume = orderBomDetailService.volume(obd);
		//obd.setVolume(getCellString(row.getCell(cellColNum)));
		obd.setVolume(volume);
		cellColNum = 10;// 倒角边
		//obd.setReversedAngleLong(getCellString(row.getCell(cellColNum)));
		cellColNum = 11;//饰面面积
		//obd.setFacingArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setFacingArea(area);
		cellColNum = 12;// 防水面积
		//obd.setWaterproofArea(getCellString(row.getCell(cellColNum),true,false));
		obd.setWaterproofArea(area);
		cellColNum = 13;// 胚料面积
		//obd.setRohlingArea(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 14;// 倒角边数量
		obd.setReversedAngleCount(getCellString(row.getCell(cellColNum),true,false));
	    String reversedAngleLong = orderBomDetailService.reversedAngleLong(obd);
	    obd.setReversedAngleLong(reversedAngleLong);
		cellColNum = 15;// 重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 16;//抛光米数
		obd.setPolish(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 17;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 18;// 胚料尺寸-长
		obd.setRohlingLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 19;// 胚料尺寸-宽
		obd.setRohlingWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 20;// 胚料尺寸-厚
		obd.setRohlingDepth(getCellString(row.getCell(cellColNum),true,false));
		String rohlingArea = orderBomDetailService.rohlingArea(obd);
		obd.setRohlingArea(rohlingArea);
		String rohlingVolume = orderBomDetailService.rohlingVolume(obd);
		obd.setRohlingVolume(rohlingVolume);
		String isFamilyLine = orderBomDetailService.isFamilyLine(standardRadius);
		obd.setIsFamilyLine(isFamilyLine);
		return obd;
	}
	/**
	 * 圆柱下料单  
	 */
	public OrderBomDetail importColumn(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 4;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;//规格-厚
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 8;// 加工图
		obd.setProcessChartNo(getCellString(row.getCell(cellColNum), false, false));
		cellColNum = 9;// 面积
		String area = orderBomDetailService.yzarea(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 10;// 体积
		String volume = orderBomDetailService.volume(obd);
		//obd.setVolume(getCellString(row.getCell(cellColNum)));
		obd.setVolume(volume);
		cellColNum = 11;// 重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 12;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		return obd;
	}
	/**
	 * 雕花下料单  
	 */
	public OrderBomDetail importCarving(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 3;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;//规格-高
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 切角/转头-左
		obd.setCutTurnLeft(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 切角/转头-右
		obd.setCutTurnRight(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 8;// 加工图
		obd.setProcessChartNo(getCellString(row.getCell(cellColNum),false,false));
		cellColNum = 9;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 10;// 体积
		String volume = orderBomDetailService.volume(obd);
		obd.setVolume(getCellString(row.getCell(cellColNum)));
		obd.setVolume(volume);
		cellColNum = 11;// 切角个数
		String cutAngleCount = orderBomDetailService.cutAngleCount(obd);
		//obd.setCutAngleCount(getCellString(row.getCell(cellColNum)));
		obd.setCutAngleCount(cutAngleCount);
		cellColNum = 12;// 转头个数
		String turnAngleCount = orderBomDetailService.turnAngleCount(obd);
		//obd.setTurnAngleCount(getCellString(row.getCell(cellColNum)));
		obd.setTurnAngleCount(turnAngleCount);
		cellColNum = 13;// 重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 14;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		return obd;
	}
	/**
	 * 弧形板下料单  
	 */
	public OrderBomDetail importArc(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-半径
		obd.setStandardRadius(getCellString(row.getCell(cellColNum),true,false));
		String standardRadius = obd.getStandardRadius();
		cellColNum = 3;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;//规格-厚
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 加工图
		obd.setProcessChartNo(getCellString(row.getCell(cellColNum), false, false));
		cellColNum = 8;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 9;// 体积
		String volume = orderBomDetailService.volume(obd);
		//obd.setVolume(getCellString(row.getCell(cellColNum)));
		obd.setVolume(volume);
		cellColNum = 10;// 倒角边
		//obd.setReversedAngleLong(getCellString(row.getCell(cellColNum), true, false));
		cellColNum = 11;//饰面面积
		//obd.setFacingArea(getCellString(row.getCell(cellColNum), true, false));
		obd.setFacingArea(area);
		cellColNum = 12;// 防水面积
		//obd.setWaterproofArea(getCellString(row.getCell(cellColNum), true, false));
		obd.setWaterproofArea(area);
		cellColNum = 13;// 胚料面积
		//obd.setRohlingArea(getCellString(row.getCell(cellColNum), true, false));
		cellColNum = 14;//倒角边数量
		obd.setReversedAngleCount(getCellString(row.getCell(cellColNum),true,false));
	    String reversedAngleLong = orderBomDetailService.reversedAngleLong(obd);
	    obd.setReversedAngleLong(reversedAngleLong);	
		cellColNum = 15;// 重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 16;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 17;// 胚料尺寸-长
		obd.setRohlingLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 18;// 胚料尺寸-宽
		obd.setRohlingWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 19;// 胚料尺寸-厚
		obd.setRohlingDepth(getCellString(row.getCell(cellColNum),true,false));
		String rohlingArea = orderBomDetailService.rohlingArea(obd);
		obd.setRohlingArea(rohlingArea);
		String rohlingVolume = orderBomDetailService.rohlingVolume(obd);
		obd.setRohlingVolume(rohlingVolume);
		String isFamilyLine = orderBomDetailService.isFamilyLine(standardRadius);
		obd.setIsFamilyLine(isFamilyLine);
		return obd;
	}
	/**
	 * 屋檐板下料单  
	 */
	public OrderBomDetail importEave(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 3;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;//规格-高
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 左开角
		obd.setLeftOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 7;// 右开角
		obd.setRightOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 8;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 9;// 开角米数A/B
		String openAngleOne = orderBomDetailService.openAngleOne(obd);
		//obd.setOpenAngleMOne(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMOne(openAngleOne);
		cellColNum = 10;// 开角米数C/D
		String openAngleTwo = orderBomDetailService.openAngleTwo(obd);
		//obd.setOpenAngleMTwo(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMTwo(openAngleTwo);
		cellColNum = 11;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 12;// 开槽米数
		String openSlotM = orderBomDetailService.openSlotM1(obd);
		//obd.setOpenSlotM(getCellString(row.getCell(cellColNum)));
		obd.setOpenSlotM(openSlotM);
		cellColNum = 13;//重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 14;//抛光米数
		obd.setPolish(getCellString(row.getCell(cellColNum),true,false));
		return obd;
	}
	/**
	 * 窗侧板下料单  
	 */
	public OrderBomDetail importReveal(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 3;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;//规格-高
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;// 左开角
		obd.setLeftOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 7;// 右开角
		obd.setRightOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 8;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 9;// 开角米数A/B
		String openAngleOne = orderBomDetailService.openAngleOne(obd);
		//obd.setOpenAngleMOne(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMOne(openAngleOne);
		cellColNum = 10;// 开角米数C/D
		String openAngleTwo = orderBomDetailService.openAngleTwo(obd);
		//obd.setOpenAngleMTwo(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMTwo(openAngleTwo);
		cellColNum = 11;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 12;// 开槽米数
		String openSlotM = orderBomDetailService.openSlotM1(obd);
		//obd.setOpenSlotM(getCellString(row.getCell(cellColNum)));
		obd.setOpenSlotM(openSlotM);
		cellColNum = 13;//重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		cellColNum = 14;//抛光米数
		obd.setPolish(getCellString(row.getCell(cellColNum),true,false));
		return obd;
	}
	/**
	 * 平板下料单（工字缝）  
	 */
	public OrderBomDetail importSeam(OrderBomDetail obd) throws Exception{
		int cellColNum;
		cellColNum = 2;// 规格-长
		obd.setStandardLong(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 3;// 规格-L1
		obd.setStandardL1(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 4;//规格-L2
		obd.setStandardL2(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 5;// 规格-宽
		obd.setStandardWidth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 6;//规格-高
		obd.setStandardDepth(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 7;// 数量
		obd.setCount(getCellString(row.getCell(cellColNum),true,false));
		cellColNum = 8;// 左开角
		obd.setLeftOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 9;// 右开角
		obd.setRightOpenAngle(getCellString(row.getCell(cellColNum)));
		cellColNum = 10;// 面积
		String area = orderBomDetailService.area(obd);
		//obd.setArea(getCellString(row.getCell(cellColNum)));
		obd.setArea(area);
		cellColNum = 11;// 开角米数A/B
		String openAngleOne = orderBomDetailService.openAngleOne(obd);
		//obd.setOpenAngleMOne(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMOne(openAngleOne);
		cellColNum = 12;// 开角米数C/D
		String openAngleTwo = orderBomDetailService.openAngleTwo(obd);
		//obd.setOpenAngleMTwo(getCellString(row.getCell(cellColNum)));
		obd.setOpenAngleMTwo(openAngleTwo);
		cellColNum = 13;//加工图
		obd.setProcessChartNo(getCellString(row.getCell(cellColNum),false,false));
		cellColNum = 14;// 备注
		obd.setRemark(getCellString(row.getCell(cellColNum)));
		cellColNum = 15;// 开槽米数
		String openSlotM = orderBomDetailService.openSlotM2(obd);
		//obd.setOpenSlotM(getCellString(row.getCell(cellColNum)));
		obd.setOpenSlotM(openSlotM);
		cellColNum = 16;//重量
		String wdight = orderBomDetailService.wdight1(obd);
		//obd.setWdight(getCellString(row.getCell(cellColNum)));
		obd.setWdight(wdight);
		return obd;
	}
	
	
	/**
	 * 石材类下料单导入  
	 * @param multipartFile
	 * @param request
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "importStone")
	@Transactional(readOnly = false)
	public String importStone(OrderBomBase orderBomBase,MultipartFile multipartFile, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String orderType = request.getParameter("orderType");
		int uniformMaterielTypeNum = Integer.valueOf(orderType).intValue();
		String uniformMaterielType = uniformMaterielTypeNum + "";
		
		orderBomBase.setOrderType(orderType);//下料单类型 
		String orderBomNo = this.createOrderBomBaseNumber(orderBomBase);
		orderBomBase.setId(IdGen.uuid());
		orderBomBase.setOrderBomNo(orderBomNo);
		orderBomBase.setOrderMadeTime(new Date());
		orderBomBase.setCreateUser(UserUtils.getUser().getName());
		orderBomBase.setUniformMaterielType(uniformMaterielType);
		
		StringBuilder errorString = new StringBuilder();
		InputStream inputstream = null;
		HSSFWorkbook workBook = null;
		int i = 3;
		int cellColNum = 0;
		try{
			try {
				inputstream = multipartFile.getInputStream();
				workBook = new HSSFWorkbook(inputstream);
			} catch (FileNotFoundException e) {
				errorString.append(e.getMessage());
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
			} catch (IOException e) {
				if(e.getMessage().startsWith("Invalid header signature")){
					errorString.append("系统无法解析此Excel文件。");
				}else{
					errorString.append(e.getMessage());
				}
				addMessage(redirectAttributes, "导入失败："+errorString);
				return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
			}finally{
				try {
					if(inputstream!=null){
						inputstream.close();
					}
				} catch (IOException e) {
					addMessage(redirectAttributes, "导入失败："+e.getMessage());
					return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
				}
			}	
			
			//模版有4个sheet 对应‘东、南、西、北’4个立面
			List<OrderBomDetail> obdList = new ArrayList<OrderBomDetail>();
			int sheetNum = 0;
			sheetNum = workBook.getNumberOfSheets();
			
//			if (workBook.getNumberOfSheets()<4) {
//				sheetNum = 1;
//			}else {
//				sheetNum = workBook.getNumberOfSheets();
//			}
			
			for (int j = 0; j < sheetNum; j++) {
				HSSFSheet sheet = workBook.getSheetAt(j);
				String sheetName = sheet.getSheetName();//立面方向
				int rowNum = sheet.getPhysicalNumberOfRows();
				if (rowNum < 4) {
					errorString.append("Excel工作薄的第"+(j+1)+"个sheet的记录为空，"+sheetName+"的数据导入失败！<br/>");
					continue;
				}
				//校验模板是否正确
				try {
					row = sheet.getRow(0);// 取行信息
					String cellValue = this.getCellString(row.getCell(0));
					String title = "";
					if(CommonConstant.OrderBomBase_SLAB.equals(orderType)){
						title = "平板下料单";
					}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderType)){
						title = "门窗套线下料单";
					}else if(CommonConstant.OrderBomBase_WAIST.equals(orderType)){
						title = "腰线下料单";
					}else if(CommonConstant.OrderBomBase_MOULD.equals(orderType)){
						title = "造型板下料单";
					}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderType)){
						title = "圆柱下料单";
					}else if(CommonConstant.OrderBomBase_CARVING.equals(orderType)){
						title = "雕花下料单";
					}else if(CommonConstant.OrderBomBase_ARC.equals(orderType)){
						title = "弧形板下料单";
					}else if(CommonConstant.OrderBomBase_EAVE.equals(orderType)){
						title = "屋檐板下料单";
					}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderType)){
						title = "窗侧板下料单";
					}else if(CommonConstant.OrderBomBase_SEAM.equals(orderType)){
						title = "平板下料单工字缝";
					}else{
						title = " ";
					}
					if(!title.equals(cellValue.trim())){
						addMessage(redirectAttributes, "导入失败：模版错误请重新下载模版！<br/>");
						return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
					}
				} catch (Exception e) {
					addMessage(redirectAttributes, "导入失败："+e.getMessage());
					return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
				}
				try {
					for (i = 3; i < rowNum; i++) {
						OrderBomDetail obd = new OrderBomDetail();
						row = sheet.getRow(i);// 取行信息
						cellColNum = 0;
						String cellValue = getCellString(row.getCell(cellColNum));
						if(CommonConstant.TEMPLATE_SUBTOTAL.equals(cellValue.trim())){
					    	//如果是小计 则直接跳过
					    	continue;
					    }
						if (cellValue == null || cellValue.trim().length() == 0) {
							errorString.append("第"+(j+1)+"个sheet:"+sheetName+"的第" + (i+1) + "行,箱号为空，导入失败！<br/>");					
							break;
						} else {
							obd.setBoxNo(cellValue);
						}
						
						String[] fourSheet = {CommonConstant.OrderBomBase_SLAB, CommonConstant.OrderBomBase_WAIST, CommonConstant.OrderBomBase_EAVE, 
								CommonConstant.OrderBomBase_REVEAL, CommonConstant.OrderBomBase_SEAM};
						
						String[] oneSheet = {CommonConstant.OrderBomBase_WINDOW, CommonConstant.OrderBomBase_MOULD, CommonConstant.OrderBomBase_CARVING, 
								CommonConstant.OrderBomBase_ARC}; 
						
						if (Arrays.asList(fourSheet).contains(orderType)) {
							cellColNum = 1; //石材编号
						    cellValue = this.getCellString(row.getCell(cellColNum));
							if (cellValue == null || cellValue.trim().length() == 0) {
								errorString.append("第"+(j+1)+"个sheet:"+sheetName+"的第" + (i+1) + "行的石材编号为空，导入失败！<br/>");
								break;
							}else{
								obd.setId(IdGen.uuid());
								obd.setOrderBomId(orderBomBase.getId());
								obd.setMaterielNo(cellValue);
							}
						}
						
						if (Arrays.asList(oneSheet).contains(orderType)) {
							cellColNum = 1; //石材编号
						    cellValue = this.getCellString(row.getCell(cellColNum));
							if (cellValue == null || cellValue.trim().length() == 0) {
								errorString.append("第" + (i+1) + "行的编号为空，系统无法导入");
								addMessage(redirectAttributes, "导入失败："+errorString);
								return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
							}else{
								obd.setId(IdGen.uuid());
								obd.setOrderBomId(orderBomBase.getId());
								obd.setMaterielNo(cellValue);
							}
						}
						
						if (CommonConstant.OrderBomBase_COLUMN.equals(orderType)) {
							cellColNum = 1;// 圆柱类型
							StringBuffer cv = new StringBuffer();
							cv.append(getCellString(row.getCell(cellColNum))==null || "".equals(getCellString(row.getCell(cellColNum)))?" ":getCellString(row.getCell(cellColNum)));
							cv.append(" ┋  ");
							cv.append(getCellString(row.getCell(cellColNum+1))==null || "".equals(getCellString(row.getCell(cellColNum+1)))?" ":getCellString(row.getCell(cellColNum+1)));
							obd.setMaterielType(cv.toString());
							
							cellColNum = 3; //圆柱编号
						    cellValue = this.getCellString(row.getCell(cellColNum));
							if (cellValue == null || cellValue.trim().length() == 0) {
								errorString.append("第" + (i+1) + "行的圆柱编号为空，系统无法导入");
								addMessage(redirectAttributes, "导入失败："+errorString);
								return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=6";
							}else{
								obd.setId(IdGen.uuid());
								obd.setOrderBomId(orderBomBase.getId());
								obd.setMaterielNo(cellValue);
							}
						}
								
						if(CommonConstant.OrderBomBase_SLAB.equals(orderType)){
							obd = this.importSlab(obd);
							obd.setOutsideWallOrientation(sheetName.trim());//立面方向
							obdList.add(obd);	
						}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderType)){
							obd = this.importWindow(obd);
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_WAIST.equals(orderType)){
							obd = this.importWaist(obd);
							obd.setOutsideWallOrientation(sheetName.trim());//立面方向	
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_MOULD.equals(orderType)){
							obd = this.importMould(obd);
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderType)){
							obd = this.importColumn(obd);
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_CARVING.equals(orderType)){
							obd = this.importCarving(obd);
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_ARC.equals(orderType)){
							obd = this.importArc(obd);
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_EAVE.equals(orderType)){
							obd = this.importEave(obd);
							obd.setOutsideWallOrientation(sheetName.trim());//立面方向
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderType)){
							obd = this.importReveal(obd);
							obd.setOutsideWallOrientation(sheetName.trim());//立面方向
							obdList.add(obd);
						}else if(CommonConstant.OrderBomBase_SEAM.equals(orderType)){
							obd = this.importSeam(obd);
							obd.setOutsideWallOrientation(sheetName.trim());//立面方向
							obdList.add(obd);
						}
					}
				} catch (IllegalStateException e) {
					if("Cannot get a text value from a numeric cell".equalsIgnoreCase(e.getMessage())){
						errorString.append("第"+(j+1)+"个sheet:"+sheetName+"第" + i + "行,系统尝试读取文本型数据，但被错误的设置为数值型，导入失败！<br/>");
					}else{
						errorString.append("第"+(j+1)+"个sheet:"+sheetName+"第"+i+"行，第"+(cellColNum+1)+"列数据的单元格格式设置有错误，导入失败！<br/>");
					}
					break;
				}
			}
			if(obdList.size()>0){
				orderBomDetailService.batchInsert(obdList);
				orderBomBaseService.insert(orderBomBase);
				errorString.append("成功导入"+obdList.size()+"条！<br/>");
			}else{
				errorString.append("导入失败！<br/>");
			}
//			int num = 0;
//			for(OrderBomDetail o :obdList){
//				orderBomDetailService.insert(o);
//				num++;
//			}
//			if(obdList.size() > 0){
//				orderBomBaseService.insert(orderBomBase);
//				errorString.append("成功导入"+obdList.size()+"条！<br/>");
//			}else{
//				errorString.append("导入失败！<br/>");
//			}
		} catch (Throwable t) {
			if(t.getMessage()!=null && t.getMessage().trim().length()>0) {
				errorString.append("第" + (i+1) +"行，第"+(cellColNum+1)+"列数据，异常：["+t.getMessage()+"]，导入失败！<br/>");
			}else{
				errorString.append("系统执行Excel导入时发生未知异常，导入失败！<br/>");
			}
			t.printStackTrace();
		}
		addMessage(redirectAttributes,errorString.toString());
		return "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
	}
	
	
	private String getCellString(HSSFCell cell,boolean decimalFormat,boolean isMust) throws Exception{
		String value = getCellString(cell);
		if(value==null||value.trim().length()==0){
			return value;
		}
		if(decimalFormat){
			//解析读入的科学技术法
			Double d = null;
			try{
				d = Double.parseDouble(value);
			}catch(NumberFormatException e){
				if(isMust){//如果是必输项
					throw new Exception("格式非法，期望为数值型，但取值为["+value+"]");
				}
			}
			if(d!=null){
				value =new DecimalFormat("#.###").format(d);
			}
		}
		return value; 
	}
	private String getCellString(HSSFCell cell) throws Exception{
		String value = null;
		if(cell!=null){
			int type = cell.getCellType();
			if(type==HSSFCell.CELL_TYPE_STRING){
				value = cell.getStringCellValue();
				if(value!=null){
					value = value.trim();
				}
			}else if(type==HSSFCell.CELL_TYPE_NUMERIC){
				value = cell.getNumericCellValue()+"";
			}else if(type==HSSFCell.CELL_TYPE_BOOLEAN){
				value = cell.getBooleanCellValue()+"";
			}else if(type==HSSFCell.CELL_TYPE_BLANK){
				value = "";
			}else if(type== HSSFCell.CELL_TYPE_FORMULA){
//				HSSFFormulaEvaluator evaluator = new HSSFFormulaEvaluator(sheet, hssfworkbook);
//				HSSFFormulaEvaluator.CellValue tempCellValue = evaluator.evaluate(cell);
//              double iCellValue = tempCellValue.getNumberValue();
				value = cell.getNumericCellValue()+"";
			}else if(type== HSSFCell.CELL_TYPE_ERROR){
				value = "";
			}
		}
		return value;
	}	
	
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String orderType = request.getParameter("orderType");
		//获取前端勾选项
		OrderBomBase orderBomBase = null;
		String[] oCheckd = request.getParameterValues("vCheckd");
		if(oCheckd != null && oCheckd.length > 0){
			String[] orderId = oCheckd[0].split(",");
			if(orderId != null && orderId.length > 0){
				for (int i = 0; i < orderId.length; i++) {
					orderBomBase = orderBomBaseService.get(orderId[i]);
					if(orderBomBase != null){
						orderBomBaseService.delete(orderBomBase);
						OrderBomDetail orderBomDetail = new OrderBomDetail();
						orderBomDetail.setOrderBomId(orderBomBase.getId());
						orderBomDetailService.deleteByOIdUp(orderBomDetail);
						addMessage(redirectAttributes, "下料单删除成功");
					}
				}
			}
		}else{
			addMessage(redirectAttributes, "下料单删除失败");
		}
		String returnUrl = "";
		if (orderType.equals(CommonConstant.OrderBomBase_PURCHASE)) {
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(orderBomBase.getUniformMaterielType())){
				returnUrl = "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType=1";
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(orderBomBase.getUniformMaterielType())){
				returnUrl = "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType=1&uniformMaterielType=2";
			}
		}else {
			returnUrl = "redirect:" + adminPath + "/orbom/orderBomBase/list?orderType="+orderType;
		}
		return returnUrl;
	}
	
	@RequestMapping(value = "form")
	public String form(OrderBomBase orderBomBase, Model model) {
		model.addAttribute("orderBomBase", orderBomBase);
		return "modules/orbom/orderBomBaseForm";
	}

	@RequestMapping(value = "save")
	public String save(OrderBomBase orderBomBase, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, orderBomBase)){
			return form(orderBomBase, model);
		}
		orderBomBaseService.save(orderBomBase);
		addMessage(redirectAttributes, "保存下料单基本表成功");
		return "redirect:"+Global.getAdminPath()+"/orbom/orderBomBase/?repage";
	}
	
	
	/**
	 * 上传附件
	 * @param file
	 * @param request
	 * @param redirectAttributes
	 * @return
	 * @throws BusinessException 
	 */
	@ResponseBody
	@RequestMapping(value = "upload",method=RequestMethod.POST)
	public String upload(@RequestParam(value = "file") MultipartFile file,String uploadOrderId, HttpServletRequest request,RedirectAttributes redirectAttributes) throws BusinessException {
		String dirName = DictUtils.getDictValue("orderBomBase/file","upload_path_type","orderBomBase/file");
		UploadUtils utils = new UploadUtils();
		return utils.uploadFile(file, request,dirName,uploadOrderId);
	}
	
	/**
	 * 下载附件
	 * @param request
	 * @param response
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value="download")
	public void download(HttpServletRequest request, HttpServletResponse response,Model model) throws BusinessException {
		
		UploadUtils utils = new UploadUtils();
		utils.download(request,response);
	}
	
	/**
	 * 提交(开始流程)
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"submitOrder"})
	@ResponseBody
	@Transactional(readOnly = false)
	public String submitOrder(HttpServletRequest request,HttpServletResponse response,Model model) {
		String orderId = request.getParameter("orderBomId");
		String copyNum = request.getParameter("copyNum");
		String flag = "false";
		OrderBomBase order = null;
		if(orderId != null && StringUtils.isNotBlank(orderId)){
			 order = orderBomBaseService.get(orderId);
		}else{
			order = new OrderBomBase();
		}
		//创建一个新的流程
		if(order != null){
			Map<String,Object> variable = new HashMap<String, Object>();
			variable.put(ActivitiConstants.PERSIST_BEAN_NAME, OrderBomBaseService.BEAN_NAME);
//			variable.put(ActivitiConstants.PRIMARY_KEY, order);
			variable.put(ActivitiConstants.PRIMARY_KEY, order.getId());
			//variable.put("copyNum", copyNum);
			String actID = actTaskService.startProcess("SubmitMaterialsFormFlow", "btg_order_bom_base", "workflow_id","下料单审核",variable);
			order.setWorkflowid(actID);
			order.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
			order.setCopyNum(copyNum);
			if(order.getId() != null && StringUtils.isNotBlank(order.getId())){
				orderBomBaseService.updateWorkflowId(order);
				flag = "true";
			}	
		}
		return flag;
	}

	@RequestMapping(value = "findAllOrderBySubProjForSC/{subProjId}", method = RequestMethod.GET)
	public @ResponseBody List<OrderBomBase> findAllOrderBySubProjForSC(@PathVariable String subProjId){
		return orderBomBaseService.findAllOrderBySubProjForSC(subProjId);
	}

	@RequestMapping(value = "findAllOrderBySubProjForGFL/{subProjId}", method = RequestMethod.GET)
	public @ResponseBody List<OrderBomBase> findAllOrderBySubProjForGFL(@PathVariable String subProjId){
		return orderBomBaseService.findAllOrderBySubProjForGFL(subProjId);
	}
	
}