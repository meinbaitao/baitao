/*
 *自定义js方法
 */

$(function(){
	$(document).on("tap",".dropmenu[show_target][site_target]",dropmenu_do);//显示下拉选项
	$(document).on("tap","ul.menu-lists>li",dropmenu_choice)//选中选项
	$(document).on("tap",".affirm-chooice",affirm_chooice)//确认选中
	$(document).on("tap",".task-show-method",change_task_show_model)//切换任务显示模式
	$(document).on("swipeUp",".list-model li.current",current_swipeUp)//切换任务显示模式
})

/*
 * 点击下拉菜单按钮执行显示或者隐藏操作
 * 
 */

var dropmenu_do=function(event){
	if($(this).hasClass("search")){
		$(".space-nav").addClass("fixed");
		$(".affirm-chooice").css({"position":"fixed","top":"0px","left":"0px","height":$(document).height(),"display":"block"});
		$(".filtrate-menu").addClass("fixed");
		$(".filtrate-menu").slideDown();
	}
	
	if($(this).hasClass("active")){
		
		$(this).removeClass("active");
		$(this).find("span.icon-sort-down").attr("class","icon-sort-up");		
		$($(this).attr("show_target")).slideUp();
	}else{
		if($(".dropmenu.active").length>=1){
			hide_dropmenu();
		}
		$(this).addClass("active");
		$(this).find("span.icon-sort-up").attr("class","icon-sort-down");
		show_dropmenu($(this).attr("show_target"),$(this).attr("site_target"));
		
	}
}
/*
 * 隐藏下拉菜单
 */
var hide_dropmenu=function(){
	$(".menu-lists.open").removeClass("open").hide();
	$(".dropmenu.active").find("span.icon-sort-down").attr("class","icon-sort-up");
	$(".dropmenu.active").removeClass("active");   //隐藏已经显示的菜单
}
/*
 * show_target string  要显示selector
 * site_target string  对齐位置selector
 * 显示下拉菜单
 */

var show_dropmenu=function(show_target,site_target){
	$(show_target).css({"position":"fixed","top":$(site_target).offset().top+$(site_target).height(),"left":$(site_target).offset().left});
	$(show_target).slideDown(function(){
		$(this).addClass("open");
	});
}

/*
 * 选项选中
 */
var dropmenu_choice=function() {
	$(".dropmenu.active").html($(this).text()+"<span class='icon-sort-up'></span>");
	hide_dropmenu();
	
}	
	
	
/*
* 确认筛选 
*/

var affirm_chooice=function(){
	if($(".dropmenu.active").length>=1){
		hide_dropmenu();
	}else{
		$(".filtrate-menu").slideUp();
		$(".affirm-chooice").hide();
	}
}
	
/*
 * 切换任务显示模式
 */	
var change_task_show_model=function(){
	if($("ul.task-list").hasClass("list-model")){
		$("ul.task-list").removeClass("list-model").addClass("layer").hide();
		var translateZ=0,step=50,lis=$("ul.task-list").children("li");
		$(lis[0]).addClass("current");
		for(var i=0,len=lis.length;i<len&&i<6;i++){
		   $(lis[i]).attr("style","transform:translateZ(-"+translateZ+"px);-webkit-transform:translateZ(-"+translateZ+"px);top:"+(translateZ+step*i)+"px;z-index:"+(len+1-i)+";");
		   translateZ+=step;
		}
		$("ul.task-list").show();
	
	}else{
		$("ul.task-list").removeClass("layer").addClass("list-model");
	}
}

/*
* 上划操作 
*/

var current_swipeUp=function(){
	
}






