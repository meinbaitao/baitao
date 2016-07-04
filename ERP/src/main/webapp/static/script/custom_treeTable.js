$(function(){
	each_firstLevel();
	  $("div.tit i").unbind("click");
	  $("div.tit i").live("click",function(){//项目展开收起函数
		  if($(this).hasClass("glyphicon-triangle-right")){ 
				  $(this).removeClass("glyphicon-triangle-right").addClass("glyphicon-triangle-bottom");
				  $(this).parents("tr").eq(0).addClass("Create-tr").siblings(".Create-tr").removeClass("Create-tr");
				 
		  }else{
			  $(this).removeClass("glyphicon-triangle-bottom").addClass("glyphicon-triangle-right");
			  $(this).parents("tr").eq(0).removeClass("Create-tr");
		  }
		
	  });
	

		
	  $(".tree_table tbody").find("tr.active").load(function(){alert("123123")});
	  $(".tree_table tbody").find("tr:not('.hide-childen')").eq(0).find("i").filter(".glyphicon").removeClass("glyphicon-triangle-right").addClass("glyphicon-triangle-bottom");

	  
	  $(".tree_table").find("input[type=checkbox]").unbind("click");
	  $(".tree_table").find("input[type=checkbox]").live("click",function(){//根据一级项目checkbox,选中所有二级checkbox
		 
		  var this_chk=this;
		  var this_id=$(this).parents("tr").attr("id");
		  tr_chked(this_chk,this_chk.checked);
			  $(this_chk).parents("table").find("tr[pid="+this_id+"]").each(function(){
				  if(!$(this).find("input").prop("disabled")){
				    $(this).find("input").attr("checked",this_chk.checked);
				     tr_chked($(this).find("input")[0], $(this).find("input")[0].checked);
				  }
				}); 
			  var pid=$(this_chk).parents("tr").attr("pid"),
			      ptr=$(".tree_table tr[id="+pid+"]").find("input[type=checkbox]"),
			      ctr=$(".tree_table tr[pid="+pid+"]");
			  
              if(this_chk.checked){
            	  for(var i=0,len=ctr.length;i<len;i++){
            		  if(!($(ctr[i]).find("input[type=checkbox]")[0].checked)) break;
            	  }
            	  if(i==len){
            		  ptr.prop("checked",true); 
            		  ptr.parents("tr").addClass("tr_chked");
            	  }
              }else{
            	  if(ptr[0]&&ptr[0].checked){

            		  ptr.prop("checked",false);
            		  ptr.parents("tr").removeClass("tr_chked");
            	  }
              }
	
	  });

	

	  treeTables_input_chk();
})
function each_firstLevel(){//设置第一项跨列
		$(".tree_table tr.first-level").each(function(){$(this).find("td").eq(0).attr("colspan",$(".tree_table thead tr").find("th").length)});
	}

function treeTables_input_chk(){
	  $(".tree_table  tbody tr td input").each(function(){
			 if(!$(this).prop("disabled"))  {
					if(this.checked){
						
					  tr_chked(this,this.checked);
					}
				}
		  });
}

function tr_chked(This,checked){
	  if(checked){
	    	$(This).parents("tr").eq(0).addClass("tr_chked");

	    }else{
	    	$(This).parents("tr").eq(0).removeClass("tr_chked");
	    }
}
function treeTable_input_chk(){
	  var this_chk=$("tr.Create-tr")[0];
	  var this_id=$(this_chk).attr("id");
	  if($(this_chk).find("input[type=checkbox]")[0]){
		  tr_chked($(this_chk).find("input[type=checkbox]"),$(this_chk).find("input[type=checkbox]")[0].checked);
	  }
	  $(this_chk).parents("table").find("tr[pid="+this_id+"]").each(function(){
		  if(!$(this).find("input").prop("disabled")&&$(this).find("input").length>0){
			  if($(this_chk).find("input[type=checkbox]")[0]){
				  $(this).find("input").attr("checked",$(this_chk).find("input[type=checkbox]")[0].checked);
			  }
		     tr_chked($(this).find("input")[0],$(this).find("input")[0].checked);
		  }
		});
}






