package com.bt.modules.execution.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.h2.store.fs.FilePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bt.common.exceptions.BusinessException;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.execution.entity.Schedule;
import com.bt.modules.execution.entity.ScheduleIssue;
import com.bt.modules.execution.entity.Scheduledetail;
import com.bt.modules.execution.service.ScheduleIssueService;
import com.bt.modules.execution.service.ScheduleService;
import com.bt.modules.orbom.entity.OrderBomDetail;
import com.bt.modules.production.entity.Production;
import com.bt.modules.production.service.ProductionService;
import com.bt.modules.project.entity.Project;
import com.bt.modules.project.entity.Subproject;
import com.bt.modules.project.service.ProjectService;
import com.bt.modules.project.service.SubProjectService;
import com.bt.modules.supplier.entity.Supplier;
import com.bt.modules.utils.CommonStatus;
import com.bt.modules.utils.UploadUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 施工管理 -->项目进度管理
 * 
 * @author xjp
 * @version 2015-8-1
 */
@Controller
@RequestMapping(value = "${adminPath}/constdraw")
public class ConstDrawController extends BaseController {

	@Autowired
	private ProjectService projectService;// 一级项目Service
	/**
	 * 附件上传
	 */
	@Autowired
	private AttachmentService attachService;

	/**
	 * 二级项目Service
	 */
	@Autowired
	private SubProjectService subProjectService;

	/**
	 * ajax 由项目一级id取二级项目
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getSubProjectById")
	public List<Subproject> getSubProjectById(HttpServletRequest request) {
		String projectId = request.getParameter("projectId");
		return subProjectService.findByPIdAttachmentList(projectId);
	}

	/**
	 * 一级项目进度查询列表
	 * 
	 * @param schedule
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = { "list", "" })
	public String findScheduleList(Project project, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		List<Map<String, Object>> listMap = projectService.gbProByName();
		model.addAttribute("listMap", listMap);

		/*
		 * List<Map<String, Object>> listall =
		 * projectService.getProAttachmentList(); model.addAttribute("list",
		 * listall);
		 */

		project.setWorkflowstatus(CommonStatus.WORK_FLOW_END);

		// Page<Project> page = projectService.findPage(new
		// Page<Project>(request, response), project);
		Page<Project> page = null;
		Boolean isJGC = UserUtils.verificationRole("scjgry");
		Boolean isJGCFZR = UserUtils.verificationRole("jgcfzr");
		Boolean isSJJL = UserUtils.verificationRole("sjjl");
		if (isJGC || isJGCFZR) {
			project.setMemberListStr(UserUtils.getUserId());
			page = projectService.getListForProjectByJGC(new Page<Project>(
					request, response), project);
		} else if (UserUtils.getUser().isAdmin() || isSJJL) {
			page = projectService.findPage(
					new Page<Project>(request, response), project);
		} else {
			project.setAboutUser(UserUtils.getUser());
			page = projectService.getListForProject(new Page<Project>(request,
					response), project);
		}
		model.addAttribute("page", page);
		// 填写设计师
		model.addAttribute("subproject", new Subproject());
		return "modules/execution/constdrawList";
	}

	/**
	 * 上传附件
	 * 
	 * @param request
	 * @param servletRequest
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws BusinessException
	 */
	@RequestMapping(value = "upload")
	// @ResponseBody
	public String upload(MultipartHttpServletRequest request,
			HttpServletRequest servletRequest,
			RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException, BusinessException {

		String[] listsubID = servletRequest.getParameterValues("buildingTwo");
		String subprojectId = "";
		String dirName = DictUtils.getDictValue("project/constdraw",
				"upload_path_type", "project/constdraw");
		UploadUtils uploadUtils = new UploadUtils();
		Iterator<String> itr = request.getFileNames();
		while (itr.hasNext()) {
			MultipartFile multipart = request.getFile(itr.next());
			for (int i = 0; i < listsubID.length; i++) {
				subprojectId = listsubID[i];
				uploadUtils.uploadFile(multipart, servletRequest, dirName,
						subprojectId);
			}
		}
		addMessage(redirectAttributes, "文件上传成功");
		return "redirect:" + adminPath + "/constdraw/list";
	}

	/**
	 * 下载附件
	 * 
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "download")
	public void download(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		UploadUtils utils = new UploadUtils();
		utils.download(request, response);
	}

	@RequestMapping(value = "downloadzip")
	public void downloadzip(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes redirectAttributes)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String fileid = "";
		String[] oCheckd = request.getParameterValues("vCheckd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		SimpleDateFormat format = new SimpleDateFormat("HHmmssSSS");
		String hms = format.format(new Date());
		String FilePath = "D:\\";
		String tmpFileName = ymd + hms + ".zip";
		byte[] buffer = new byte[1024];
		String strZipPath = FilePath + tmpFileName;
		List<File> list = new ArrayList<File>();
		try {
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
					strZipPath));
			// 需要同时下载的多个文件
			if (oCheckd != null && oCheckd.length > 0) {
				String[] file = oCheckd[0].split(",");
				if (file != null && file.length > 0) {
					for (int i = 0; i < file.length; i++) {
						fileid = file[i];
						if (StringUtils.isNotBlank(fileid)) {
							Attachment modelAttachment = attachService
									.get(fileid);
							String fileName = modelAttachment.getName();
							String path = modelAttachment.getAttachAddress();
							File file2 = new File(path + File.separator
									+ fileName);
							list.add(file2);
						}
					}
				}
			}

			for (int i = 0; i < list.size(); i++) {
				FileInputStream fis = new FileInputStream(list.get(i));
				out.putNextEntry(new ZipEntry(list.get(i).getName()));
				// 设置压缩文件内的字符编码，不然会变成乱码
				out.setEncoding("GBK");
				int len;
				// 读入需要下载的文件的内容，打包到zip文件
				while ((len = fis.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				out.closeEntry();
				fis.close();
			}
			out.close();
			this.downFile(response, redirectAttributes, tmpFileName);
		} catch (FileNotFoundException e) {
			addMessage(redirectAttributes, "下载失败");
		}
	}

	/**
	 * 文件下载
	 * 
	 * @param response
	 * @param str
	 * @throws Exception
	 */
	private void downFile(HttpServletResponse response,
			RedirectAttributes redirectAttributes, String str) {
		String FilePath = "D:\\";
		InputStream ins = null;
		BufferedInputStream bins = null;
		BufferedOutputStream bouts = null;
		OutputStream outs = null;
		try {
			String path = FilePath + str;
			File file = new File(path);
			if (file.exists()) {
				ins = new FileInputStream(path);
				bins = new BufferedInputStream(ins);// 放到缓冲流里面
				outs = response.getOutputStream();// 获取文件输出IO流
				bouts = new BufferedOutputStream(outs);
				response.setContentType("application/x-download");// 设置response内容的类型
				response.setHeader(
						"Content-disposition",
						"attachment;filename="
								+ URLEncoder.encode(str, "UTF-8"));// 设置头部信息
				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				// 开始向网络传输文件流
				while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
					bouts.write(buffer, 0, bytesRead);
				}
				bouts.flush();// 这里一定要调用flush()方法

			} else {
				addMessage(redirectAttributes, "选择的文件不存在！");
			}
		} catch (IOException e) {
			addMessage(redirectAttributes, "下载失败");
		} finally {
			try {
				if (null != ins)
					ins.close();
				if (null != bins)
					bins.close();
				if (null != outs)
					outs.close();
				if (null != bouts)
					bouts.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
