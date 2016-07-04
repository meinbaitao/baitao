<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同评审申请</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/common/common_service.js"></script>
	<script type="text/javascript">
		var ctxPath="${ctx}";
		$(function(){
			String.prototype.startWith=function(str){     
				  var reg=new RegExp("^"+str);     
				  return reg.test(this);        
			}
			function dealWithUndefined(attribute){
				if(typeof attribute == "undefined"){
					return "";
				}else{
					return attribute;
				}
			}
			function finalSonsLength(parentLevel,list){
				var result = new Array();
				$.each(list,function(idx,item){
					var level = item.level;
					if(level.startWith(parentLevel)){
						result.push(item);
					}
				});
				return result.length;
			}
			
			var html = $("#types").html();
			var url = "/a/contract/contractAccountType/findList";
			startUp.getData(url,function(data){
				$.each(data,function(idx,item){
					var tr = "";
					var level = item.level;
					if(item.url){
						tr = "<tr><td rowspan='"+finalSonsLength(level,data)+"' style='text-align: center'>\
						<span style='font-size: ;'><a href='"+ctxPath+item.url+"'>"+item.name+"</a></span><br><span>"+dealWithUndefined(item.remarks)+"</span></td></tr>";
					}else{
						tr = "<tr><td rowspan='"+finalSonsLength(level,data)+"' style='text-align: center;'>\
						<span style='font-size: ;'>"+item.name+"</span>\
						<br><span'>"+dealWithUndefined(item.remarks)+"</span></td></tr>";
					}
					
					html += tr;
				});
				$("#types").html(html);
			});
			
		
		
		/*		$(function(){
			var html = $("#types").html();
			var url = "/a/contract/contractAccountType/findList";
			startUp.getData(url,function(data){
				
				var parentId = "0";
				var list = data;
				html = createTR(parentId,list,html);
				$("#types").html(html);
			});
 			function sonsFromParentId(parentId,list){
				var result = new Array();
				$.each(list,function(idx,item){
					if(parentId == item.parentId){
						result.push(item);
					}
				});
				if(result.length>0){
					return result;
				}else{
					return null;
				}
				
			}
			function createTR(parentId,list,html){
				var sons = sonsFromParentId(parentId,list);
				if(sons){
					$.each(sons,function(idx,item){
						var tr = "<tr id='"+item.id+"'><td>"+item.name+"</td></tr>";
						html += tr;
						html = createTR(item.id,list,html);
					});
					
				}
				return html;
			} */
			
			 
		});
		
	</script>
</head>
<body>
	<div class="list-content">
		<div class="table_scroll" style="margin-bottom:150px;">
			<table id="contentTable" class="table table-striped table-bordered  ">
				<thead>
					<tr>
					 <th colspan="4">
					    <p style="	text-align: center;font-size: 30px;">合同评审申请界面</p>
					    </th>
					 </tr>
					<tr>
						<th style="text-align: center;font-size: 20px;">大类</th>
						<th >&nbsp;</th>
						<th style="text-align: center;font-size: 20px;">一级类别</th>
						<th style="text-align: center;font-size: 20px;">二级类别</th>
						<!-- <th>备注</th> -->
					</tr>
				</thead>
				<tbody id="types" >
				
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>