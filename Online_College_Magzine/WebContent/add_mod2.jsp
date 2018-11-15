<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 PreparedStatement pst;
	 ResultSet rs;
	 String mid,mname,pass,mobile,email,cat;
	 int i;
%>

<%
	try{
	mid=request.getParameter("id").trim();
	mname=request.getParameter("name").trim();
    pass=request.getParameter("pass").trim();
	cat=request.getParameter("cat").trim();
	mobile=request.getParameter("mobile").trim();
	email=request.getParameter("email").trim();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	
	pst=con.prepareStatement("insert into moderator_profile values(?,?,?,?,?,?)");
	
	pst.setString(1,mid);
	pst.setString(2,pass);
	pst.setString(3,mname);
	pst.setString(4,email);
	pst.setString(5,mobile);
	pst.setString(6,cat);

	i=pst.executeUpdate();
   
	if(i==1)
	{
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
  <a href="post_articles.jsp" id="conta">Post Articles</a>
  <a href="update_articles.jsp" id="contac">Update Articles</a>
  <a href="maintain_articles.jsp" id="conti">View Articles</a>
  <a href="all_Not_Activated_members.jsp" id="contui">Activate Members</a>
  <a href="del_moderator.jsp" id="co">Delete Moderator</a>
  
  
  
  
  
</div>
<br>
<br><center>
<strong><font size="4" color="white">Moderator  <%=mname%> is added Successfully.......<BR>
To add one more Moderator click on</font></strong>
<a href="add_moderator.jsp"><h3 color="white">BACK</h3></a>
</center>
</body>
<% i=0;
	pst.close();
	con.close();
	}
	 else
	{
%>
<HTML>
<HEAD>

</HEAD>
<body>
<br>
<br><center>
<strong><font size="4" color="red">Due to internal ERROR ,Moderator details are not Added.<br> Try again.......</font></strong>
<a href="admin_home.jsp"><h3 color="green">HOME</h3></a>
</center>
</body></HTML>
<%
	pst.close();
	con.close();
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>