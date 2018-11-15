<html>
<head>
<!-- <link rel="stylesheet" href="style.css"></link> -->
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
    top: 60px;
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
<a  class="active" href="in.jsp">Home</a>
  <a  class="active" href="new_articles.jsp">Articles</a>
  <a  class="active" href="most_visited_articles.jsp">Most visited </a>
  <a  class="active" href="logout.jsp"> Signout</a> 
</div>
<br>
<br>
<br>
<br>
<div id="mySidenav" class="sidenav">
  <a href="inbox.jsp" id="about">Admin Home</a>
  <a href="viewactivemembers.jsp" id="blog">Active Members</a>
  <a href="inbox.jsp" id="projects">Inbox</a>
  <a href="add_moderator.jsp" id="cont">Add Moderator</a>
  <a href="post_articles.jsp" id="conta">Post Articles</a>
  <a href="update_articles.jsp" id="contac">Update Articles</a>
  <a href="maintain_articles.jsp" id="conti">View Articles</a>
  <a href="all_Not_Activated_members.jsp" id="contui">Activate Members</a>
  <a href="del_moderator.jsp" id="co">Delete Moderator</a>
  
  
  
  
  
</div>

<br><BR>
<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String qstr;int aid,i;
%>

<%
   try
   {
	   System.out.println("bc1");
   	Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("bc2");	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
    stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
	rs=stmt.executeQuery("select article_id,date_of_post from articles_status where status='accepted'  order by date_of_post");
    rs.afterLast();
	System.out.println("hey");
	stmt1=con.createStatement();
   
%>

<%
  i=0;
	while(rs.previous() && i<3)
	{
		i++;
	   aid=rs.getInt(1);
       rs1=stmt1.executeQuery("select * from articles where article_id='"+aid+"'");
       while(rs1.next())
		{
%>
      <p><acronym title="type tag in search to view article">
      <table align="center">
	  <td><b><%=rs1.getString(3)%></b></td><td><%=rs1.getString(4)%></td>
	  </table>
	  </acronym></p>
<%
		}//rs1
    }//rs
	i=0;
	stmt.close();
	stmt1.close();
	con.close();
%>

<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
