/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.act.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bt.modules.activiti.constants.ActivitiConstants;
import com.bt.modules.activiti.constants.TaskType;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.act.entity.ActAuditTrace;
import com.thinkgem.jeesite.modules.act.dao.ActAuditTraceDao;



/**
 * 流程轨迹跟踪Service
 * @author fjy
 * @version 2016-04-18
 */
@Service
@Transactional(readOnly = true)
public class ActAuditTraceService extends CrudService<ActAuditTraceDao, ActAuditTrace> {

	public static final String USER_ID_SEPERATOR = ",";

	@Autowired
	private TaskService taskService;

	@Autowired
	private UserDao userDao;


	/**
	 * 获取流程轨迹
	 * @param procInstId 流程ID
	 * @return
	 */
	public List<ActAuditTrace> getFlowAuditTrace(String procInstId){
		ActAuditTrace param =  new ActAuditTrace();
		param.setProinstid(procInstId);
		return dao.getFlowAuditTrace(param);
	}


	@Transactional(readOnly = false)
	public void save(ActAuditTrace actAuditTrace) {
		super.save(actAuditTrace);
	}

	@Transactional(readOnly = false)
	public void traceFlowStart(String procInstId){
		ActAuditTrace actAuditTrace = new ActAuditTrace();
		actAuditTrace.setProinstid(procInstId);
		actAuditTrace.setSubmitnode("开始");
		actAuditTrace.setSubmitpeople(UserUtils.getUser().getId());
		actAuditTrace.setAuditType(TaskType.Audit.getValue());
		actAuditTrace.setAudittime(new Date());

		wrapperNextNodeInfo(actAuditTrace, procInstId);
		save(actAuditTrace);
	}

	@Transactional(readOnly = false)
	public void traceAudit(Task currentTask, String procInstId, Map<String, String> processVariables){
		ActAuditTrace actAuditTrace = new ActAuditTrace();
		actAuditTrace.setProinstid(procInstId);
		actAuditTrace.setSubmitnode(currentTask.getName());
		actAuditTrace.setSubmitpeople(UserUtils.getUser().getId());
		actAuditTrace.setAuditType(TaskType.Audit.getValue());
		actAuditTrace.setAuditresult(processVariables.get(ActivitiConstants.APPROVAL_RESULT_VARIABLE));
		actAuditTrace.setAuditproposal(processVariables.get(ActivitiConstants.REJECT_BACK_REASON));
		actAuditTrace.setAudittime(new Date());

		wrapperNextNodeInfo(actAuditTrace, procInstId);
		save(actAuditTrace);
	}

	@Transactional(readOnly = false)
	public void traceClaim(Task doneTask, String procInstId){
		ActAuditTrace actAuditTrace = new ActAuditTrace();
		actAuditTrace.setProinstid(procInstId);
		actAuditTrace.setSubmitnode(doneTask.getName());
		actAuditTrace.setSubmitpeople(UserUtils.getUser().getId());
		actAuditTrace.setAuditType(TaskType.Claim.getValue());
		actAuditTrace.setAudittime(new Date());

		wrapperNextNodeInfo(actAuditTrace, procInstId);
		save(actAuditTrace);
	}


	public void wrapperNextNodeInfo(ActAuditTrace actAuditTrace, String procInstId){
		Task nextTask =  taskService.createTaskQuery().processInstanceId(procInstId)
				.singleResult();
		if(nextTask == null){
			actAuditTrace.setNextNode("结束");
			return;
		}

		actAuditTrace.setNextNode(nextTask.getName());
		if(StringUtils.isNotEmpty(nextTask.getAssignee())){
			actAuditTrace.setNextAuditPeople(UserUtils.getByLoginName(nextTask.getAssignee()).getId());
		}else{
			List<IdentityLink> identityLinks = taskService.getIdentityLinksForTask(nextTask.getId());
			StringBuilder candidateUsers = new StringBuilder();
			for(IdentityLink link : identityLinks) {
				if (!link.getType().equals("candidate"))
					continue;

				if(link.getGroupId()!=null){
					handlerBindGroupSituation(candidateUsers, link.getGroupId());
				}else{
					candidateUsers.append(UserUtils.getByLoginName(link.getUserId()).getId()).append(USER_ID_SEPERATOR);
				}

			}
			actAuditTrace.setNextAuditPeople(candidateUsers.toString());
		}

	}


	private void handlerBindGroupSituation(StringBuilder candidateUsers, String groupId){
		Role roleParam = new Role();
		roleParam.setEnname(groupId);
		List<User> users = userDao.findByRoleEnName(roleParam);
		int count = 0;
		for(User user : users){
			candidateUsers.append(user.getId()).append(USER_ID_SEPERATOR);
			count++;
			if(count > 9) {
				break;
			}
		}
	}

}
