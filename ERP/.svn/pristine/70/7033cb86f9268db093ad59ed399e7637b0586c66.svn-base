<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>总控报表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/activitiHeader.jsp"%>
<%-- 	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/accCarriageContract.js?tsf=${jsVersion}"></script> --%>
<%-- 	<script type="text/javascript" src="${ctxStatic}/modules/contract/scripts/common_contract.js?tsf=${jsVersion}"></script> --%>
<%-- 	<script type="text/javascript" src="${ctxStatic}/ajaxfileupload/ajaxfileupload.js?tsf=${jsVersion}" ></script> --%>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js?tsf=${jsVersion}"></script>
	<script>
// 		var ctxPath="${ctx}";
// 		$(function(){
// 			form_validate("inputForm");
// 		});
// 		function page(n,s){
// 			$("#pageNo").val(n);
// 			$("#pageSize").val(s);
// 			$("#searchForm").submit();
// 			return false;
// 		}
	</script>
</head>
<body>
	
	
	<div class="list-content">
       <div class="nav-operate">
	       	<ul class="operationg-new" >
				<li>
					<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
				</li>							
		    </ul>
		</div>
		<div class="form-content">
		 <sys:message content="${message}"/>
	<form:form id="inputForm" modelAttribute="viewContractProgress"  class="form-horizontal">
			<input type="hidden" id="pid" name="pid" value="${viewContractProgress.pid }"/>			
	  <div class="nav-operate" >
		<ul class="operationg-new  operationg-attach" >
			<li>项目一级信息</li>				
		</ul>
    </div>   
	 <div class="table_scroll">	
    	<table id="contentTable" class="table table-striped table-bordered table-condensed table-eidt">
		<thead>
			   <tr>    
			           
			           <th>区域</th>
			           <th>省份</th>
			           <th>市区</th>
			           <th>镇</th>   
					   <th>项目名称</th>
					   <th>项目简称</th>
					   <th>项目地址</th>
					   <th>苑区（期数）</th>
					   <th>业务板块</th>
					   <th>状态</th>
					   <th>计划开工时间</th>
					   <th>计划完工时间</th>
					   <th>区域经理</th>
					   <th>项目负责人</th>
					   <th>施工员</th>
					   <th>材料员</th>
					   <th>是否需要提交周报</th>
					   <th>项目公司名称</th>
					   <th>甲方项目总经理</th>
					   <th>联系方式</th>
					   <th>甲方项目区域总经理</th>
					   <th>联系方式</th>
					   <th>甲方现场跟进人</th>
					   <th>联系方式</th>
					   <th>是否需要挂靠</th>
					   <th>是否需报建</th>
					  <c:if test="${Flag ne '0' and Flag ne '1'}">
                       <th>是否已报建</th>
                       <th>设计项目负责人</th> 
                       <th>设计主管</th>
                      </c:if>	   
                        <th>成本项目负责人</th>
					   <th>联系方式</th>
					   <th>成本组长</th>
					   <th>成本主管</th>
					     <c:if test="${Flag ne '0' and Flag ne '4' }">
					   <th>质保金比例</th>					  
					   <th>合同编号</th>
					   <th>合同名称</th>
					   <th>合同造价</th>
					    </c:if>
					    <c:if test="${Flag ne '0'}">
					   <th>石材总面积</th>
					     </c:if>
					      <c:if test="${Flag ne '0' and Flag ne '4' }">
					   <th>估算造价</th>
					   <th>预算面积</th>
					   <th>预付款比例</th>					  
					   <th>签约对方</th>					    
					   <th>施工&frasl;外包单位</th>					  
					   <th>挂靠单位</th>					 
					   <th>挂靠费比例</th>					  
					   <th>签约日期</th>
					   </c:if>
					   <c:if test="${Flag ne '0'}">					  
					   <th>竣工验收日期</th>	
					   </c:if>
					    <c:if test="${Flag ne '0' and Flag ne '4' }">				    
					   <th>收款条款（比例）</th>					 
					   <th>结算面积</th>
					   <th>结算金额</th>					    
					    <th>结算日期</th>
					    </c:if>
					    <c:if test="${Flag eq '1' or Flag eq '3' }">
                       <th>印花税申购</th>                   
                        <th>外经证办理</th>                        
                       <th>外经证到期日</th>                       
                       <th>当地综合税率</th>
                        </c:if>				
					   <th>备注</th>
					   <th>状态</th>
				</tr>					
		</thead>
		<tbody id="viewContractProgress" copy="false">
		<input type="hidden" name="pid" id="pid" value=""/>
<%-- 			<c:forEach items="${accCarriageContractBase.detailPriceList}" var="detail" varStatus="idx"> --%>
				<tr list="viewContractProgress">
					<td>${viewContractProgress.pareaName}</td>
					<td>${viewContractProgress.pprovince}</td>
					<td>${viewContractProgress.pcity}</td>
					<td>${viewContractProgress.ptown}</td>
					<td>${viewContractProgress.pname}</td>
					<td>${viewContractProgress.pcode}</td>
					<td>${viewContractProgress.paddress}</td>
					<td>${viewContractProgress.plocation}</td>
					<td>${viewContractProgress.pbusinessline}</td>
					<td>${viewContractProgress.pstatus}</td>
					<td>${viewContractProgress.starttime}</td>
					<td>${viewContractProgress.endtime}</td>
					<td>${viewContractProgress.prmanagername}</td>
					<td>${viewContractProgress.pcmanagername}</td>
					<td>${viewContractProgress.psmaterialname}</td>
					<td>${viewContractProgress.pcconstructname}</td>
					<td>${viewContractProgress.prflag}</td>
					<td>${viewContractProgress.pcompy}</td>
					<td>${viewContractProgress.pjmanagername}</td>
					<td>${viewContractProgress.generalManagerMobile}</td>
					<td>${viewContractProgress.pjamanagername}</td>
					<td>${viewContractProgress.regionalManagerMobile}</td>
					<td>${viewContractProgress.pjfmanagername}</td>
					<td>${viewContractProgress.localManagerMobile}</td>
					<td>${viewContractProgress.preport}</td>
					<td>${viewContractProgress.pisreport}</td>
					 <c:if test="${Flag ne '0' and Flag ne '1'}">
                      <td>${viewContractProgress.pisattachunit}</td>                   
                      <td>${viewContractProgress.pdesignmanager}</td>                   
                      <td>${viewContractProgress.pdesignerbname}</td>
                      </c:if>	
					 <c:if test="${Flag ne '0' and Flag ne '4' }">
					<td>${viewContractProgress.pcostmanagername}</td>
					<td>${viewContractProgress.pcostmanagermobile}</td>
					<td>${viewContractProgress.pcostgrouper}</td>
					<td>${viewContractProgress.pcostleader}</td>
					 
					<td>${viewContractProgress.pzbpercent}</td>
					<td>${viewContractProgress.contractid}</td>
					<td>${viewContractProgress.contractname}</td>
					<td>${viewContractProgress.contractcost}</td>
					 </c:if>
					   <c:if test="${Flag ne '0'}">
					<td>${viewContractProgress.contractastone}</td>
					 </c:if>
					<td>${viewContractProgress.contractecost}</td>
					<td>${viewContractProgress.contractearea}</td>
					<td>${viewContractProgress.contractprepayratio}</td>
					<td>${viewContractProgress.signedcounterparty}</td>
					 <c:if test="${Flag ne '0' and Flag ne '4' }">
					<td>${viewContractProgress.operationunit}</td>				
					<td>${viewContractProgress.contractattachunit}</td>				
					<td>${viewContractProgress.attachfeeratio}</td>				
					<td>${viewContractProgress.signeddate}</td>
					</c:if>
					<c:if test="${Flag ne '0'}">						
					<td>${viewContractProgress.completiondate}</td>
					</c:if>
					 <c:if test="${Flag ne '0' and Flag ne '4' }">					
					<td>${viewContractProgress.paycollectionratio}</td>					
					<td>${viewContractProgress.contractsettlearea}</td>				
					<td>${viewContractProgress.contractsettleamount}</td>					
					<td>${viewContractProgress.contractsettledate}</td>
					</c:if>
					   <c:if test="${Flag eq '1' or Flag eq '3' }">
                       <td>${viewContractProgress.stamptaxapplied}</td>                     
                        <td>${viewContractProgress.certapplied}</td>                        
                         <td>${viewContractProgress.certexpirydate}</td>                      
                        <td>${viewContractProgress.taxratio}</td>
                        </c:if>				
					<td>${viewContractProgress.contractremark}</td>
					<td>${viewContractProgress.attachunit}</td>												
				 </tr>
<%-- 	 		</c:forEach>				 --%>
		</tbody>
	</table>
	</div>	
	<div class="nav-operate" >
		<ul class="operationg-new  operationg-attach" >
				<li>项目二级信息</li>
	     </ul>
   </div>
	<div class="table_scroll">
	
	<table id="contentTable2" class="table table-striped table-bordered table-condensed table-eidt">
		<thead>
			<tr list="viewSubprojectProgress">
			 <c:if test="${Flag ne '1'}">
			<th>户型</th>			
            <th>楼栋号</th>
            <th>预估挂石面积(平方米)</th>
            <th>类别<br>
			<th>石材品种</th>
			<th>计划开始施工时间</th>
			<th>计划完工时间</th>
			<th>设计图纸计划完成时间</th>
			<th>石材下单计划完成时间</th>
			<th>骨架类材料下单计划完成时间</th>
			<th>挂件类材料下单计划完成时间</th>
			<th>石材要求到货时间</th>
			<th>骨架类材料要求到货时间</th>
			<th>挂件类材料要求到货时间</th>
			<th>设计图纸实际完成时间</th>
			<th>石材下单实际完成时间</th>
			<th>骨架类材料下单实际完成时间</th>
			<th>挂件类材料下单实际完成时间</th>
			<th>设计单体负责人</th>
			</c:if>
			<c:if test="${Flag ne '0' and Flag ne '4'}">
			<th>联系方式</th>
			<th>实际挂石面积</th>
			<th>施工班组</th>
			</c:if>
			<c:if test="${Flag ne '1'}">
			<th>劳务价款</th>
			<th>石材实际到货时间</th>
			<th>骨架类材料实际到货时间</th>
			<th>挂件类材料实际到货时间</th>
			<th>工作面移交时间</th>
			  </c:if>
			  <c:if test="${Flag ne '0' and Flag ne '4'}">
			<th>完工落架时间</th>		 
			<th>各栋预计总产值</th>
			 </c:if>			
			</tr>
		</thead>
		
		<tbody id="viewSubprojectProgress" copy="false">
		<input type="hidden" name="delIdWay" id="delIdWay" value=""/>
			<c:forEach items="${viewContractProgress.subList}" var="viewSubprojectProgress" varStatus="1">
				<tr list="sublist">
				 <c:if test="${Flag ne '1'}">
				 <td>${viewSubprojectProgress.subhousetype}</td>
				 <td>${viewSubprojectProgress.buildingDisplayName}</td>
				 <td>${viewSubprojectProgress.subastone}</td>
				 <td>${viewSubprojectProgress.showtype}</td>
				 <td>${viewSubprojectProgress.materialtype}</td>
				 <td>${viewSubprojectProgress.planstartdate}</td>
				 <td>${viewSubprojectProgress.planenddate}</td>
				 <td>${viewSubprojectProgress.designstartdate}</td>
				 <td>${viewSubprojectProgress.stoneorderdate}</td>
				 <td>${viewSubprojectProgress.skeletonorderdate}</td>
				 <td>${viewSubprojectProgress.pendantorderdate}</td>
				 <td>${viewSubprojectProgress.stoneedate}</td>
				 <td>${viewSubprojectProgress.skeletonedate}</td>
				 <td>${viewSubprojectProgress.pendantedate}</td>
				 <td>${viewSubprojectProgress.designCompleteDate}</td>
				 <td>${viewSubprojectProgress.stoneCompleteDate}</td>
				 <td>${viewSubprojectProgress.skeletonCompleteDate}</td>
				 <td>${viewSubprojectProgress.pendantCompleteDate}</td>
				 <td>${viewSubprojectProgress.showdesigner}</td>
				 </c:if>
				  <c:if test="${Flag ne '0' and Flag ne '4'}">
				 <td>${viewSubprojectProgress.designerMobile}</td>
				 <td>${viewSubprojectProgress.stoneActualArea}</td>
				 <td>${viewSubprojectProgress.workclass}</td>
				 </c:if>
				  <c:if test="${Flag ne '1'}">
				 <td>${viewSubprojectProgress.larbomoney}</td>
				 <td>${viewSubprojectProgress.stoneActualDate}</td>
				 <td>${viewSubprojectProgress.skeletonActualDate}</td>
				 <td>${viewSubprojectProgress.pendantActualDate}</td>
				 <td>${viewSubprojectProgress.workshiftdate}</td>
				   </c:if>
				    <c:if test="${Flag ne '0' and Flag ne '4'}">				 
				 <td>${viewSubprojectProgress.completedate}</td>				
				 <td>${viewSubprojectProgress.estimateRevenue}</td>
				  </c:if>
				 				 
				 </tr>
	 		</c:forEach>		
		</tbody>
	</table>	
	</div>		
	</form:form>
	
	</div>
	

</div>
</body>
</html>