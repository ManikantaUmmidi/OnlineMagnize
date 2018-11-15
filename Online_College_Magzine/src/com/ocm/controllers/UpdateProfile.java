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
import com.ocm.dao.AuthorUpdateDAO;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
			String uid,pass,mname,mobile,email,addr,status;
			HttpSession se=request.getSession();
			uid=(String)se.getAttribute("uid");
		pass=request.getParameter("pass").trim();
		mname=request.getParameter("mname").trim();
		mobile=request.getParameter("mobile").trim();
		email=request.getParameter("email").trim();
		addr=request.getParameter("addr").trim();
		status=request.getParameter("status");
		Member_profile mem=new Member_profile();
		mem.setMem_login_id(uid);
		mem.setPasssword(pass);
		mem.setMobile(mobile);
		mem.setEmail(email);
		mem.setAddress(addr);
		mem.setStatus(status);
		AuthorUpdateDAO au=new AuthorUpdateDAO();
		boolean b=au.updateProfile(mem);
		if(b==true)
		{
			out.println("profile updated successfully");
			RequestDispatcher rd=request.getRequestDispatcher("mem_update_profile.jsp");
			rd.include(request, response);
		}
		else
		{
			out.println("profile updation failed");
			RequestDispatcher rd=request.getRequestDispatcher("mem_update_profile.jsp");
			rd.include(request, response);
		}

	}

}
