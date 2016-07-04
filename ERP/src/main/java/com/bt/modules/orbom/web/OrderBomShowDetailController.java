/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.orbom.web;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.material.service.MaterialService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomDetailService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.service.PurchaseDemandSubProjectMappingService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.MathUtil;
import com.bt.modules.utils.RequestUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 下料单明细表Controller
 * @author ljp
 * @version 2015-08-05
 */
@Controller
@RequestMapping(value = "${adminPath}/orbom/orderBomShowDetail")
public class OrderBomShowDetailController extends BaseController {
	
	@Autowired
	private OrderBomBaseService orderBomBaseService;//下料单基本服务
	@Autowired
	private OrderBomDetailService orderBomDetailService;
	@Autowired
	private PurchaseDemandSubProjectMappingService purchaseDemandSubProjectMappingService;
	@Autowired
	private SubProjectService subProjectService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private MaterialService materialService;// 物料信息Service
	//附件管理服务
	@Autowired
	private AttachmentService attachService;
	@Autowired
	private ProductionService productionService;//生产订单
	
	
	@RequestMapping(value = {"showDetail"})
	public String list(OrderBomDetail orderBomDetail, HttpServletRequest request, HttpServletResponse response, Model model) throws BusinessException {
		String orderType = request.getParameter("orderType");
		String orderId = request.getParameter("orderBomId");
		String outsideWallOrientation = RequestUtils.getParameter(request, "outsideWallOrientation");
		orderBomDetail.setOutsideWallOrientation(outsideWallOrientation);
		String returnUrlStr = request.getParameter("returnUrl");
		String returnUrl = "";
		if(CommonConstant.OrderBomBase_PURCHASE.equals(orderType)){
			String uniformMaterielType = request.getParameter("uniformMaterielType");
			if(CommonConstant.OrderBomBase_MATERIAL_STONE.equals(uniformMaterielType)){
				returnUrl = "modules/orbom/showDetail/orderBomPurchaseStoneDetailList";
			}else if(CommonConstant.OrderBomBase_MATERIAL_FRAME.equals(uniformMaterielType)){
				returnUrl = "modules/orbom/showDetail/orderBomPurchaseFrameDetailList";
			}
		}else if(CommonConstant.OrderBomBase_SLAB.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomSlabDetailList";
		}else if(CommonConstant.OrderBomBase_WINDOW.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomWindowDetailList";
		}else if(CommonConstant.OrderBomBase_WAIST.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomWaistDetailList";
		}else if(CommonConstant.OrderBomBase_MOULD.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomMouldDetailList";
		}else if(CommonConstant.OrderBomBase_COLUMN.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomColumnDetailList";
		}else if(CommonConstant.OrderBomBase_CARVING.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomCarvingDetailList";
		}else if(CommonConstant.OrderBomBase_ARC.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomArcDetailList";
		}else if(CommonConstant.OrderBomBase_EAVE.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomEaveDetailList";
		}else if(CommonConstant.OrderBomBase_REVEAL.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomRevealDetailList";
		}else if(CommonConstant.OrderBomBase_SEAM.equals(orderType)){
			returnUrl = "modules/orbom/showDetail/orderBomSeamDetailList";
		}else{
			returnUrl = "modules/orbom/showDetail/orderBomBaseList";
		}
		//只查询对应箱
		List<String> boxNos = this.getBoxNos(orderId);
		orderBomDetail.setBoxNos(boxNos);
		orderBomDetail.setOrderBomId(orderId);
		
		List<OrderBomDetail> listOne = orderBomDetailService.findList(orderBomDetail); 
		List<OrderBomDetail> listTwo = this.compute(listOne,model);
		List<Map<String, Object>> listMap = projectService.gbProByName();
		OrderBomBase order = orderBomBaseService.get(orderId);
		List<String> outsideWallOrientationList = orderBomDetailService.selectOutsideWallOrientation(order.getId());
		Project p = null;
		Subproject sp = null;
		if(order != null){
			if(order.getSubProjId() != null){
				//获取二级项目信息
				sp = subProjectService.get(order.getSubProjId());
				if(sp != null){
					//获取一级项目信息
					p = projectService.get(sp.getProjectId());
				}
			}
		}
		//根据下料单ID获取附件
//		Attachment attachment = new Attachment();
//		attachment.setType(order.getId());
//		List<Attachment> attachList = attachService.findAttachType(attachment);
//		model.addAttribute("attachList", attachList);
		model.addAttribute("subProject", sp);
		model.addAttribute("project", p);
		model.addAttribute("outsideWallOrientationList",outsideWallOrientationList);
		model.addAttribute("orderBomBase", order);
		model.addAttribute("listTwo", listTwo);
		model.addAttribute("listOne", listOne);
		model.addAttribute("listMap", listMap);
		model.addAttribute("returnUrl", returnUrlStr);
		model.addAttribute("outsideWallOrientation",orderBomDetail.getOutsideWallOrientation());//;立面方向
		return returnUrl;
	}

	/**
	 * 
	 * @param obbId
	 * @return
	 */
	public List<String> getBoxNos(String obbId){
		Production production = new Production();
		Supplier supp = new Supplier();
		supp.setBusinessPreson(UserUtils.getUser().getId());
		production.setSupp(supp);
		production.setStatus(CommonStatus.PRODUCTION_DQS);
		OrderBomBase o = new OrderBomBase();
		o.setId(obbId);
		production.setOrderBomBase(o);
		List<Production> list = productionService.getDetail(production);
		List<String> boxNos = new ArrayList<String>();
		for(Production p:list){
			boxNos.add(p.getOrderBomDetail().getBoxNo());
		}
		return boxNos;
	}
	//统计
	private List<OrderBomDetail> compute(List<OrderBomDetail> listOne,Model model){
		List<OrderBomDetail> listTwo = new ArrayList<OrderBomDetail>();
		try {
			if(listOne != null && listOne.size() > 0){
				boolean flag = true;
				String boxNo = "";
				//小计				
				double countSubtotal = 0;		// 数量
				double volumeSubtotal = 0;		// 体积
				double areaSubtotal = 0;		// 面积
				double wdightSubtotal = 0;		// 重量
				double cutAngleCountSubtotal = 0;		// 切角个数
				double turnAngleCountSubtotal = 0;		// 转角个数
				double openAngleMOneSubtotal = 0;		// 开角米数A/B
				double openAngleMTwoSubtotal = 0;		// 开角米数C/D
				double openSlotMSubtotal = 0;		// 开槽米数
				double waterSlotMSubtotal = 0;		// 滴水槽米数
				double reversedAngleCountSubtotal = 0;		// 倒边角数量
				//总计
				double countTotal = 0;		// 数量
				double volumeTotal = 0;		// 体积
				double areaTotal = 0;		// 面积
				double wdightTotal = 0;		// 重量
				double cutAngleCountTotal = 0;		// 切角个数
				double turnAngleCountTotal = 0;		// 转角个数
				double openAngleMOneTotal = 0;		// 开角米数A/B
				double openAngleMTwoTotal = 0;		// 开角米数C/D
				double openSlotMTotal = 0;		// 开槽米数
				double waterSlotMTotal = 0;		// 滴水槽米数
				double reversedAngleCountTotal = 0;		// 倒边角数量
				for(OrderBomDetail obd : listOne){
					if(flag){
						boxNo = obd.getBoxNo();
						flag = false;
					}
					//箱号相等 小计累加
					if(boxNo != null && boxNo.equals(obd.getBoxNo())){
						countSubtotal = MathUtil.sum(countSubtotal, ((obd.getCount()==null||"".equals(obd.getCount()))?"0":obd.getCount()));
						volumeSubtotal = MathUtil.sum(volumeSubtotal, ((obd.getVolume()==null||"".equals(obd.getVolume()))?"0":obd.getVolume()));
						areaSubtotal = MathUtil.sum(areaSubtotal, ((obd.getArea()==null||"".equals(obd.getArea()))?"0":obd.getArea()));
						wdightSubtotal = MathUtil.sum(wdightSubtotal, ((obd.getWdight()==null||"".equals(obd.getWdight()))?"0":obd.getWdight()));
						cutAngleCountSubtotal = MathUtil.sum(cutAngleCountSubtotal, ((obd.getCutAngleCount()==null||"".equals(obd.getCutAngleCount()))?"0":obd.getCutAngleCount()));
						turnAngleCountSubtotal = MathUtil.sum(turnAngleCountSubtotal, ((obd.getTurnAngleCount()==null||"".equals(obd.getTurnAngleCount()))?"0":obd.getTurnAngleCount()));
						openAngleMOneSubtotal = MathUtil.sum(openAngleMOneSubtotal, ((obd.getOpenAngleMOne()==null||"".equals(obd.getOpenAngleMOne()))?"0":obd.getOpenAngleMOne()));
						openAngleMTwoSubtotal = MathUtil.sum(openAngleMTwoSubtotal, ((obd.getOpenAngleMTwo()==null||"".equals(obd.getOpenAngleMTwo()))?"0":obd.getOpenAngleMTwo()));
						openSlotMSubtotal = MathUtil.sum(openSlotMSubtotal, ((obd.getOpenSlotM()==null||"".equals(obd.getOpenSlotM()))?"0":obd.getOpenSlotM()));
						waterSlotMSubtotal = MathUtil.sum(waterSlotMSubtotal, ((obd.getWaterSlotM()==null||"".equals(obd.getWaterSlotM()))?"0":obd.getWaterSlotM()));
						reversedAngleCountSubtotal = MathUtil.sum(reversedAngleCountSubtotal, ((obd.getReversedAngleCount()==null||"".equals(obd.getReversedAngleCount()))?"0":obd.getReversedAngleCount()));
					}else{
						boxNo = obd.getBoxNo();
						OrderBomDetail detail = new OrderBomDetail();
						detail.setMaterielNo("小计");
						detail.setCount(Double.toString(countSubtotal));
						detail.setVolume(Double.toString(volumeSubtotal));
						detail.setArea(Double.toString(areaSubtotal));
						detail.setWdight(Double.toString(wdightSubtotal));
						detail.setCutAngleCount(Double.toString(cutAngleCountSubtotal));
						detail.setTurnAngleCount(Double.toString(turnAngleCountSubtotal));
						detail.setOpenAngleMOne(Double.toString(openAngleMOneSubtotal));
						detail.setOpenAngleMTwo(Double.toString(openAngleMTwoSubtotal));
						detail.setOpenSlotM(Double.toString(openSlotMSubtotal));
						detail.setWaterSlotM(Double.toString(waterSlotMSubtotal));
						detail.setReversedAngleCount(Double.toString(reversedAngleCountSubtotal));
						listTwo.add(detail);
						
						countSubtotal = Double.parseDouble((obd.getCount()==null||"".equals(obd.getCount()))?"0":obd.getCount());
						volumeSubtotal = Double.parseDouble((obd.getVolume()==null||"".equals(obd.getVolume()))?"0":obd.getVolume());
						areaSubtotal = Double.parseDouble((obd.getArea()==null||"".equals(obd.getArea()))?"0":obd.getArea());
						wdightSubtotal = Double.parseDouble((obd.getWdight()==null||"".equals(obd.getWdight()))?"0":obd.getWdight());
						cutAngleCountSubtotal = Double.parseDouble((obd.getCutAngleCount()==null||"".equals(obd.getCutAngleCount()))?"0":obd.getCutAngleCount());
						turnAngleCountSubtotal = Double.parseDouble((obd.getTurnAngleCount()==null||"".equals(obd.getTurnAngleCount()))?"0":obd.getTurnAngleCount());
						openAngleMOneSubtotal = Double.parseDouble((obd.getOpenAngleMOne()==null||"".equals(obd.getOpenAngleMOne()))?"0":obd.getOpenAngleMOne());
						openAngleMTwoSubtotal = Double.parseDouble((obd.getOpenAngleMTwo()==null||"".equals(obd.getOpenAngleMTwo()))?"0":obd.getOpenAngleMTwo());
						openSlotMSubtotal = Double.parseDouble((obd.getOpenSlotM()==null||"".equals(obd.getOpenSlotM()))?"0":obd.getOpenSlotM());
						waterSlotMSubtotal = Double.parseDouble((obd.getWaterSlotM()==null||"".equals(obd.getWaterSlotM()))?"0":obd.getWaterSlotM());
						reversedAngleCountSubtotal = Double.parseDouble((obd.getReversedAngleCount()==null||"".equals(obd.getReversedAngleCount()))?"0":obd.getReversedAngleCount());
					}
					listTwo.add(obd);
					//总计
					countTotal = MathUtil.sum(countTotal, ((obd.getCount()==null||"".equals(obd.getCount()))?"0":obd.getCount()));
					volumeTotal = MathUtil.sum(volumeTotal, ((obd.getVolume()==null||"".equals(obd.getVolume()))?"0":obd.getVolume()));
					areaTotal = MathUtil.sum(areaTotal, ((obd.getArea()==null||"".equals(obd.getArea()))?"0":obd.getArea()));
					wdightTotal = MathUtil.sum(wdightTotal, ((obd.getWdight()==null||"".equals(obd.getWdight()))?"0":obd.getWdight()));
					cutAngleCountTotal = MathUtil.sum(cutAngleCountTotal, ((obd.getCutAngleCount()==null||"".equals(obd.getCutAngleCount()))?"0":obd.getCutAngleCount()));
					turnAngleCountTotal = MathUtil.sum(turnAngleCountTotal, ((obd.getTurnAngleCount()==null||"".equals(obd.getTurnAngleCount()))?"0":obd.getTurnAngleCount()));
					openAngleMOneTotal = MathUtil.sum(openAngleMOneTotal, ((obd.getOpenAngleMOne()==null||"".equals(obd.getOpenAngleMOne()))?"0":obd.getOpenAngleMOne()));
					openAngleMTwoTotal = MathUtil.sum(openAngleMTwoTotal, ((obd.getOpenAngleMTwo()==null||"".equals(obd.getOpenAngleMTwo()))?"0":obd.getOpenAngleMTwo()));
					openSlotMTotal = MathUtil.sum(openSlotMTotal, ((obd.getOpenSlotM()==null||"".equals(obd.getOpenSlotM()))?"0":obd.getOpenSlotM()));
					waterSlotMTotal = MathUtil.sum(waterSlotMTotal, ((obd.getWaterSlotM()==null||"".equals(obd.getWaterSlotM()))?"0":obd.getWaterSlotM()));
					reversedAngleCountTotal = MathUtil.sum(reversedAngleCountTotal, ((obd.getReversedAngleCount()==null||"".equals(obd.getReversedAngleCount()))?"0":obd.getReversedAngleCount()));
				}
				if(!flag){
					OrderBomDetail detail = new OrderBomDetail();
					detail.setMaterielNo("小计");
					detail.setCount(Double.toString(countSubtotal));
					detail.setVolume(Double.toString(volumeSubtotal));
					detail.setArea(Double.toString(areaSubtotal));
					detail.setWdight(Double.toString(wdightSubtotal));
					detail.setCutAngleCount(Double.toString(cutAngleCountSubtotal));
					detail.setTurnAngleCount(Double.toString(turnAngleCountSubtotal));
					detail.setOpenAngleMOne(Double.toString(openAngleMOneSubtotal));
					detail.setOpenAngleMTwo(Double.toString(openAngleMTwoSubtotal));
					detail.setOpenSlotM(Double.toString(openSlotMSubtotal));
					detail.setWaterSlotM(Double.toString(waterSlotMSubtotal));
					detail.setReversedAngleCount(Double.toString(reversedAngleCountSubtotal));
					listTwo.add(detail);
				}
				OrderBomDetail detail = new OrderBomDetail();
				detail.setMaterielNo("总计");
				detail.setCount(Double.toString(countTotal));
				detail.setVolume(Double.toString(volumeTotal));
				detail.setArea(Double.toString(areaTotal));
				detail.setWdight(Double.toString(wdightTotal));
				detail.setCutAngleCount(Double.toString(cutAngleCountTotal));
				detail.setTurnAngleCount(Double.toString(turnAngleCountTotal));
				detail.setOpenAngleMOne(Double.toString(openAngleMOneTotal));
				detail.setOpenAngleMTwo(Double.toString(openAngleMTwoTotal));
				detail.setOpenSlotM(Double.toString(openSlotMTotal));
				detail.setWaterSlotM(Double.toString(waterSlotMTotal));
				detail.setReversedAngleCount(Double.toString(reversedAngleCountTotal));
				listTwo.add(detail);
			}
		} catch (NumberFormatException nEx) {
			model.addAttribute("message","数据异常：数据转换出错");
		}
		return listTwo;
	}
	

	@RequestMapping(value = "findBoxesByOrderId/{orderBomId}", method = RequestMethod.GET)
	public @ResponseBody
	List<String> findBoxesByOrderId(@PathVariable String orderBomId){
		return orderBomDetailService.findBoxesByOrderId(orderBomId);
	}

	/**
	 * 通过下料单id，查询下面所有的下料单
	 * @return
	 */
	@RequestMapping(value = "findByOrderBaseId/{orderBomId}", method = RequestMethod.GET)
	public @ResponseBody List<OrderBomDetail> findByOrderBaseId(@PathVariable String orderBomId){
		OrderBomDetail orderBomDetail = new OrderBomDetail();
		orderBomDetail.setOrderBomId(orderBomId);
		return orderBomDetailService.findList(orderBomDetail);
	}
}