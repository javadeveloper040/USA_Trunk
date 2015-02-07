<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="vdb.Db;"%>

<%!
Connection con = null;
PreparedStatement pst=null;
%>
<html>
<body bgcolor="skyblue">
<center>
<%
try{
    con=Db.connect();
    String user_id=request.getParameter("user_id");
    String oldpassword=request.getParameter("psw");
    String newpassword=request.getParameter("psw1");    
    pst=con.prepareStatement("update users_tab set password=? where user_id=? and password=?");
    pst.setString(1,newpassword);
    pst.setString(2,user_id);
    pst.setString(3,oldpassword);
    if(pst.executeUpdate()==1)
    {
    	%>
    	<h1>Password changed Successfully</h1>
    	<%
    }
    else
    {
    	%>
    	<h1>Updation of password Failed</h1>
    	<%
    }
}

catch(Exception e)
{
	System.out.println(e);	
}
%>


<INPUT TYPE="button" value="  QUIT  " onclick="window.close()">
 	</center>
 	</body>
 	</html>
