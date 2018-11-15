<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String uid,status;
%>

<%
	try{

	uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select article_id from articles where poster_id='"+uid+"'");
      
%>
 <html>
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
    top: 230x;
    background-color: #f44336;
}

#cont {
    top: 90px;
    background-color:pink
}
#conta {
    top: 140px;
    background-color: blue
}
#contac {
    top: 200px;
    background-color: orange
}
#conti {
    top: 470px;
    background-color:red
}
#contui {
    top: 260px;
    background-color:yellow
}
#co {
    top: 320px;
    background-color: violet
}
</style>
</HEAD>
<body>
<div class="navbar">

  <a  class="active" href="inbox2.jsp"> Home</a>
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
<form action="UpdateModArticles">
<table  align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" color="maroon">Select Article Id</font></strong></td>
   <td align="center">
<select name="aid">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%>
<%
	}
%>
</select></td>
<td align="center"><select name="option"><option value="edit" >EDIT<option value="delete" >DELETE</select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="  OK  "></td>
</tr>
</table></form></body></html>
<%
	stmt.close();
	con.close();
	}
	catch(Exception e)
{
	e.printStackTrace();
}
%>