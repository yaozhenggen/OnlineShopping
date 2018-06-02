package com.cai.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cai.Books;
import com.cai.Dao;

@WebServlet("/start")
public class Start extends HttpServlet{
	private static ArrayList bookslist=new ArrayList();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//连接到数据库，并读取数据
		Dao dao=new Dao();
		String sql="select * from book";
		try {
			ResultSet rs=dao.executeQuery(sql);
			//遍历rs集
			while(rs.next()){
				Books single=new Books();
				single.setBookname(rs.getString(1));
				single.setAuthor(rs.getString(2));
				single.setPression(rs.getString(3));
				single.setPrice(rs.getFloat(4));
				single.setNum(1);
				bookslist.add(single);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session=req.getSession();
		session.setAttribute("bookslist", bookslist);
		resp.sendRedirect("show.jsp");
	}
	
}
