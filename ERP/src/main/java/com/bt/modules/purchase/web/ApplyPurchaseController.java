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
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.person.service.CommonPersonService;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.purchase.entity.PurchaseDemandSubProjectMapping;
import com.bt.modules.purchase.entity.PurchaseDemand;
import com.bt.modules.purchase.service.PurchaseDemandSubProjectMappingService;
import com.bt.modules.purchase.service.PurchaseDemandService;
import com.bt.modules.purchase.service.PurchaseService;
import com.bt.modules.utils.CommonConstant;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.SeriesNumberUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.act.service.ActAccessTaskDirectService;
import com.thinkgem.jeesite.modules.act.service.ActTaskService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 申购计划Controller
 * @author xiaocai
 * @version 2015-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/purchase/applyPurchase")
public class ApplyPurchaseController extends BaseController {

	@Autowired
	private PurchaseDemandService purchaseDemandService;	//申购需求
	@Autowired	
	private PurchaseService purchaseService;				//采购订单
	@Autowired
	private ProjectService projectService;					//一级项目
	@Autowired
	private SubProjectService subProjectService;			//二级项目
	@Autowired
	private PurchaseDemandSubProjectMappingService purchaseDemandSubProjectMappingService;  //采购需求和二级项目关联表
	@Autowired
	private SystemService systemService;	//系统
	@Autowired
	private CommonPersonService commonPersonService;		//常用联系人
	@Autowired
	private ActTaskService actTaskService;		//流程
	@Autowired
	private ActAccessTaskDirectService actAccessTaskDirectService;		//流程
	
	
	
	/**
	 * 申购计划 start
	 */
	/**
	 * 申购计划列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"applyHCList"})
	public String applyHCList(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		PurchaseDemand pd = new PurchaseDemand();
		pd.setType(CommonConstant.MATERIAL_HEICAI);
		boolean yyzg = UserUtils.verificationRole("yyzg");
		if(yyzg){
			pd.setCreateBy(UserUtils.getUser());
		}
		pd.setSeriesnumber(seriesnumber);
		Page<PurchaseDemand> page = purchaseDemandService.applyHCList(new Page<PurchaseDemand>(request, response), pd); 
		model.addAttribute("page", page);
		return "modules/purchase/applyHCList";
	}
	/**
	 * 跳转添加申购计划界面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"applyPurchase"})
	public String applyPurchase(HttpServletRequest request,HttpServletResponse response,Model model) {
		int count = purchaseDemandService.getToDaysCount(new Date());
		String seriesnumber = SeriesNumberUtils.getSGHCSeriesNumber(count);
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("is", false);
		model.addAttribute("isyyzg", UserUtils.verificationRole("yyzg"));
		return "modules/purchase/applyPurchase";
	}
	/**
	 * 根据申购编号获取详细的列表数据(页面跳转)
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"apDetail"})
	public String apDetail(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		model.addAttribute("seriesnumber", seriesnumber);
		model.addAttribute("is", true);
		model.addAttribute("isyyzg", UserUtils.verificationRole("yyzg"));
		return "modules/purchase/applyPurchase";
	}
	/**
	 * ajax根据申购编号获取详细的列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"ajaxApDetail"})
	@ResponseBody
	public Map<String,Object> ajaxApDetail(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		//查询相关的关联数据
		List<Map<String, Object>> listM = purchaseDemandSubProjectMappingService.getDetailBySeriesNumber(seriesnumber);
		//根据申购编号查询相关的申购数据
		List<PurchaseDemand> listPD = purchaseDemandService.getBySeriesNumber(seriesnumber);
		List<Map<String, Object>> listPro = projectService.gbProByName();
		String wfStatus = "0";
		//获取数据最新的流程状态
		if(listPD!=null&&listPD.size()>0){
			wfStatus = listPD.get(0).getWorkflowstatus();
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("seriesnumber", seriesnumber);
		map.put("listM", listM);
		map.put("listPD", listPD);
		map.put("wfStatus", wfStatus);
		map.put("listPro", listPro);
		return map;
	}
	
	/**
	 * 获取添加行需要的项目数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "listPro")
	@ResponseBody
	public Map<String,Object> listPro(
			HttpServletRequest request,
			HttpServletResponse response){
		//项目列表数据
		List<Map<String, Object>> listMap = projectService.gbProByName();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("listMap", listMap);
		return map;
	}
	/**
	 * 根据一级项目ID获取二级项目列表数据
	 * @return
	 */
	@RequestMapping(value = "getSubByProID")
	@ResponseBody
	public List<Map<String,Object>> getSubByProID(HttpServletRequest request, HttpServletResponse response){
		String proID = request.getParameter("proID");
		List<Map<String, Object>> listSub = subProjectService.getSubByProID(proID);
		return listSub;
	}
	/**
	 * 根据户型获取二级项目列表数据
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "getSubByHouseType")
	@ResponseBody
	public List<Map<String,Object>> getSubByHouseType(HttpServletRequest request, HttpServletResponse response){
		String proID = request.getParameter("proID");
		String houseType = request.getParameter("houseType");
		List<Map<String, Object>> listSub = subProjectService.getSubByHouseType(proID,houseType);
		return listSub;
	}
	/**
	 * 保存申购数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = {"saveAP"})
	@ResponseBody
	public Map<String,Object> saveAP(HttpServletRequest request,HttpServletResponse response,Model model) throws Exception {
		//获取界面端对应的数据
		String seriesnumber = request.getParameter("seriesnumber");
		String processInstanceId = request.getParameter("processInstanceId");
		String pdJson = request.getParameter("pdJson");
		String subIDstr = request.getParameter("subIDs");
		String[] subIDs = subIDstr.split(",");
		//转换界面传过来的json数据
		List<PurchaseDemand> listPD = this.pdHCJsonUtils(pdJson, seriesnumber);
		List<PurchaseDemandSubProjectMapping> listMapping = new ArrayList<PurchaseDemandSubProjectMapping>();
		PurchaseDemandSubProjectMapping psm;
		//循环关联采购需求跟二级项目
		for(PurchaseDemand pd:listPD){
			if(StringUtils.isNotBlank(processInstanceId)){
				pd.setWorkflowid(processInstanceId);
				pd.setWorkflowstatus(CommonStatus.WORK_FLOW_UNDERWAY);
			}
			
			pd.setSeriesnumber(seriesnumber);
			pd.setCreateBy(UserUtils.getUser());
			//采购需求关联二级项目
			for(String sunID:subIDs){
				String pID = pd.getId();		//读取需求单ID
				
				psm = new PurchaseDemandSubProjectMapping();
				psm.setId(IdGen.uuid());
				psm.setPdid(pID);
				psm.setSubid(sunID);
				
				listMapping.add(psm);
			}
		}
		purchaseDemandService.batchSaveApplyPurchase(listPD, seriesnumber);
		purchaseDemandSubProjectMappingService.batchPurchaseDemandSubProjectMapping(listMapping);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", "保存成功");
		return map;
	}
	/**
	 * 提交申购计划
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"submitAP"})
	@ResponseBody
	public String submitAP(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		//提交流程（正式开启流程）
		List<PurchaseDemand> listPD = purchaseDemandService.getBySeriesNumber(seriesnumber);
		List<String> listIDs = new ArrayList<String>();
		//组装IDs
		for(PurchaseDemand pd : listPD){
			listIDs.add(pd.getId());
		}
		//创建一个新的流程
		Map<String,Object> variable = new HashMap<String, Object>();
		variable.put(ActivitiConstants.PERSIST_BEAN_NAME, PurchaseDemandService.BEAN_NAME);
		variable.put(ActivitiConstants.PRIMARY_KEY, listIDs);
		String actID = actTaskService.startProcess("ApplyProcureFlow", "btg_purchase_demand", "workflow_id","",variable);
		for(PurchaseDemand pd:listPD){
			pd.setStatus(CommonStatus.PURCHASE_DSH);
			pd.setWorkflowid(actID);
			pd.setWorkflowstatus(CommonStatus.WORK_FLOW_OPEN);
		}
		purchaseDemandService.batchUpdate(listPD);
		return "提交成功";
//		return "modules/purchase/applyHCList";
//		return "redirect:"+Global.getAdminPath()+"/purchase/applyPurchase/applyHCList";
	}
	/**
	 * 审核流程通过（即使流程进入下一步）
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"passAP"})
	public String passAP(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		//审核流程通过（即使流程进入下一步）
		List<PurchaseDemand> listPD = purchaseDemandService.getBySeriesNumber(seriesnumber);
		String actID = "";
		for(PurchaseDemand pd:listPD){
			actID = pd.getWorkflowid();
			pd.setWorkflowstatus(CommonStatus.WORK_FLOW_UNDERWAY);
		}
		purchaseDemandService.batchUpdate(listPD);
		actAccessTaskDirectService.completeTask(actID, "1", "", UserUtils.getUser().getLoginName());
//		return "modules/purchase/applyPurchase";
		return "redirect:"+Global.getAdminPath()+"/purchase/applyPurchase/applyHCList";
	}
	/**
	 * 驳回申购计划
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"rebutAP"})
	public String rebutAP(HttpServletRequest request,HttpServletResponse response,Model model) {
		String seriesnumber = request.getParameter("seriesnumber");
		String processInstanceId = request.getParameter("processInstanceId");
		String message = request.getParameter("message");
		//1.通过申购编号获取对应的流程ID 2.对申购订单修改成驳回状态		
		List<PurchaseDemand> listPD = purchaseDemandService.getBySeriesNumber(seriesnumber);
		for(PurchaseDemand pd:listPD){
//			String actID = pd.getWorkflowid();
		}
		purchaseDemandService.batchUpdate(listPD);
		//驳回并结束流程
		actAccessTaskDirectService.completeTask(processInstanceId, "0", message, UserUtils.getUser().getLoginName());
//		return "true";
		return "redirect:"+Global.getAdminPath()+"/purchase/applyPurchase/applyHCList";
	}
	/**
	 * 黑材的json数据处理
	 * @param jsonStringString
	 * @param seriesnumber
	 * @return
	 */
	public List<PurchaseDemand> pdHCJsonUtils(String jsonString,String seriesnumber) {
		List<PurchaseDemand> listPD = new ArrayList<PurchaseDemand>();
		try {
			JSONObject  dataJson=new JSONObject(jsonString);
			JSONArray jsonArray= dataJson.getJSONArray("pd");
			
			PurchaseDemand pd;
			String id;
			for(int i=0;i<jsonArray.length();i++){
				JSONObject jObj = jsonArray.getJSONObject(i);
				pd = new PurchaseDemand();
				if(jObj.getInt("count")<=0)
					continue;
				id=IdGen.uuid();
				pd.setId(id);
				pd.setType("黑材");
				pd.setSeriesnumber(seriesnumber);
				pd.setCreateDate(new Date());
				pd.setUpdateDate(new Date());
				pd.setCount(jObj.getInt("count"));
				pd.setMtype(jObj.getString("type"));
				
				listPD.add(pd);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return listPD;
	}
	/**
	 * 申购计划 end 2015年9月9日13:58:09
	 */
}