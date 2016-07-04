<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>选择下料单类型</title>
<meta name="decorator" content="default" />
</head>
<body>
	<div class="list-content">
		<div class="nav-operate">
			<ul class="operationg-new">
				<li>
					<span class="tab-name">请选择下料单类型：</span>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=1" method="post" >
						<input class="btn btn-primary" type="submit" value="钢辅材下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=2" method="post" >
						<input class="btn btn-primary" type="submit" value="平板下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=3" method="post" >
						<input class="btn btn-primary" type="submit" value="门窗套线下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=4" method="post" >
						<input class="btn btn-primary" type="submit" value="腰线下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=5" method="post" >
						<input class="btn btn-primary" type="submit" value="造型板下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=6" method="post" >
						<input class="btn btn-primary" type="submit" value="圆柱下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=7" method="post" >
						<input class="btn btn-primary" type="submit" value="雕花下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=8" method="post" >
						<input class="btn btn-primary" type="submit" value="弧形板下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=9" method="post" >
						<input class="btn btn-primary" type="submit" value="屋檐板下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=10" method="post" >
						<input class="btn btn-primary" type="submit" value="窗侧板下料单">
					</form>
				</li>
				<li>
					<form id="returnForm" action="${ctx}/orbom/orderBomBase/list?orderType=11" method="post" >
						<input class="btn btn-primary" type="submit" value="平板下料单(工字缝)">
					</form>
				</li>
			</ul>
		</div>	
	</div>
</body>
</html>