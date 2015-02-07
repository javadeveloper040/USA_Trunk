<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body bgcolor="skyblue">
<%
HttpSession sess=request.getSession();
String status=(String)sess.getAttribute("status");
String incharge=(String)sess.getAttribute("incharge");
System.out.println(incharge);
String password=(String)sess.getAttribute("newpassword");
System.out.println(password);
Dbcon d=new Dbcon();
Connection con= d.getConnection();
Statement st= con.createStatement();
ResultSet rs= st.executeQuery("select * from counter_tab where incharge='"+incharge+"' and password='"+password+"' ");
if(rs.next()){
%>
<center>
<table>
<tr><td>Incharge Name :</td><td><%=rs.getString(4) %></td></tr>
<tr><td>Location</td><td><%=rs.getString(3) %></td></tr>
<tr><td>Counter Number :</td><td><%=rs.getString(1) %></td></tr>
<tr><td>Counter Name :</td><td><%=rs.getString(2) %></td></tr>
</table><%} %>
<input type="button" value="  Quit  " onclick="javascript:window.close()"></center>
</body>
</html>