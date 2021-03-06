$(function() {
    //选择空间
    var s = window.location.search;
    var ownerId = s.substring(9, s.indexOf("&"));
    var container
    var url_spacelist = "/a/mobile/task/queryspacelist";
    var COOKIE_NAME = 'spaceId';
    if ($.cookie(COOKIE_NAME)) {
        container = $.cookie(COOKIE_NAME);
    }
    var data;
    if (container) {
        data = '{"spaceId":"' + container + '"}';
    } else {
        data = '{"spaceId":""}';
    }
    $(".s_masked,.container").children().remove();
    startUp.ajaxPost(url_spacelist, data, false,
    function(resultMap) {
        if (resultMap) {
            var space_first;
            var htmlStr = "";
            for (var i = 0; i < resultMap.result.length; i++) {
                if (resultMap.result[i].id == container) {
                    space_first = resultMap.result[i];
                    $(".s_name").html(space_first.title);
                } else {
                    space_first = resultMap.result[0];
                }
                htmlStr += "<div id='" + resultMap.result[i].id + "' class='mask_space'>";
                htmlStr += "<span class='space_name'>" + resultMap.result[i].title + "</span>";
                htmlStr += "<span class='space_ed fr' style='display: none;'><img src='../common/images/tick.png'></span>";
                htmlStr += "</div>";

            };
            $(".s_masked").append(htmlStr);
            //显示列表第一个空间的名称
            $("#" + container).addClass("selected").addClass("selected");
            $("#" + container + " .space_ed").show();

            var spaceId;
            if (container) {
                spaceId = container;
                $(".container").attr("id", container);
            } else {
                spaceId = space_first.id
            }
            var data_projectlist = '{"spaceId":"' + spaceId + '"}';
            var url_projectlist = "/a/mobile/task/queryprojectlist";
            startUp.ajaxPost(url_projectlist, data_projectlist, false,
            function(resultMap) {
                if (resultMap && resultMap.result) {
                    var htmlStr2 = "",N_htmlStr2="";
                    if( resultMap.result.length == 0){
                    	N_htmlStr2 += "<div class='n_task'>";
                    	N_htmlStr2 += " 	<img src='../common/images/non_task_topic.png'>";
                    	N_htmlStr2 += " 	<div class='task_text'>亲，赶紧去添加项目吧~<div>";
                    	N_htmlStr2 += "</div>";
                    	$(".container").append(N_htmlStr2);
                    }
                    $.each(resultMap.result,
                    function(idx, item) {
                        $.each(item.teamList,
                        function(idx, item) {
                            htmlStr2 += "<div id='" + item.id + "' class='c_project' >";
                            htmlStr2 += "	<div class='p_img'>";
                            htmlStr2 += "		<img alt='' src='../common/images/ico_project.png'>";
                            htmlStr2 += "	</div>";
                            htmlStr2 += "	<div class='p_content'>";
                            htmlStr2 += "		<div>" + item.title + "</div>";
                            htmlStr2 += "	</div>";
                            htmlStr2 += "</div>";
                        });
                    });
                    $(".container").append(htmlStr2);
                }
            })

        }
    })
    //项目列表 
    $(document).on("touchstart touchmove touchend", ".mask_space",
    function() {
    	var touch = event.targetTouches[0];
		if(event.type == "touchstart"){
			moved = false ; // moved用于判断是否滑动
            x = touch.pageX ;
            y = touch.pageY ;
		}else if(event.type == "touchmove"){
			if(moved) return
            X = touch.pageX ;
            Y = touch.pageY ;
            if(X-x != 0 || Y-y !=0) {moved = true}
		}else if(event.type == "touchend"){
			if(!moved){     // 如果没有滑动就执行
				$(".container").children().remove();
		        var id = $(this).attr("id");
		        $(".container").attr("id", id);
		        var data = '{"spaceId":"' + id + '"}';
		        var url = "/a/mobile/task/queryprojectlist";
		        startUp.ajaxPost(url, data, false,
		        function(resultMap) {
		            if (resultMap && resultMap.result) {
		            	var htmlStr2 = "",N_htmlStr2="";
		                if( resultMap.result.length == 0){
		                	N_htmlStr2 += "<div class='n_task'>";
		                	N_htmlStr2 += " 	<img src='../common/images/non_task_topic.png'>";
		                	N_htmlStr2 += " 	<div class='task_text'>亲，赶紧去添加项目吧~<div>";
		                	N_htmlStr2 += "</div>";
		                	$(".container").append(N_htmlStr2);
		                }
		                $.each(resultMap.result,
		                function(idx, item) {
		                    $.each(item.teamList,
		                    function(idx, item) {
		                        htmlStr2 += "<div id='" + item.id + "' class='c_project' >";
		                        htmlStr2 += "	<div class='p_img'>";
		                        htmlStr2 += "		<img alt='' src='../common/images/ico_project.png'>";
		                        htmlStr2 += "	</div>";
		                        htmlStr2 += "	<div class='p_content'>";
		                        htmlStr2 += "		<div>" + item.title + "</div>";
		                        htmlStr2 += "	</div>";
		                        htmlStr2 += "</div>";
		                    });
		                });
		                $(".container").append(htmlStr2);
		            }
		        });
            }
		}
    })
    //事件委托
    $(document).on("touchstart touchmove touchend", ".c_project",
    function() {
    	var touch = event.targetTouches[0];
		if(event.type == "touchstart"){
			moved = false ; // moved用于判断是否滑动
            x = touch.pageX ;
            y = touch.pageY ;
		}else if(event.type == "touchmove"){
			if(moved) return
            X = touch.pageX ;
            Y = touch.pageY ;
            if(X-x != 0 || Y-y !=0){moved = true}
		}else if(event.type == "touchend"){
			if(!moved){     // 如果没有滑动就执行
				var spaceEachId = $(this).attr("id");
		        var spaceId = $(".container").attr("id");
		        var title = $(this).find(".p_content").find("div").text();
		        if (spaceEachId) {
		            window.location.href = startUp.getRootPath() + "/h5/home/project/task.html?spaceId=" + spaceEachId + "&title=" + escape(title)
		        }
            }
		}
    })
})