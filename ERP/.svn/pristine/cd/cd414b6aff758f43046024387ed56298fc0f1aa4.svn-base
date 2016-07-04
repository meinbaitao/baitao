<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>待办任务</title>
    <meta name="decorator" content="default"/>

  <script type="text/javascript">
    $(function(){
    	$(document).on("click",".container-div .panel-div",function(){
    		var container=$(this).parents(".container-div");
    		setTimeout(function(){
    			container.toggleClass("selected-table");
    		},100)
    	});
    	$(document).on("click",".div-table tbody tr",function(){ 
			var data=$(this).find("a").attr("href");
			location.href=data; 
		})
		$(".div-table tbody").find("tr:even").addClass("interlaced");
    	var q=$(".contentTable-tr th").length,
	    	w=$(".container-div").length,
	    	e=Math.ceil(q/w),
	    	t=Math.floor(parseFloat("100")/e)+"%";
    	$(".contentTable-tr th").width(t);
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
<div class="list-content" >
  <div class="nav-operate" >
    <ul class="operationg-new" >
    </ul>
    <form:form id="searchForm" commandName="currentTask" action="${ctx}/todo/task/todoTasks" method="post" class="breadcrumb form-search">
      <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
      <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
      <ul class="search">
        <li>
          <select name="businessType" >
            <option>--选择业务类型--</option>
            <option value="1" <c:if test="${currentTask.businessType=='1'}">selected="selected"</c:if>>项目周报</option>
          </select>
        </li>
        <li>
          <form:input path="keyWord" htmlEscape="false" maxlength="200" class="input-medium" placeholder="关键字"/>
        </li>
        <li>
          <input id="searchProject" type="submit" name="查询" value="查询" class="search-btn"/>
        </li>
      </ul>
      <div class="clearfix"></div>
    </form:form>
    <div class="clear"></div>
  </div>
  <sys:message content="${message}"/>

    <c:forEach items="${page.list}" var="cat" varStatus="loop">
      <div class="container container-div">
        <div class="panel-group">
          <div class="panel panel-default">
            <div class="panel-heading panel-div">
            <h5>
            	<a class="default_active_node default_open collapsed" data-toggle="collapse" href="#collapse${loop.index}">
            		<i></i>
            		<span>${cat.cateName}（${cat.amount}）</span>
            	</a>
            	</h5>
            </div>
            <div class="container-table">
	            <div id="collapse${loop.index}" class="panel-collapse collapse">
	              <table id="contentTable" class="table table-striped table-bordered table-condensed resize table-eidt div-table">
	                <thead>
	                <tr class="contentTable-tr">
	                  <th>单据编号</th>
	                  <th>项目简称</th>
	                  <th>经办人</th>
	                  <th>发起日期</th>
	                </tr>
	                </thead>
	                <tbody>
		              <c:forEach items="${cat.tasks}" var="task" >
		                      <tr pid="0"  class="0 first-level" haschild="true" previd="" islastone="true" depth="1">
		                        <td>
		                        <c:choose>
		                          <c:when test="${not empty task.entryName  }">
		                            <a href="${ctx}/${task.redirectUrl}">${task.entryName}</a>
		                          </c:when>
		                          <c:otherwise>
		                            <a href="${ctx}/${task.redirectUrl}">${task.businessName}</a>
		                          </c:otherwise>
		                        </c:choose>
		                        </td>
		 						<td>${task.projectShortName}</td>
		                        <td>${task.initiator}</td>
		                        <td>
		                          ${task.beginDate}
		                        </td>
		                      </tr>
		              </c:forEach>
	                </tbody>
	              </table>
	            </div>
			</div>
          </div>
        </div>
      </div>
    </c:forEach>


</div>
<div class="pagination">${page}</div>
</body>
</html>
