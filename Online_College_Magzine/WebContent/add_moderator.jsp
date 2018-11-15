<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
%>

<%
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	//stmt2=con.createStatement();
	rs=stmt.executeQuery("select * from categories");
	//rs1=stmt2.executeQuery("selct * from MEMBER_PROFILE ");
%>
<html>
<head>
<script language=javascript>
function validate()
{
  if(document.form1.name.value=="")
   {
	     alert("Please enter Moderator name ...");
         document.form1.name.focus();
		 return false;
	}
  if(document.form1.id.value=="")
	 {
	     alert("Please enter Moderator ID ...");
         document.form1.id.focus();
		 return false;
	 }
  if(document.form1.pass.value=="")
	 {
	     alert("Please enter the password ...");
         document.form1.pass.focus();
		 return false;
	  }
  if(document.form1.pass.value.length<4)
	{
         alert("Password should be atleast 4 charecters");
         document.form1.pass.focus();
		 document.form1.pass.value="";
		 return false;
	}
  if(document.form1.pass.value!=document.form1.cpass.value)
    {
         alert("Password and Confirm password should be same.");
         document.form1.cpass.focus();
         document.form1.cpass.value="";
		 return false;
	 }
  if(document.form1.mobile.value=="")
	 {
	     alert(" please enter Mobile number...");
	     document.form1.mobile.focus();
		 return false;
	 }
	if(isNaN(document.form1.mobile.value))
	  {  
	     alert("mobile number should be in digits.");
	     document.form1.mobile.focus();
	     document.form1.mobile.value="";
	     return false;
	  }
	if(document.form1.mobile.value.length!=10)
	  {
	     alert(" Mobile number should be 10 digits only...");
		 document.form1.mobile.focus();
		 return false;
       }
     if(document.form1.email.value.indexOf("@")==-1)
	  {
         alert("Invalid email......");
	     document.form1.email.focus();
	     document.form1.email.value="";
         return false;
	  }
	if(document.form1.email.value.indexOf(".")==-1||document.form1.email.value.indexOf(".")==0)
	  {
          alert("Invalid email......");
	      document.form1.email.focus();
		  document.form1.email.value="";
		  return false;
	   }
   return true;
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

  <a href="add_moderator.jsp" id="cont">Add Moderator</a>
  <a href="update_articles.jsp" id="contac">Update Articles</a>
  <a href="maintain_articles.jsp" id="conti">View Articles</a>
  <a href="all_Not_Activated_members.jsp" id="contui">Activate Members</a>
  <a href="del_moderator.jsp" id="co">Delete Moderator</a>
  
  
  
  
  
</div><BR><BR>
<h2 align="center">Enter Reviewer Details </font></h3>
<form action="add_mod2.jsp" name="form1" onsubmit="return validate()">
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" >Category </font></strong></td>
<td align="center">
<select name="cat">
<%
	while(rs.next())
	{
%>
<option value="<%=rs.getString(2)%>"><%=rs.getString(2)%>
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
<tr>
     <td align="center"><strong><font size="4">User ID</font></strong></td>
     <td align="center"><input type=text name="id">
     
     
     
     
     </td>
</tr>


<tr>
     <td align="center"><strong><font size="4" >Moderator Name</font></strong></td>
     <td align="center"><input type=text name="name"></td>
</tr>

<tr>
     <td align="center"><strong><font size="4" >Password</font></strong></td>
     <td align="center"><input type=password name="pass"></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" >Confirm Password</font></strong></td>
     <td align="center"><input type=password name="cpass"></td>
</tr>
<tr>
     <td><strong><font size="4">Mobile Number</font></strong></td>
     <td align="center"><input type=text name="mobile"></td>
</tr>
<tr>
     <td><strong><font size="4">Email ID</font></strong></td>
     <td align="center"><input type=text name="email"></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" class="sub" value="SAVE" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" class="sub"></td>
</tr>
</table>

</form>
</body>
</html>