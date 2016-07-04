<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>劳务评审管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/laborVerify.js?tsf=${jsVersion}"></script>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js?tsf=${jsVersion}"></script>
	<script>
		
		$(function(){
			form_validate("inputForm");
			/**
			 * 点击添加合同
			 */
			$("#addContract").on("click",function(){
				 window.location.href=startUp.getRootPath()+"/a/contract/laborcontract/formVerify";
			});
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<div class="list-content">
		
		<div class="nav-operate">
			<ul class="operationg-new" >
				<li>
<!-- 					<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
					<input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
					<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwpsgl')}">
						<input id="addContract" class="btn btn-primary" type="button" value="添加合同">
						<!-- <input id="deleteContract" class="btn btn-primary" type="button" value="删除合同"> -->
					</shiro:hasAnyRoles>
				</li>
		    </ul>
			<ul class="act">
				<li><input type="radio" name="actRadio" value="1" ${(param.actRadio eq '1' or empty param.actRadio)?'checked="checked"':'' }/>待提交</li>
				<li><input type="radio" name="actRadio" value="2" ${param.actRadio eq '2'?'checked="checked"':'' }/>待审批</li>
				<li><input type="radio" name="actRadio" value="3" ${param.actRadio eq '3'?'checked="checked"':'' }/>已完成</li>
				<shiro:hasPermission name="laborcontractAllList">
					<li><input type="radio" name="actRadio" value="4" ${param.actRadio eq '4'?'checked="checked"':'' }/>全部</li>
				</shiro:hasPermission>
			</ul>
			<c:choose>
				<c:when test="${param.actRadio eq '1' or empty param.actRadio }">
					<c:set var="url" value="${ctx}/contract/laborcontract/findMyLaborcontract"/>
				</c:when>
				<c:when test="${param.actRadio eq '2' }">
					<c:set var="url" value="${ctx}/contract/laborcontract/findUnAuditLaborcontract"/>
				</c:when>
				<c:when test="${param.actRadio eq '3' }">
					<c:set var="url" value="${ctx}/contract/laborcontract/findAuditDoneLaborcontract"/>
				</c:when>
				<c:when test="${param.actRadio eq '4' }">
					<c:set var="url" value="${ctx}/contract/laborcontract/allList"/>
				</c:when>
				<c:otherwise>
					<c:set var="url" value="${ctx}/contract/laborcontract/listVerify"/>
				</c:otherwise>
			</c:choose>
			<form:form id="searchForm" modelAttribute="laborcontract" action="${url}" method="post"
				class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
					<input id="actRadio" name="actRadio" type="hidden" value="${param.actRadio}" />
				<ul class="search">
					<li>
						<form:input path="keyWord" htmlEscape="false" class="input-medium" placeholder="关键字"/></li>
					<li>
						<!-- <button class="search-btn" id="btnSubmit" type="submit">查询</button> -->
						<input class="search-btn" id="btnSubmit" name="actRadio" type="button" value="查询" />
					</li>
				</ul>
			</form:form>
		</div>	
		
	
	<%-- <sys:message content="${message}"/> --%>
	<div id="scroll-table">
		<div id="scroll-head">
		</div>
		<div id="tbody-scroll" class="tbody-scroll" >
			<table id="contentTable" class="table table-striped table-bordered table-condensed resize">
				<thead>
					<!-- <tr>
						<th width="20%">合同编号</th>
						<th width="20%">工程名称</th>
						<th width="5%">班组类别</th>
						<th width="5%">乙方施工班组</th>
						<th width="5%">工程开工日期</th>
						<th width="5%">工程总工期</th>
						<th width="7%">施工日期</th>
						<th width="5%">合同总价</th>
						<th width="5%">审批状态</th>
						<th width="5%">合同状态</th>
						<th width="5%">备注信息</th>
						<th width="13%">操作</th>
					</tr> -->
					<tr>
						<th >合同编号</th>
						<th >项目简称</th>
						<th width="5%">承接范围</th>
						<th width="5%">乙方施工班组</th>
						<th width="5%">户型</th>
						<th width="5%">楼栋</th>
						<th width="5%">合同总价</th>
						<th width="5%">工程总工期</th>
						<th width="5%">工程开工日期</th>
						<th width="5%">工程竣工日期</th>
						<th width="5%">审批状态</th>
						<th width="5%">合同状态</th>
						<th width="5%">备注信息</th>
						<th width="13%">操作</th>
					</tr>
				</thead>
				<tbody>
				<%-- <c:forEach items="${page.list}" var="laborcontract">
					<tr>
						<td>
							<a href="${ctx}/contract/laborcontract/formVerify?id=${laborcontract.id}"
							 >${laborcontract.contractNo}</a>
						</td>
						<td>
							${laborcontract.proName}
						</td>
						<td>
							${fns:getDictLabel(laborcontract.exetype, 'executionType', '')}
						</td>
						<td>
							${laborcontract.executionName}
						</td>
						<td>
							${laborcontract.startdate}
						</td>
						<td>
							${laborcontract.duration}
						</td>
						<td>
							${laborcontract.signDate}
						</td>
						<td>
							${laborcontract.contractPrice}
						</td>
						<td>
							<c:choose>
								<c:when test="${laborcontract.workflowstatus eq '1'}">
									待审核
								</c:when>
								<c:when test="${laborcontract.workflowstatus eq '4'}">
									已完成
								</c:when>
								<c:otherwise>待提交</c:otherwise>
							</c:choose>
						</td>
						<td>
							${laborcontract.conStatus}
						</td>
						<td>
							${laborcontract.remarks}
						</td>
						<td class="table-operate">
							<a href="${ctx}/contract/laborcontract/formVerify?id=${laborcontract.id}">修改</a>
							<a href="${ctx}/contract/laborcontract/deleteVerify?id=${laborcontract.id}" onclick="return confirmx('确认要删除该劳务评审吗？', this.href)">删除</a>
							<a href="${ctx}/contract/contractPrint/laborcontract?id=${laborcontract.id}">打印预览</a>
						</td>
					</tr>
				</c:forEach> --%>
				<c:forEach items="${page.list}" var="laborcontract">
					<tr>
						<td>
							<a href="${ctx}/contract/laborcontract/formVerify?id=${laborcontract.id}">${laborcontract.contractNo}</a>
						</td>
						<td>
							${laborcontract.project.code}
						</td>
						<td>
							${fns:getDictLabel(laborcontract.exeScope, 'executionArea', '')}
						</td>
						<td>
							${laborcontract.ctype}
						</td>
						<td>
							${laborcontract.house}
						</td>
						<td>
							${laborcontract.buildingsDisName}
						</td>
						<td>
							${laborcontract.contractPrice}
						</td>
						<td>
							${laborcontract.duration}
						</td>
						<td>
							${laborcontract.startdate}
						</td>
						<td>
							${laborcontract.enddate}
						</td>
						<td>
							<c:choose>
								<c:when test="${laborcontract.workflowstatus eq '1'}">
									待审核
								</c:when>
								<c:when test="${laborcontract.workflowstatus eq '4'}">
									已完成
								</c:when>
								<c:otherwise>待提交</c:otherwise>
							</c:choose>
						</td>
						<td>
							${laborcontract.extraData.conStatusLab}
						</td>
						<td>
							${laborcontract.remarks}
						</td>
						<td class="table-operate">
							<shiro:hasAnyRoles name="${fns:getWhitelistsList('lwpsgl')}">
								<a href="${ctx}/contract/laborcontract/formVerify?id=${laborcontract.id}">修改</a>
								<a href="${ctx}/contract/laborcontract/deleteVerify?id=${laborcontract.id}" onclick="return confirmx('确认要删除该劳务合同吗？', this.href)">删除</a>
							</shiro:hasAnyRoles>
							<a href="${ctx}/contract/contractPrint/laborcontract?id=${laborcontract.id}">打印预览</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</div>
	

	
	
	<div class="pagination">${page}</div>
</body>
</html>