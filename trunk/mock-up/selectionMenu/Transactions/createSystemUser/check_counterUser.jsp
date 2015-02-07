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
    String counter_num=request.getParameter("counter_num");
    String counter_name=request.getParameter("counter_name");
    String location=request.getParameter("location");
    String incharge_id=request.getParameter("incharge_id");
    String password=request.getParameter("password");
    pst=con.prepareStatement("insert into counter_tab values(?,?,?,?,?)");
    pst.setInt(1,Integer.parseInt(counter_num));
    pst.setString(2,counter_name);
    pst.setString(3,location);
    pst.setString(4,incharge_id);
    pst.setString(5,password);
    if(pst.executeUpdate()==1)
    {
    	%>
    	<h1>User Created Successfully</h1>
    	<%
    }
    else
    {
    	%>
    	<h1>User Creation Failed</h1>
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