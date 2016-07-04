<%@ page contentType="text/html;charset=UTF-8" %>
<div class="nav-operate">
		<div id="importBox" class="hide">
			<form id="importForm" action="${ctx}/orbom/orderBomBase/importStone" method="post" enctype="multipart/form-data"
				style="padding-left:20px;text-align:center;">
			<ul class="modal-body">
				<li>
					<span class="tab-name">项目名称：</span>
					<label>
						 <select id="projectNameOne" class="input-medium required">
							<option value=""/>请选择</option>
							<c:forEach items="${listMap}" var="obj">
								<option  value="${obj.proID}">${obj.proName}</option>
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
					   <span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li class="autoHeight">
					<span class="tab-name">栋号：</span>
					<label id="buildingOne">
						 <select class="input-medium"  multiple='mutiple'>
						 <select>
						 <span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">石材品种：  </span> 
					<label> 
						<select id="stoneColorName" name="stoneColorName" class="required input-medium">
							<c:forEach items="${fns:getDictList('stone_variety')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">饰面处理：  </span> 
					<label> 
						<select id="facingProcess" name="facingProcess" class="input-medium">
							<option value="荔枝面">荔枝面
							<option value="光面">光面
							<option value="火烧面">火烧面
							<option value="拉丝面">拉丝面
							<option value="按各部件处理">按各部件处理
						</select>
						<span class="help-inline"><font color="red">*</font> </span>
					</label>
				</li>
				<li>
					<span class="tab-name">文件：</span>
					<label>
						<input id="multipartFile" name="multipartFile" type="file" style="width:330px"/><br/>
					</label>
				</li>
				<li>
					<span class="tab-name">备注：</span>
					<label>
						<input id="remark" name="remark" type="text" class="input-medium"/><br/>
					</label>
				</li>
				<li class="clear"></li>
				<li class="fr">
					<input id="btnImportSubmit" class="btn btn-primary" type="button" value="导    入"/>
					<input name="subProjId" id="subprojectId" type="hidden"/>
					<input name ="orderType" id="orderType" type="hidden" value="${orderType}" />
				</li>
			</ul>
			</form>
		</div>
		</div>	