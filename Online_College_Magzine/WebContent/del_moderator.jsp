<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String uid,status;
%>

<%
	try{

	uid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select mod_login_id from moderator_profile");
%>
<html>
<HEAD>
<script language="javascript">
	function f()
     {
         a=window.confirm("Are u sure ?");
         if(a)
            return true;
	     else 
	        return false;
    }
</script> 
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
    top: 120px;
    background-color: #4CAF50;
}

#blog {
    top: 180px;
    background-color: #2196F3;
}

#projects {
    top: 230x;
    background-color: #f44336;
}

#cont {
    top: 240px;
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
    top: 410px;
    background-color:yellow
}


#co {
    top: 460x;
    background-color: violet
}
</style>
</HEAD>
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
<BR><BR>
<form action="mod_delete.jsp" onsubmit="return f()">
<table  align="center" cellpadding="3" cellspacing="5" >
<tr>
   <td align="center"><strong><font size="4" >Select Moderator Id</font></strong></td>
   <td align="center">
<select name="mid">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>
<%
	}
%>
</select></td>
<%
	stmt.close();
	con.close();
	}
	catch(Exception e)
{
	e.printStackTrace();
}
%>
<td colspan="2" align="center" ><input type="submit" value="Delete" ></td>
</tr>
</table>
</form>
</body></HTML>
