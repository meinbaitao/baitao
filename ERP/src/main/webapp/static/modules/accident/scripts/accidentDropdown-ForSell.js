
$(function() {

    var flag = $("#flag").val();
    if (flag == "edit") {
        $("#projectId").attr('disabled','disabled');
        $("#roomModelSelect").attr('disabled','disabled');
        $("#buildingNOSelect").attr('disabled','disabled');
        $("#materialsFormSelect").attr('disabled','disabled');
    }

    //根据项目一级信息，获取户型
    $("#projectId").live("change", function () {
        var proID = $(this).val();
        var d = {proID: proID};
        var url = "/a/purchase/applyPurchase/getSubByProID";
        startUp.postData(url, d, function (data) {
            $("#roomModelSelect").empty();
            $("#roomModelSelect").append('<option value=""/>请选择</option>');
            $.each(data,function(index, value){
                $("#roomModelSelect").append("<option value1='" + value.subID + "' value='" + value.subHouseType + "'>" + value.subHouseType + "</option>");
            });
            $("#roomModelSelect").select2();
        });
    });

    //根据项目二级信息，获取楼栋
    $("#roomModelSelect").live("change", function () {
        var proID = $("#projectId").val();
        var houseType = $("#roomModelSelect").val();
        if(houseType == ""){
            return;
        }

        var d = {proID: proID, houseType: houseType};
        var url = "/a/purchase/applyPurchase/getSubByHouseType";
        $("#buildingNOSelect").append();
        startUp.postData(url, d, function (data) {
            $("#buildingNOSelect").empty();
            $("#buildingNOSelect").append('<option value=""/>请选择</option>');
            $.each(data, function(index, value){
                $("#buildingNOSelect").append("<option value='" + value.subID + "'>" + value.buildingDisplayName + "</option>");
            });
            $("#buildingNOSelect").select2();
        });

    });


    /**
     * 选择楼栋带出下料单
     */
    $("#buildingNOSelect").on("change", function(){
        var accidentType = $("#accidentType").val();
        var subProjId = $("#buildingNOSelect").val();
        if(subProjId == ""){
            return;
        }

        var fetchMaterialsFormUrl = "";
        if(accidentType=="3"){
            fetchMaterialsFormUrl = '/a/orbom/orderBomBase/findAllOrderBySubProjForSC/'+subProjId;
        }else if(accidentType=="4"){
            fetchMaterialsFormUrl = '/a/orbom/orderBomBase/findAllOrderBySubProjForGFL/'+subProjId;
        }else{
            return;
        }

        startUp.getData(fetchMaterialsFormUrl, function(data){
            $("#materialsFormSelect").empty();
            $.each(data, function(index, value){
                $("#materialsFormSelect").append("<option value='" + value.id + "'>" + value.orderBomNo + "</option>");
            });
            $("#materialsFormSelect").select2();
        });
    });

});
