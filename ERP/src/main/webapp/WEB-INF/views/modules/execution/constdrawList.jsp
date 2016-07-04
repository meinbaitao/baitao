<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>上传施工图</title>
	<link href="${ctxStatic}/treeTable/themes/vsStyle/treeTable.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
	<%-- <script src="${ctxStatic}/modules/construction/scripts/schedule.js" type="text/javascript"></script> --%>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			form_validate("addScheduleForm");
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<script>
  $(function(){
	//根据项目拉取二级项目项目数据
		$("#projectNameOne").live("change",function(){
			var proID = $(this).val();
			var d={proID:proID};
			var url="/a/project/getSubByProID";
			startUp.postData(url,d,function(data){
				var html="<select name='houseTypeTwo' id=\"houseTypeTwo\" class='input-medium requireds'>";
				html+="<option value1='' value=''>请选择</option>";
				for(var i=0;i<data.length;i++){
					html+="<option value1='"+data[i].subID+"' value='"+data[i].subHouseType+"'>"+data[i].subHouseType+"</option>";
				}
				html+="</select>";
				$("#houseTypeOne").html(html);
				$("#houseTypeTwo").select2();
			});
		});
		//根据项目拉取二级项目项目数据
		$("#houseTypeOne").live("change",function(){
			var c = $("#houseTypeTwo").val();
			$("#subprojectId").val($("#houseTypeTwo").find("option[value='"+c+"']").attr("value1"));
			var proID = $("#projectNameOne").val();
			var houseType = $("#houseTypeTwo").val();
			var d={proID:proID,houseType:houseType};
			var url="/a/project/getSubByHouseType";
			startUp.postData(url,d,function(data){
				var html="<select name='buildingTwo' id='buildingTwo' multiple='mutiple' class='input-medium'>";
//				html+="<option value=''>请选择</option>";
				for(var i=0;i<data.length;i++){
					html+="<option value='"+data[i].subID+"' selected='selected'>"+data[i].subBuildingDisplayName+"</option>";
				}
				html+="</select>";
//				html+="";
				$("#buildingOne").html(html);
				$("#buildingTwo").select2();
			});
		});
	/* 	$("#buildingTwo").live("change",function(){
			var c = $("#buildingTwo").val();
			window.alertx(c);
		}); */
		//隐藏/显示 导入操作
		$("#btnImport").click(function(){
			$("#importBox").slideToggle();
		});
		
		//下料单导入
		$("#btnImportSubmit").click(function(){
			var subprojectId = $("#subprojectId").val();
			var houseType = $("#houseTypeTwo").val();
			var multipartFile = $("#multipartFile").val();
			var building = $("#buildingTwo").val();
			var processChartType = $("#processChartType").val();
			if(houseType == '' || subprojectId == ''){
				window.alertx("请先选择项目和户型！");
				return;
			}
			<%--if(building =='' || building == null){
				window.alertx("请先选择栋号！");
				return;
			}--%>
			if(multipartFile ==''){
				window.alertx("请先选择文件！");
				return;
			}
			if(processChartType =='' || processChartType == null){
				window.alertx("请先选择文件类型 ！");
				return;
			}
			$('#importForm').submit();				
		});
		/**
		 * 点击查询二级项目信息列表
		 */
		$("#querySubProjectList").live("click",function(){
			var projectId=this.getAttribute("thisTagertId");
			var isOpen = $("#project"+projectId).siblings("tr[pid=project"+projectId+"]");
			if(isOpen.length>0){
				//判断有下级数据则删除数据并不请求后台
				isOpen.remove();
				return;
			}
			if(!projectId){
				projectId=$("#querySubProjectList")[0].getAttribute("thisTagertId");
			}
			var url ="/a/constdraw/getSubProjectById?projectId="+projectId;
			startUp.getData(url,function(data){
				 var projectlist =$("#project"+projectId);
				 $("#project"+projectId).siblings("[pid=project"+projectId+"]").remove();
				 $.each(data, function(idx,item){
//					 debugger;
					 var showStatus=item.showStatus;
					 var showdesigner=item.showdesigner;
					 var subattachmentId=item.subattachmentId;
					 var subattachmentName=item.subattachmentName;
					 var processChartType = item.processChartType;
					 var subattachmenCreateDate = item.subattachmenCreateDate;
					 if(!showStatus){
						 showStatus = "";
					 }
					 if(!showdesigner){
						 showdesigner = "";			 
					 }
					 
					 if(!subattachmentId){
						 subattachmentId = "";						
					 }
					 if(!subattachmentName){
						 subattachmentName = "";
					 }
					 if(!processChartType){
						 processChartType = "";
					 }
					 if(!subattachmenCreateDate){
						 subattachmenCreateDate = "";
					 }
					var vhref="${ctx}/constdraw/download?id="+subattachmentId;
					 var vfile="";
					 
					 if(subattachmentId != ""){
						 vfile="<div id='showAttach'><a name='fujian' id='"+subattachmentId+"' href='"+vhref+"'> "+subattachmentName+"</a>"+						 
			             //"<span id='deleteAttach' deleteId='"+subattachmentId+"' class='glyphicon glyphicon-remove-circle'></span></div>";
						 "<span id='deleteAttach' deleteId='"+subattachmentId+"' class='glyphicon'></span></div>";
					 }
					 
					 var tr ="<tr pid='project"+projectId+"' id='"+item.id+"' class='active' haschild='true' previd='' islastone='true' depth='2'>"+
					 		 "<td class='td_fr'>└<input type='checkbox' name='checkdbox' id='"+item.id+"' value='"+subattachmentId+"'></td>"+
					 		 //"<td></td>"+	
					 		 "<td></td><td></td>"+					 		 
		                     "<td>"+item.houseType+"</td>"+
		                    // "<td>"+item.buildingDisplayName+"</td>"+
				       		 "<td>"+processChartType+"</td>"+
				             "<td>"+vfile+"</td>"+
				             "<td>"+subattachmenCreateDate+"</td>"+	
				             "</tr>";
					 projectlist.after(tr);
				 });
			});
		});
		
		/**
		// 删除附件
		 
		$("#deleteAttach").live("click", function(){
			var deleteId = this.getAttribute("deleteId");
			var url = "/a/attachment/attachment/deleteAttach?deleteId="+deleteId;
			startUp.getData(url,function(data){
				$("a#"+deleteId).parent().remove();
			});
		});*/
		
		$("#btn").click(function(){
			var formdata = new FormData();
			var file = document.getElementById("files");
			$.each(file.files,function(index,value){
				formdata.append("pic-"+index,value);
			});
			
			$.ajax({
				type:"POST",
				url:"uploadFile",
				data:formdata,
				contentType:false,
				processData:false,
				success:function(result){
					$.each(result,function(index,value){
						$("#show").append("<h3>"+value+"</h3>");
					});
				}
			});
		});

		/*  $("#btnDownload").click(function (){
  			var itemId = "";
  			var vCheckd =[]; 
  			var c = $('input[name="checkdbox"]:checked');
  			 for(var i=0;i<c.length;i++){
  				$(c[i]).parent().siblings().find("a[name='fujian']").trigger("click");//.attr("href");
  			} 
  			$('input[name="checkdbox"]:checked').each(function(){ 
  				var h = $(this).parent().siblings().find("a[name='fujian']").attr("href");
  				window.location=h;
  				alert(h);
  				itemId = $(this).attr("value");
  				vCheckd.push($(this).attr("value")); 
  			});
  			if(vCheckd.length==0){
  				window.alertx("请选择一个项目！"); 
  				return;
  			}
  			var inputForm = $('#downloadForm');
  			inputForm.attr('action',startUp.getRootPath()+"/a/constdraw/download?vCheckd="+vCheckd);
  			inputForm.submit();
  		});  */
		
    });	
  	
 	
	
  	function download(){
  		var i = 0;
  		var vCheckd =[];
  		var inputForm = $('#downloadForm');
  		var j = 0;
  		$('input[name="checkdbox"]:checked').each(function(){ 
  				var h = $(this).parent().siblings().find("a[name='fujian']").attr("href");
  				itemId = $(this).attr("value");
  				vCheckd.push($(this).attr("value")); 
  				j++;
  		});
  		if(vCheckd.length==0){
				window.alertx("请选择一个项目！"); 
				return;
		}
  		fileId = vCheckd[i];
  		i++;
  		inputForm.attr('action',startUp.getRootPath()+"/a/constdraw/downloadzip?vCheckd="+vCheckd);
  		inputForm.submit();
  		//alert(j);
  		/* if(i<j&&i!=0){
  			var deferred = $.Deferred()
  			deferred.done(download)
  			setTimeout(function() {
  			    deferred.resolve()
  			}, 10000)
  		}  */
	}
</script>
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
		<div id="importBox" class="hide">
			<form id="importForm" action="${ctx}/constdraw/upload" method="post" enctype="multipart/form-data"
				style="padding-left:20px;text-align:center;">
			<ul class="modal-body">
				<li>
					<span class="tab-name">项目名称：</span>
					<label>
						 <select id="projectNameOne" class="input-medium required">
							<option value=""/>请选择</option>
							<c:forEach items="${page.list}" var="obj">				
									<option  value="${obj.id}">${obj.name}</option>
							</c:forEach>				
						</select>		
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">户型：</span>
					<label>
					   <span id="houseTypeOne">
						 <select class="input-medium required">
							<option value=""/>请选择</option>
						 </select>
					   </span>
					   <span class="help-inline"><font color="red">*</font></span>
					</label>
				</li>
				<li hidden="">
					<span class="tab-name">栋号：</span>
					<label id="buildingOne">
						 <select class="input-medium" multiple="mutiple">
							<option value=""/>请选择</option>
						 <select>
					</label>
				</li>
				<li>
					<span class="tab-name">文件类型：</span>
					<label id="fileType">
						 <select id="processChartType" name="processChartType" class="input-medium required">
							<option value=""/>请选择</option>
							<c:forEach items="${fns:getDictList('processChartType')}" var="obj" varStatus="idxStatus">
						 	<option value="${fns:escapeHtml(obj.value)}">${fns:escapeHtml(obj.label)}</option>
				 			</c:forEach>
						 <select>
						 
						 <span class="help-inline"><font color="red">*</font></span>
					</label>
				</li>
				<li>
					<span class="tab-name">文件：</span>
					<label>
						<span>
							<input id="multipartFile" name="multipartFile" type="file"  multiple="multiple" style="width:330px"/><br/>
						</span>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
					<input id="btnImportSubmit" class="btn btn-primary" type="button" value="上  传"/>
					<input name="subprojectId" id="subprojectId" type="hidden"/>
				</li>
			</ul>
			</form>
		</div>
		</div>	
		<div class="nav-operate">
			<ul class="operationg-new">
				<%-- <li>
					<a href="${ctxTemplate}/钢辅材下料单.xls" id="costId" class="btn btn-primary">
						下载模板
					</a>
				</li> --%>
				<li>
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('sjgl')}">
					<input id="btnImport" class="btn btn-primary" type="button" value="上传图纸">
					</shiro:hasAnyRoles>
				</li>
				 <li>
					<form id="downloadForm" action="${ctx}/constdraw/downloadzip" method="post" onclick="download()" enctype="multipart/form-data">
						<input id="btnDownload" class="btn btn-primary" type="button" value="打包下载">
					</form>
				</li>
				<%-- <li>
					<form id="deleteForm" action="${ctx}/orbom/orderBomBase/detele" method="post">
						<input id="btnDelete" class="btn btn-primary" type="button" value="删除">
						<input id="orderType" name="orderType"type="hidden" value="${orderType}" />
					</form>
				</li> --%>
			</ul>
			  <form:form id="searchForm" modelAttribute="project" action="${ctx}/constdraw/list" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="search">
		            <li>
		               <form:input path="name" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
		            </li>
		            <li>
		            	<input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
		            </li>
		        </ul>
		       <div class="clearfix"></div>
		     </form:form>
		     <div class="clear"></div>
		</div>
		<sys:messagefororder content="${message}"/>	
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
				<!-- 	<th class="all-check">
			         <input type="checkbox" id="all-check" >
			         <label for="all-check">全选</label>
		   		    </th> -->
					<th style="width:25%">一级项目信息</th>
					<th style="width:8%">业务板块</th>
					<th style="width:10%">苑区</th>
					<th style="width:10%">户型</th>
					<!--<th style="width:10%">楼栋号</th>-->
					<th style="width:10%">文件类型</th>
					<th style="width:22%">文件名称</th>
					<th style="width:15%">上传日期</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="project" varStatus="1">
					<tr  pid="0" id="project${project.id}" class="0 first-level hide-childen" haschild="true" previd="" islastone="true" depth="1">
						<!-- <td class="check">
							<input type="checkbox" id="${project.id}" name="chkproject">
						</td> -->				
						<td>
						 <div class="tit">
					        <i thisTagertId="${project.id}" id="querySubProjectList" class="glyphicon glyphicon-triangle-right"></i> 
					        <label class="operation-project" showWidth="800px" thisTagert="appoint-saider" id="projectDetail" thisTagertId="${project.id}">
					        	<a href="${ctx}/project/view?id=${project.id}">
								${project.name}
							</a>
					        </label>
					     </div>							
						</td>
						<td>${project.businessLine}</td>
						<td>${project.location}</td>
						<td></td>
						<td></td>
						<!--<td></td>-->
						<td></td>
						<td></td>
					 </tr>
			 	 </c:forEach>	
			</tbody>
		</table>	
	</div>
	<div class="pagination">${page}</div>
	<!-- <form id="form" >
		<div>
			<input type="file" id="files" multiple="multiple"><br />
			<input type="button" id="btn" value="upload">
		</div><br/>
		<div id="show"></div>		
		<div id="show2"></div>
	</form> -->
</body>
</html>