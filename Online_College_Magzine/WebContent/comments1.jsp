<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String work=""; 
%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	stmt1=con.createStatement();
	rs=stmt.executeQuery("select a.article_id,a.article,c.comments from articles a,comments c where c.article_id=a.article_id");
%>
<HTML>
<HEAD>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

.navbar {
  width: 100%;
  background-color: orange;
  overflow: auto;
}

.navbar a {
  float: left;
  padding: 12px;
  color: pink;
  text-decoration: none;
  font-size: 17px;
}


.active {
  background-color: purple;
}

@media screen and (max-width: 500px) {
  .navbar a {
    float: none;
    display: block;
  }
}

#mySidenav a {
    position: absolute;
    left: -80px;
    transition: 0.3s;
    padding: 15px;
    width: 90px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
    left: 0;
}

#about {
    top: 90px;
    background-color: #4CAF50;
}

#blog {
    top: 160px;
    background-color: #2196F3;
}

#projects {
    top: 190x;
    background-color: #f44336;
}

#cont {
    top: 240px;
    background-color:#f44336
}
#conta {
    top: 280px;
    background-color: blue
}
#contac {
    top: 340px;
    background-color: orange
}
#conti {
    top: 400px;
    background-color:red
}
#contui {
    top: 400px;
    background-color:yellow
}
#co {
    top: 460px;
    background-color: violet
}
</style>

</HEAD>
<body>
<div class="navbar">

  <a  class="active" href="inbox.jsp"> Home</a>
  <a  class="active" href="new_articles1.jsp">Timeline </a>
  <a  class="active" href="mod_approve_articles.jsp">Review Articles </a>
  <a  class="active" href="logout.jsp"> Signout</a> 
</div>
<br>
<br>
<br>
<br>
<div id="mySidenav" class="sidenav">
  
  <a href="inbox2.jsp" id="cont">Inbox</a>
  
  <a href="post_articles2.jsp" id="conta">Post Articles</a>
  <a href="Update_Mod_Articles.jsp" id="contac">Update Articles</a>
  <a href="mod_update_profile.jsp" id="contui">Update Profile</a>
  <a href="comments1.jsp" id="co">Comments</a>
</div>
  
<BR><BR>

<h2 align="center">Comments Details </h2>
<table align="center"  cellpadding="3" cellspacing="5" border="1">
<tr>
   <td align="center"><strong><font size="4" >Article Id</font></strong></td>
   <td align="center"><strong><font size="4" >Article</font></strong></td>
   <td align="center"><strong><font size="4" >Comment</font></strong></td>
 </tr>
<%
	while(rs.next())
	{
%>
 <tr>
   <td align="center"><font size="2" ><%=rs.getInt(1)%></font></td>
   <td align="center"><font size="2" ><%=rs.getString(2)%></font></td>
   <td align="center"><font size="2" ><%=rs.getString(3)%></font></td>
 </tr>
<%
    }
%>
</table></body></HTML>
<%
	stmt.close();stmt1.close();con.close();
  }
catch(Exception e)
{
	e.printStackTrace();
}
%>
