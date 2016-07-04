package com.thinkgem.jeesite.modules.dataQuery.web;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.modules.dataQuery.service.DataQueryService;

/**
 * SQL界面维护查询
 * @author zhoujs
 * @version 2016-3-10
 */
@Controller
@RequestMapping(value = "${adminPath}/dataQuery/dataQuery")
public class DataQueryController {

	@Autowired
	private DataQueryService dataQueryService;
	
	@RequestMapping(value="query")
	public String selectQuery(HttpServletRequest request,HttpServletResponse response){
		ResultSet resultSet = null;
		
		String sqlStatement = request.getParameter("sqlStatement");
		
		if (sqlStatement == null) {
			sqlStatement = "";
		}
		String select = ".*[Ss][Ee][Ll][Ee][Cc][Tt].*";
		String updata = ".*[Uu][Pp][Dd][Aa][Tt][Ee][^_].*";
		String delete = ".*[Dd][Ee][Ll][Ee][Tt][Ee].*"; 
		
		Boolean isSelect = sqlStatement.matches(select);
		Boolean isUpdate = sqlStatement.matches(updata);
		Boolean isDelete = sqlStatement.matches(delete);
		Boolean onlySelect = null;
		
		if (isSelect&&!isUpdate&&!isDelete) {
			onlySelect = true;
		}else {
			onlySelect = false;
		}
		
		if (onlySelect) {
			try {
				//String sql = "select * from btg_project";
				resultSet = dataQueryService.executeQuery(sqlStatement);
				int column = resultSet.getMetaData().getColumnCount();
							
				List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
				try {
					while (resultSet.next()) {
						Map<String, Object> map = new HashMap<String, Object>();
						for (int i = 1; i <= column; i++) {
							map.put("data" + i, resultSet.getString(i));
							// System.out.println(resultSet.getString(i));
						}
						
						list.add(map);
						//System.out.println(map);
					}
					
					request.setAttribute("inputSql", sqlStatement);
					request.setAttribute("onlySelect", onlySelect);
					request.setAttribute("column",column);
					request.setAttribute("list", list);
					//System.out.println(list);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					onlySelect = false;
					e.printStackTrace();
					request.setAttribute("SQLException",e);
				}

			} catch (Exception e) {
				// TODO: handle exception
				onlySelect = false;
				e.printStackTrace();
				request.setAttribute("Exception",e);
			} finally {
				dataQueryService.close();
			}
		}else {
			request.setAttribute("inputSql", sqlStatement);
			request.setAttribute("msg","Only Can Select !!!" );
			//System.out.println("Only Can Select !!!");
		}
		return "modules/dataQuery/dataQuery";
	}
}
