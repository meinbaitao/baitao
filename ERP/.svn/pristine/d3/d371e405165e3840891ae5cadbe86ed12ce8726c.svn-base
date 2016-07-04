
//显示正在运行的流程图
function showTraceDiagramInRuntime(processInstanceId){
    $.ajax({
        url: ctx + '/act/access/task/direct/getCurrentTask/' + processInstanceId,
        success: function(task){
            processTraceInRuntime(task.executionId, task.processDefinitionId, processInstanceId);
        }
    });
}

//显示已经完成的流程图
function showTraceDiagramInHistory(processInstanceId){
    var imageUrl = ctx + "/act/access/task/direct/graphHistoryProcessInstance/"+processInstanceId;

    if ($('#workflowTraceDialog').length == 0) {
        $('<div/>', {
            id: 'workflowTraceDialog',
            title: '',
            html: "<div><img src='" + imageUrl + "' style='position:absolute; left:0px; top:0px;' />" +
            "</div>"
        }).appendTo('body');
    } else {
        $('#workflowTraceDialog img').attr('src', imageUrl);
    }

    // 打开对话框
    $('#workflowTraceDialog').dialog({
        modal: true,
        resizable: false,
        dragable: false,
        open: function() {
            $('#workflowTraceDialog').dialog('option', 'title', '查看流程（按ESC键可以关闭）');
            $('#workflowTraceDialog').css('padding', '0.2em');
            $('#workflowTraceDialog .ui-accordion-content').css('padding', '0.2em').height($('#workflowTraceDialog').height() - 75);

        },
        close: function() {
            $('#workflowTraceDialog').remove();
        },
        width: document.documentElement.clientWidth * 0.95,
        height: document.documentElement.clientHeight * 0.95
    });

}


var executorUsername;
var executorLoginName;

function processTraceInRuntime(executionId, processDefinitionId, processInstanceId) {

    // 获取图片资源
    var imageUrl = ctx + "/act/task/resource/process-instance?pid=" + executionId + "&type=image";
    $.getJSON(ctx + '/act/task/trace/info/' + executionId, function(infos) {

        var positionHtml = "";

        // 生成图片
        var varsArray = new Array();
        $.each(infos, function(i, v) {
            var $positionDiv = $('<div/>', {
                'class': 'activity-attr'
            }).css({
                position: 'absolute',
                left: (v.x - 1),
                top: (v.y - 1),
                width: (v.width - 2),
                height: (v.height - 2),
                backgroundColor: 'black',
                opacity: 0,
                zIndex: $.fn.qtip.zindex - 1
            });

            // 节点边框
            var $border = $('<div/>', {
                'class': 'activity-attr-border'
            }).css({
                position: 'absolute',
                left: (v.x - 1),
                top: (v.y - 1),
                width: (v.width - 4),
                height: (v.height - 3),
                zIndex: $.fn.qtip.zindex - 2
            });

            if (v.currentActiviti) {
                $border.addClass('ui-corner-all-12').css({
                    border: '3px solid red'
                });
                var getAssigneeUrl = '/a/act/access/task/direct/getCurrentExecutor/' + processInstanceId;
                startUp.getData(getAssigneeUrl, function(data){
                    if($.type(data)=="null" || $.type(data) == "undefined"){
                        executorUsername = "待签收";
                        executorLoginName = "待签收";
                    }else{
                        executorUsername = data.name;
                        executorLoginName = data.loginName;
                    }
                });

                //加个属性标识当前节点是被执行节点
                $positionDiv.attr("isCurrentNode",'yes');
            }
            positionHtml += $positionDiv.outerHTML() + $border.outerHTML();
            varsArray[varsArray.length] = v.vars;
        });

        if ($('#workflowTraceDialog').length == 0) {
            $('<div/>', {
                id: 'workflowTraceDialog',
                title: '',
                html: "<div><img src='" + imageUrl + "' style='position:absolute; left:0px; top:0px;' />" +
                "<div id='processImageBorder'>" +
                positionHtml +
                "</div>" +
                "</div>"
            }).appendTo('body');
        } else {
            $('#workflowTraceDialog img').attr('src', imageUrl);
            $('#workflowTraceDialog #processImageBorder').html(positionHtml);
        }

        // 设置每个节点的data
        $('#workflowTraceDialog .activity-attr').each(function(i, v) {
            $(this).data('vars', varsArray[i]);
        });

        // 打开对话框
        $('#workflowTraceDialog').dialog({
            modal: true,
            resizable: false,
            dragable: false,
            open: function() {
                $('#workflowTraceDialog').dialog('option', 'title', '查看流程（按ESC键可以关闭）');
                $('#workflowTraceDialog').css('padding', '0.2em');
                $('#workflowTraceDialog .ui-accordion-content').css('padding', '0.2em').height($('#workflowTraceDialog').height() - 75);

                // 此处用于显示每个节点的信息，如果不需要可以删除
                $('.activity-attr').qtip({
                    content: function() {
                        var vars = $(this).data('vars');
                        var  tipContent = "<table class='need-border'>";
                        if($(this).attr("isCurrentNode")=='yes'){
                            tipContent += "<tr><td class='label'>审批人：</td><td>" + executorUsername + "<td/></tr>";
                            tipContent += "<tr><td class='label'>登录名：</td><td>" + executorLoginName + "<td/></tr>";
                        }else{
                            $.each(vars, function(varKey, varValue) {
                                if (varValue) {
                                    tipContent += "<tr><td class='label'>" + varKey + "</td><td>" + varValue + "<td/></tr>";
                                }
                            });
                        }
                        tipContent += "</table>";
                        return tipContent;
                    },
                    position: {
                        at: 'bottom left',
                        adjust: {
                            x: 3
                        }
                    }
                });
                // end qtip
            },
            close: function() {
                $('#workflowTraceDialog').remove();
            },
            width: document.documentElement.clientWidth * 0.95,
            height: document.documentElement.clientHeight * 0.95
        });

    });
}
