/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.attachment.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;

/**
 * 附件信息存放表Controller
 * @author xjp
 * @version 2015-08-17
 */
@Controller
@RequestMapping(value = "${adminPath}/attachment/attachment")
public class AttachmentController extends BaseController {

	@Autowired
	private AttachmentService attachmentService;
	
	@ModelAttribute
	public Attachment get(@RequestParam(required=false) String id) {
		Attachment entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = attachmentService.get(id);
		}
		if (entity == null){
			entity = new Attachment();
		}
		return entity;
	}
	
	@RequiresPermissions("attachment:attachment:view")
	@RequestMapping(value = {"list", ""})
	public String list(Attachment attachment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Attachment> page = attachmentService.findPage(new Page<Attachment>(request, response), attachment); 
		model.addAttribute("page", page);
		return "modules/attachment/attachmentList";
	}

	@RequiresPermissions("attachment:attachment:view")
	@RequestMapping(value = "form")
	public String form(Attachment attachment, Model model) {
		model.addAttribute("attachment", attachment);
		return "modules/attachment/attachmentForm";
	}

	@RequiresPermissions("attachment:attachment:edit")
	@RequestMapping(value = "save")
	public String save(Attachment attachment, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, attachment)){
			return form(attachment, model);
		}
		attachmentService.save(attachment);
		addMessage(redirectAttributes, "保存上传附件成功成功");
		return "redirect:"+Global.getAdminPath()+"/attachment/attachment/?repage";
	}
	
	@RequiresPermissions("attachment:attachment:edit")
	@RequestMapping(value = "delete")
	public String delete(Attachment attachment, RedirectAttributes redirectAttributes) {
		attachmentService.delete(attachment);
		addMessage(redirectAttributes, "删除上传附件成功成功");
		return "redirect:"+Global.getAdminPath()+"/attachment/attachment/?repage";
	}

	/**
	 * 由type获取列表
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "findattachlist")
	public List<Attachment> findAttachType(HttpServletRequest request,HttpServletResponse response,Model model) {
		Attachment attachment = new Attachment();
		attachment.setType(request.getParameter("type"));
		return attachmentService.findAttachType(attachment);
	}
	
	/**
	 * 异步调用删除对象
	 * @param attachment
	 * @param request
	 */
	@ResponseBody
	@RequestMapping(value="deleteAttach")
	public void deleteAttach(Attachment attachment, HttpServletRequest request,HttpServletResponse response){
		String deleteId = request.getParameter("deleteId");
		attachment.setId(deleteId);
		attachmentService.delete(attachment);
	}
}