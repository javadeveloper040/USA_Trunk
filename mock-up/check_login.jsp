<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="vdb.Db;"%>
<html>
<head>
<title>WELCOME TO COLLEGE MANAGEMENT INFORMATION SYSTEM</title>
<script language="javascript">
function fun()
{
var id=document.getElementById("login_id").value;
var psw=document.getElementById("password").value;
if((id=="")||(psw==""))
{
document.getElementById("err").innerHTML="Invalid User Id or Password";
return false;
}
return true;
}
function change(url)
{
window.open(url,"menu","width="+1007+",height="+700+",location=0,directories=0,menubar=0,toolbar=0,status=0,scrollbars=auto,resizable=0,top=0,left=2");
}
</script>
</head>
<%!
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
String type="";
RequestDispatcher rd;
String nextpage="";
%>
<%
try{
    con=Db.connect();
    String user_id=request.getParameter("login_id");
    String password=request.getParameter("password");
    pst=con.prepareStatement("select * from col.users_tab where user_id=? and password=?");
	pst.setString(1,user_id);
	pst.setString(2,password);
	rs=pst.executeQuery();
	if(rs.next())
	{
		type=rs.getString(3);
		System.out.println(type);
		if(type.equals("admin"))
		{
			nextpage="./selectionMenu/menu.html";
		}
		else if(type.equals("deo"))
		{
			nextpage="./selectionMenu/menu_deo.html";
		}
		else if(type.equals("cashier"))
		{
			nextpage="./selectionMenu/menu_cashier.html";
		}
		else if(type.equals("clerk"))
		{
			nextpage="./selectionMenu/menu_clerk.html";
		}
		else
		{
			nextpage="./oops.html";
		}
		user_id="";
		password="";
		%>
<body  onload="change('<%=nextpage%>')" oncontextmenu="return false">
<br>
<center>
<marquee bgcolor="skyblue" behavior="scroll">
<h1>THANK YOU</h1>
</marquee><br/><br/><br/>
<img src="./images/college.jpg" width="900" height="400"></img>
<br/><br/><br/>
<input type="button" value="    LOG IN    " onclick="window.location.replace('./index.html')">
&nbsp;&nbsp;&nbsp;<input type="button" value="CONTACT US" onclick="window.location.replace('./contact.html')">
&nbsp;&nbsp;&nbsp;<input type="button" value="    QUIT    " onclick="window.close()">
</center>
</body>
		<%
	}
	else
	{
		System.out.println("user does not exists");
		response.sendRedirect("./login_fail.html");
	}

}
catch(Exception e)
{
	System.out.println(e);	
}
%>
</html>

