function removeOneRow(table_name, obj) {
	//alert(obj.parentNode.parentNode.rowIndex);
	var table = document.getElementById(table_name);
	var row = table.getElementsByTagName("tr")[obj.parentNode.parentNode.rowIndex];

	var tbody = row.parentNode;
	tbody.removeChild(row);
	//$("#frame_detail_delete_count").val(  parseInt($("#frame_detail_delete_count").val()) + 1);
	var row_num = document.getElementById(table_name).rows.length;
	var hidden_row = table.insertRow(row_num);
	hidden_row.style.display = "none";

}

function batchAddTableRows(table_name, count){
	for(var i=0; i < count; i++){
		addTableRow(table_name);
	}
}

function addTableRow(table_name){
	//要注意有些表格的内容是由第三行才开始的，而有一些表格的内容是第二行开始。
	
	//骨架材料，挂石材料明细项增加一行 ---开始
	if(table_name == 'frameTypeDetail'){
		var table = document.getElementById(table_name);
		var row_num = document.getElementById(table_name).rows.length;
		var row = table.insertRow(row_num);
		//alert(row_num)
		var cell0 = row.insertCell(0);
		var cell1 = row.insertCell(1);
		var cell2 = row.insertCell(2);
		var cell3 = row.insertCell(3);
		var cell4 = row.insertCell(4);
		var cell5 = row.insertCell(5);
		var cell6 = row.insertCell(6);
		var cell7 = row.insertCell(7);
		
		
		//判断上一行是否已经有有效数据，是，则复制值到新的一行中
		if(row_num > 1){
			var row_tmp = table.getElementsByTagName("tr")[row_num - 1];
			var cell_tmp = row_tmp.cells[0];
			if( $("#frame_materiel_seleted" + (row_num-1)).val() != null && $("#frame_materiel_seleted" + (row_num-1)).val().length > 0){
				selected_value = $("#frame_materiel_seleted" + (row_num-1)).val();
				count_value = $("#frame_type_count" + (row_num-1)).val();
				cell0.innerHTML = "<select class=\"input-mini\" id=\"frame_materiel_seleted" + row_num + "\" name=\"materiel_seleted" + row_num + "\" onChange=\"updateCellValue('frameTypeDetail', this)\" >"  + $("#frame_materiel_seleted1").html() +  "</select>";
				cell1.innerHTML = row_tmp.cells[1].innerHTML;
				cell2.innerHTML = row_tmp.cells[2].innerHTML;
				cell3.innerHTML = "<input type=\"text\" onKeyUp=\"calFrameWamount(" + row_num + ", this)\" id=\"frame_type_count" + row_num + "\" name=\"count" + row_num + "\">";
				cell4.innerHTML = row_tmp.cells[4].innerHTML;
				cell5.innerHTML = row_tmp.cells[5].innerHTML;
				cell6.innerHTML = row_tmp.cells[6].innerHTML;
				cell7.innerHTML = "<span onClick=\"removeOneRow('frameTypeDetail', this)\" class=\"glyphicon glyphicon-minus-sign\">";
				
				$("#frame_materiel_seleted" + row_num).val(selected_value);
				$("#frame_type_count" + row_num).val(count_value);
				
			}else{
				cell0.innerHTML="<select class=\"input-mini\" id=\"frame_materiel_seleted" + row_num + "\" name=\"materiel_seleted" + row_num + "\" onChange=\"updateCellValue('frameTypeDetail', this)\" >" + $("#frame_materiel_seleted1").html() + "</select>";
				cell1.innerHTML="";
				cell2.innerHTML="";
				cell3.innerHTML="<input type=\"text\" onKeyUp=\"calFrameWamount(" + row_num + ", this)\" id=\"frame_type_count" + row_num + "\" name=\"count" + row_num + "\">";
				cell4.innerHTML="";
				cell5.innerHTML="";
				cell6.innerHTML="";
				cell7.innerHTML="<span onClick=\"removeOneRow('frameTypeDetail', this)\" class=\"glyphicon glyphicon-minus-sign\">";
			}
			$("#frame_materiel_seleted" + row_num).select2();
		}
		
	}
	//骨架材料，挂石材料明细项增加一行 ---结束
	
	//平板类材料明细项增加一行 ---开始
	if(table_name == 'slabTypeDetail'){
		var table = document.getElementById(table_name);
		var row_num = document.getElementById(table_name).rows.length;
		var row = table.insertRow(row_num);
		var cell0 = row.insertCell(0);
		var cell1 = row.insertCell(1);
		var cell2 = row.insertCell(2);
		var cell3 = row.insertCell(3);
		var cell4 = row.insertCell(4);
		var cell5 = row.insertCell(5);
		var cell6 = row.insertCell(6);
		var cell7 = row.insertCell(7);
		var cell8 = row.insertCell(8);
		var cell9 = row.insertCell(9);
		var cell10 = row.insertCell(10);
		var cell11 = row.insertCell(11);
		var cell12 = row.insertCell(12);
		var cell13 = row.insertCell(13);
		var cell14 = row.insertCell(14);
		
		//判断上一行是否已经有有效数据，是，则复制值到新的一行中
		if(row_num > 2){
			var row_tmp = table.getElementsByTagName("tr")[row_num - 1];
			
			if( $("#slab_materiel_seleted" + (row_num-2)).val() != null && $("#slab_materiel_seleted" + (row_num-2)).val().length > 0){
				slab_box_value = $("#slab_box" + (row_num-2)).val();
				selected_value = $("#slab_materiel_seleted" + (row_num-2)).val();
				slab_long = $("#slab_long" + (row_num-2)).val();
				count_value = $("#slab_count" + (row_num-2)).val();
				
				cell0.innerHTML = "<select class=\"input-mini\" id=\"slab_box" + (row_num - 1) + "\" name=\"box" + (row_num - 1) + "\"><option value=\"1\">1#<option value=\"2\">2#<option value=\"3\">3#<option value=\"4\">4#<option value=\"5\">5#</select>";
				cell1.innerHTML = "<select class=\"input-mini\" id=\"slab_materiel_seleted" + (row_num - 1) + "\" name=\"materiel_seleted" + (row_num - 1) + "\" onChange=\"updateCellValue('slabTypeDetail', this)\" >" + $("#slab_materiel_seleted1").html() + "</select>";
				
				cell2.innerHTML = "<input style=\"width:36px\" type=\"text\" id=\"slab_long" + (row_num - 1) + "\" name=\"slab_long" + (row_num - 1) + "\" onKeyUp=\"calSlabAmount(this)\">";;
				cell3.innerHTML = row_tmp.cells[3].innerHTML;
				cell4.innerHTML = row_tmp.cells[4].innerHTML;
				
				cell5.innerHTML = "<input style=\"width:36px\" type=\"text\" id=\"slab_count" + (row_num - 1) + "\" name=\"count" + (row_num - 1) + "\" onKeyUp=\"calSlabAmount(this)\">";
				
				cell6.innerHTML = row_tmp.cells[6].innerHTML;
				cell7.innerHTML = row_tmp.cells[7].innerHTML;
				cell14.innerHTML = "<span onClick=\"removeOneRow('slabTypeDetail', this)\" class=\"glyphicon glyphicon-minus-sign\">";
				$("#slab_box" + (row_num-1)).val(slab_box_value);
				$("#slab_materiel_seleted" + (row_num-1)).val(selected_value);
				$("#slab_long" + (row_num-1)).val(selected_value);
				$("#slab_count" + (row_num-1)).val(count_value);
				
			}else{
				cell0.innerHTML = "<select class=\"input-mini\" id=\"slab_box" + (row_num - 1) + "\" name=\"box" + (row_num - 1) + "\"><option value=\"1\">1#<option value=\"2\">2#<option value=\"3\">3#<option value=\"4\">4#<option value=\"5\">5#</select>";
				cell1.innerHTML = "<select class=\"input-mini\" id=\"slab_materiel_seleted" + (row_num - 1) + "\" name=\"materiel_seleted" + (row_num - 1) + "\" onChange=\"updateCellValue('slabTypeDetail', this)\" >" + $("#slab_materiel_seleted1").html() + "</select>";
				
				cell2.innerHTML = "<input style=\"width:36px\" type=\"text\" id=\"slab_long" + (row_num - 1) + "\" name=\"slab_long" + (row_num - 1) + "\" onKeyUp=\"calSlabAmount(this)\">";
				cell3.innerHTML = "";
				cell4.innerHTML = "";
				
				cell5.innerHTML = "<input style=\"width:36px\" type=\"text\" id=\"slab_count" + (row_num - 1) + "\" name=\"count" + (row_num - 1) + "\" onKeyUp=\"calSlabAmount(this)\">";
				
				cell6.innerHTML = "";
				cell7.innerHTML = "";
				cell14.innerHTML = "<span onClick=\"removeOneRow('slabTypeDetail', this)\" class=\"glyphicon glyphicon-minus-sign\">";
			}
			$("#slab_box" + (row_num-1)).select2();
			$("#slab_materiel_seleted" + (row_num-1)).select2();
		}
	}
	//平板类材料明细项增加一行 ---结束
	
	//门窗线框材料明细项增加一行--开始
	//门窗线框材料明细项增加一行--结束

}
