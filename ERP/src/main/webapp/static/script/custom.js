$(function(){
	
		 if($(".nav-operate .search select").length>0&&$(".nav-operate .search select").get(0).selectedIndex!=null){
				
				select_change($(".nav-operate .search select"),$(".nav-operate .search select").get(0).selectedIndex);
			};
			$(".nav-operate .search select").change(function(){				
				var change_index=$(".nav-operate .search select").get(0).selectedIndex;
				select_change($(".nav-operate .search select"),$(".nav-operate .search select").get(0).selectedIndex);
         });
			
			function select_change(this_select,change_index){ //根据选择内容显示表单
				var inputs=this_select.parent().parent().find("li[class=input]");
				 inputs.find("input").attr("disabled","disabled");
				 inputs.children("i").filter(".input-show").removeClass("input-show");
				 inputs.children("i").eq(change_index).addClass("input-show");	
				 inputs.children("i").eq(change_index).removeAttr("disabled").find("input").removeAttr("disabled");
			}
			
			$("#advanced-search-btn").unbind("click");
			$("#advanced-search-btn").toggle(function(){  //为高级删选按钮绑定事件
				$(".list-content .nav-operate .advanced-search-form").slideDown();
				$(this).find("i").css({"background-position":"-47px -17px","margin-top":"12px"});
			},function(){
				$(".list-content .nav-operate .advanced-search-form").slideUp();
				$(this).find("i").css({"background-position":"-11px -19px","margin-top":"14px"});
			});
			
			$("#table-set").unbind("click");
			$("#table-set").toggle(function(){  //为表格显示按钮绑定事件
				if($(".list-content .nav-operate .table-set-container").find("li").length==1){
              
				
					var ths=$(".list-content table thead tr").children("th");
					$.each(ths,function(index,item){
						if($(this).attr("cols_hidden")=="false"){
						    $(".list-content .nav-operate .table-set-container").append("<li>"+"<input type='checkbox' index='"+index+"' id='check"+index+"' checked='checked' disabled > <label for='check"+index+"'>"+$(item).text()+"</label></li>");
						}else{
							$(".list-content .nav-operate .table-set-container").append("<li>"+"<input type='checkbox' index='"+index+"' id='check"+index+"' checked='checked'> <label for='check"+index+"'>"+$(item).text()+"</label></li>");
						}
						$(".list-content .nav-operate .table-set-container").slideDown();
						$(".list-content .nav-operate .advanced-search-form .modal-footer").show();
					});
					
				}else{
					$(".list-content .nav-operate .table-set-container").slideDown();
					$(".list-content .nav-operate .advanced-search-form .modal-footer").show();
				}
				th_hide();
			},function(){
				$(".list-content .nav-operate .table-set-container").slideUp();
				$(".list-content .nav-operate .advanced-search-form .modal-footer").hide();
			});
			
			function th_hide(){  //表格显示和影藏函数
				$(".list-content .nav-operate .table-set-container").find("input[type=checkbox]").unbind("click");
				$(".list-content .nav-operate .table-set-container").find("input[type=checkbox]").bind("click",function(){
					if($(this).attr("checked")!="checked"){
						$(".list-content table thead tr").children("th").eq($(this).attr("index")).hide();
		                var tabel=$(".list-content table tbody").children("tr");
						for(i=0,len=tabel.length;i<len;i++){
							$(tabel[i]).children("td").eq($(this).attr("index")).hide();
						}
						var lis=$(".projext-info").find("li");
							for(i=0,len=lis.length;i<len;i++){
								$(lis[i]).children("span").eq($(this).attr("index")).hide();
							}
						
					}else{
						$(".list-content table thead tr").children("th").eq($(this).attr("index")).show();
		                var tabel=$(".list-content table tbody").children("tr");
						for(i=0,len=tabel.length;i<len;i++){								
							$(tabel[i]).children("td").eq($(this).attr("index")).show();
						}
						var lis=$(".projext-info").find("li");
						for(i=0,len=lis.length;i<len;i++){
							$(lis[i]).children("span").eq($(this).attr("index")).show();
						}
					}
				}
			);
			}	
	 $(".operation-project,.appoint-saider h3>i").live("click",appoint);
     function appoint(){//操作划出效果
    	     
			 var tagert=$(this).attr("thisTagert")==null?$(this).parents(".appoint-saider").attr("id"):$(this).attr("thisTagert");
			if($(document).height()>$("#"+tagert).height()){
				$("body").height($(document).height())
				$("#"+tagert).height($(document).height());
			}
			 if($(this).attr("small")=="true"){
				 $("#"+tagert).css({"height":"200px","margin-top":($(window).height()-200)/2+"px"});
			  
			 }
			 if($(this).attr("showWidth")!=null){
				  $("#"+tagert).css("width",$(this).attr("showWidth"));
				  if(parseInt($(this).attr("showWidth"))<750)
					  $("#"+tagert).addClass("small-saider");   
			 }
			 if($("#"+tagert).is(":visible")==false){
				if($(this).attr("small")!="true"){
				    $(".appoint-saider").hide();}
				$("#"+tagert).css("right","-"+$("#"+tagert).width()+"px");					
				$("#"+tagert).show();
				$(".operation-project,.appoint-saider h3>i").unbind("click",appoint);
				$("#"+tagert).animate({right:'0px'},300,
						              function(){
					                     /* var zoomico=$("body").children("div:empty");
					                      console.log(zoomico);
					                     if(zoomico.length<=1&&(zoomico.css("background-image")).indexOf("zoomico.png")>0){
					                    	 zoomico.css("margin-top","10px");
					                     };*/
					                      $(".operation-project,.appoint-saider h3>i").unbind("click",appoint);
					                      $(".appoint-saider").filter(":visible").find("h3>i").css({right:$("#"+tagert).width()-30+"px"}).addClass("fixed");
					                   });
				$("#"+tagert).niceScroll({cursorcolor:"#4A8BC2", cursorwidth: '10', cursorborderradius: '0px', background: '#404040', cursorborder: '',boxzoom:true,dblclickboxzoom:true,dblclickzoom: false,autohidemode:false});
			}else{
			   if($(this).attr("reset")=="true"){//清空表单
				   var this_from=$("#"+tagert).find("form");
				   this_from[0].reset();
				   this_from.find("input[type=hidden]").val("");
				   this_from.find("select").select2("val", "");
				  
				  
			   }
				$(".operation-project,.appoint-saider h3>i").unbind("click",appoint);
				 
				 if($("#"+tagert).width()>=$("body").width()){
					   var zoomico=$("body").children("div:empty");
	                      console.log(zoomico);
	                     if(zoomico.length<=1&&(zoomico.css("background-image")).indexOf("zoomico.png")>0){
	                    	 zoomico.click();
	                    	
	                     };
				 }
				 $(".appoint-saider").filter(":visible").find("h3>i").css("right","auto").removeClass("fixed");
				$("#"+tagert).animate({right:'-'+$("#"+tagert).width()+'px'},300,function(){$("#"+tagert).hide();$(".operation-project,.appoint-saider h3>i").unbind("click",appoint);});	
			}
	}
    
		
		 
	  $(".project-list li div.tit i").unbind("click");  
	  $(".project-list li div.tit i").live("click",function(){//项目展开收起函数
		  if($(this).hasClass("glyphicon-triangle-right")){ 
			  $(this).removeClass("glyphicon-triangle-right").addClass("glyphicon-triangle-bottom");
			  if($(this).parent().next().attr("class")=="projext-info"){
					 $(this).parent().next(".projext-info").slideDown(300);  
			  }
		  }else{
			  $(this).removeClass("glyphicon-triangle-bottom").addClass("glyphicon-triangle-right");
			  $(this).parent().next(".projext-info").slideUp(300);
			 
		  }
		
	  });
	  if($(".project-list li ul.projext-info").find("li").length>0){
	    $(".project-list li div.tit i").eq(0).removeClass("glyphicon-triangle-right").addClass("glyphicon-triangle-bottom");
	  }
	  
	  $(".project-list li div.tit").find("input[type=checkbox]").unbind("click");
	  $(".project-list li div.tit").find("input[type=checkbox]").live("click",function(){
		  $(this).parent().next(".projext-info").find("input[type=checkbox]").attr("checked",this.checked);
	  });
	  
	  //全选表格数据
	  
	  $("table:not('.tree_table') #all-check").unbind("click");
	  $("table:not('.tree_table') #all-check").live("click",function(){
		  var this_checked=this.checked;
		  $(this).parents("table").find("tbody tr td input").each(function(){
			 if(!$(this).prop("disabled")){
				 $(this).prop("checked",this_checked);
				  // tr_chked(this, this_checked);
				}
		  });
	  })
	  
	  function input_chk(){
		  $("table:not('.tree_table') tbody tr td input").each(function(){
				 if(!$(this).prop("disabled"))  {
					if(this.checked){
					 tr_chked(this, this.checked);
					}
					}
			  });
	  }
	  input_chk();
	  
	  $("table tbody").find("input[type=checkbox]").unbind("click")
	   $("table tbody").find("input[type=checkbox]").live("click",function(){
				// tr_chked(this, this.checked);
	  })
	  
	  function tr_chked(This,checked){
		  if(checked){
		    	$(This).parents("tr").addClass("tr_chked");

		    }else{
		    	$(This).parents("tr").removeClass("tr_chked");
		    }
	 }
      
	 $(".select2-container").live("mouseover",function(){
		 $(this).attr("title",$(this).find("span.select2-chosen").text());
	 });
	 $(".list-content input[type='text']").live("mouseover",function(){
		 $(this).attr("title",$(this).val());
	 })
	 
	});

$(function(){
	        if($("table.resize").length>0){
			$("table.resize").resizableColumns({
	            store: window.store
	        });}
	        $("html").niceScroll({cursorcolor:"#aaa",background:"#eff0f4", cursorwidth: '10px', cursorborderradius: '5px', cursorborder: '', zindex: '1300',horizrailenabled:false,autohidemode:true});
	        $("#mydiv").getNiceScroll().resize()
	       
 }

);

/**
 * 表单验证
 * id 表单id
 */
function form_validate(id){

$("#"+id).validate({

	submitHandler: function(form){
		loading();
		form.submit();
	},
	errorLabelContainer:"#messageBox",
	errorPlacement: function(error, element) {
		$("#messageBox").text("输入有误，请先更正。");
		if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
			error.appendTo(element.parent().parent());
		} else {
			error.insertAfter(element);
		}
	}
});
}

window.onload=function(){
    $("body:not(.index_body)").css("min-height",$(document).height()+"px");
    $("#ascrail2001").remove();
    $("body.index_body .pagination").css("bottom","3px");
}



 

	 
 
