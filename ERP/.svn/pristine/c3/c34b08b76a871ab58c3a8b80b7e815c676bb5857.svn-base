/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.logistics.web;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.modules.contract.entity.StoneCarriageContractBase;
import com.bt.modules.contract.entity.StoneCarriageContractDetail;
import com.bt.modules.contract.service.StoneCarriageContractBaseService;
import com.bt.modules.contract.service.StoneCarriageContractDetailService;
import com.bt.modules.finance.service.ManufSettlementService;
import com.bt.modules.finance.service.TransportationSettlementService;
import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.logistics.entity.LogisticsDetail;
import com.bt.modules.logistics.entity.LogisticsSend;
import com.bt.modules.logistics.entity.LogisticsSendBox;
import com.bt.modules.logistics.entity.ProductionLogisticsSendMapping;
import com.bt.modules.logistics.service.LogisticsDetailService;
import com.bt.modules.logistics.service.LogisticsSendBoxService;
import com.bt.modules.logistics.service.LogisticsSendService;
import com.bt.modules.logistics.service.ProductionLogisticsSendMappingService;
import com.bt.modules.orbom.entity.OrderBomBase;
import com.bt.modules.orbom.service.OrderBomBaseService;
import com.bt.modules.orbom.service.OrderBomBoxService;
import com.bt.modules.person.service.CommonPersonService;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.DateUtils;
import com.bt.modules.utils.RequestUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 生产物流管理
 * @author xiaocai
 * @version 2015年9月23日
 */
@Controller
@RequestMapping(value = "${adminPath}/logistics/productionLogistics")
public class ProductionLogisticsController extends BaseController {

	@Autowired
	private ProductionService productionService;//生产订单
	@Autowired
	private OrderBomBaseService orderBomBaseService;	//下料单
	@Autowired
	private OrderBomBoxService orderBomBoxService;	//箱列表数据
	@Autowired
	private CommonPersonService commonPersonService;//常用联系人
	@Autowired
	private StoneCarriageContractBaseService stoneCarriageContractBaseService; //运输合同
	@Autowired
	private LogisticsSendService logisticsSendService;	//发货
	@Autowired
	private ProductionLogisticsSendMappingService productionLogisticsSendMappingService;//生产发货关联
	@Autowired
	private TransportationSettlementService transportationSettlementService;//运费结算
	@Autowired
	private InventoryService inventoryService;	//库存管理
	@Autowired
	private LogisticsSendBoxService logisticsSendBoxService;	//物流关联箱
	@Autowired
	private LogisticsDetailService logisticsDetailService;		//发货清单
	@Autowired
	private StoneCarriageContractDetailService stoneCarriageContractDetailService;	//运输合同明细-起运地址
	@Autowired
	private ManufSettlementService manufSettlementService;		//加工结算
	
	/**
	 * start 2015年12月1日
	 */
	/**
	 * 石材发货通知列表页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"sendNoticeList"})
	public String sendNoticeList(HttpServletRequest request,HttpServletResponse response,Model model) {
		Production production = new Production();
//		//跟单员
//		if(!UserUtils.verificationRole("gdy")){
//			model.addAttribute("production", production);
//			model.addAttribute("logisticsSend", new LogisticsSend());
//			return "modules/logistics/sendNoticeList";
//		}
//		//条件查询
//		production.setDocumentaryby(UserUtils.getUser());
		
		//返回相应的列表数据
		Page<Production> page = productionService.sendNoticeList(new Page<Production>(request, response), production);
		LogisticsSend ls = new LogisticsSend();
		model.addAttribute("logisticsSend", ls);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_YRK);
		model.addAttribute("production", production);
		model.addAttribute("planSendDate", DateUtils.getDateStrByPattern(DateUtils.getNowNextDate(), "yyyy-MM-dd"));
		return "modules/logistics/sendNoticeList";
	}
	/**
	 * 发货通知 操作 通知发货按钮
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"sendNotice"})
	@Transactional(readOnly = false)
	public String sendNotice(HttpServletRequest request,HttpServletResponse response,Model model) {
		String pJson = request.getParameter("pJson");	//json数据（组装对应的选择条件）
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		String planSendDateStr = request.getParameter("planSendDateStr");
		Date planSendDate = DateUtils.getNowNextDate();	//默认获取当前时间的第二天
		if(StringUtils.isNotBlank(planSendDateStr)){
			planSendDate = DateUtils.getDateByPattern(planSendDateStr, "yyyy-MM-dd");
		}
		List<Production> listProduction = this.parseJson(pJson);
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		List<Production> listP = new ArrayList<Production>();
		Production p;
		//循环将需要发货的加工单组装成发货数据
		for(String id:ids){
			//组装待修改数据
			p = new Production();
			p.setId(id);
			p.setUpdateDate(new Date());
			p.setStatus(CommonStatus.PRODUCTION_DPC);
			p.setPlanSendDate(planSendDate);
			
			listP.add(p);
		}
		//进行相关的修改删除数据
		productionService.batchUpdate(listP);
		return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/sendNoticeList";
	}
	/**
	 * 根据条件查看箱详情数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getBoxByCondition"})
	@ResponseBody
	public Map<String,Object> getBoxByCondition(HttpServletRequest request,HttpServletResponse response) {
		String subID = request.getParameter("subID");
		String orderType = request.getParameter("orderType");
		String suppID = request.getParameter("suppID");
		String isStatus = request.getParameter("isStatus");
		String lid = request.getParameter("lid");
		String obbaseID = request.getParameter("obbaseID");
		OrderBomBase orderBomBase = new OrderBomBase();
		orderBomBase.setOrderType(orderType);
		orderBomBase.setId(obbaseID);
		//填充界面传过来的条件
		LogisticsSend ls = new LogisticsSend();
		ls.setId(lid);
		Production production = new Production();
		production.setSub(new Subproject(subID));
		production.setSupp(new Supplier(suppID));
		production.setOrderBomBase(orderBomBase);
		production.setLogisticsSend(ls);
		production.setStatus(isStatus);
		//条件查询
		List<Production> listProduction = productionService.getBoxByCondition(production);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", listProduction);
		return map;
	}
	/**
	 * 统计相关的箱数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getOBBCountVal"})
	@ResponseBody
	public Map<String,Object> getOBBCountVal(HttpServletRequest request,HttpServletResponse response) {
		String pJson = request.getParameter("pJson");//json数据（组装对应的选择条件）
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		List<Production> listProduction = this.parseJson(pJson);
		//获取全部的加工单IDs
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		Map<String,Object> map = orderBomBaseService.getOrderBomCountVal(null, ids);
		return map;
	}
	/**
	 * 解析json数据
	 * @param pJson
	 * @return
	 */
	private List<Production> parseJson(String pJson) {
		List<Production> listProduction = new ArrayList<Production>();
		try {
			JSONObject dataJson= JSONObject.fromObject(pJson);//new JSONObject(pJson);
			JSONArray jsonArray= dataJson.getJSONArray("p");
			Production production = new Production();
			for(int i=0;i<jsonArray.size();i++){
				JSONObject jObj = jsonArray.getJSONObject(i);
				String subID = "";
				if(jObj.containsKey("subID")){
					subID = jObj.getString("subID");
				}
				String orderType = "";
				if(jObj.containsKey("orderType")){
					orderType = jObj.getString("orderType");
				}
				String suppID = "";
				if(jObj.containsKey("suppID")){
					suppID = jObj.getString("suppID");
				}
				String isStatus = "";
				if(jObj.containsKey("isStatus")){
					isStatus = jObj.getString("isStatus");
				}
				String lsID = "";
				if(jObj.containsKey("lsID")){
					lsID = jObj.getString("lsID");
				}
				String orderBomBaseId = "";
				if(jObj.containsKey("orderBomBaseId")){
					orderBomBaseId = jObj.getString("orderBomBaseId");
				}
				OrderBomBase orderBomBase = new OrderBomBase();
				orderBomBase.setOrderType(orderType);
				orderBomBase.setId(orderBomBaseId);
				
				production = new Production();
				production.setSub(new Subproject(subID));
				production.setSupp(new Supplier(suppID));
				production.setLogisticsSend(new LogisticsSend(lsID));
				production.setOrderBomBase(orderBomBase);
				production.setStatus(isStatus);
				
				listProduction.add(production);
			}
		} catch (Exception e) {
			logger.debug("加工单json转换出错："+e.getMessage());
		}
		return listProduction;
	}
	/**
	 * 物流文员
	 * 派车通知
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"carNoticeList"})
	public String carNoticeList(HttpServletRequest request,HttpServletResponse response,Model model) {
		Production production = new Production();
		//条件查询
//		production.setDocumentaryby(UserUtils.getUser());
//		production.setStatus(CommonStatus.PRODUCTION_DPC);	//只查看待派车的数据
		//返回相应的列表数据
		Page<Production> page = productionService.carNoticeList(new Page<Production>(request, response), production);
		LogisticsSend ls = new LogisticsSend();
		//获取运输方
		List<StoneCarriageContractBase> listSCCB = stoneCarriageContractBaseService.groupByPBName();
		//获取起运地址
		List<StoneCarriageContractDetail> listSCCD = stoneCarriageContractDetailService.getGroupByStartAddress();
		model.addAttribute("listSCCB", listSCCB);
		model.addAttribute("listSCCD", listSCCD);
		model.addAttribute("logisticsSend", ls);
		model.addAttribute("page", page);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DPC);
		model.addAttribute("production", production);
		model.addAttribute("planSendDate", DateUtils.getDateStrByPattern(DateUtils.getNowNextDate(), "yyyy-MM-dd"));
		return "modules/logistics/carNoticeList";
	}
	/**
	 * 派车通知界面
	 * 生成通知发货
	 * @param logisticsSend
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"generateNoticeSend"})
	@Transactional(readOnly = false)
	public String generateNoticeSend(LogisticsSend logisticsSend,HttpServletRequest request,HttpServletResponse response,Model model) {
		String pJson = request.getParameter("pJson");//json数据（组装对应的选择条件）
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		String sccb = request.getParameter("sccb");//承运方合同ID
		List<Production> listProduction = this.parseJson(pJson);
		//获取全部的加工单IDs
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		String address = logisticsSend.getSendAddress();//获取加工厂 发货基地
		//没有加工单则不执行生成操作 或者 没有发货地址直接不允许发货
		if(ids.size()==0||StringUtils.isBlank(address)){
			return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/carNoticeList";
		}
		String lID = IdGen.uuid();
		String seriesnumber = SeriesNumberUtils.getLogisticsSendSeriesNumber(address,logisticsSendService.getThisYearCount(new Date()));
		//组装发货数据
		logisticsSend.setId(lID);
		logisticsSend.setSeriesnumber(seriesnumber);
		logisticsSend.setCarriageContractId(sccb);
		logisticsSend.setStatus(CommonStatus.LOGISTICS_TZFH);
		//组装相关的关联数据
		List<Production> listP=new ArrayList<Production>();
		List<ProductionLogisticsSendMapping> listPLSM=new ArrayList<ProductionLogisticsSendMapping>();	//加工单关联发货
		ProductionLogisticsSendMapping plsm;
		Production p;
		//循环将需要发货的加工单组装成发货数据
		for(String id:ids){
			//组装关联表数据
			plsm = new ProductionLogisticsSendMapping();
			plsm.setId(IdGen.uuid());
			plsm.setProductionId(id);
			plsm.setLogisticsSendId(lID);
			//组装待修改数据
			p = new Production();
			p.setId(id);
			p.setUpdateDate(new Date());
			p.setStatus(CommonStatus.PRODUCTION_YPCWF);
			
			listP.add(p);
			listPLSM.add(plsm);
		}
		//进行相关的修改删除数据
		logisticsSendService.insert(logisticsSend);
		productionService.batchUpdate(listP);
		productionLogisticsSendMappingService.batchInsert(listPLSM);
		//发货的箱关联相应的物流单号
		List<LogisticsSendBox> listLSB = this.logisticsSendBoxMapping(lID, listP);
		logisticsSendBoxService.batchInsert(listLSB);
		
		return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/carNoticeList";
	}
	/**
	 * 发货信息汇总
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"sendDataSummary"})
	public String sendDataSummary(LogisticsSend ls,HttpServletRequest request,HttpServletResponse response,Model model) {
		String projectName = request.getParameter("projectName");
		//返回相应的列表数据
		Page<LogisticsSend> page = logisticsSendService.sendDataSummary(new Page<LogisticsSend>(request, response), ls,projectName);
		model.addAttribute("page", page);
		model.addAttribute("logisticsSend", ls);
		return "modules/logistics/sendDataSummary";
	}
	/**
	 * 确认发货页面加载列表数据
	 * @param ls
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"confirmSendList"})
	public String confirmSendList(LogisticsSend ls,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<LogisticsSend> page = logisticsSendService.confirmSendList(new Page<LogisticsSend>(request, response), ls);
		model.addAttribute("page", page);
		model.addAttribute("logisticsSend", ls);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_YPCWF);
		return "modules/logistics/confirmSendList";
	}
	/**
	 * 确认发货
	 * @param logisticsSend
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"confirmConsignment"})
	@Transactional(readOnly = false)
	public String confirmConsignment(HttpServletRequest request,HttpServletResponse response,Model model) {
		String pJson = request.getParameter("pJson");//json数据（组装对应的选择条件）
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		List<Production> listProduction = this.parseJson(pJson);
		//获取全部的加工单IDs	
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		if(ids.size()==0){
			return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/confirmSendList";
		}
		/** =================================================================================*/
		//保存发货清单
//		if(null != ids && ids.size()>0){
			List<LogisticsDetail> logisticsDetailList = logisticsDetailService.findLogisticsDetail(ids);
			logisticsDetailList = logisticsDetailService.patchSettlementTypeForDetail(logisticsDetailList);
			if(null != logisticsDetailList){
				logisticsDetailService.batchInsert(logisticsDetailList);
			}
//		}
		/** =================================================================================*/

		List<Production> listP = new ArrayList<Production>();
		Production p;
		for(String id:ids){
			//组装待修改数据
			p = new Production(id,CommonStatus.PRODUCTION_DSH);
			listP.add(p);
		}
		productionService.batchUpdate(listP);	//修改加工单的数据
		//回写发货单的状态
		logisticsSendService.logisticsSendStatusUtils(ids, CommonStatus.PRODUCTION_DSH, CommonStatus.LOGISTICS_YFH);
		
		return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/confirmSendList";
	}
	/**
	 * 退回发货
	 * @param logisticsSend
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"returnSend"})
	@Transactional(readOnly = false)
	public String returnSend(LogisticsSend logisticsSend,HttpServletRequest request,HttpServletResponse response,Model model) {
		String pJson = request.getParameter("pJson");//json数据（组装对应的选择条件）
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		List<Production> listProduction = this.parseJson(pJson);
		//获取全部的加工单IDs
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		List<Production> listP = new ArrayList<Production>();
		Production p;
		for(String id:ids){
			//组装待修改数据
			p = new Production(id,CommonStatus.PRODUCTION_DPC);
			listP.add(p);
		}
		//还原数据状态
		productionService.batchUpdate(listP);
		//删除对应的数据关联
		productionLogisticsSendMappingService.batchDeleteByProductionIds(ids);
		return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/confirmSendList";
	}
	/**
	 * 根据id获取发货单详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getLogisticsSendDetailByID"})
	@ResponseBody
	public Map<String,Object> getLogisticsSendDetailByID(HttpServletRequest request,HttpServletResponse response) {
		String lid = request.getParameter("lid");	//物流单ID
		String projectName = request.getParameter("projectName");
		Map<String,Object> map = new HashMap<String,Object>();
		List<LogisticsSend> listLS = logisticsSendService.getLogisticsSendDetail(lid,projectName);
		map.put("list", listLS);
		return map;
	}
	/**
	 * 收货明细 发货单详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getLogisticsReceiveDetailByID"})
	@ResponseBody
	public Map<String,Object> getLogisticsReceiveDetailByID(HttpServletRequest request,HttpServletResponse response) {
		String lid = request.getParameter("lid");	//物流单ID
		String projectName = request.getParameter("projectName");
		Map<String,Object> map = new HashMap<String,Object>();
		List<LogisticsSend> listLS = logisticsSendService.getLogisticsReceiveDetail(lid,projectName);
		map.put("list", listLS);
		return map;
	}
	/**
	 * 确认收货列表数据
	 * @param ls
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"confirmReceiveList"})
	public String confirmReceiveList(LogisticsSend ls,HttpServletRequest request,HttpServletResponse response,Model model) {
		Page<LogisticsSend> page = logisticsSendService.confirmReceiveList(new Page<LogisticsSend>(request, response), ls);
		model.addAttribute("page", page);
		model.addAttribute("logisticsSend", ls);
		model.addAttribute("isStatus", CommonStatus.PRODUCTION_DSH);
		return "modules/logistics/confirmReceiveList";
	}
	/**
	 * 确认收货
	 * @param logisticsSend
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"confirmReceive"})
	@Transactional(readOnly = false)
	public String confirmReceive(LogisticsSend logisticsSend,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		String pJson = request.getParameter("pJson");//json数据（组装对应的选择条件）
		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));//加工单IDs
		List<Production> listProduction = this.parseJson(pJson);
		//获取全部的加工单IDs
		for(Production production:listProduction){
			ids = productionService.idsAndProductionUtils(ids, production);
		}
		List<Production> listP = new ArrayList<Production>();
		Production p;
		for(String id:ids){
			//组装待修改数据
			p = new Production(id,CommonStatus.PRODUCTION_YSH);
			listP.add(p);
		}
		productionService.batchUpdate(listP);	//修改加工单状态
		inventoryService.batchIntoForProduction(ids, CommonConstant.MATERIAL_SHICAI);	//数据入库
		List<String> obbIds = logisticsSendService.orderBomBaseReceiveUtils(ids);	//根据加工单ids获取已经完全发货下料单ids
		//回写发货单的状态
		logisticsSendService.logisticsSendStatusUtils(ids, CommonStatus.PRODUCTION_YSH, CommonStatus.LOGISTICS_YSH);
		/*xxxxxxxxxxx		生成结算单		xxxxxxxxxxxxxx*/
		manufSettlementService.createSettlementsByOrderIds(obbIds);
		/*xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/
		
		return "redirect:"+Global.getAdminPath()+"/logistics/productionLogistics/confirmReceiveList";
	}
	/**
	 * 根据条件获取箱的相关数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getBoxDataByCondition"})
	@ResponseBody
	public Map<String,Object> getBoxDataByCondition(HttpServletRequest request,HttpServletResponse response) {
		String lsID = request.getParameter("lsID");	//物流单ID
		String subID = request.getParameter("subID");
		Map<String,Object> map = new HashMap<String,Object>();
		LogisticsSend logisticsSend = new LogisticsSend();
		logisticsSend.setId(lsID);
		logisticsSend.setGbStr("lsID");
		List<LogisticsSend> listLS = logisticsSendService.getLogisticsSendDetail(logisticsSend);
		LogisticsSend ls = listLS.get(0);
		if(ls!=null){
			Project project = ls.getProject();
//			String subID = ls.getSub().getId();
			String orderType = ls.getOrderBomBase().getId();
			String suppID = ls.getSupp().getId();
			String isStatus = CommonStatus.PRODUCTION_DPC;	//获取 待派车 的数据
			OrderBomBase orderBomBase = new OrderBomBase();
			orderBomBase.setOrderType(orderType);
			//组装查询条件
			Production production = new Production();
			if(StringUtils.isBlank(subID)){
				production.setProject(project);
			}else{
				production.setSub(new Subproject(subID));
			}
			production.setSupp(new Supplier(suppID));
//			production.setOrderBomBase(orderBomBase);
			ls.setId("");
			production.setLogisticsSend(ls);
			production.setStatus(isStatus);
			//条件查询
			List<Production> listProduction = productionService.getBoxByCondition(production);
			List<Production> listSub = productionService.removeDuplicateBuildingByList(listProduction);
			map.put("project", project);
			map.put("sub", listSub.get(0).getSub());
			map.put("listSub", listSub);
			map.put("listProduction", listProduction);
		}
		return map;
	}
	/**
	 * 新增发货
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"createSend"})
	@ResponseBody	
	@Transactional(readOnly = false)
	public Map<String,Object> createSend(HttpServletRequest request,HttpServletResponse response) {
		String lsID = request.getParameter("lsID");	//物流单ID
//		List<String> ids = CommonUtils.stringToList(request.getParameter("ids"));
		List<String> ids = RequestUtils.getParameterStringsToList(request, "ids");
		if(ids.size()==0){
			return null;
		}
		//开始进行数据操作
		List<Production> listP=new ArrayList<Production>();
		List<ProductionLogisticsSendMapping> listPLSM=new ArrayList<ProductionLogisticsSendMapping>();	//加工单关联发货
		ProductionLogisticsSendMapping plsm;
		Production p;
		//循环将需要发货的加工单组装成发货数据
		for(String id:ids){
			//组装关联表数据
			plsm = new ProductionLogisticsSendMapping();
			plsm.setId(IdGen.uuid());
			plsm.setProductionId(id);
			plsm.setLogisticsSendId(lsID);
			//组装待修改数据
			p = new Production();
			p.setId(id);
			p.setUpdateDate(new Date());
			p.setStatus(CommonStatus.PRODUCTION_YPCWF);
			
			listP.add(p);
			listPLSM.add(plsm);
		}
		//进行相关的修改删除数据
		productionService.batchUpdate(listP);
		productionLogisticsSendMappingService.batchInsert(listPLSM);
		//发货的箱关联相应的物流单号
		List<LogisticsSendBox> listLSB = this.logisticsSendBoxMapping(lsID, listP);
		logisticsSendBoxService.batchInsert(listLSB);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("flag", true);
		return map;
	}
	
	/**
	 * 物流关联相应的箱
	 * @param lID
	 * @param listP
	 */
	public List<LogisticsSendBox> logisticsSendBoxMapping(String lID,List<Production> listP){
		List<String> ids = new ArrayList<String>();
		for(Production p:listP){
			ids.add(p.getId());
		}
		Production production = new Production();
		production.setIds(ids);
		List<Production> listProduction = productionService.getDetail(production);
		List<LogisticsSendBox> listLSB=new ArrayList<LogisticsSendBox>();	//发货关联箱
		LogisticsSendBox lsb;
		for(Production p:listProduction){
			lsb = new LogisticsSendBox();
			lsb.setId(IdGen.uuid());
			lsb.setLogisticsSendId(lID);
			lsb.setOrderBomBoxId(p.getOrderBomBox().getId());
			
			listLSB.add(lsb);
		}
		return listLSB;
	}
	/**
	 * end 2015年12月1日
	 */
	
	
	
}