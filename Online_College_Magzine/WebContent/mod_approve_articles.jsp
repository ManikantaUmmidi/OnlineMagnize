<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String category,uid;int i;
%>

<%
	try{

    uid=(String)session.getAttribute("uid");
    System.out.println("Uid Is :"+uid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
    stmt1=con.createStatement();
	rs1=stmt1.executeQuery("select category from moderator_profile where mod_login_id='"+uid+"'");
	if(rs1.next())
		category=rs1.getString(1);
	stmt1.close();
    session.setAttribute("categ",category);
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from articles where category='"+category+"' and status='rejected'");
	
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
    top: 130px;
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
    background-color: #f44336
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
<BR><BR>
<BR>
<table align="center"  cellpadding="3" cellspacing="5" border="3">
<tr><td align="center"><strong><font size="4" >Category</font></strong></td>
<td align="center" colspan="3" ><input type="text" name="categ" value=<%=category%> ></td>
</tr>
<%
	while(rs.next())
	{
%>
 
<tr>
<td style=" font-family: verdana;font-size: 14pt;"><%=rs.getInt(1) %></td>
<td style=" font-family: verdana;font-size: 14pt;"><%=rs.getString(2) %></td>
<td style=" font-family: verdana;font-size: 14pt;"><%=rs.getString(3) %></td>
<td  style=" font-family: verdana;font-size: 14pt;"><%=rs.getString(5) %></td>
<td style=" font-family: verdana;font-size: 14pt;"><a href="reviewarticles.jsp?aid=<%=rs.getInt(1) %>" style="text-decoration: none" target="home">Review</a></td>
</tr>


	
<%
	}

%>
	</table>
 </body></HTML>
<%
}
catch(Exception e)
{
	e.printStackTrace();
	
}
%>