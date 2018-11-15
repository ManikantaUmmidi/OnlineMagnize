package com.ocm.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocm.dao.ArticleUpdateDAO;
import com.ocm.dao.AuthorUpdateDAO;

/**
 * Servlet implementation class UpdateArticles1
 */
public class UpdateArticles1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateArticles1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int aid=Integer.parseInt(request.getParameter("aid"));
		String article=request.getParameter("article");
		ArticleUpdateDAO au=new ArticleUpdateDAO();
		RequestDispatcher rd;
		boolean b=au.updateArticle(article, aid);
		if(b==true)
		{
			out.println("update successful");
			rd=request.getRequestDispatcher("Update_Mem_Articles.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("update failed");
			rd=request.getRequestDispatcher("Update_Mem_Articles.jsp");
			rd.include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
