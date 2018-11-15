<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String mid;
	 int i;
%>

<%
	try{
		mid=(String)session.getAttribute("uid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from moderator_profile where mod_login_id='"+mid+"'");
%>
<HTML>
<HEAD>
<script>
  function validate() 
	{
            if(document.form1.mname.value=="")
			 {
			    alert(" please enter Moderator name...");
				document.form1.mname.focus();
				return false;
			 }
            if(document.form1.mid.value=="")
			 {
			    alert(" please enter Moderator ID...");
				document.form1.mid.focus();
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
           if(document.form1.cat.value=="")
			 {
			    alert(" please enter Address...");
				document.form1.cat.focus();
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

  <a  class="active" href="inbox.jsp"> Home</a>
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
<h2 align="center"><font color="purple">Update profile </font></h3>
<form action="UpdateModProfile" name=form1 onsubmit="return validate()">
<%
	if(rs.next())
	{
%>
<table align="center"  cellpadding="3" cellspacing="5">
<tr><td align="center"><strong><font size="4" color="maroon">Moderator Id</font></strong></td>
<td align="center"><input type=text name="mid" value=<%=mid%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Moderator Name:</font></strong></td>
     <td align="center"><input type=text name="mname" value=<%=rs.getString(3)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Password:</font></strong></td>
     <td align="center"><input type=password name="pass" value=<%=rs.getString(2)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Confirm Password:</font></strong></td>
     <td align="center"><input type=password name="cpass" value=<%=rs.getString(2)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Mobile:</font></strong></td>
     <td align="center"><input type=text name="mobile" value=<%=rs.getString(5)%>></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" color="maroon">Email ID</font></strong></td>
     <td align="center"><input type=text name="email" value=<%=rs.getString(4)%>></td>
</tr>
<tr>
     
     <td align="center"><input type="hidden" name="category" value=<%=rs.getString(6)%>></td>
</tr>

<%
	}
stmt.close();
con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<tr>
     <td colspan="2" align="center" ><input type="submit" value="SAVE" class="sub">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" ></td>
</tr>
</table>
</form>
</body></HTML>