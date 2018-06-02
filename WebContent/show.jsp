<%@page import="com.cai.Books"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//从session中读取数据
	ArrayList bookslist=(ArrayList)session.getAttribute("bookslist");
	//分页功能
	int pageSize=5;  //页面大小
	int cpage;   //当前页码
	int rowCount;  //总记录数
	int pageCount;  //总页码
	//实现过程省略
%>
<table border="1" width="750">
	<tr height="50">
		<td colspan="5" align="center">欢迎选购，商品如下</td>
	</tr>
	<tr align="center"> 
		<td>商品名称</td>
		<td>作者</td>
		<td>出版社</td>
		<td>价格</td>
		<td>购买</td>
	</tr>
	<%
		//遍历数据
		if(bookslist==null||bookslist.size()==0){
	%>
			<tr height="100">
				<td colspan="5">没有要显示的商品！</td>
			</tr>
	<%
		}else{
		
			for(int i=0;i<bookslist.size();i++){
				Books book=(Books)bookslist.get(i);
	%>
	<tr height="50" align="center">
		<td><%=book.getBookname() %></td>
		<td><%=book.getAuthor() %></td>
		<td><%=book.getPression() %></td>
		<td><%=book.getPrice() %></td>
		<td><a href="doCar?action=buy&id=<%=i %>">购买</a></td>
	</tr>
	<%
			}
		}	
	%>
	<tr height="100">
		<td align="center" colspan="5">
		<a href="shopcar.jsp">查看购物车</a></td>
	</tr>
</table>
</body>
</html>