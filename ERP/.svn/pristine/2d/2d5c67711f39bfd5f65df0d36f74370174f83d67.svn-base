package com.bt.modules.activiti.behavior;

import java.util.Collection;
import java.util.List;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.ActivitiIllegalArgumentException;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.Expression;
import org.activiti.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.delegate.ActivityExecution;
import org.activiti.engine.impl.task.TaskDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.base.Strings;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;

/**
 * 
 * Activiti 自定义行为可以监控到各个元素的各种行为, 只需要覆盖相应方法即可
 * @since 20160517
 * @author 许俊雄
 *
 */
public class CustomUserTaskActivityBehavior extends UserTaskActivityBehavior {
	private static Logger logger = LoggerFactory
			.getLogger(CustomUserTaskActivityBehavior.class);

	private SystemService systemService;

	// @Autowired获取不到的
	private TaskService taskService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 7884877494583824542L;

	/**
	 * 基于注解获取不到systemService
	 * 
	 * @return
	 */
	public SystemService getSystemService() {
		if (systemService == null) {
			systemService = SpringContextHolder.getBean(SystemService.class);
		}
		return systemService;
	}

	/**
	 * 基于注解获取不到taskService
	 * 
	 * @return
	 */
	public TaskService getaskService() {
		if (taskService == null) {
			taskService = SpringContextHolder.getBean(TaskService.class);
		}
		return taskService;
	}

	public CustomUserTaskActivityBehavior(TaskDefinition taskDefinition) {
		super(taskDefinition);
	}

	@Override
	protected void handleAssignments(TaskEntity task,
			ActivityExecution execution) {
		String assignee = null;
		List<String> candidateUserId = null, candidateGroupId = null;

		if (taskDefinition.getAssigneeExpression() != null) {
			assignee = (String) taskDefinition.getAssigneeExpression()
					.getValue(execution);
			task.setAssignee(assignee, true, false);
		}

		if (taskDefinition.getOwnerExpression() != null) {
			task.setOwner((String) taskDefinition.getOwnerExpression()
					.getValue(execution));
		}

		if (!taskDefinition.getCandidateGroupIdExpressions().isEmpty()) {
			for (Expression groupIdExpr : taskDefinition
					.getCandidateGroupIdExpressions()) {
				Object value = groupIdExpr.getValue(execution);
				if (value instanceof String) {
					candidateGroupId = extractCandidates((String) value);
					task.addCandidateGroups(candidateGroupId);
				} else if (value instanceof Collection) {
					task.addCandidateGroups((Collection) value);
				} else {
					throw new ActivitiIllegalArgumentException(
							"Expression did not resolve to a string or collection of strings");
				}
			}
		}

		if (!taskDefinition.getCandidateUserIdExpressions().isEmpty()) {
			for (Expression userIdExpr : taskDefinition
					.getCandidateUserIdExpressions()) {
				Object value = userIdExpr.getValue(execution);
				if (value instanceof String) {
					candidateUserId = extractCandidates((String) value);
					task.addCandidateUsers(candidateUserId);
				} else if (value instanceof Collection) {
					task.addCandidateUsers((Collection) value);
				} else {
					throw new ActivitiException(
							"Expression did not resolve to a string or collection of strings");
				}
			}
		}

		// 如果candidateGroup不为空且为一组！，则获取到组ID
		if (assignee == null && candidateUserId == null
				&& candidateGroupId.size() == 1) {
			String roleEName = candidateGroupId.get(0);

			if (Strings.isNullOrEmpty(roleEName)) {
				logger.warn("用户组信息为空，无法实现自动签收！");
				throw new ActivitiException("roleEName is null or empty!");
			}

			// 查询符合该组的人员信息 许俊雄 20160509
			// 因为流程中不可能去绑定UUID
			// Sales、masterControl、SalesManager这样的显示code
			// 需要通过ENAME去查询出ID
			Role role = getSystemService().getRoleByEnname(roleEName);
			if (null == role || Strings.isNullOrEmpty(role.getId())) {
				logger.warn("角色ename:{}不存在表sys_role", roleEName);
				throw new ActivitiException("group is not exist");
			}
			List<User> data = getSystemService().findUserNoneFilter(
					new User(new Role(role.getId())));
			// 如果人员信息为1个，则符合自动签收！
			if (data.size() == 1) {
				// !!用登录名称去签收，系统登录名称是唯一的
				String userName = data.get(0).getLoginName();

				logger.debug("用户{}自动签收{}组的任务", userName, roleEName);
				// 签收
				getaskService().claim(task.getId(), userName);
			}
		}
	}

}
