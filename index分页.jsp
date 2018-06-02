
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>id</td>
		<td>姓名</td>
		<td>性别</td>
		<td>年龄</td>
		<td>email</td>
		<td>手机号码</td>
	</tr>

<%
	int pageSize=5;  //页面大小
	int cpage;   //当前页码
	int rowCount;  //总记录数
	int pageCount;  //总页码
	//1加载驱动
	Class.forName("com.mysql.jdbc.Driver");
	//2创建连接
	String url="jdbc:mysql://localhost:3306/studb";
	String username="root";
	String password="123";
	Connection conn=DriverManager.getConnection(url, username, password);
	//3.发送一个SQL语句
	Statement stmt=conn.createStatement();
	//4.执行SQL语句
	String sql="select * from stud";
	ResultSet rs=stmt.executeQuery(sql);
	//5.遍历rs
	
	String strPage=request.getParameter("cpage");// 先获得当前页码
	if(strPage==null){
		cpage=1;  //如没有页码，置当前页码为1
	}
	else{
		cpage=(Integer.parseInt(strPage)); //否则获取页码值
	}
	if(cpage<1){   //如果到第一页，当前页码值为1
		cpage=1;
	}	
	rs.last();   //指针定位到最后一条记录
	rowCount=rs.getRow();  //获取记录数
	pageCount=(rowCount+pageSize-1)/pageSize;  //计算总页码
	if(cpage>pageCount){
		cpage=pageCount;   //到最后页码将当前页码置为总页数
	}
	if(pageCount>0){   //记录从0开始，页码从1开始
		rs.absolute((cpage-1)*pageSize+1);  //如果有数据，让指针回第一条记录
	}
	int i=0;
	while(i<pageSize&&!rs.isAfterLast()){
		%>
	<tr>
		<td><%=rs.getInt(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getInt(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
	</tr>
	<%
		rs.next();  //指针下移
		i++;
	}
	
%>
</table>
当前页数<%=cpage %>/<%=pageCount %>&nbsp;&nbsp;
<%
	if(cpage>1){
%>
<a href="index.jsp?cpage=1">第一页</a>
<a href="index.jsp?cpage=<%=cpage-1 %>">上一页</a>

<%		
	}
	if(cpage<pageCount){
%>
<a href="index.jsp?cpage=<%=cpage+1 %>">下一页</a>
<a href="index.jsp?cpage=<%=pageCount %>">尾页</a>
<%
	}
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>