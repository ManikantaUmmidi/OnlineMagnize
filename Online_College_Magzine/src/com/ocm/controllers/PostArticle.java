package com.ocm.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocm.beans.Articles;
import com.ocm.services.AutourServices;


/**
 * Servlet implementation class PostArticle
 */
public class PostArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.setContentType("text/html");

		HttpSession session=request.getSession();
		
		String userid=(String)session.getAttribute("uid");
		
	String	cat=request.getParameter("cat").trim();
	   String  tag=request.getParameter("tag").trim();
	   String art=request.getParameter("article").trim();
		int artid=Integer.parseInt(request.getParameter("aid"));
		
		String status="rejected";
		
		Articles a=new Articles();
		
		a.setArticle_id(artid);
		a.setArticle(art);
		a.setCategory(cat);
		a.setPoster_id(userid);
		
		a.setStatus(status);
		a.setTag(tag);

		
		
		AutourServices services=new AutourServices();
		
		PrintWriter out=response.getWriter();
		try {
			boolean b=services.postArticle(a);
			
			if(b==true)
			{
				
				out.println("Posted Succesfully");
				RequestDispatcher rd=request.getRequestDispatcher("inbox1.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("oops ......................."); 
				RequestDispatcher rd=request.getRequestDispatcher("inbox1.jsp");
				rd.include(request, response);
			}
			
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}
