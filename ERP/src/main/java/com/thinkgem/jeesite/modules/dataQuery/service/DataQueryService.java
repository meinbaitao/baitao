package com.thinkgem.jeesite.modules.dataQuery.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.MappedStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.modules.dataQuery.dao.DataQueryGetConn;

/**
 * SQL界面维护查询方法
 * @author zhoujs
 * @version 2016-3-10
 */
@Service
public class DataQueryService {
    
    public static Connection connection;
    public static PreparedStatement statement;
    public ResultSet resultSet;

    
    public ResultSet executeQuery(String sql) {
        try {
            connection = DataQueryGetConn.getMysqlConn();
            statement = connection.prepareStatement(sql, java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
                    java.sql.ResultSet.CONCUR_READ_ONLY);
            resultSet = statement.executeQuery();
            System.out.println("取得结果集");
        } catch (SQLException e) {
            // TODO: handle exception
            System.err.println("db.executeQuery: " + e.getMessage());
        }
        return resultSet;
    }

    /**
     * 关闭数据库结果集，数据库操作对象，数据库链接
     *
     * @Function: Close all the statement and conn int this instance and close
     *            the parameter ResultSet
     * @Param: ResultSet
     * @Exception: SQLException,Exception
     **/
    public void close() {

        if (statement != null) {
            try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            statement = null;
        }
        if (connection != null) {
            try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            connection = null;
        }
        //System.out.println("连接已关闭！");
    }
}
