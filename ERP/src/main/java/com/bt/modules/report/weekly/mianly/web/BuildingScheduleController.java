/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.bt.modules.report.weekly.mianly.web;


import com.bt.common.exceptions.BusinessException;
import com.bt.modules.attachment.entity.Attachment;
import com.bt.modules.attachment.service.AttachmentService;
import com.bt.modules.report.common.FilesUploadForm;
import com.bt.modules.report.weekly.mianly.entity.BuildingSchedule;
import com.bt.modules.report.weekly.mianly.entity.ProjWeeklyReport;
import com.bt.modules.report.weekly.mianly.service.BuildingScheduleService;
import com.bt.modules.report.weekly.mianly.service.ProjWeeklyReportService;
import com.bt.modules.utils.UploadUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 周报-在建进度Controller
 * @author jinyuanf
 * @version 2015-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/report/weekly/buildingSchedule")
@Configuration
@PropertySource("classpath:jeesite.properties")
public class BuildingScheduleController extends BaseController {

	@Autowired
	private BuildingScheduleService buildingScheduleService;

	@Autowired
	private ProjWeeklyReportService weeklyReportService;
	
	@Autowired
	private AttachmentService attachService;
	
	@Autowired
	@Qualifier("APP_PROP")
	private Properties applicationProperties;


	@RequestMapping(value = "getLastWeekOneByProjAndBuildNo/{projectId}/{buildNo}")
	public @ResponseBody BuildingSchedule getLastWeekOneByProjAndBuildNo(@PathVariable String projectId,@PathVariable String buildNo){
		return buildingScheduleService.getLastWeekOneByProjAndBuildNo(projectId, buildNo);
	}

	@RequestMapping(value="initUploadPage/{buildingScheduleId}")
	public String initUploadPage(Model model,@PathVariable String buildingScheduleId){
		BuildingSchedule buildingSchedule = buildingScheduleService.get(buildingScheduleId);
		
		model.addAttribute("buildingSchedule",buildingSchedule);
		return "modules/report/weekly/mainly/buildingScheduleImages";
	}

	@RequestMapping(value="buildingImagesView/{buildingScheduleId}")
	public String buildingImagesView(Model model,@PathVariable String buildingScheduleId){
		BuildingSchedule buildingSchedule = buildingScheduleService.get(buildingScheduleId);
		model.addAttribute("buildingSchedule",buildingSchedule);
		return "modules/report/weekly/mainly/buildingScheduleImagesView";
	}
	//uploadBuildingImages
	@RequestMapping(value="upload", method = RequestMethod.POST)
	public String uploadBuildingImages(@ModelAttribute("uploadForm") FilesUploadForm uploadForm,
									   Model model, HttpServletRequest request,HttpServletResponse response) throws IOException, BusinessException {
		List<MultipartFile> files = uploadForm.getFiles();
		MultipartFile southFile = files.get(0);
		MultipartFile northFile = files.get(1);
		MultipartFile eastFile = files.get(2);
		MultipartFile westFile = files.get(3);

//		String rootDir = request.getSession().getServletContext().getRealPath("/") + "/";
//		BuildingSchedule buildingScheduleQuery = buildingScheduleService.get(uploadForm.getBuildingScheduleId());
//		ProjWeeklyReport report = weeklyReportService.get(buildingScheduleQuery.getReportId());

		if(southFile.getSize()>0){
			String dirName = DictUtils.getDictValue("projectWeekly/file","upload_path_type","projectWeekly/file");
			UploadUtils utils = new UploadUtils();
			attachService.deleteByType(uploadForm.getBuildingScheduleId()+"south");
			utils.uploadFile(southFile, request,dirName,uploadForm.getBuildingScheduleId()+"south");
		}

		if(northFile.getSize()>0){
			String dirName = DictUtils.getDictValue("projectWeekly/file","upload_path_type","projectWeekly/file");
			UploadUtils utils = new UploadUtils();
			attachService.deleteByType(uploadForm.getBuildingScheduleId()+"north");
			utils.uploadFile(northFile, request,dirName,uploadForm.getBuildingScheduleId()+"north");
		}

		if(eastFile.getSize()>0){
			String dirName = DictUtils.getDictValue("projectWeekly/file","upload_path_type","projectWeekly/file");
			UploadUtils utils = new UploadUtils();
			attachService.deleteByType(uploadForm.getBuildingScheduleId()+"east");
			utils.uploadFile(eastFile, request,dirName,uploadForm.getBuildingScheduleId()+"east");
		}

		if(westFile.getSize()>0){
			String dirName = DictUtils.getDictValue("projectWeekly/file","upload_path_type","projectWeekly/file");
			UploadUtils utils = new UploadUtils();
			attachService.deleteByType(uploadForm.getBuildingScheduleId()+"west");
			utils.uploadFile(westFile, request,dirName,uploadForm.getBuildingScheduleId()+"west");
		}

		BuildingSchedule buildingSchedule = buildingScheduleService.get(uploadForm.getBuildingScheduleId());
		model.addAttribute("buildingSchedule", buildingSchedule);
		//return "modules/report/weekly/mainly/buildingScheduleImages";
		return "redirect:" + adminPath + "/report/weekly/buildingSchedule/initUploadPage/"+uploadForm.getBuildingScheduleId();
	}

	@RequestMapping(value="download")
	public void download(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
		UploadUtils uploadUtils = new UploadUtils();
		uploadUtils.download(request, response);
	}
	
	@RequestMapping(value="attchlist/{buildingScheduleId}")
	@ResponseBody
	public List<Attachment> attchList(@PathVariable String buildingScheduleId){
		Attachment attachment = new Attachment();
		attachment.setType(buildingScheduleId);
		List<Attachment> attachList = attachService.findLikeAttachType(attachment);
		return  attachList;
	}
//	private String buildFilePath(MultipartFile file, String projectId) throws UnknownHostException, UnsupportedEncodingException {
//		String uploadDir = applicationProperties.getProperty("wanfang.upload.building.schedule.images.dir");
//		String fileName = ((CommonsMultipartFile) file).getFileItem().getName();
//		fileName = fileName.replaceAll("#", "_");
//		StringBuilder filePath = new StringBuilder();
//
//		filePath.append(uploadDir);
//		if(!uploadDir.endsWith("/")){
//			filePath.append("/");
//		}
//		filePath.append(projectId).append("/");
//		FileUtils.createDirectory(FileUtils.path(filePath.toString()));
//		String hostName = InetAddress.getLocalHost().getHostName();
//		filePath.append(hostName).append("_");
//		filePath.append(System.currentTimeMillis())
//				.append("_")
//				.append(fileName);
//		return FileUtils.path(filePath.toString());
//	}

}