
$(document).ready(function(){
    //捕获添加行事件
    $("#contentTable").bind("tr_add_complete",function(e){
        var projectId = $("#projectId").val();
        var buildingNo = e.back_obj.buildingNO;
        var escapedBuildingNo = encodeURIComponent(buildingNo);
        //填充劳务合同号
        var getContractUrl = '/a/contract/laborcontract/getOneLaborContract/projectId/'+projectId+'/buildingNO/'+escapedBuildingNo;
        startUp.getData(getContractUrl,function(data){
            var contractNO = "";
            if(data!=null){
                contractNO = data.contractNo;
            }
            e.keyCode.find('input[name*=contractNo]').val(contractNO);
        });

        //填充合同号(甲方)
        var jiaContractUrl = '/a/contract/jiaContract/getContractByBuildAndProject/'+escapedBuildingNo+'/'+projectId;
        startUp.getData(jiaContractUrl,function(data){
            var jiaContractNO = "";
            if(data!=null){
                jiaContractNO = data.cid;
            }
            e.keyCode.find('input[name*=jiaContractNo]').val(jiaContractNO);
        });

        e.keyCode.find('input[name*=district]').val($("#district").val());
        e.keyCode.find('input[name*=buildNo]').val(buildingNo);
        e.keyCode.find('input[name*=buildingDisplayName]').val(e.back_obj.buildingDisplayName);
        e.keyCode.attr("id", buildScheduleBuildingTrId(buildingNo));

        //填充工程量
//        var getSubprojUrl = '/a/report/weekly/mainly/projWeeklyReport/getSubprojByProjectAndBuild/projectId/'+projectId+'/buildingNO/'+escapedBuildingNo;
//        startUp.getData(getSubprojUrl, function(data){
//            var stoneActualAreaValue = 0;
//            if(data!=null){
//                stoneActualAreaValue = data.stoneActualArea;
//            }
//            e.keyCode.find('input[name*=projectAmount]').val(stoneActualAreaValue);
//        });
        //获取用户在填写未移交列表时的数值
        var prefix = untransferPrefix(buildingNo);
        var stoneActualAreaValue = $("#"+prefix+"_actualStoneArea").val();
        e.keyCode.find('input[name*=projectAmount]').val(stoneActualAreaValue);
        e.keyCode.find('input[name*=planTransferDate]').val($("#"+prefix+"_planTransferDate").val());		//计划完成时间
        e.keyCode.find('input[name*=planFinishDate]').val($("#"+prefix+"_planFinishDate").val());		//计划完成时间
        e.keyCode.find('input[name*=memberCount]').val($("#"+prefix+"_memberCount").val());				//人数
        e.keyCode.find('input[name*=hurry]').val($("input[name='"+prefix+"_hurry']:checked").val());	//是否赶工
        e.keyCode.find('input[name*=subsidy]').val($("input[name='"+prefix+"_subsidy']:checked").val());//住宿补贴

        //填充本周计划比例
        var getBuildingScheduleUrl = '/a/report/weekly/buildingSchedule/getLastWeekOneByProjAndBuildNo/'+projectId+'/'+escapedBuildingNo;
        startUp.getData(getBuildingScheduleUrl, function(data){
            if(data != null){
                var nwFinishRateGjValue = data.nwFinishRateGj;
                var nwFinishRateScValue = data.nwFinishRateSc;
            }else{
                var nwFinishRateGjValue = 0;
                var nwFinishRateScValue = 0;
            }
            e.keyCode.find('input[name*=planFinishRateGj]').val(nwFinishRateGjValue);
            e.keyCode.find('input[name*=planFinishRateSc]').val(nwFinishRateScValue);
        });

    });

    //累计申请进度款比例
    $("#accuApplyMoney").unbind("change").bind("change", function(){
        var accumulatePayRate = 0;
        if($("#contractTotalMoney").val() != 0){
            accumulatePayRate = ($("#accuApplyMoney").val() / $("#contractTotalMoney").val()) * 100 ;
        }
        accumulatePayRate = accumulatePayRate.toFixed(2);
        $("#accuApplyMoneyRate").val(accumulatePayRate);
    });



    //骨架本周实际完成比例-- 变动 -- 更新 产值 字段
    $("#buildingSchedules tr td>input[name*='factFinishRateGj']").live("change",function(){
        var factFinishRateGj_input = $(this);
        if(factFinishRateGj_input.parent().parent().find("input[name*=factFinishRateSc]").val() == ""){
            return;
        }
        var projectId = $("#projectId").val();
        var buildingNo = $(this).parent().parent().find("input[name*=buildNo]").val();
        var escapedBuildingNo = encodeURIComponent(buildingNo);
        var getSubprojUrl = '/a/report/weekly/mainly/projWeeklyReport/getSubprojByProjectAndBuild/projectId/'+projectId+'/buildingNO/'+escapedBuildingNo;
        startUp.getData(getSubprojUrl, function(data){
            var estimateRevenueValue = 0;
            if(data!=null){
                estimateRevenueValue = data.estimateRevenue;
            }

            //产值
            var factFinishRateGjValue = factFinishRateGj_input.val() / 100.0;
            var factFinishRateScValue = factFinishRateGj_input.parent().parent().find("input[name*=factFinishRateSc]").val() / 100.0;
            var producationValue = calculateProducationVavlue(estimateRevenueValue, factFinishRateGjValue, factFinishRateScValue);
            factFinishRateGj_input.parent().parent().find('input[name*=productionValue]').val(producationValue);

            //累计产值
            calculateAccuProValue();

            //产值进度
            var productionValueSchedule = estimateRevenueValue !=0 ? producationValue / estimateRevenueValue : 0 ;
            productionValueSchedule = (100*productionValueSchedule).toFixed(2);
            factFinishRateGj_input.parent().parent().find('input[name*=proValueSchedule]').val(productionValueSchedule);
        });
    });


    //石材本周实际完成比例-- 变动 -- 更新 产值 字段
    $("#buildingSchedules tr td>input[name*='factFinishRateSc']").live("change",function(){
        var factFinishRateSc_input = $(this);
        if(factFinishRateSc_input.parent().parent().find("input[name*=factFinishRateGj]").val() == ""){
            return;
        }
        var projectId = $("#projectId").val();
        var buildingNo = $(this).parent().parent().find("input[name*=buildNo]").val();
        var escapedBuildingNo = encodeURIComponent(buildingNo);
        var getSubprojUrl = '/a/report/weekly/mainly/projWeeklyReport/getSubprojByProjectAndBuild/projectId/'+projectId+'/buildingNO/'+escapedBuildingNo;
        startUp.getData(getSubprojUrl, function(data){
            var estimateRevenueValue = 0;
            if(data!=null){
                estimateRevenueValue = data.estimateRevenue;
            }
            var factFinishRateScValue = factFinishRateSc_input.val() / 100.0;
            var factFinishRateGjValue = factFinishRateSc_input.parent().parent().find("input[name*=factFinishRateGj]").val() / 100.0;
            var producationValue = calculateProducationVavlue(estimateRevenueValue, factFinishRateGjValue, factFinishRateScValue);
            producationValue = producationValue.toFixed(2);
            factFinishRateSc_input.parent().parent().find('input[name*=productionValue]').val(producationValue);

            //累计产值
            calculateAccuProValue();

            //产值进度
            var productionValueSchedule = estimateRevenueValue !=0 ? producationValue / estimateRevenueValue : 0 ;
            productionValueSchedule = (100*productionValueSchedule).toFixed(2);
            factFinishRateSc_input.parent().parent().find('input[name*=proValueSchedule]').val(productionValueSchedule);
        });
    });


    //左右选择控件
    $('#multiselect').multiselect({
        rightSelected: '#multiselect_rightSelected',
        leftSelected: '#multiselect_leftSelected',
        moveToRight: function(Multiselect, options, event, silent, skipStack) {	//点击已移交楼栋
           
        	var left_options = Multiselect.left.find('option:selected');
            Multiselect.right.eq(0).append(left_options);
            $.each(left_options, function(index, option){
            	var trId = "#" + buildScheduleBuildingTrId(option.value);
                var buildScheduleId = $(trId).find("td[name*=\\.id]").attr("value");
                if($.type(buildScheduleId) != "null" && $.type(buildScheduleId) != "undefined"){
                    $("#buildingScheduleDeletedIdsContainer").append("<input type='hidden' value='"+buildScheduleId+"' name='buildingScheduleDeletedIds' /> ");
                }
                $(trId).remove();
                //累计产值
                calculateAccuProValue();
                //添加未移交楼栋列表 并 将左边的楼栋列表数据移到右边
                addRowsWhenBuildingMoveToRight(option);

                calculateTotalUnTransferBuilding();
            });
        },
        moveToLeft: function(Multiselect, options, event, silent, skipStack) {	//点击未移交楼栋列表数据
        	var right_options = Multiselect.right.find('option:selected');
            Multiselect.left.eq(0).append(right_options);
            $.each(right_options,function(index, option){
            	//添行 在建进度信息
                tr_add_line({buildingNO: option.value, buildingDisplayName: $(option).attr("buildingDisplayName")});
               
                removeRowsWhenBuildingMoveToLeft(option);

                calculateTotalUnTransferBuilding();
            });
        }
    });


    //保存
    $("#editBtn").on("click",function(){
        $("#transferedBuildingsContainer").empty();
        $("#unTransferBuildingsContainer").empty();
        $("#multiselect option").each(function(index, option){
            var district = $(option).attr("district");
            $("#transferedBuildingsContainer").append("<input type='hidden' value='"+option.value+"' name='transferedBuildings["+index+"].buildNo'>");
            $("#transferedBuildingsContainer").append("<input type='hidden' value='" + district + "' name='transferedBuildings["+index+"].district' />");
        });

        $("#multiselect_to option").each(function(index, option){
            var district = $(option).attr("district");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+option.value+"' name='unTransferBuildings["+index+"].buildNo' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ district +"' name='unTransferBuildings["+index+"].district' />");
//            var planTransferDateInputId ="#" + untransferPrefix(option.value);
            
            var prefix = untransferPrefix(option.value);
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ $("#"+prefix+"_planTransferDate").val() +"' name='unTransferBuildings["+index+"].planTransferDate' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ $("#"+prefix+"_actualStoneArea").val() +"' name='unTransferBuildings["+index+"].actualStoneArea' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ $("#"+prefix+"_planFinishDate").val() +"' name='unTransferBuildings["+index+"].planFinishDate' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ parseInt($("#"+prefix+"_memberCount").val()) +"' name='unTransferBuildings["+index+"].memberCount' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ $("input[name='"+prefix+"_hurry']:checked").val()+"' name='unTransferBuildings["+index+"].hurry' />");
            $("#unTransferBuildingsContainer").append("<input type='hidden' value='"+ $("input[name='"+prefix+"_subsidy']:checked").val() +"' name='unTransferBuildings["+index+"].subsidy' />");
        });
        $("#inputForm").submit();
    });


    //启动流程
    $("#startWorkflow").on("click", function () {
        var reportId = $("#reportId").val();
        var url = "/a/report/weekly/mainly/projWeeklyReport/startAuditFlow/reportId/"+reportId;
        loading();
        startUp.getData(url, function (data) {
            loaded();
            if(data.code==200){
                window.alertx(data.message);
                callbackWhenActionDone();
            }else{
                window.alertx(data.message);
            }

        });
    });


    //数据筛选
    $(document).off("click","input[name*='actRadio']").on("click","input[name*='actRadio']",function(e){
    	var radioVal = e.target.value;
    	var url="";
    	if(e.target.value==1){
    		url=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findMyWeekReport';
		}else if(e.target.value==2){
			url=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findUnAuditWeekReport';
		}else if(e.target.value==3){
			url=startUp.getRootPath() + '/a/report/weekly/mainly/projWeeklyReport/findAuditDoneWeekReport';
		}
    	$("#searchForm").attr("action",url);
    	$("#searchForm").submit();
	});

});

//计算累计产值
function calculateAccuProValue(){
    var accumulateProductionValue = 0.0;

    $("#buildingSchedules tr").each(function(index, line){
        var productionValue = '';
        var buildNO = $(line).find("input[name*=buildNo]").val();
        if($.type(buildNO) != "undefined" && $.type(buildNO) != "null"){
            //编辑状态
            productionValue = $(line).find("input[name*='productionValue']").val();
        } else{
            //非编辑状态
            productionValue = $(line).find("td[name*='productionValue']").html();
            productionValue = productionValue.match(/\d+/);
        }
        if(productionValue!=''){
            accumulateProductionValue += parseFloat(productionValue);
        }
    });

    accumulateProductionValue = accumulateProductionValue.toFixed(2);
    $("#accuOutputValue").val(accumulateProductionValue);
}

//计算产值
function calculateProducationVavlue(estimateRevenueValue, factFinishRateGjValue, factFinishRateScValue){
    var producationValue = estimateRevenueValue * (factFinishRateGjValue * 0.2 + factFinishRateScValue*0.8);
    return producationValue;
}

function buildScheduleBuildingTrId(buildingNo){
    var pureBuildingNo = extractPureBuildingNo(buildingNo);
    return "buildingSchedules_tr_" + pureBuildingNo;
}

//增加未移交楼栋,自动添加行到 planTransferDateContainer
function addRowsWhenBuildingMoveToRight(option){
    var trId = untransferTrId(option.value);
    var prefix = untransferPrefix(option.value);
    var district = $(option).attr("district");
//    var planTransferDateId = buildPlanTransferDateInputId(option.value);
//    $("#planTransferDateContainer").append('<tr id="'+trId+'">' +
//        '<td><input type="text" readonly="readonly" value="'+district+'"  /></td>'+
//        '<td><input type="text" readonly="readonly" value="'+$(option).attr("displayName")+'"  /></td>'+
//        '<td><input type="text" readonly="readonly" onclick="timeinput()" class="input115 Wdate" id="'+planTransferDateId+'"  /></td>' +
//        '</tr>');
    var html="<tr id='"+trId+"'>\
    	<td><input class='input-mini' type='text' readonly='readonly' value='"+district+"'  /></td>\
    	<td><input class='input-mini' type='text' readonly='readonly' value='"+$(option).attr("houseType")+"' /></td>\
    	<td><input type='hidden'  value='"+$(option).attr("building")+"'  />\
    		<input class='input-mini' type='text' readonly='readonly' value='"+$(option).attr("buildingDisplayName")+"' /></td>\
    	<td><input id='"+prefix+"_actualStoneArea' class='input-mini' type='text' value='"+$(option).attr("actualStoneArea")+"' /></td>\
    	<td><input type='text' readonly='readonly' onclick='timeinput()' id='"+prefix+"_planTransferDate' class='input115 Wdate'  /></td>\
        <td><input type='text' readonly='readonly' onclick='timeinput()' id='"+prefix+"_planFinishDate' class='input115 Wdate' /></td>\
        <td><input id='"+prefix+"_memberCount' class='input-mini' type='text' value='0' /></td>\
        <td><input name='"+prefix+"_hurry' type='radio' value='1' checked='checked' >是\
        	<input name='"+prefix+"_hurry' type='radio' value='0' >否</td>\
        <td><input name='"+prefix+"_subsidy' type='radio' value='1' checked='checked' >是\
        	<input name='"+prefix+"_subsidy' type='radio' value='0' >否</td>\
    </tr>";
    $("#planTransferDateContainer").append(html);
}

//删除未移交楼栋,自动从 planTransferDateContainer 删除行
function removeRowsWhenBuildingMoveToLeft(option){
    var trId ="#" + untransferTrId(option.value);
    $(trId).remove();
}

//创建 未移交 表格行的 id
function untransferTrId(buildingNo){
    var pureBuildingNo = extractPureBuildingNo(buildingNo);
    return "untransfer_tr_" + pureBuildingNo;
}

function buildPlanTransferDateInputId(buildingNo){
    var pureBuildingNo = extractPureBuildingNo(buildingNo);
    return 'panTransferDateContainer_' +pureBuildingNo+'_planTransferDate';
}
//列表内容id前缀
function untransferPrefix(buildingNo){
    var pureBuildingNo = extractPureBuildingNo(buildingNo);
    return 'untransfer_' +pureBuildingNo;
}

//去掉楼栋里面的 #
function extractPureBuildingNo(buildingNo){
    //var pureBuildingNo = buildingNo.slice(0,-1);
    var pureBuildingNo = buildingNo.replace(/#/g, '');
    return pureBuildingNo;
}


/**
 * 审核、驳回 操作完成后，回调这个方法
 */
function callbackWhenActionDone(){
    var url = $("#managementPageUrl").val();
    window.location.href = url;
}


//计算未移交楼栋总数
function calculateTotalUnTransferBuilding(){
    var length = $("#planTransferDateContainer").children().length;
    $("#amountOfUnTransferBuildings").html(length);
}
