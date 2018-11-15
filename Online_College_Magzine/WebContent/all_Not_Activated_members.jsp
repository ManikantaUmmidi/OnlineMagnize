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
    top: 220px;
    background-color:pink
}
#conta {
    top: 280px;
    background-color: blue
}
#contac {
    top: 280px;
    background-color: orange
}
#conti {
    top: 340px;
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
</head>
<body>
<div class="navbar">
<a  class="active" href="in.jsp">Home</a>
  <a  class="active" href="new_articles.jsp">Articles</a>
  <a  class="active" href="most_visited_articles.jsp">Most visited </a>
  <a  class="active" href="logout.jsp"> Signout</a> 
</div>
<div id="mySidenav" class="sidenav">
  <a href="inbox.jsp" id="about">Admin Home</a>
  <a href="viewactivemembers.jsp" id="blog">Active Members</a>
  <a href="inbox.jsp" id="projects">Inbox</a>
  <a href="add_moderator.jsp" id="cont">Add Moderator</a>
  <a href="update_articles.jsp" id="contac">Update Articles</a>
  <a href="maintain_articles.jsp" id="conti">View Articles</a>
  <a href="all_Not_Activated_members.jsp" id="contui">Activate Members</a>
  <a href="del_moderator.jsp" id="co">Delete Moderator</a>
  
  
  
  
  
</div>
<div align="center">
<h1 >Activate Members</h1>


<table border="2" >
<tr>
<td>Member Id</td>
<td>Member Name</td>
<td>Member Email</td>
<td>Mobile</td>

<td>Activate</td>
</tr>
<%

Connection con=null;
Statement st=null;

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	st=con.createStatement();
     ResultSet rs=  st.executeQuery("select * from member_profile where status='Not Activated'");


     
     while(rs.next())
     {
    	 %>
    	 
    	 
    	 
    	 <tr>
    	<td><%=rs.getString(1) %></td>
    	<td><%=rs.getString(3) %></td>
    	<td><%=rs.getString(4) %></td>
    	<td><%=rs.getString(5) %></td>
    	<td><a href="activate.jsp?mid=<%=rs.getString(1)%>">Activate</a></td>
    	 
    	 </tr>
    	 
    	 
    	 
    	
    	 
    	 <%
    	 
     }
}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</table>

</div>
<%-- <jsp:include page="admin_home.html"></jsp:include> --%>


</body>
</html>