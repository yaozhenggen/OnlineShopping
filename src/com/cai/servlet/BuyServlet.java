package com.cai.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cai.Books;
import com.cai.Tools;
import com.cai.javabean.ShopCar;

@WebServlet("/doCar")
public class BuyServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action=req.getParameter("action");
		if(action==null)
			action="";
		if(action.equals("buy"))
			buy(req,resp);
		if(action.equals("remove"))
			remove(req,resp);
		if(action.equals("clear"))
			clear(req,resp);
	}

	private void clear(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session=req.getSession();
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");
		buylist.clear();
		resp.sendRedirect("shopcar.jsp");
	}

	private void remove(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session=req.getSession();
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");
		
		String name=req.getParameter("name");
		ShopCar myCar=new ShopCar();
		myCar.setBuylist(buylist);
		myCar.removeItem(Tools.toChinese(name));
		resp.sendRedirect("shopcar.jsp");
	}

	private void buy(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session=req.getSession();
		String strid=req.getParameter("id");
		int id=Integer.parseInt(strid);
		ArrayList bookslist=(ArrayList)session.getAttribute("bookslist");
		Books single=(Books)bookslist.get(id);
		
		ArrayList buylist=(ArrayList)session.getAttribute("buylist");
		if(buylist==null){
			buylist=new ArrayList();
		}
		 ShopCar myCar=new ShopCar();
		 myCar.setBuylist(buylist);
		 myCar.addItem(single);
		 
		 session.setAttribute("buylist", buylist);
		 resp.sendRedirect("show.jsp");
	}
	
}
