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

  <a  class="active" href="inbox.jsp"> Home</a>
  <a  class="active" href="new_articles1.jsp">Timeline </a>
  <a  class="active" href="mod_approve_articles.jsp">Review Articles </a>
  <a  class="active" href="logout.jsp"> Signout</a> 
</div>


<div id="mySidenav" class="sidenav">
  
  <a href="inbox2.jsp" id="cont">Inbox</a>
  
  <a href="post_articles2.jsp" id="conta">Post Articles</a>
  <a href="Update_Mod_Articles.jsp" id="contac">Update Articles</a>
  <a href="mod_update_profile.jsp" id="contui">Update Profile</a>
  <a href="comments1.jsp" id="co">Comments</a>
</div>

<%
Connection con=null;
Statement st=null;

int aid=Integer.parseInt(request.getParameter("aid"));




try
{
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from articles where ARTICLE_ID="+aid);
	
	
	if(rs.next())
	{
		
		
		session.setAttribute("aid", rs.getInt(1));
		
		String uid=(String)session.getAttribute("uid");
		System.out.println(uid);
		
		session.setAttribute("uid", uid);
		%>
		
		<div align="center"  ">
		
		
		<table>
		<h1>Review articles</h1>
		<tr>
		<form action="acceptarticle.jsp">
		<td>Article Id:</td>
		<td><input type="text" name="aid" value="<%=rs.getInt(1)%>" readonly="readonly"></td>
		</tr>
		
		<tr>
		<td>Category :</td>
		<td><input type="text" name="cat" value="<%=rs.getString(2)%>" readonly="readonly">
		</td></tr>
		
		<tr><td>Posted By</td>
		<td><input type="text" name="postby" value="<%=rs.getString(5)%>">
		</td></tr>
	
		<tr><td>
		Tag</td>
		
		<td><input type="text" name="tag" value="<%=rs.getString(3)%>">
		</td></tr>
		
		<tr><td>
		Article</td>
		<td>
	
	
	<textarea rows="" cols="" name="article"><%=rs.getString(4) %></textarea>
	</td></tr>
	<tr><td>
	
	Remarks</td>
	<td>
	<textarea rows="10" cols="17" name="article"></textarea>	
	</td></tr>
	<tr><td>
	<br>
	<input type="submit" value="Accept">
	</td></tr>
		</form>
		
		
		
		<a href="mod_approve_articles.jsp" style="text-decoration: no"><button>Back</button></a>
		
		</div>
		
		
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


</body>
</html>