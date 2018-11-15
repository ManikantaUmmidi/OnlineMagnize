<html>
<head>
<script language=javascript>
function validate()
	{
	  if(document.form1.tag.value=="")
	   {
	     alert("Please enter Tag...");
         document.form1.tag.focus();
		 return false;
		 }
      if(document.form1.article.value=="")
	   {
	     alert("Please enter Article...");
         document.form1.article.focus();
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
<%


long articleid=(int)(Math.random()*1000)*3*3;


%>
<div class="navbar">

  <a  class="active" href="inbox.jsp"> Home</a>
  <a  class="active" href="new_articles.jsp">Timeline </a>
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
  
  
</div>
<BR><BR>
<h2 align="center"><font>Post Articles Here</font></h3>
<form action="post_articles_db2.jsp" name="form1" onsubmit="return validate()">
<table align="center"  cellpadding="3" cellspacing="5">
<tr>
     <td align="center"><strong><font size="4">Article ID</font></strong></td>
     <td align="center"><input type=text name="aid" readonly value=<%=articleid %>></td>
</tr>
<tr><td align="center"><strong><font size="4">Category</font></strong></td>
<td align="center">
<select name="cat">
<option value=0>--select--</option>

<option value="Education">Education

<option value="Entartainment">Entartainment

</select></td></tr>

<tr>
     <td align="center"><strong><font size="4" >Tag</font></strong></td>
     <td align="center"><input type=text name="tag"></td>
</tr>
<tr>
     <td align="center"><strong><font size="4" >Article</font></strong></td>
     <td align="center"><textarea  name="article" rows="5" cols="18"></textarea></td>
</tr>
<tr>
     <td colspan="2" align="center" ><input type="submit" value="SAVE" >&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET" ></td>
</tr>
</table>
</form>
</body>