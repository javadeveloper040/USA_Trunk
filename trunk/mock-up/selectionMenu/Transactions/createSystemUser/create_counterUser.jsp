<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<%@page import="vdb.Db;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create counter User</title>
<script language="javascript" src="check_id.js">
</script>
</head>
<body bgcolor="skyblue" onload="document.getElementById('counter_name').focus()">
<%!
Connection con = null;
PreparedStatement pst=null,pst1=null;
ResultSet rs=null,rs1=null;
int counter_num;
%>
<%
try{
   con=Db.connect();
   pst=con.prepareStatement("select * from counter_tab");
   rs=pst.executeQuery();
   if(rs.next())
   {
	   pst1=con.prepareStatement("select max(counter_num) from counter_tab");
	   rs1=pst1.executeQuery();
	   if(rs.next())
	   {
	   counter_num=Integer.parseInt(rs.getString(1));
	   System.out.println(counter_num);
	   counter_num++;
	   }
   }
   else
   {
	   counter_num=1;
   }
}
catch(Exception e)
{
	System.out.println(e);	
}
%>
<fieldset>
<legend><b>CREATE COUNTER USERS</b></legend>
<form action="./check_counterUser.jsp" method="post"  onsubmit="return cH()">
<table cellpadding="5" border=0>
<tr>
<th align="right">Counter Number:</th><td><input type="text" name="counter_num" id="counter_num" value="<%=counter_num %>" readonly></td>
</tr>
<tr>
<th align="right">Counter Name:</th><td><input type="text" name="counter_name" id="counter_name"></td>
</tr>
<tr>
<th align="right">Location:</th><td><input type="text" name="location" id="location"></td>
</tr>
<tr>
<th align="right">Incharge Id:</th><td><input type="text" name="incharge_id" id="incharge_id"></td>
</tr>
<tr>
<th align="right">Password:</th><td><input type="password" name="password" id="password"></td>
</tr>
<tr>
<th align="right">Retype Password:</th><td><input type="password" name="password1" id="password1"></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="CREATE USER">&nbsp;&nbsp;&nbsp;
<input type="reset" value="     CLEAR     ">
&nbsp;&nbsp;&nbsp;<input type="button" value="      QUIT      " onclick="window.close()"></td></tr>
<TR><th colspan="2"><b><p id="check"></p></b></th>
</table>
</form>
</fieldset>
</body>
</html>