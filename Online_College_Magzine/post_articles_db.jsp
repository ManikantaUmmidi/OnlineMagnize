<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs;
	 String cat,tag,art,uid;
	 int i,j,k,artid;
%>

<%
	try{
	cat=request.getParameter("cat").trim();
    tag=request.getParameter("tag").trim();
    art=request.getParameter("article").trim();
	artid=Integer.parseInt(request.getParameter("aid"));

	uid=(String)session.getAttribute("uid");
	

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	stmt1=con.createStatement();
	con.setAutoCommit (false);
	i=stmt.executeUpdate("insert into articles values('"+artid+"','"+cat+"','"+tag+"','"+art+"','"+uid+"')");
 
	j=stmt1.executeUpdate("insert into articles_status values("+artid+",sysdate,'0','0','submitted',' ')");

  if(i==1 && j==1)
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="green">Article is saved Successfully.......<BR>
To add one more Article click on</font></strong>
<a href="post_articles.jsp"><h3 >BACK</h3></a>
</center>
</body>
<% i=0;j=0;
    con.commit();
	stmt.close();
	stmt1.close();
	con.close();
	}
	 else
	{
%>
<body>
<br>
<br><center>
<strong><font size="4" color="red">Due to internal ERROR ,Article is not Added. Try again.......</font></strong>
<a href="mem_home.jsp"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	con.rollback();
    stmt.close();
	stmt1.close();
	con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>