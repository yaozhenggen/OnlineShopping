package com.cai;

import java.sql.*;
public class Dao {
	private String url;
	private String user;
	private String pwd;
	private Connection  conn;
	private Statement stmt;
	private ResultSet rs;
	public Dao() {
		url="jdbc:mysql://localhost:3306/userdb";
		user="root";
		pwd="123";
		conn=null;
		stmt=null;
		rs=null;
	}
	public Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url, user, pwd);
		return conn;				
	}
	public ResultSet executeQuery(String sql) throws ClassNotFoundException, SQLException{
		conn=getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		return rs;
	}
	public int execteUpdate(String sql) throws ClassNotFoundException, SQLException{
		conn=getConnection();
		stmt=conn.createStatement();
		return stmt.executeUpdate(sql);
	}
	public void close() throws SQLException{
		if(rs!=null)
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(conn!=null)
			conn.close();
	}
}
