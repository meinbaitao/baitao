 $(function(){
	
	    	$(".table-eidt tbody").find("td[type=select],td[type=text]").click(td_edit);
	        
	    	function td_edit(){
	    		$(this).siblings("td").each(function(){
	    			if($(this).attr("type") in table_eidt) {
		    			  table_eidt[$(this).attr("type")]($(this));
		    			  $(this).unbind("click");
		    		}
	    		});
	    		if($(this).attr("type") in table_eidt) {
	    			  table_eidt[$(this).attr("type")]($(this));
	    			  $(this).unbind("click");
	    		}
	    		$(this).parents('#scroll-table').find("#scroll-head>table").html($(this).parents("table").eq(0).html());	
	    		$("#scroll-head>table").find("[id]").removeAttr("id");
	    		$("#scroll-head>table").find("[name]").removeAttr("name");

	    		$("#scroll-head>table").find(".required").removeClass("required");
	    	}
	    	
	        $("ul.operationg .edit-more").live("click",edit_more); 
	        function edit_more(){//批量编辑
	        	cancel_edit_more();
    			if($(".table-eidt tbody tr td").find("input[type=checkbox]:checked").length>0){
    				$(this).html($(this).html().replace(/批量编辑/,"取消编辑"));
    				$(this).removeClass("edit-more").addClass("cancel-edit-more");
        			$(this).siblings(".edit-more-submit").removeClass("hide");
        			$(".table-eidt tbody tr td").find("input[type=checkbox]:checked").each(function(){
        				
        			   
        				$(this).parents("td").siblings("td").each(function(){
	        				
	        				if($(this).attr("type") in table_eidt) {
	        					$(this).attr("eidt_more","true");
	        					table_eidt[$(this).attr("type")]($(this));
	        				}
	        				
	        			});
        			});
    			}else{
    				alert("没有选择数据");
    			} 
    		}
	        
	        
	        $("ul.operationg .cancel-edit-more").live("click",cancel_edit_more);
	        function cancel_edit_more(){ //取消批量编辑
	        	var This;
    			if(this.tagName!="LI"){
    				 This=$("ul.operationg .edit-more")[0];
    			}else{
    				This=this;
    			};
    			if($(".table-eidt tbody tr td").find("input[type=checkbox]:checked").length>0){
    				$(This).html($(This).html().replace(/取消编辑/,"批量编辑"));
    				$(This).removeClass("cancel-edit-more").addClass("edit-more");
        			$(This).siblings(".edit-more-submit").addClass("hide");
        			$(".table-eidt tbody tr td").find("input[type=checkbox]:checked").each(function(){
        				
        			   
        				$(this).parents("tr").find("td>input[type!=checkbox],td>select").each(function(){
        					table_eidt_cancel(this);
	        			}); 
        			});
    			}else{
    				alert("没有选择数据");
    			} 
    		}
	        
	        
/*	        $("ul.operationg .edit-more-submit").live("click",function(){	 
	        	 console.log(table_eidt_data());
	        });*/
	        
	         	
	         
	    	 
	    	 
	     
	       
	       
	      $("#tr_add,.tr_add").bind("click",tr_add_line);   
	    
	      
	      
	      $("#tr_del,.tr_del").bind("click",function(){
	    	  del_tr(table_obj(this));
	    	
	      })
	       
	      
	      Tresize(0);
	      
	      
	      $("#scroll-head").scroll(function(){
	    	  $(this).scrollTop(0);
	      });
	      $("#tbody-scroll").scroll(function(){
	    	  if($("#tbody-scroll").siblings("#scroll-head").is(":hidden")){ 
	    		  $("#scroll-head").html("<table></table>");
	    		  $("#scroll-head>table").attr('class',$(this).children("table").attr('class')).css("width",$(this).find("table").width());
	    		  $("#scroll-head").height($(this).find("table>thead").height());
		          $("#scroll-head>table").html($(this).find("table").html());
		          $("#scroll-head>table").find("[id]").removeAttr("id");
		          $("#scroll-head>table").find("[name]").removeAttr("name");
		          $("#scroll-head>table").find(".required").removeClass("required");
	    		  $("#scroll-head").css({"display":"block"});
	    	  }
	    	  $("#scroll-head").scrollLeft($("#tbody-scroll").scrollLeft());
	    	  
	      })
	      
	    
	      
	      
           //鼠标移动切换单元格
  	       

		document.onkeydown= function(e) {
	    	                   e=e||window.event;
	    	                   customTab(e);
		                                
		                            }
	      
	      
//	      $("#scroll-head").bind('scroll',function(){
//	    	  $(this).scrollTop(0);
//	      })
		                       
			    });
	    
	    
	    
  var  table_eidt={ //单元格添加表单对象
	    			  
	    		  text:function(tdEvent){  //添加text表单
	    			   
	    			      if(tdEvent.children().length>0){
	    			    	  tdEvent.html("<input  type='"+$(tdEvent).attr("type")+"'  "+table_eidt.attrEach(tdEvent)+" odlvalue='"+$(tdEvent).text().Trim()+"'  value='"+$(tdEvent).text().Trim()+"' html='"+tdEvent.html()+"'>");
	    			      }else{
	    			          tdEvent.html("<input  type='"+$(tdEvent).attr("type")+"' "+table_eidt.attrEach(tdEvent)+"  odlvalue='"+$(tdEvent).text().Trim()+"'  value='"+$(tdEvent).text().Trim()+"'>");
	    			      }
	    			      if(tdEvent.attr("eidt_more")==undefined){
	    			    	tdEvent.find("input").focus();
	    			    	tdEvent.find("input").select();
	    			        tdEvent.find("input").blur(function(){
	    			        	 $("ul.operationg .edit-more-submit").click();
	    			        });
	    			      }
	    			      
	    			   },	    			 
	    	      select:function(tdEvent){   //添加select表单
	    	    	  var text=$(tdEvent).text().Trim()==""?"请选择":$(tdEvent).text().Trim();
	    	    	  if(tdEvent.children().length>0){
    			    	  tdEvent.html("<select "+table_eidt.attrEach(tdEvent)+"    oldvalue='"+$(tdEvent).text().Trim()+"'  value='"+$(tdEvent).text().Trim()+"' html='"+tdEvent.html()+"'>"+"<option value='"+($(tdEvent).attr('value')?$(tdEvent).attr('value'):'')+"' selected='selected'>"+text+"</option> </select>");
    			          
	    	    	  }else{
    			          tdEvent.html("<select "+table_eidt.attrEach(tdEvent)+"  oldvalue='"+$(tdEvent).text().Trim()+"'  value='"+$(tdEvent).text().Trim()+"'>"+"<option value='"+($(tdEvent).attr('value')?$(tdEvent).attr('value'):'')+"' selected='selected'>"+text+"</option> </select>");
	    	    	  }
	    	    	  if($(tdEvent).find("select").attr("empty")=="true"){
	    	    		  var select=$(tdEvent).find("select");
	    	    		  select.find("option:contains(请选择)").remove();
	    	    		  
	    	    	  }
	    	    	  $(tdEvent).find("select").select2();
	    	      },
	    	      checkbox:function(tdEvent){
	    	    	  tdEvent.text("");
	    	    	  tdEvent.html("<input type='checkbox' "+table_eidt.attrEach(tdEvent)+"/>")
	    	      },
	    	      hidden:function(tdEvent){
	    	    	  tdEvent.html("<input type='hidden' "+table_eidt.attrEach(tdEvent)+"/>")
	    	      },
	    	      attrEach:function(tdEvent){  //属性编辑
	    	    	  var attribute="",names;
	    	    	  var chack_char="abbr,align,axis,bgcolor,char,charoff,colspan,headers,height,nowrap,rowspan,scope,valign,width,type,name,style";
	    	    	  var attrlist=tdEvent[0].attributes;
	    	    	      for(i=0,len=attrlist.length;i<len;i++){
	    	    	    	  if(chack_char.indexOf(attrlist[i].name)<0){
	    	    	    		   attribute+=" "+attrlist[i].name+"='"+attrlist[i].value+"'";
	    	    	    	  }
	    	    	    	  
	    	    	      }
	    	    	      var  list=tdEvent.parents("tr").attr("list");
	    	    	      
	    	    	      if(list!=undefined&&(tdEvent.attr("name")&&tdEvent.attr("name").indexOf(list)<0)){
	    	    	    	
	    	    	    	 len=tdEvent.parents("tr").attr("index");
	    	    	    	names=tdEvent.parents("tr").attr("list")+"["+len+"]."+tdEvent.attr("name");
	    	    	        attribute+=" "+"name='"+names+"'";
	    	    	        attribute+=" "+"id='"+names+"'";
	    	    	      }else{
	    	    	    	  var t_name=tdEvent.attr("name")==null?'':"name='"+tdEvent.attr("name")+"'"+" id='"+tdEvent.attr("name")+"'";
	    	    	    	  attribute+=" "+t_name;
	    	    	      }
	    	    	   return attribute;
	    	      }
	    		
	    		 }
	    	  	    
var tr_add_line=function(get_obj){  //添加数据项
	    	   var tr,name,num,table,maxIndex,trueIndex;
	    	       table=table_obj(this);
	    	       if($(table).length>1) return false;
	    		   tr=$(table+" thead").eq(0).find("tr"); 
	    		   if(tr.length>1){
	    			   tr=$(table+" thead").eq(0).find("tr").filter(".copy").clone(); 
	    			   if(tr.filter(".copy").length<=0){ return false;}else{tr.removeClass("hide");}
	    		   }else{
	    			   tr=$(table+" thead").eq(0).find("tr").clone();  
	    		   }
	    		   
	    		   tr.find("th:gt(0)").not("[copy='th-copy']").text("");

					if(tr.find("th").hasClass("all-check")) {
						tr.find("th").eq(0).attr("class", "check").children("label").remove().children("input").attr("id", "");
						tr.find("th").eq(0).children("input").attr("id", "");
					}
	    		   tr.html(tr.html().replace(/<th/ig,"<td").replace(/<\/th>/ig,"</td>"));
	    		   maxIndex=parseInt($(table+" tbody").eq(0).find("tr").last().attr("index"));
	    		   trueIndex=parseInt($(table+" tbody").eq(0).find("tr").length);
	    		   $(table+" tbody").eq(0).find("tr").each(function(){
	    			   if(parseInt($(this).attr("index"))>maxIndex) maxIndex=parseInt($(this).attr("index"));
	    		   })
	    		   if(trueIndex<maxIndex+1){
	    			   for(var i=0;i<trueIndex;i++){
	    				 
	    				   if($(table+" tbody").eq(0).find("tr[index="+i+"]")[0]===undefined){
	    					   tr.attr("index",i);
	    					   break;
	    				   }
	    			   }
	    			 
	    		   }else{
					   tr.attr("index",$(table+" tbody").eq(0).find("tr").length);
				   }
	    		   
	    		   
	    		   tr.find("td").each(function(){
	    	    	   if($(this).attr("type") in table_eidt)  table_eidt[$(this).attr("type")]($(this));
	    	       })
	    	       $(table).eq(0).append(tr);
	    		   tr.find("input[type=text],select").eq(0).focus();
	    	

	    		   var tr_add_complete = $.Event( "tr_add_complete", { keyCode: tr,back_obj:get_obj } );					
	    		   $("#contentTable").trigger(tr_add_complete);
	    	      
	  
	    	   
	    	   Tresize(1);
	    	  
	      }
	    
var table_obj= function(This){
	 var table;
	  if($(This).attr("target")!==undefined){
		   table="#"+$(This).attr("target");
	   }else{
		   if($(".tbody-scroll").length>0){
			   table=".tbody-scroll .table-eidt";
		   }else{
			   table=".table-eidt";  
		   }
		    
	   }
	  return table;
 };
 var del_tr=function(obj){
	 
	 var table=obj;
	  if($(table+" tbody tr td").find("input[type=checkbox]:checked").length>0){
		  $(table+" tbody tr td").find("input[type=checkbox]:checked").each(function(){
			  $(this).parents("tr").eq(0).remove();
		  })
	  }else{
		  alert("选择数据");
	  }
 }
var Tresize=function(va){
	$(".table_scroll,#tbody-scroll").niceScroll({autohidemode:false,cursorcolor:"#aaa",background:"#eff0f4", cursorwidth: '8px', cursorborderradius: '4px', cursorborder: '', zindex: '1000',horizrailenabled:true});
	$("#scroll-head").niceScroll({
		autohidemode:"hidden",
		cursorcolor:"#aaa",
		background:"#eff0f4", 
		cursorwidth: '8px', 
		cursorborderradius: '4px',
		cursoropacitymax:0,
		cursoropacitymin:0,
		cursorborder: '', 
		zindex: '-1',
		horizrailenabled:true,
		mousescrollstep:0
		});
	$(".table_scroll,#tbody-scroll,#scroll-head").getNiceScroll().resize();
	if(va){window.scrollTo(0,document.body.scrollHeight);}
}
var table_eidt_submit=function(This){//表单提交执行操作,还原td
	  
	  if(This.tagName=="INPUT"){
		   if($(This).attr("odlvalue")==$(This).val()&&$(This).val().Trim()!=""){
			   table_eidt_cancel(This);
		   }else{
			   table_eidt_cancel(This,$(This).val());
		   }
		   
	  }else if(This.tagName=="SELECT"){
		  if($($(This)[0].options[$(This)[0].selectedIndex]).text()!=$(This).attr("oldvalue")){
			  table_eidt_cancel(This,$($(This)[0].options[$(This)[0].selectedIndex]).text());
		  }else{
			  table_eidt_cancel(This);
		  }
	  }
}

var table_eidt_cancel=function(This,val){ //取消编辑操作
	 
	 if(val==null||val==undefined){
		 var _var=$($(This).attr("html")).length>0?$($(This).attr("html")).text($(This).attr("oldvalue")):$(This).attr("oldvalue");
		  $(This).parents("td").html(_var); 

	 }else{	
		 var _var=$($(This).attr("html")).length>0?$($(This).attr("html")).text(val):val;
		 $(This).parents("td").html(_var);  

	 }
}
var table_eidt_data=function() {  //返回编辑表单数据
	   
	   if($(".table-eidt tbody tr td").find("input[type=checkbox]:checked").length>0){
     	
     	if($("#table-form").valid()){
     		return data_each();
     	}else{
     		return [];
     	};
     
     }else if($(".table-eidt tbody tr").find("td>input[type!=checkbox],td>select").length>0){
			var This=$(".table-eidt tbody tr").find("td>input[type!=checkbox],td>select");
			if(This.valid()){
				return data_each();
			}else{
				return [];
			}
		}else{
			alert("没有选择数据");
			return [];
		}
			
    
    }


var table_add_data=function() {  //返回编辑表单数据
	   
	   if($(".table-eidt tbody").find("tr").length>0){
     	
     	if($("#table-form").valid()){
     		return data_each("add");
     	}else{
     		return [];
     	};
     
     }else{
			alert("没有数据");
			return [];
		}
			
    
    }

var data_each=function(opreta){ //遍历表单，将数据以数组对象提交
	   
	   var sub_datau=new Array(); //新建数组保存数据
	   
	   var input_each=[];//获取遍历的对象
	   
	   if($(".table-eidt tbody tr td").find("input[type=checkbox]:checked").length>0){ //如果有表格的check表单呗选中，则表示批量提交。
		   
		   input_each=$(".table-eidt tbody tr td").find("input[type=checkbox]:checked");
		   
	   }else if($(".table-eidt tbody tr").find("td>input[type!=checkbox],td>select").length>0){//否者只许提交一个表单
		   
		   input_each=$(".table-eidt tbody tr td").find("input[type=checkbox]:checked");
		   
	   }
	   
	   if(opreta=="add"){
		   input_each=$(".table-eidt tbody tr td").find("input[type=checkbox]");
	   }
	   
	   $(input_each).each(function(index){//通过遍历获取数据
		   
			var i=index;
			sub_datau[i]={};
			
			$(this).parents("tr").find("td>input[type!=checkbox],td>select").each(function(){
				
				 if(this.tagName=="INPUT"){
					 if($(this).attr("odlvalue")!=$(this).val()&&$(this).val().Trim()!=""){//数据有改变才提交
						 
						 sub_datau[i][$(this).attr("name")]=$(this).val();
						 
					 }
					 
	    			   
	    		  }else if(this.tagName=="SELECT"){
	    			  if($(this).val()!=$(this).attr("oldvalue")){//数据有改变才提交
	    				  
	    			    sub_datau[i][$(this).attr("name")]=$(this).val();
	    			    
	    			  }
	    			  
	    		  }
				
				
			}); 
			
			 if(jQuery.isEmptyObject(sub_datau[i])){//删除空对象
				 sub_datau.splice(i,1);
			   
			  }else{
				  sub_datau[i].id=$(this).attr("id");
			  } 
		});
	
		var sub_data=[];
		for(var i=0,len=sub_datau.length;i<len;i++){//删除undefined数组元素
			if(sub_datau[i]!=undefined){ 
				sub_data[sub_data.length]=sub_datau[i];
			}
		}
		$(".table-eidt tbody tr td").find("input[type=checkbox]:checked").each(function(){
			
			   
			$(this).parents("tr").find("td>input[type!=checkbox],td>select").each(function(){
			
				$(this).parents("td").removeAttr("eidt_more");
				table_eidt_submit(this);
				
			}); 
		}); 
		
		return sub_data;
    }

function timeinput(){
	WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});
}

//鼠标移动切换单元格

var  customTab=function(e){
	 kc=e.keyCode||e.charCode;
	 var _keyCode=null;
	 if(kc==38) _keyCode='top';
	 if(kc==40) _keyCode='Down';
	 if(kc==37) _keyCode='left';
	 if(kc==39) _keyCode='right';
	 if(kc==37&&e.ctrlKey) _keyCode='charLeft';
	 if(kc==39&&e.ctrlKey) _keyCode='charRight';
	 
	 if(!(_keyCode)) return false;
	 
     var this_input=$(e.target),
         element=e.target,
         this_td=this_input.parents('td').eq(0),
         this_tr=this_input.parents('tr').eq(0),
         tdIndex=this_td.index(),
         this_table=this_input.parents('table').eq(0),
         hasPrevLine=this_tr.prev('tr:visible'),
         hasNextLine=this_tr.next('tr:visible'),
         hasPrevTd=this_td.prevAll('td:visible'),
         hasNextTd=this_td.nextAll('td:visible');
     if(!((this_input.prop('tagName')==='INPUT'||this_input.prop('tagName')==='SELECT')&&this_table.hasClass('table-tab'))) return ;     
	 if(_keyCode=='top'){
		if(hasPrevLine.length>0){
			var tab_td=hasPrevLine.find('td,th').eq(tdIndex);
			if(hasPrevLine.find("input[type='text'],select").length<=0){
				tab_td.click();
			}else{
				tab_td.find('input').focus();
			}
		}else{
			return false;
		}
		return ;
	 }	 
	 if(_keyCode=='Down'){
		 console.log(tdIndex);
		 if(hasNextLine.length>0){
				var tab_td=hasNextLine.find('td,th').eq(tdIndex);
				if(hasNextLine.find("input[type='text'],select").length<=0){
					tab_td.click();
				}else{
					tab_td.find('input').focus();
				}
			}else{
				return false;
			}
		 return ;
	 }
	
	 if(_keyCode=='charLeft'){
		 if(hasPrevTd.length>0){
				var tab_input=hasPrevTd.find("input[type='text'],select");
				if(tab_input.length>0){
					tab_input.eq(0).focus();
				}else{
				   console.log('上一个单元格没有表单了，我要回家了');
				}
			}else{
				return false;
			}
		 return ;
	 }
	 if(_keyCode=='charRight'){
		 if(hasNextTd.length>0){
				var tab_input=hasNextTd.find("input[type='text'],select");
				if(tab_input.length>0){
					tab_input.eq(0).focus();
				}else{
				   console.log('下一个单元格没有表单了，我要回家了');
				}
			}else{
				return false;
			}
		 return ;
	 }

	 
	 
	 
	

}
var funGetSelected = function(element) {

	 if (element.createTextRange) {
	        var range = textObj.createTextRange();
	        range.moveStart("character", 0);
	        range.select();    
	    } else {
	    	element.setSelectionRange(0,element.selectionEnd);
	    	element.focus();

	    }
    if (!window.getSelection) { 
        //IE浏览器
        return document.selection.createRange().text;
    } else {
        return element.value.substr(element.selectionStart, element.selectionEnd - element.selectionStart);
    };
}
   
/**
 * 
 * 自定义字符串对象
 */

String.prototype.Clear_space = function(){//去掉字符串所有空格
    //  str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	//	str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
    //   str = str.replace(/\n[\s| | ]*\r/g,'\n'); //去除多余空行
	//	str = str.replace(/ /ig,'');//去掉 
	//	str = str.replace(/^[\s　]+|[\s　]+$/g, "");//去掉全角半角空格
	//	str = str.replace(/[\r\n]/g,"");//去掉回车换行
	return this.replace(/[\r\n]/g,"").replace(/^[\s　]+|[\s　]+$/g, "").replace(/ /ig,'').replace(/\n[\s| | ]*\r/g,'\n').replace(/[ | ]*\n/g,'\n');
  };	  
  
  String.prototype.Trim =function () { return this.replace(/(^\s*)|(\s*$)|\n/g, ""); } ;  // 去掉左右空格
  String.prototype.Ltrim=function() { return this.replace(/(^\s*)|\n/g, ""); }  ;          // 去掉左空格
  String.prototype.Rtrim=function () { return this.replace(/(\s*$)|\n/g, ""); } ;           // 去掉右空格
	    