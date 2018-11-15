package com.ocm.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kite.ocm.db.DBConnection;
import com.ocm.dao.ArticleUpdateDAO;

/**
 * Servlet implementation class UpdateArticles
 */
public class UpdateModArticles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateModArticles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String uid,opt;
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		Connection con=DBConnection.getConnection();
		int aid;
		RequestDispatcher rd;
		 uid=(String)session.getAttribute("uid");
	     aid=Integer.parseInt(request.getParameter("aid"));
		 opt=request.getParameter("option");
		 if(opt.equalsIgnoreCase("edit"))
		 {
			 rd=request.getRequestDispatcher("UpdateModArticles1.jsp");
			 rd.forward(request,response);
			  
		 }
		 else if(opt.equalsIgnoreCase("delete"))
		 {
			 ArticleUpdateDAO au=new  ArticleUpdateDAO();
			 boolean b=au.articleDelete(aid);
			 if(b==true)
			 {
				 out.println("Article deleted successfully");
				 rd=request.getRequestDispatcher("Update_Mod_Articles.jsp");
				 rd.include(request, response);
			 }
			 else
			 {
				 out.println("Article deletion failed");
				 rd=request.getRequestDispatcher("Update_Mod_Articles.jsp");
				 rd.include(request, response);
			 }
			 
		 }

	}

}
