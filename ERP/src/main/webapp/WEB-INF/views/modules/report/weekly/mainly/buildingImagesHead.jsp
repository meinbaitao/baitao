<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="nav-operate images-list">
	<ul>
		<li class="all-line"><span class="tab-name">楼栋号:</span> <label>${buildingSchedule.buildNo}</label>
		</li>
		<li class="li-images"><span class="tab-name">南立面:</span>
			<div id="southImgId"></div></li>
		<li class="li-images"><span class="tab-name">北立面:</span>
		<div id="northImgId"></div></li>



		<li class="li-images"><span class="tab-name">东立面:</span>
			<div id="eastImgId"></div></li>
		<li class="li-images"><span class="tab-name">西立面:</span>
			<div id="westImgId"></div></li>
	</ul>
</div>