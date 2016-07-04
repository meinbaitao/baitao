/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.web;

import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.act.entity.ActAuditTrace;
import com.thinkgem.jeesite.modules.act.service.ActAuditTraceService;
import com.bt.modules.activiti.constants.AuditResult;
import com.bt.modules.activiti.constants.TaskType;

import java.util.List;

/**
 * 流程轨迹跟踪Controller
 * @author fjy
 * @version 2016-04-18
 */
@Controller
@RequestMapping(value = "${adminPath}/act/actAuditTrace")
public class ActAuditTraceController extends BaseController {

	@Autowired
	private ActAuditTraceService actAuditTraceService;
	

	@RequestMapping(value = "getFlowAuditTrace/{processInstanceId}")
	@ResponseBody
	public List<ActAuditTrace> getFlowAuditTrace(@PathVariable String processInstanceId) {
		List<ActAuditTrace> auditTraces = actAuditTraceService.getFlowAuditTrace(processInstanceId);
		for(ActAuditTrace trace : auditTraces){
			trace.setSubmitPeopleName(UserUtils.get(trace.getSubmitpeople()).getName());
			trace.setNextAuditPeopleName(wrapperNextAuditUsersName(trace.getNextAuditPeople()));
			AuditResult auditResult = null;
			if(AuditResult.REJECT.getValue().equals(trace.getAuditresult())){
				auditResult = AuditResult.REJECT;
			}else{
				auditResult = AuditResult.APPROVAL;
			}
			trace.setAuditResultName(auditResult.getLabel());

			TaskType auditType =  null;
			if(TaskType.Audit.getValue().equals(trace.getAuditType())){
				auditType = TaskType.Audit;
			}else{
				auditType = TaskType.Claim;
			}
			trace.setAuditTypeName(auditType.getLabel());
		}
		return auditTraces;
	}

	private String wrapperNextAuditUsersName(String nextAuditUsers){
		if(StringUtils.isEmpty(nextAuditUsers))
			return "";

		StringBuilder userNames = new StringBuilder();
		String[] userIds = nextAuditUsers.split(ActAuditTraceService.USER_ID_SEPERATOR);
		for(int index = 0; index<userIds.length; index++){
			userNames.append(UserUtils.get(userIds[index]).getName());
			if(index<userIds.length-1){
				userNames.append(ActAuditTraceService.USER_ID_SEPERATOR);
			}
		}

		return userNames.toString();
	}

}