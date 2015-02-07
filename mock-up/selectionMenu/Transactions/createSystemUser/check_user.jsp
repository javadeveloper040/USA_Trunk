<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="vdb.Db;"%>

<%!
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
%>
<html>
<body bgcolor="skyblue">
<center>
<%
try{
    con=Db.connect();
    String user_id=request.getParameter("user_id");
    String password=request.getParameter("password");
    String type=request.getParameter("cat");
    System.out.println(user_id+"--"+password+"--"+type);
    if(user_id.equals("") || password.equals("") || type.equals("select"))
    {
       %>
    	
    	<h1>USER CREATION FAILED.</h1>
   
    	<%
    }
       else
    {
	    pst=con.prepareStatement("insert into users_tab values(?,?,?)");
	    pst.setString(1,user_id);
	    pst.setString(2,password);
	    pst.setString(3,type);
	    int status=pst.executeUpdate();
	    if(status==1)
	    {
	    	%>
	
	<h1>USER CREATED SUCCESSFULLY</h1>
	
	    	<%
	    }
	    else
	    {
	    	%>
	    	
	    	<h1>USER CREATION FAILED.</h1>
	   
	    	<%	
	    }
    }
}
catch(Exception e)
{
	System.out.println(e);	
}
%>
<INPUT TYPE="button" value="  QUIT  " onclick="window.close()">
 	</center>