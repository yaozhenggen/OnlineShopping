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
	//购物车
	ArrayList buylist=(ArrayList)session.getAttribute("buylist");
	float total=0;
%>
<table border="1"> 
	<tr height="50">
		<td colspan="7">您购买的商品如下：</td>		
	</tr>
	<tr align="center" height="30">
		<td>商品名称</td>
		<td>作者</td>
		<td>出版社</td>
		<td>价格</td>
		<td>数量</td>
		<td>总价</td>
		<td>移除</td>
	</tr>
<%
	if(buylist==null||buylist.size()==0){
%>
	<tr>
		<td colspan="7">您的购物车为空！</td>
	</tr>
	<%
	}
	else{
		for(int i=0;i<buylist.size();i++){
			Books single=(Books)buylist.get(i);
			String name=single.getBookname();
			String author=single.getAuthor();
			String pression=single.getPression();
			float price=single.getPrice();
			int num=single.getNum();
			float money=((int)((price*num+0.05f)*10))/10f;
			total+=money;
	%>
	<tr height="50">
		<td><%=name %></td>
		<td><%=author %></td>
		<td><%=pression %></td>
		<td><%=price %></td>
		<td><%=num %></td>
		<td><%=money %></td>
		<td><a href="doCar?action=remove&name=<%=single.getBookname() %>">移除</a></td>
	</tr>

<%
		}
	}
	%>
	<tr height="30">
		<td colspan="2">应付金额：<%=total %></td>
		<td colspan="2"><a href="show.jsp">继续购物</a></td>
		<td colspan="3"><a href="doCar?action=clear">清空购物车</a></td>
	</tr>
</table>
</body>
</html>