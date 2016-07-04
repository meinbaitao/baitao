
/**
 * 绑定审核驳回
 */
function bindRejectEvent(button, originNodeId, callbackFunction, wfId){

    button.on("click",function(){
        var html = "<div style='padding:10px;'><table>" +
            "<tr><td align='right'>驳回缘由：</td><td align='left'><input type='text' id='rejectBackReason' name='rejectBackReason' /></td></tr>" +
            "<tr><td align='right'>驳回到：</td> <td align='left'><select id='rejectToNode'><option value='previousNode'>上一个节点</option><option value='originNode'>发起人</option></select></td></tr>" +
            "</table></div>";
        var submit = function(v, h, f) {
            if(f.rejectBackReason == ""){
                top.$.jBox.tip("驳回缘由", "error", { focusId: "rejectBackReason" }); // 关闭设置 some 为焦点
                return false;	//标识窗口不被关闭
            }


            var rejectToNode = h.find("#rejectToNode").val();
            var url, editApplyForm="";
            if(rejectToNode == 'originNode'){
                url = "/a/act/access/task/direct/rejectToSpecifyNode";
                editApplyForm=originNodeId;
            }else{
                url = "/a/act/access/task/direct/complete";
            }
            var reject = f.rejectBackReason;
            var json ='{\"processInstanceId\":\"'+wfId+'\",\"approval\":\"0\",\"rejectBackReason\":\"' + reject + '\", \"rejectToNode\":\"'+editApplyForm+'\"}';

            startUp.postActData(url,json,"application/json",function(data){
                if(data==null){
                    window.alertx("驳回失败！");
                }else{
                    window.alertx("驳回成功！");
                    waitTimesAndCallback(callbackFunction);
                }
            });
            return true;//标识窗口关闭
        }
        top.$.jBox(html, { title: "驳回", submit: submit });
    });

}


/**
 * 流程轨迹
 */
function showFlowAuditHistoryTrace(workflowId){

    var html = '<div id="flowAuditHistoryDialog"><table class="table table-striped table-bordered table-condensed  table-eidt" id="flowAuditHistoryTable"><tr><th>序号</th><th>审批节点</th><th>审批人</th><th>下一审批节点</th><th>下一节点审批人</th><th>审批结果</th><th>审核人意见</th><th>审批时间</th><th>审批类型</th></tr></table></div>';
    $(html).appendTo('body');
    var url = '/a/act/actAuditTrace/getFlowAuditTrace/' + workflowId;
    startUp.getData(url, function(data){
        var sequence = 1;
        $.each(data, function(index, entry){
            var auditProposalValue = entry.auditproposal==null ? "":entry.auditproposal;
            $("#flowAuditHistoryTable").append('<tr><td>'+sequence+'</td><td>'+entry.submitnode+'</td><td>'+entry.submitPeopleName+'</td><td>'+entry.nextNode+'</td><td>'+entry.nextAuditPeopleName+'</td><td>'+entry.auditResultName+'</td><td>'+auditProposalValue+'</td><td>'+entry.audittime+'</td><td>'+entry.auditTypeName+'</td></tr>');
            sequence++;
        });

        // 打开对话框
        $('#flowAuditHistoryDialog').dialog({
            modal: true,
            resizable: false,
            dragable: false,
            open: function() {
                $('#flowAuditHistoryDialog').dialog('option', 'title', '流程轨迹');
                $('#flowAuditHistoryDialog').css('padding', '0.2em');
                $('#workflowTraceDialog .ui-accordion-content').css('padding', '0.2em').height($('#flowAuditHistoryDialog').height() - 75);
            },
            close: function() {
                $('#flowAuditHistoryDialog').remove();
            },
            width: document.documentElement.clientWidth * 0.95,
            height: document.documentElement.clientHeight * 0.95
        });
    });

}