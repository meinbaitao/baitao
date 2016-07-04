/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.purchase.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.contract.entity.PurchasingContractBase;
import com.bt.modules.contract.entity.PurchasingContractDetail;
import com.bt.modules.contract.service.PurchasingContractBaseService;
import com.bt.modules.contract.service.PurchasingContractDetailService;
import com.bt.modules.inventory.service.InventoryService;
import com.bt.modules.person.service.CommonPersonService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.purchase.entity.Purchase;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.entity.PurchaseSFDetail;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.purchase.service.PurchaseSFDetailService;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.supplier.service.SupplierService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.CommonUtils;
import com.bt.modules.utils.DateUtils;
import com.bt.modules.utils.RequestUtils;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 采购订单Controller
 * @author xiaocai
 * @version 2015-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/purchase")
public class PurchaseController extends BaseController {

	@Autowired
	private PurchaseService purchaseService;	//采购
	@Autowired
	private PurchaseDemandService purchaseDemandService;//采购需求
	@Autowired
	private PurchaseSFDetailService purchaseSFDetailService;//收发详情
	@Autowired
	private CommonPersonService commonPersonService;//常用联系人
	@Autowired
	private ActTaskService actTaskService;		//流程
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;		//流程
	@Autowired
	private PurchasingContractBaseService purchasingContractBaseService;	//采购 供应商合同
	@Autowired
	private PurchasingContractDetailService purchasingContractDetailService;	//采购 供应商合同
	@Autowired
	private SupplierService supplierService;		//供应商
	@Autowired
	private InventoryService inventoryService;	//库存
	
	/**
	 * 生成采购单（钢辅料）
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"createPurchaseGFL"})
	public String createPurchaseGFL(HttpServletRequest request, HttpServletResponse response, Model model) throws BusinessException {
		//生成采购订单的编号
		String seriesNumber = SeriesNumberUtils.getCGSeriesNumber(purchaseService.getToDaysCount(new Date()));
		List<String> ids = RequestUtils.getParameterValuesToList(request, "cBox");//.getParameterValues("cBox");
		//获取界面传送过来的相应的采购需求订单
		List<PurchaseDemand> listPD = purchaseDemandService.getByIDs(ids);
		if(listPD.size()==0){
			return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseGFLList";
		}
		//组装订单数据
		List<Purchase> listP = new ArrayList<Purchase>();
		Purchase purchase;
		for(PurchaseDemand purchaseDemand: listPD){
			int count = RequestUtils.getInt(request, "xd"+purchaseDemand.getId());
			if(count<=0){
				continue;
			}
			
			purchase = new Purchase();
			purchase.setId(IdGen.uuid());
			purchase.setPurchaseDemand(purchaseDemand);
			purchase.setType(purchaseDemand.getType());	
			purchase.setMtype(purchaseDemand.getMtype());
			purchase.setPurchaseby(UserUtils.getUser());
			purchase.setCreateDate(new Date());
			purchase.setUpdateDate(new Date());
			purchase.setCount(count);	//获取统计总数
			purchase.setSeriesnumber(seriesNumber);
			purchase.setStatus(CommonStatus.PURCHASE_DXD);
			
			listP.add(purchase);
		}
		//批量插入相应的 待采购 数据
		purchaseService.batchInsert(listP);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseGFLList";
	}
	/**
	 * 采购单列表数据（采购单）
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGFLList"})
	public String purchaseGFLList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		
		purchase.setTypes(types);
		purchase.setSeriesnumber(seriesnumber);
		purchase.setGlfpGB("seriesnumber");
		if(UserUtils.verificationRole("cgy")){
			purchase.setPurchaseby(UserUtils.getUser());
		}else{
			purchase.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		}
		
		Page<Purchase> page = purchaseService.getPageData(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
		return "modules/purchase/purchaseGFLList";
//		String seriesnumber = request.getParameter("seriesnumber");
//		purchase = this.basicPurchase(purchase);
//		
//		Page<Purchase> page = purchaseService.findMyPurchase(new Page<Purchase>(request, response), purchase);
//		model.addAttribute("page", page);
//		model.addAttribute("seriesnumber", seriesnumber);
//		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
//		return "modules/purchase/findMyPurchase";
	}
	/**
	 * 查看我创建的采购单
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findMyPurchase"})
	public String findMyPurchase(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		purchase = this.basicPurchase(purchase);
		
		Page<Purchase> page = purchaseService.findMyPurchase(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
		return "modules/purchase/findMyPurchase";
	}
	/**
	 * 查询所有的待审核
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findUnAuditPurchase"})
	public String findUnAuditPurchase(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		purchase = this.basicPurchase(purchase);
		
		Page<Purchase> page = purchaseService.findUnAuditPurchase(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
		return "modules/purchase/findUnAuditPurchase";
	}
	/**
	 * 查询经手的所有采购单
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"findAuditDonePurchase"})
	public String findAuditDonePurchase(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		purchase = this.basicPurchase(purchase);
		
		Page<Purchase> page = purchaseService.findAuditDonePurchase(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
		return "modules/purchase/findAuditDonePurchase";
	}
	
	/**
	 * 初始基础查询条件
	 * @param purchase
	 * @return
	 */
	private Purchase basicPurchase(Purchase purchase){
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		
		purchase.setTypes(types);
		purchase.setGlfpGB("seriesnumber");
		purchase.setPurchaseby(UserUtils.getUser());
		return purchase;
	}
	/**
	 * 根据采购编号获取相应的订单详情（钢辅料）
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getGFLDetailBySeriesNumber"})	
	public String getGFLDetailBySeriesNumber(HttpServletRequest request,HttpServletResponse response,Model model) {
		model = this.getDetailBySeriesNumberGFL(request, response, model);
		model.addAttribute("requireDate", DateUtils.getNowNextDate());
		return "modules/purchase/purchaseGFLDetailList";
	}
	/**
	 * 根据采购合同获取相应的详情id
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getPurchasingContractDetailByBaseID"})
	@ResponseBody
	public Map<String,Object> getPurchasingContractDetailByBaseID(Purchase purchase,HttpServletRequest request,HttpServletResponse response) {
		String contractId = request.getParameter("contractId");
		Map<String,Object> map = new HashMap<String, Object>();
//		PurchasingContractDetail purchasingContractDetail = new PurchasingContractDetail();
//		purchasingContractDetail.setContractId(contractId);
		List<PurchasingContractDetail> listPCD = purchasingContractDetailService.getListByPurchasingContractId(contractId);
		map.put("listPCD", listPCD);
		return map;
	}
	/**
	 * 根据供应商名称获取全部材料采购价格
	 * @param purchase
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = {"getListByPurchasingContractName"})
	@ResponseBody
	public Map<String,Object> getListByPurchasingContractName(Purchase purchase,HttpServletRequest request,HttpServletResponse response) {
		String purchasingContractName = request.getParameter("purchasingContractName");
		String isprovince = request.getParameter("isprovince");
		Map<String,Object> map = new HashMap<String, Object>();
//		PurchasingContractDetail purchasingContractDetail = new PurchasingContractDetail();
//		purchasingContractDetail.setContractId(contractId);
		List<PurchasingContractDetail> listPCD = purchasingContractDetailService.getListByPurchasingContractName(purchasingContractName,isprovince);
		map.put("listPCD", listPCD);
		return map;
	}
	
	/**
	 * 采购单修改保存
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"savePurchaseGFL"})	
	public String savePurchaseGFL(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		//进行相应的业务逻辑处理组装形成相关的采购订单
		List<Purchase> listP = this.listPurchaseUtils(request);
		//批量修改 数据
		purchaseService.batchUpdateByID(listP);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/getGFLDetailBySeriesNumber/?seriesnumber="+seriesnumber;
	}
	/**
	 * 提交钢材料采购流程
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"submitACTGFL"})	
	@Transactional(readOnly = false)
	public String submitACTGFL(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
		//获取界面传过来列表数据
		List<String> ids = CommonUtils.stringToList(request.getParameter("sdIDs"));
		//对界面的数据进行保存处理（用户存在未保存直接提交数据的情况）
		List<Purchase> listSaveP = this.listPurchaseUtils(request);//进行相应的业务逻辑处理组装形成相关的采购订单
		if(ids.size()==0||listSaveP.size()==0){
			return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGFLList";
		}
		purchaseService.batchUpdateByID(listSaveP);//批量保存 数据
		String seriesnumber = listSaveP.get(0).getSeriesnumber();
		//创建一个新的流程
		String actID = this.purchaseActUtils(ids,seriesnumber);
		//进行相应的业务逻辑处理组装形成相关的采购订单
		List<Purchase> listP = this.submitPurchaseUtils(actID, ids,request);
		//批量修改 采购 数据
		purchaseService.batchUpdateByID(listP);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGFLList";
	}
	/**
	 * 流程审核通过下一步
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"passACTGFL"})
	public String passACTGFL(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String wfID = request.getParameter("wfID");
		actAccessTaskDirectService.completeTask(wfID, "1", "", UserUtils.getActUserID());
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGFLList";
	}
	/**
	 * 流程驳回
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"rebutACTGFL"})
	public String rebutACTGFL(HttpServletRequest request,HttpServletResponse response,Model model) {
		String wfID = request.getParameter("wfID");
		String message = request.getParameter("message");
		actAccessTaskDirectService.completeTask(wfID, "0", message, UserUtils.getUser().getLoginName());
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGFLList";
	}
	/**
	 * 供应商签收列表数据
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGYSList"})
	public String purchaseGYSList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		//对应的供应商数据
		Supplier supp = new Supplier();
		supp.setBusinessPreson(UserUtils.getUser().getId());
		
		purchase.setTypes(types);
		purchase.setSeriesnumber(seriesnumber);
		purchase.setGlfpGB("seriesnumber");
		purchase.setStatus(CommonStatus.PURCHASE_DQS);
		purchase.setSupp(supp);
		
		Page<Purchase> page = purchaseService.getPageData(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DQS);
		return "modules/purchase/purchaseGYSList";
	}
	/**
	 * 供应商查看详情
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getGFLGYSDetailBySeriesNumber"})	
	public String getGFLGYSDetailBySeriesNumber(HttpServletRequest request,HttpServletResponse response,Model model) {
		model = this.getDetailBySeriesNumberGFL(request, response, model);
		return "modules/purchase/purchaseGFLGYSDetailList";
	}
	/**
	 * 供应商签收
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGYSSign"})	
	public String purchaseGYSSign(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesNumber = request.getParameter("seriesnumber");
		List<String> seriesNumbers = new ArrayList<String>();
		seriesNumbers.add(seriesNumber);
		purchaseService.updateStatusBySeriesNumbers(seriesNumbers, CommonStatus.PURCHASE_DFH);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGYSList";
	}
	/**
	 * 供应商对多条数据进行一次签收
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGYSSigns"})	
	public String purchaseGYSSigns(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		List<String> seriesNumbers = CommonUtils.stringToList(request.getParameter("seriesnumbers"));
		purchaseService.updateStatusBySeriesNumbers(seriesNumbers, CommonStatus.PURCHASE_DFH);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGYSList";
	}
	/**
	 * 供应商发货列表数据
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGYSSendList"})
	public String purchaseGYSSendList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		//对应的供应商数据
		Supplier supp = new Supplier();
		supp.setBusinessPreson(UserUtils.getUser().getId());
		
		purchase.setTypes(types);
		purchase.setSeriesnumber(seriesnumber);
		purchase.setGlfpGB("seriesnumber");
		purchase.setIsStatus(CommonStatus.PURCHASE_DFH);
		purchase.setSupp(supp);
		
		Page<Purchase> page = purchaseService.purchaseGYSSendList(new Page<Purchase>(request, response), purchase);
		
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_DFH);
		return "modules/purchase/purchaseGYSSendList";
	}
	/**
	 * 供应商查看发货详情
	 * 确认发货详情界面
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getGFLGYSSendDetailBySeriesNumber"})	
	public String getGFLGYSSendDetailBySeriesNumber(HttpServletRequest request,HttpServletResponse response,Model model) {
		model = this.getDetailBySeriesNumberGFL(request, response, model);
		return "modules/purchase/purchaseGFLGYSSendDetailList";
	}
	/**
	 * 供应商发货
	 * 确认发货
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"purchaseGYSSend"})	
	@Transactional(readOnly = false)
	public String purchaseGYSSend(HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		List<String> ids = CommonUtils.stringToList(request.getParameter("sdIDs"));
		List<PurchaseSFDetail> listPSF = new ArrayList<PurchaseSFDetail>();
		for(String id:ids){
			int sc = RequestUtils.getInt(request, "sc"+id);//.getParameter("sc"+id);
			if(sc<=0){	//获取发货数量
				continue;
			}
			PurchaseSFDetail psf = new PurchaseSFDetail();
			psf.setId(IdGen.uuid());
			psf.setPurchase(new Purchase(id));
			psf.setFcount(sc);
			psf.setType(CommonConstant.PURCHASE_TYPE_SEND);
			
			listPSF.add(psf);
		}
		//批量保存发货数据
		purchaseSFDetailService.batchInsert(listPSF);
		//修改采购单状态
		purchaseService.batchUpdateByIDs(ids,CommonStatus.PURCHASE_YFH);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGYSSendList";
	}
	/**
	 * 工地收货列表数据
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"purchaseGDReceiveList"})
	public String purchaseGDReceiveList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		
		List<String> types = new ArrayList<String>();
		types.add(CommonConstant.MATERIAL_GANGCAI);
		types.add(CommonConstant.MATERIAL_FULIAO);
		
		purchase.setTypes(types);
		purchase.setSeriesnumber(seriesnumber);
		purchase.setGlfpGB("seriesnumber");
		purchase.setGtEqVal(CommonStatus.PURCHASE_YFH);
//		purchase.setStatus(CommonStatus.PURCHASE_YFH);
		//关联对应的材料员
		Project project = new Project();
		project.setMaterialStaffBid(UserUtils.getUser().getId());
		PurchaseDemand p = new PurchaseDemand();
		p.setProject(project);
		purchase.setPurchaseDemand(p);
		
		Page<Purchase> page = purchaseService.purchaseGDReceiveList(new Page<Purchase>(request, response), purchase);
		model.addAttribute("page", page);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("isStatus", CommonStatus.PURCHASE_YFH);
		return "modules/purchase/purchaseGDReceiveList";
	}
	/**
	 * 工地查看收货单详情
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"getGFLGYSReceiveDetailBySeriesNumber"})	
	public String getGFLGYSReceiveDetailBySeriesNumber(HttpServletRequest request,HttpServletResponse response,Model model) {
		model = this.getDetailBySeriesNumberGFL(request, response, model);
		return "modules/purchase/purchaseGDReceiveDetailList";
	}
	/**
	 * 工地收货
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws BusinessException 
	 */
	@RequestMapping(value = {"purchaseGYSReceive"})	
	@Transactional(readOnly = false)
	public String purchaseGYSReceive(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) throws BusinessException {
		List<String> ids = CommonUtils.stringToList(request.getParameter("sdIDs"));
		List<PurchaseSFDetail> listPSF = new ArrayList<PurchaseSFDetail>();
		for(String id:ids){
			int sc = RequestUtils.getInt(request, "sc"+id);//.getParameter("sc"+id);
			if(sc<=0){	//获取收货数量
				continue;
			}
			PurchaseSFDetail psf = new PurchaseSFDetail();
			psf.setId(IdGen.uuid());
			psf.setPurchase(new Purchase(id));
			psf.setScount(sc);
			psf.setType(CommonConstant.PURCHASE_TYPE_RECEIVE);
			
			listPSF.add(psf);
		}
		//批量修改收货数据
		purchaseSFDetailService.batchInsert(listPSF);
		//修改采购单状态
		purchaseService.batchUpdateByIDs(ids,CommonStatus.PURCHASE_YSH);
		//入库
		inventoryService.batchIntoForPurchase(listPSF, CommonConstant.STANDINGBOOK_RUKU);
		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGDReceiveList";
	}
	/**
	 * 钢辅料 
	 */
	public Model getDetailBySeriesNumberGFL(HttpServletRequest request,HttpServletResponse response,Model model){
		String seriesnumber = request.getParameter("seriesnumber");
		List<Purchase> list = purchaseService.getDetailBySeriesNumberGFL(seriesnumber);
		List<PurchasingContractBase> listPCB = purchasingContractBaseService.getListGBName();
		//获取数据最新的流程状态
		String wfStatus = "0";
		String wfID = "";
		Date createDate = new Date();
		Supplier supp = new Supplier();
		Supplier supp2 = new Supplier();
		Project project = new Project();
		Purchase p = new Purchase();
		PurchasingContractBase purchasingContractBase = new PurchasingContractBase();
		if(list.size()>0){
			wfStatus = list.get(0).getWorkflowstatus();
			wfID = list.get(0).getWorkflowid();
			supp = list.get(0).getSupp();
			//查询选中，但是超时已经越过合同有效期的数据
//			purchasingContractBase.setSupp(supp);
//			listPCB.add(purchasingContractBaseService.getOneBySupp(purchasingContractBase));
			supp2 = list.get(0).getSupp2();	//收货地点的相关信息
			purchasingContractBase = list.get(0).getPurchasingContractBase();
			project = list.get(0).getPurchaseDemand().getProject();
			createDate = list.get(0).getCreateDate();
			p = list.get(0);
			
		}
		model.addAttribute("wfStatus", wfStatus);
		model.addAttribute("listPCB", listPCB);
		model.addAttribute("createDate", createDate);
		model.addAttribute("supp", supp);
		model.addAttribute("supp2", supp2);
		model.addAttribute("purchasingContractBase", purchasingContractBase);
		model.addAttribute("project", project);
		model.addAttribute("wfID", wfID);
		model.addAttribute("list", list);
		model.addAttribute("purchase", p);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
		return model;
	}
	/**
	 * 根据供应商的名称获取对应数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "getDataBySuppName")
	@ResponseBody
	public Map<String,Object> getDataBySuppName(
			HttpServletRequest request,
			HttpServletResponse response){
		String partyBName = request.getParameter("gysName");
		PurchasingContractBase pcb = new PurchasingContractBase();
		pcb.setPartyBName(partyBName);
		List<PurchasingContractBase> listPCB = purchasingContractBaseService.getValidListByCondition(pcb);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listPCB", listPCB);
		return map;
	}
	/**
	 * 列表数据工具方法
	 * @param request
	 * @return
	 */
	public List<Purchase> listPurchaseUtils(HttpServletRequest request){
		String seriesnumber = request.getParameter("seriesnumber");
		String suppID = request.getParameter("gys");//获取供应商数据
		String htbh = request.getParameter("htbh");//获取相应的合同
		String requireDateStr = request.getParameter("requireDate");//要求到货时间
		String isprovince = request.getParameter("isprovince");//价格区域，省内，省外...
		List<String> ids = CommonUtils.stringToList(request.getParameter("sdIDs"));
		Supplier supplier = supplierService.get(suppID);
		String gysNo = supplier==null?"":supplier.getSeriesnumber();
		if(StringUtils.isNotBlank(gysNo)&&seriesnumber.indexOf(gysNo)<0){
			seriesnumber = gysNo+"-"+seriesnumber;
		}
		Date requireDate = new Date();
		if(StringUtils.isNotBlank(requireDateStr)){
			requireDate = DateUtils.getDateByPattern(requireDateStr, "yyyy-MM-dd");
		}
		List<Purchase> listP = new ArrayList<Purchase>();
		Purchase p;
		//进行相应的业务逻辑处理组装形成相关的采购订单
		for(String key : ids){
			//组装采购订单数据
			p = new Purchase();
			p.setId(key);
			p.setSeriesnumber(seriesnumber);
			p.setIsProvince(isprovince);
			p.setCreateBy(UserUtils.getUser());
			p.setRequireDate(requireDate);
			//如果没有供应商传过来，则不进行修改
			if(StringUtils.isNotBlank(suppID)){
				p.setSupp(new Supplier(suppID));
			}
			p.setPurchasingContractBase(new PurchasingContractBase(htbh));//对应的合同
			p.setRemarks(request.getParameter("remarks"+key));
			listP.add(p);
		}
		return listP;
	}
	
	/**
	 * 启动流程
	 * @param ids
	 * @return
	 */
	public String purchaseActUtils(List<String> ids,String seriesnumber){
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, PurchaseService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, seriesnumber);
		variable.put(ActivitiConstants.IDS, ids);
		String actID = actTaskService.startProcess("procureFlow", "btg_purchase", "workflow_id","",variable);
		return actID;
	}
	/**
	 * 业务数据组装
	 * @param listP
	 * @return
	 */
	public List<Purchase> submitPurchaseUtils(String actID,List<String> ids, HttpServletRequest request){
		//获取供应商数据
		String suppID = request.getParameter("gys");
		String saddress = request.getParameter("saddress");//收货地址
		//进行相应的业务逻辑处理组装形成相关的采购订单
		List<Purchase> listP = new ArrayList<Purchase>();
		Purchase p;
		for(String id : ids){
			//组装采购订单数据
			p = new Purchase();
			p.setId(id);
			p.setStatus(CommonStatus.PURCHASE_YXD);
			//如果没有供应商传过来，则不进行修改
			if(StringUtils.isNotBlank(suppID)){
				p.setSupp(new Supplier(suppID));
			}
			if(StringUtils.isNotBlank(saddress)){
				p.setSupp2(new Supplier(saddress));
			}
			//流程关联
			p.setWorkflowid(actID);
			p.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
			
			listP.add(p);
		}
		return listP;
	}
	/**
	 * end 2015年11月9日
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * start 2015年9月11日15:12:37
	 */
	/**
	 * 生成采购单
	 * @param purchase
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
//	@SuppressWarnings("unchecked")
//	@RequestMapping(value = {"generatePurchase"})//黑材
//	public String generatePurchase(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//生成采购订单的编号
//		String seriesNumber = SeriesNumberUtils.getCGSeriesNumber(purchaseService.getToDaysCount(new Date()));
//		Map<String,Object> map = this.generateUtils(seriesNumber, request);
//		List<String> ids = (List<String>) map.get("ids");
//		Map<String,Integer> mapVal = (Map<String, Integer>) map.get("mapVal");
////		List<PurchaseMapping> listPM = (List<PurchaseMapping>) map.get("listPM");
//		//获取界面传送过来的相应的采购需求订单
//		List<PurchaseDemand> listPD = purchaseDemandService.getByIDs(ids);
//		if(listPD==null||listPD.size()==0){
//			return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseHCList";
//		}
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.generatePurchaseListPUtils(listPD, mapVal, seriesNumber);
//		//批量插入相应的 待采购 数据
//		purchaseService.batchInsert(listP);
//		//批量插入关联数据
////		purchaseMappingService.batchPurchaseMapping(listPM);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseHCList";
//	}
//	@SuppressWarnings("unchecked")
//	@RequestMapping(value = {"generatePurchaseGC"})//钢材
//	public String generatePurchaseGC(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//生成采购订单的编号
//		String seriesNumber = SeriesNumberUtils.getCGSeriesNumber(purchaseService.getToDaysCount(new Date()));
//		Map<String,Object> map = this.generateUtils(seriesNumber,request);
//		List<String> ids = (List<String>) map.get("ids");
//		Map<String,Integer> mapVal = (Map<String, Integer>) map.get("mapVal");
////		List<PurchaseMapping> listPM = (List<PurchaseMapping>) map.get("listPM");
//		//获取界面传送过来的相应的采购需求订单
//		List<PurchaseDemand> listPD = purchaseDemandService.getByIDs(ids);
//		if(listPD==null||listPD.size()==0){
//			return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseGCList";
//		}
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.generatePurchaseListPUtils(listPD, mapVal, seriesNumber);
//		//批量插入相应的 待采购 数据
//		purchaseService.batchInsert(listP);
//		//批量插入关联数据
////		purchaseMappingService.batchPurchaseMapping(listPM);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseGCList";
//	}
//	@SuppressWarnings("unchecked")
//	@RequestMapping(value = {"generatePurchaseFL"})//辅料生成订单
//	public String generatePurchaseFL(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//生成采购订单的编号
//		String seriesNumber = SeriesNumberUtils.getCGSeriesNumber(purchaseService.getToDaysCount(new Date()));
//		Map<String,Object> map = this.generateUtils(seriesNumber,request);
//		List<String> ids = (List<String>) map.get("ids");
//		Map<String,Integer> mapVal = (Map<String, Integer>) map.get("mapVal");
////		List<PurchaseMapping> listPM = (List<PurchaseMapping>) map.get("listPM");
//		//获取界面传送过来的相应的采购需求订单
//		List<PurchaseDemand> listPD = purchaseDemandService.getByIDs(ids);
//		if(listPD==null||listPD.size()==0){
//			return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseFLList";
//		}
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.generatePurchaseListPUtils(listPD, mapVal, seriesNumber);
//		//批量插入相应的 待采购 数据
//		purchaseService.batchInsert(listP);
//		//批量插入关联数据
////		purchaseMappingService.batchPurchaseMapping(listPM);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/waitPurchaseFLList";
//	}
//	//生成采购单工具类
//	public Map<String,Object> generateUtils(String seriesNumber, HttpServletRequest request){
//		Map<String,Object> map = new HashMap<String,Object>();
//		//获取界面传过来的指派采购数据(拆分组合生成实体)
//		String idsStr = request.getParameter("sdIDs");
//		String vals = request.getParameter("vs");
//		String[] idArr = idsStr.split(",");
//		String[] valArr = vals.split(",");
//		List<String> ids = new ArrayList<String>();
//		//定义map存储每个值
//		Map<String,Integer> mapVal = new HashMap<String,Integer>();
//		//关联数据
////		List<PurchaseMapping> listPM = new ArrayList<PurchaseMapping>();
////		PurchaseMapping pm = null;
////		for(int i=0;i<idArr.length;i++){
////			String id = idArr[i];
////			mapVal.put(id, Integer.parseInt(valArr[i]));
////			ids.add(id);
////			//组装关联关系
////			pm = new PurchaseMapping();
////			pm.setPdid(id);
////			pm.setPnumber(seriesNumber);
////			
////			listPM.add(pm);
////		}
////		map.put("listPM", listPM);
//		map.put("mapVal", mapVal);
//		map.put("ids", ids);
//		return map;
//	}
//	/**
//	 * 数据对象的组装
//	 * @param listPD
//	 * @return
//	 */
//	public List<Purchase> generatePurchaseListPUtils(List<PurchaseDemand> listPD,Map<String,Integer> mapVal,String seriesNumber){
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = new ArrayList<Purchase>();
//		Purchase purchase;
//		for(PurchaseDemand p:listPD){
//			purchase = new Purchase();
//			purchase.setId(IdGen.uuid());
//			purchase.setType(p.getType());	
//			purchase.setMtype(p.getMtype());
//			purchase.setPurchaseby(UserUtils.getUser());
//			purchase.setCreateDate(new Date());
//			purchase.setUpdateDate(new Date());
//			purchase.setCount(mapVal.get(p.getId()));	//获取统计总数
//			purchase.setSeriesnumber(seriesNumber);
//			purchase.setStatus(CommonStatus.PURCHASE_DXD);
//			
//			listP.add(purchase);
//		}
//		return listP;
//	}
//	/**
//	 * 保存数据
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"savePurchaseHC"})	//黑材执行完成供应商有数据
//	public String savePurchaseHC(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		String seriesnumber = request.getParameter("seriesnumber");
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.savePurchaseUtils(request);
//		//批量修改 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/getHCDetailBySeriesNumber/?seriesnumber="+seriesnumber;
//	}
//	@RequestMapping(value = {"savePurchaseGC"})	//镀锌钢材数据保存
//	public String savePurchaseGC(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		String seriesnumber = request.getParameter("seriesnumber");
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.savePurchaseUtils(request);
//		//批量修改 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/getGCDetailBySeriesNumber/?seriesnumber="+seriesnumber;
//	}
//	@RequestMapping(value = {"savePurchaseFL"})//辅料数据保存
//	public String savePurchaseFL(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		String seriesnumber = request.getParameter("seriesnumber");
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.savePurchaseUtils(request);
//		//批量修改 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/getFLDetailBySeriesNumber/?seriesnumber="+seriesnumber;
//	}
//	/**
//	 * 保存数据工具类
//	 * @param request
//	 * @return
//	 */
//	public List<Purchase> savePurchaseUtils(HttpServletRequest request){
//		String suppID = request.getParameter("gys");//获取供应商数据
//		String saddress = request.getParameter("saddress");//收货地址
//		//获取界面传过来的指派采购数据(拆分组合生成实体)
//		String idsStr = request.getParameter("sdIDs");	//ID
//		String vals = request.getParameter("vs");		//数量
//		String prices = request.getParameter("ps");		//价格
//		String[] idArr = idsStr.split(",");
//		String[] valArr = vals.split(",");
//		String[] priceArr = prices.split(",");
//		List<String> ids = new ArrayList<String>();
//		//定义map存储每个值
//		Map<String,Integer> mapVal = new HashMap<String,Integer>();
//		Map<String,Double> mapPrice = new HashMap<String,Double>();
//		for(int i=0;i<idArr.length;i++){
//			String id = idArr[i];
//			mapPrice.put(id, Double.parseDouble(priceArr[i]));
//			mapVal.put(id, Integer.parseInt(valArr[i]));
//			ids.add(id);
//		}
//		List<Purchase> listP = new ArrayList<Purchase>();
//		Purchase p;
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		for(String key : ids){
//			//组装采购订单数据
//			p = new Purchase();
//			p.setId(key);
//			p.setCount(Integer.parseInt(mapVal.get(key).toString()));
//			p.setPrice(Double.parseDouble(mapPrice.get(key).toString()));
//			p.setCreateBy(UserUtils.getUser());
//			//如果没有供应商传过来，则不进行修改
//			if(StringUtils.isNotBlank(suppID))
//				p.setSupp(new Supplier(suppID));
//			if(StringUtils.isNotBlank(saddress))
//				p.setSupp2(new Supplier(saddress));
////			p.setStatus(CommonStatus.Purchase_yxd);
//			listP.add(p);
//		}
//		return listP;
//	}
//	/**
//	 * 提交流程
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"submitACTHC"})	//黑材
//	public String submitACTHC(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传过来列表数据
//		List<String> ids = CommonUtils.getIDs(request.getParameter("sdIDs"));
//		//创建一个新的流程
//		String actID = this.purchaseActUtils(ids);
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.submitPurchaseUtils(actID, ids,request);
//		//批量修改 采购 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseHCList";
//	}
//	@RequestMapping(value = {"submitACTGC"})	//钢材
//	public String submitACTGC(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传过来列表数据
//		List<String> ids = CommonUtils.getIDs(request.getParameter("sdIDs"));
//		//创建一个新的流程
//		String actID = this.purchaseActUtils(ids);
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.submitPurchaseUtils(actID, ids,request);
//		//批量修改 采购 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGCList";
//	}
//	@RequestMapping(value = {"submitACTFL"})	//辅料
//	public String submitACTFL(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传过来列表数据
//		List<String> ids = CommonUtils.getIDs(request.getParameter("sdIDs"));
//		//创建一个新的流程
//		String actID = this.purchaseActUtils(ids);
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = this.submitPurchaseUtils(actID, ids,request);
//		//批量修改 采购 数据
//		purchaseService.batchUpdateByID(listP);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseFLList";
//	}
//	
//	/**
//	 * 根据采购单编号查看详情
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"getHCDetailBySeriesNumber"})	//（黑材）
//	public String getHCDetailBySeriesNumber(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		model = this.getDetailBySeriesNumberHC(purchase, request, response, model);
//		return "modules/purchase/purchaseHCDetailList";
//	}
////	@RequestMapping(value = {"getGCDetailBySeriesNumber"})	//钢材
////	public String getGCDetailBySeriesNumber(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
////		model = this.getDetailBySeriesNumberGFL(purchase, request, response, model);
////		return "modules/purchase/purchaseGCDetailList";
////	}
////	@RequestMapping(value = {"getFLDetailBySeriesNumber"})	//辅料
////	public String getFLDetailBySeriesNumber(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
////		model = this.getDetailBySeriesNumberGFL(purchase, request, response, model);
////		return "modules/purchase/purchaseFLDetailList";
////	}
//	/**
//	 * 根据采购单编号查看详情
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	public Model getDetailBySeriesNumberHC(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model){
//		String seriesnumber = request.getParameter("seriesnumber");
//		purchase.setSeriesnumber(seriesnumber);
//		Page<Purchase> page = purchaseService.findPage(new Page<Purchase>(request, response), purchase);
//		//获取数据最新的流程状态
//		String wfStatus = "0";
//		String wfID = "";
//		Supplier supp = new Supplier();
//		Supplier supp2 = new Supplier();
//		if(page.getList()!=null&&page.getList().size()>0){
//			wfStatus = page.getList().get(0).getWorkflowstatus();
//			wfID = page.getList().get(0).getWorkflowid();
//			supp = page.getList().get(0).getSupp();
//			supp2 = page.getList().get(0).getSupp2();
//		}
//		model.addAttribute("wfStatus", wfStatus);
//		model.addAttribute("supp", supp);
//		model.addAttribute("supp2", supp2);
//		model.addAttribute("wfID", wfID);
//		model.addAttribute("page", page);
//		model.addAttribute("seriesnumber", seriesnumber);
//		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
//		return model;
//	}
//	
//	/**
//	 * 采购单（黑材）
//	 * @param purchaseDemand
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"purchaseHCList"})
//	public String purchaseHCList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		purchase.setType(CommonConstant.MATERIAL_HEICAI);
//		model = this.purchaseList(purchase, request, response, model);
//		return "modules/purchase/purchaseHCList";
//	}
//	/**
//	 * 采购单（钢材）
//	 * @param purchaseDemand
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"purchaseGCList"})
//	public String purchaseGFCList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		purchase.setType(CommonConstant.MATERIAL_GANGCAI);
//		model = this.purchaseList(purchase, request, response, model);
//		return "modules/purchase/purchaseGCList";
//	}
//	/**
//	 * 采购单（辅料）
//	 * @param purchaseDemand
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"purchaseFLList"})
//	public String purchaseFLList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		purchase.setType(CommonConstant.MATERIAL_FULIAO);
//		model = this.purchaseList(purchase, request, response, model);
//		return "modules/purchase/purchaseFLList";
//	}
//	/**
//	 * 查看采购单详情
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	public Model purchaseList(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model){
//		String seriesnumber = request.getParameter("seriesnumber");
//		purchase.setSeriesnumber(seriesnumber);
//		purchase.setGlfpGB("seriesnumber");
//		Page<Purchase> page = purchaseService.findPage(new Page<Purchase>(request, response), purchase);
//		model.addAttribute("page", page);
//		model.addAttribute("seriesnumber", seriesnumber);
//		model.addAttribute("iscgy", UserUtils.verificationRole("cgy"));
//		return model;
//	}
//	/**
//	 * 提交流程()
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"passACTHC"})//黑材
//	public String passACTHC(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		actAccessTaskDirectService.completeTask(wfID, "1", "", UserUtils.getActUserID());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseHCList";
//	}
//	@RequestMapping(value = {"passACTGC"})//钢材
//	public String passACTGC(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		actAccessTaskDirectService.completeTask(wfID, "1", "", UserUtils.getActUserID());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGCList";
//	}
//	@RequestMapping(value = {"passACTFL"})//辅料
//	public String passACTFL(Purchase purchase,HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		actAccessTaskDirectService.completeTask(wfID, "1", "", UserUtils.getActUserID());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseFLList";
//	}
//	/**
//	 * 流程驳回
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping(value = {"rebutACTHC"})
//	public String rebutACTHC(HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		String message = request.getParameter("message");
//		actAccessTaskDirectService.completeTask(wfID, "0", message, UserUtils.getUser().getLoginName());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseHCList";
//	}
//	@RequestMapping(value = {"rebutACTGC"})
//	public String rebutACTGC(HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		String message = request.getParameter("message");
//		actAccessTaskDirectService.completeTask(wfID, "0", message, UserUtils.getUser().getLoginName());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseGCList";
//	}
//	@RequestMapping(value = {"rebutACTFL"})
//	public String rebutACTFL(HttpServletRequest request,HttpServletResponse response,Model model) {
//		String wfID = request.getParameter("wfID");
//		String message = request.getParameter("message");
//		actAccessTaskDirectService.completeTask(wfID, "0", message, UserUtils.getUser().getLoginName());
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/purchaseFLList";
//	}
//	/**
//	 * end 2015年9月14日11:25:17
//	 */
//	/**
//	 * 采购员提交需求订单生成相应的采购订单
//	 * 生成采购订单
//	 * （合并）
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"submitDemand"})
//	public String submitDemand(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取当前登录的用户，获取当前用户的数据
//		User currentUser = UserUtils.getUser();
//		String suppID = request.getParameter("gys");
//		//生成采购订单的编号
//		String seriesNumber = SeriesNumberUtils.getCGSeriesNumber(purchaseService.getToDaysCount(new Date()));
//		//获取界面传过来的指派采购数据(拆分组合生成实体)
//		String idsStr = request.getParameter("sdIDs");
//		String vals = request.getParameter("vs");
////		String prices = request.getParameter("ps");
//		String[] idArr = idsStr.split(",");
//		String[] valArr = vals.split(",");
////		String[] priceArr = prices.split(",");
//		List<String> ids = new ArrayList<String>();
//		//定义map存储每个值
//		Map<String,Integer> mapVal = new HashMap<String,Integer>();
////		Map<String,Integer> mapPrice = new HashMap<String,Integer>();
//		//关联数据
//		List<PurchaseMapping> listPM = new ArrayList<PurchaseMapping>();
//		PurchaseMapping pm = null;
//		for(int i=0;i<idArr.length;i++){
//			String id = idArr[i];
//			mapVal.put(id, Integer.parseInt(valArr[i]));
////			mapPrice.put(id, Integer.parseInt(priceArr[i]));
//			ids.add(id);
//			//组装关联关系
//			pm = new PurchaseMapping();
//			pm.setPdid(id);
//			pm.setPnumber(seriesNumber);
//			
//			listPM.add(pm);
//		}
//		PurchaseDemand pd = new PurchaseDemand();
//		pd.setAssignto(currentUser);
//		//获取界面传送过来的相应的采购需求订单
//		List<PurchaseDemand> listPD = purchaseDemandService.getByIDs(ids);
//		if(listPD.size()<=0)
//			return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/list";
////		String orginMtype = listPD.get(0).getMtype();
//		String orginType = listPD.get(0).getType();
//		//1.循环根据类型填入map
//		Map<String,Integer> mapCount = new HashMap<String,Integer>();
//		for(PurchaseDemand p:listPD){
//			if(mapCount.containsKey(p.getMtype()))	//如果map中有数据，取出相加
//				mapCount.put(p.getMtype(), mapVal.get(p.getId())+mapCount.get(p.getMtype()));
//			else	//否则直接填充数据
//				mapCount.put(p.getMtype(), mapVal.get(p.getId()));
//		}
//		//3.循环map组装新的填入数据库的数据
//		//进行相应的业务逻辑处理组装形成相关的采购订单
//		List<Purchase> listP = new ArrayList<Purchase>();
//		Supplier supp = new Supplier();
//		supp.setId(suppID);
//		for(String key:mapCount.keySet()){
//			//组装采购订单数据
//			purchase = new Purchase();
//			purchase.setId(IdGen.uuid());
//			purchase.setType(orginType);	
//			purchase.setMtype(key);
//			purchase.setPurchaseby(currentUser);
//			purchase.setCreateDate(new Date());
//			purchase.setUpdateDate(new Date());
//			purchase.setTotal(mapCount.get(key));	//获取统计总数
//			purchase.setSeriesnumber(seriesNumber);
//			purchase.setSupp(supp);
//			
//			listP.add(purchase);
//		}
//		
//		//批量插入相应的 待采购 数据
//		purchaseService.batchPurchase(listP);
//		//批量插入关联数据
//		purchaseMappingService.batchPurchaseMapping(listPM);
////		Page<Purchase> page = purchaseService.findPage(new Page<Purchase>(request, response), purchase); 
////		model.addAttribute("page", page);
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchaseDemand/purchaseHCList";
//	}
//	/**
//	 * 根据采购编号查看申购需求
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "purchaseDetail")
//	@ResponseBody
//	public List<PurchaseDemand> purchaseDetail(
//			HttpServletRequest request,
//			HttpServletResponse response){
//		String pNumber = request.getParameter("pNumber");
//		return purchaseDemandService.getByPNumber(pNumber);
//	}
//	/**
//	 * 返回列表数据
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"list",""})
//	public String list(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		String pdType = request.getParameter("pdType");
//		purchase.setType(pdType);
//		Page<Purchase> page = purchaseService.findPage(new Page<Purchase>(request, response), purchase); 
//		model.addAttribute("page", page);
//		return "modules/purchase/purchaseList";
//	}
//	/**
//	 * 
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "suppSendNeed")
//	@ResponseBody
//	public Map<String,Object> suppSendNeed(
//			HttpServletRequest request,
//			HttpServletResponse response){
//		Map<String,Object> map = new HashMap<String,Object>();
//		List<Supplier> listSupp = SupplierService.getByType("supp_wl");
//		List<CommonPerson> listC = commonPersonService.findList(null);
//		
//		map.put("listSupp", listSupp);
//		map.put("listC", listC);
//		return map;
//	}
//	/**
//	 * 采购员选定供应商后形成已下单的数据
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"submitPurchase"})
//	public String submitPurchase(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传送过来的相应的采购订单
//		List<Purchase> listP = null;
//		//获取界面传过来的供应商
//		
//		//批量提交采购订单数据
//		purchaseService.batchUpdate(listP);
//		
//		Page<Purchase> page = purchaseService.findPage(new Page<Purchase>(request, response), purchase); 
//		model.addAttribute("page", page);
//		return "modules/purchase/purchaseList";
//	}
//	/**
//	 * 供应商查看数据
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"suppSel"})
//	public String suppSel(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//运输公司的相关数据信息
//		//供应商获取相应的数据列表
//		Page<Purchase> page = purchaseService.selByCondition(new Page<Purchase>(request, response), purchase); 
//		model.addAttribute("page", page);
//		return "modules/purchase/purchaseList";
//	}
//	/**
//	 * 黑材、镀锌钢材
//	 * 供应商执行发货
//	 * 发货数量、过磅重量
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"suppSend"})
//	public String suppSend(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传送过来的发货的相关信息
//		int fcount = Integer.parseInt(request.getParameter("fcount"));
//		double fweight = Double.parseDouble(request.getParameter("fweight"));
//		//获取被发货的订单ID(一次只能对一笔单进行发货)
//		String idStr = request.getParameter("sendID");
//		//获取界面传送的关联数据
//		String suppId = request.getParameter("gys");
//		String cpId = request.getParameter("commadd");
////		//获取界面传送过来的相应的采购订单
////		List<Purchase> listP = null;
////		//执行相应发货操作
////		purchaseService.batchUpdate(listP);
//		String seriesnumber = "HCFH"+DateUtils.getDateByPattern("yyyyMMdd")+new Date().getTime();
//		//关联数据
//		Supplier supp = new Supplier();
//		supp.setId(suppId);
//		CommonPerson cp = new CommonPerson();
//		cp.setId(cpId);
//		//根据业务逻辑生成相应的收发详细数据
//		PurchaseSFDetail pSFDetail = new PurchaseSFDetail();
//		pSFDetail.setId(IdGen.uuid());
//		pSFDetail.setSeriesnumber(seriesnumber);
//		pSFDetail.setPurchaseId(idStr);
//		pSFDetail.setFcount(fcount);
//		pSFDetail.setFweight(fweight);
//		pSFDetail.setUpdateDate(new Date());
//		pSFDetail.setSupp(supp);
//		pSFDetail.setCp(cp);
//		purchaseSFDetailService.insert(pSFDetail);
//		
//		
//		
////		//供应商（跟单员获取相应的数据列表）
////		Page<Purchase> page = purchaseService.selByCondition(new Page<Purchase>(request, response), purchase); 
////		model.addAttribute("page", page);
////		return "modules/purchase/purchaseList";
//		return "redirect:"+Global.getAdminPath()+"/purchase/purchase/list";
//	}
//	/**
//	 * 获取收发详情
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "getSFDetailByPID")
//	@ResponseBody
//	public List<PurchaseSFDetail> getSFDetailByPID(
//			HttpServletRequest request,
//			HttpServletResponse response){
//		String pID = request.getParameter("pID");
//		return purchaseSFDetailService.getSFDetailByPID(pID);
//	}
//	/**
//	 * 黑材、镀锌钢材 收货
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"receiptPurchase"})
//	@ResponseBody
//	public void receiptPurchase(HttpServletRequest request, HttpServletResponse response, Model model) {
//		String id=request.getParameter("id");
//		int count=Integer.parseInt(request.getParameter("count"));
//		double weight=Double.parseDouble(request.getParameter("weight"));
//		PurchaseSFDetail p = new PurchaseSFDetail();
//		p.setId(id);
//		p.setScount(count);
//		p.setSweight(weight);
//		purchaseSFDetailService.update(p);
//	}
//	/**
//	 * 黑材、镀锌钢材
//	 * 收货
//	 * 收货数量、过磅重量
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"dxc"})
//	public String dxc(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传过来的相关数据
//		List<PurchaseSFDetail> listPSF=null;
//		PurchaseSFDetailService.batchPurchaseSFDetail(listPSF);
//		//修改相关的物流信息
//		
//		//镀锌厂获取相应的数据列表
//		Page<Purchase> page = purchaseService.selByCondition(new Page<Purchase>(request, response), purchase); 
//		model.addAttribute("page", page);
//		//生成对账（付款）单
//		return "modules/purchase/purchaseList";
//	}
//	/**
//	 * 收货
//	 * @param purchase
//	 * @param request
//	 * @param response
//	 * @param model
//	 * @return
//	 */
//	@RequiresPermissions("user")
//	@RequestMapping(value = {"receiptPurchase"})
//	public String receiptPurchase(Purchase purchase, HttpServletRequest request, HttpServletResponse response, Model model) {
//		//获取界面传过来的相关数据（收货数量）
//		List<Purchase> listP=null;
//		purchaseService.batchUpdate(listP);
//		//修改相关的物流信息
//		//生成对账单
//		Page<Purchase> page = purchaseService.selByCondition(new Page<Purchase>(request, response), purchase); 
//		model.addAttribute("page", page);
//		return "modules/purchase/purchaseList";
//	}
	
	
	
	

}