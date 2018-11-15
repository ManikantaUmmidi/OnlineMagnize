package com.ocm.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocm.beans.Member_profile;
import com.ocm.beans.Moderator_profile;

import com.ocm.dao.ReviewerUpdateDAO;

/**
 * Servlet implementation class UpdateModProfile
 */
public class UpdateModProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateModProfile() {
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
			String uid,pass,mname,mobile,email,category;
			HttpSession se=request.getSession();
			uid=(String)se.getAttribute("uid");
		pass=request.getParameter("pass").trim();
		mname=request.getParameter("mname").trim();
		mobile=request.getParameter("mobile").trim();
		email=request.getParameter("email").trim();
		category=request.getParameter("category").trim();
		Moderator_profile mem=new Moderator_profile();
		mem.setMod_login_id(uid);
		mem.setName(mname);
		mem.setPasssword(pass);
		mem.setMobile(mobile);
		mem.setEmail(email);
		mem.setCategory(category);
		
		ReviewerUpdateDAO au=new ReviewerUpdateDAO();
		boolean b=au.updateReviewerDetails(mem);
		if(b==true)
		{
			out.println("profile updated successfully");
			RequestDispatcher rd=request.getRequestDispatcher("mod_update_profile.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("profile updation failed");
			RequestDispatcher rd=request.getRequestDispatcher("mod_update_profile.jsp");
			rd.include(request, response);
		}


	}

}
