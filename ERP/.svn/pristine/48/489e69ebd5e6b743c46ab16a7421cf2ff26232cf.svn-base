package com.thinkgem.jeesite.modules.taskmapping.service;

import com.bt.modules.activiti.constants.TaskType;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActCurrentTask;
import com.thinkgem.jeesite.modules.taskmapping.entity.ActDoneTask;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * author fanjinyuan.
 */
@Service
@Transactional(readOnly = true)
public class RecordMappingFacedService {

    @Autowired
    private ActCurrentTaskService currentTaskService;

    @Autowired
    private ActDoneTaskService doneTaskService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserDao userDao;


    public List<ActCurrentTask> getCurrentTasks(String processInstanceId, String entryId, String businessTable){
        List<ActCurrentTask> currentTasks = new ArrayList<ActCurrentTask>();
        Task currentTask =  taskService.createTaskQuery().processInstanceId(processInstanceId)
                .singleResult();
        if(currentTask == null){
            return currentTasks;
        }

        if(StringUtils.isNotEmpty(currentTask.getAssignee())){
            ActCurrentTask act = new ActCurrentTask();
            act.setUserId(UserUtils.getByLoginName(currentTask.getAssignee()).getId());
            act.setEntryId(entryId);
            act.setBusinessTable(businessTable);
            act.setTaskType(TaskType.Audit.getValue());
            currentTasks.add(act);
        }else{
            List<IdentityLink> identityLinks = taskService.getIdentityLinksForTask(currentTask.getId());
            for(IdentityLink link : identityLinks){
                if(!link.getType().equals("candidate"))
                    continue;

                if(link.getGroupId()!=null){
                    this.handleBindGroupSituation(link.getGroupId(), businessTable, entryId, currentTasks);
                }else{
                    ActCurrentTask act = new ActCurrentTask();
                    act.setUserId(UserUtils.getByLoginName(link.getUserId()).getId());
                    act.setEntryId(entryId);
                    act.setBusinessTable(businessTable);
                    act.setTaskType(TaskType.Claim.getValue());
                    currentTasks.add(act);
                }

            }
        }

        return currentTasks;
    }



    private void handleBindGroupSituation(String groupId, String businessTable, String entryId, List<ActCurrentTask> currentTasks){
        Role roleParam = new Role();
        roleParam.setEnname(groupId);
        List<User> users = userDao.findByRoleEnName(roleParam);
        for(User user : users){
            ActCurrentTask act = new ActCurrentTask();
            act.setUserId(user.getId());
            act.setEntryId(entryId);
            act.setBusinessTable(businessTable);
            act.setTaskType(TaskType.Claim.getValue());
            currentTasks.add(act);
        }
    }


    @Transactional(readOnly = false)
    public void recordCurrentTasks(String processInstanceId, String entryId, String businessTable){
        List<ActCurrentTask> currentTasks = getCurrentTasks(processInstanceId, entryId, businessTable);
        for(ActCurrentTask currentTask : currentTasks){
            currentTaskService.save(currentTask);
        }
    }

    public void recordCurrentTask(ActCurrentTask actCurrentTask){
        currentTaskService.save(actCurrentTask);
    }



    public void deleteCurrentTask(String entryId, String businessTable){
        ActCurrentTask act = new ActCurrentTask();
        act.setEntryId(entryId);
        act.setBusinessTable(businessTable);
        currentTaskService.delete(act);
    }

    @Transactional(readOnly = false)
    public void recordDoneTask(String entryId, String businessTable){
        String userId = UserUtils.getUser().getId();
        ActDoneTask doneTask = new ActDoneTask();
        doneTask.setUserId(userId);
        doneTask.setEntryId(entryId);
        doneTask.setBusinessTable(businessTable);
        doneTaskService.save(doneTask);
    }

}
