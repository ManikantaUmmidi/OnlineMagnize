<%@page import="com.kite.ocm.db.DBUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    top: 460px;
    background-color:yellow
}
#co {
    top: 520px;
    background-color: violet
}
</style>

</head>
<body>
<div class="navbar">
<a  class="active" href="inbox1.jsp">Home</a>
  <a  class="active" href="new_articles2.jsp">Articles</a>
  <a  class="active" href="most_visited_articles2.jsp">Most visited </a>
  <a  class="active" href="logout.jsp"> Signout</a> 
</div>
<div id="mySidenav" class="sidenav">
  
  <a href="inbox1.jsp" id="cont">Inbox</a>
  
  <a href="post_articles1.jsp" id="conta">Post Articles</a>
  <a href="Update_Mem_Articles.jsp" id="contac">Update Articles</a>
  <a href="mem_veiwarticles.jsp" id="conti">View Articles</a>
  <a href="mem_update_profile.jsp" id="contui">Update Profile</a>
  <a href="comments.jsp" id="co">Comments</a>
</div>
<h1 align="center"> Articles</h1>


<table align="right">

<tr>
<td>Article Id</td>
<td>Category</td>
<td>Article Tag</td>

<td>Article </td>
<td>Posted By</td>
<td>Comment</td>
</tr>


<%
Connection con=null;
Statement st,st1,st2=null;

ResultSet rs=null;


String memId=(String)session.getAttribute("uid");

//session.setAttribute("uid", memId);

try
{

	Class.forName(DBUtilities.DRIVER_NAME);
	con=DriverManager.getConnection(DBUtilities.DRIVER_URL, DBUtilities.USERNAME, DBUtilities.PASSWORD);
	
	
	st=con.createStatement();
	
	
	rs=st.executeQuery("select * from articles where status='accepted' and NOT POSTER_ID='"+memId+"'");
	while(rs.next())
	{
		
		%>
		<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>

<td><%=rs.getString(4) %> </td>
<td><%=rs.getString(5) %></td>
<td><a href="storecomments.jsp?aid=<%=rs.getInt(1)%>&uid=<%=memId%>">Comment</a></td>
</tr>
		
		<%
		
		
	}
}
	catch(Exception e)
{
	e.printStackTrace();
}
finally
{
	con.close();
}

%>
</table>


</body>
</html>