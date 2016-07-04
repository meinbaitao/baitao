<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".edit-more-submit").click(function(){
				var data=table_eidt_data();
				console.log(data);
			})
		});
		function page(btn,n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$(btn).parents("form").submit();
        	return false;
        }
	</script>
</head>
<body>
	
	<div class="list-content" >
	      <div class="nav-operate" >
	           <form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post" class="breadcrumb form-search">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		        <ul class="operationg" >           
		           <li class="edit-more"><span class="glyphicon glyphicon-pencil"></span> 批量编辑</li>
		          <li class="edit-more-submit hide" ><span class="glyphicon glyphicon-ok"></span> 批量提交</li>
		        </ul>
		        <ul class="search">
		            <li>
		               <label>根据：</label>
		               <select class="input-small">
						  <option>标题&nbsp;&nbsp;</option>
						  <option>类型</option>
						  <option>状态</option>
						</select>
		            </li>
		            <li class="input">
			               <i class="input-show"><form:input path="title" htmlEscape="false" maxlength="200" class="input-small"/></i>
			               <i><form:select path="type" class="input-small">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select></i>
							<i><form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" 
itemLabel="label" itemValue="value" htmlEscape="false"/></i>
							
			        </li>
		            <li><button class="search-btn" id="btnSubmit"  type="submit"  onclick="return page(this);">筛选</button></li>
		            <li><button class="search-btn icon" id="advanced-search-btn"  type="button"  >高级筛选<i></i></button></li>
		            <li> <button class="search-btn" id="table-set"  type="button"  >表格显示</button></li>
		          </ul>
		          <div class="clearfix"></div>
		       </form:form>
		       <div class="clear"></div>
			   <div class="advanced-search-form">
				   <form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post" class="breadcrumb form-search">
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				        <ul class="modal-body">
				           <li>
				               <span>标题：</span>
				               <label><form:input path="title" htmlEscape="false" maxlength="200" class="input-medium"/></label>
				           </li>
				           <li>
				               <span>类型：</span>
				               <label> 
				                 <form:select path="type" class="input-medium">
								 <form:option value="" label=""/>
								 <form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								 </form:select>
							  </label>
				           </li>
				           <li>
				               <span>状态：</span>
				               <label>
									<form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</label>
				           </li>
				           
				           <li class="clear clearfix"></li>
				           <li class="fr"><button class="btn btn-primary" id="btnSubmit"  type="submit"  onclick="return page(this);">提交筛选</button></li>          
					      </ul>
					      <div class="modal-footer">
					       
					      </div>
			          </form:form>
			    </div>
			    <div class="clear"></div>
			     <ul class="table-set-container">
			        <li class="tit">选中隐藏:</li> 
			     </ul>
	      </div>
	      <sys:message content="${message}"/>
	     <form:form id="table-form" method="post"  action="" >
		  <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt">

				<thead class="center">
				   
					<tr>
					   <th class="all-check"  rowspan="2">
					         <input type="checkbox" id="all-check">
					         <label for="all-check">选择</label>
					    </th>
						
						<th colspan="2">信息</th>	
						<th rowspan="2">状态</th>
						<th rowspan="2">查阅状态</th>
						<th rowspan="2">更新时间</th>
						<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><th rowspan="2">操作</th></shiro:hasPermission></c:if>
					</tr>
					<tr>
						<th>标题</th>
						<th>类型</th>					
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${page.list}" var="oaNotify">
					<tr>
					    <td class="check"><input type="checkbox" id="${oaNotify.id}" name="chkproject">  </td>
						<td  name="" type="text"><a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}"  >
							${fns:abbr(oaNotify.title,50)}
						</a></td>
						<td type="select">
							${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
						</td>
						<td>
							${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')}
						</td>
						<td>
							<c:if test="${requestScope.oaNotify.self}">
								${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
							</c:if>
							<c:if test="${!requestScope.oaNotify.self}">
								${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<c:if test="${!requestScope.oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><td>
		    				<a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}">修改</a>
							<a href="${ctx}/oa/oaNotify/delete?id=${oaNotify.id}" onclick="return confirmx('确认要删除该通知吗？', this.href)">删除</a>
						</td></shiro:hasPermission></c:if>
					</tr>
				</c:forEach>
				  
				</tbody>
				
			</table>
	      </form:form>
	</div>

	
	<div class="pagination">${page}</div>
</body>
</html>