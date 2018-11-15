<%@page import="java.sql.*"%>
<%!
 Connection con;
 PreparedStatement  pst=null; 
 Statement stmt;
 ResultSet rs;
String mid,pass,mname,addr,email,mobile;int i;
String status="Not Activated";

%>
<%
  try{
	
	mname=request.getParameter("mname").trim();
	mid=request.getParameter("mid").trim();
	pass=request.getParameter("pass").trim();
	mobile=request.getParameter("mobile").trim();
	email=request.getParameter("email").trim();
	addr=request.getParameter("addr").trim();

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm","ocm");

	
	pst=con.prepareStatement("insert into member_profile values(?,?,?,?,?,?,?)");

	pst.setString(1,mid);
	pst.setString(2,pass);
	pst.setString(3,mname);
	pst.setString(4,email);
	pst.setString(5,mobile);
	pst.setString(6,addr);
	pst.setString(7, status);

	i=pst.executeUpdate();
	
	
	
	//stmt=con.createStatement();
	//rs=stmt.executeQuery("select * from members");

  /* while(rs.next())
	{
	if(mid.equals(rs.getString(1)))
		{

			pst=con.prepareStatement("insert into member_profile values(?,?,?,?,?,?)");

			pst.setString(1,mid);
			pst.setString(2,pass);
			pst.setString(3,mname);
			pst.setString(4,email);
			pst.setString(5,mobile);
			pst.setString(6,addr);

			i=pst.executeUpdate();
		}
	}
  stmt.close(); */
if(i==1)
	{
%>
<HTML>
<HEAD>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.bg-img {
  /* The image used */
  background-image: url("image4.jpg");

  min-height: 100%;
  background-position:top-left;
  background-repeat: no-repeat;

  /* Needed to position the navbar */
  position: relative;
  
}

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

</style>
</HEAD>
<body>
<div class="navbar">
  
   <a class="active" href="head.html"><i class="fa fa-fw fa-home"></i>home</a> 
    <a class="active" href="mod_login.html"><i class="fa fa-fw fa-home"></i>Reviewer</a>   
</div>
<br>
<br><center>
<h1>You Have Successfully Registered.......<br>
Please Wait for Admin Confirmation</h1>
<br>
<br>
<font  size=4>Click <a href="mem_login.html">here</a> to login</font>
</center>
</body><HTML>
<%
	pst.close();
    con.close();
	}
    else
	{
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body>
<br>
<br><center>
<strong>

Oops .... SomeThing Goes Wrong?
<br>

Please contact Admin
</strong>
<a href="mem_login.html"><h3>BACK</h3></a>
</center>
</body></HTML>
<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>