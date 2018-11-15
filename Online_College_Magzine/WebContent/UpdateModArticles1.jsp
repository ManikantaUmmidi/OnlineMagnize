<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,s;
	 ResultSet rs;
	 String uid,opt,art;int aid,a,as;
	 RequestDispatcher rd;
%>

<%
try{
	try
	{
     uid=(String)session.getAttribute("uid");
	}
	catch(Exception e)
	{
		rd=request.getRequestDispatcher("head.html");
	}
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
     String aid=request.getParameter("aid");
	   stmt=con.createStatement();
       rs=stmt.executeQuery("select article from articles where article_id="+aid+"");

	   if(rs.next())
		{
%>
<html>
<HEAD>

</HEAD>
<body><BR><BR><BR>
<form action="UpdateModArticles1">
<table  align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article id</font></strong></td>
   <td align="center"><strong><font size="2" color="maroon"><INPUT TYPE="text" NAME="aid" value="<%=aid%>"></font></strong></td></tr>
<tr>
   <td align="center"><strong><font size="4" color="maroon">Article </font></strong></td>
   <td align="center"><strong><font size="2" color="maroon"><textarea NAME="article" rows="5" cols="18"><%=rs.getString(1)%></textarea></font></strong></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="SUBMIT" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table></form></body></html>
 
<%
		}//if
     stmt.close();
	 con.close();
	


}//try
catch(Exception e)
{
	e.printStackTrace();
}
%>

