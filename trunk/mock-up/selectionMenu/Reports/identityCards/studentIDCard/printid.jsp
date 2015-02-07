<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print ID Card</title>
</head>
<%
String name=request.getParameter("student");
String roll=request.getParameter("roll");
String db=request.getParameter("db");
String course=request.getParameter("branch");
String path=request.getParameter("path");
%>
<body onload="window.resizeTo(500,360)">
<table border="2" style="border-color:black"><tr><td>
<table>
<tr><td colspan="4"><img src="ID_HEAD.jpg" width="400" height="70"></td></tr>
<tr><td rowspan="5"><img src="<%=path%>" width="75" height="100"></td><th></th><td></td></tr>
<tr><th align="left">Name:</th><td align="left"><%=name%></td></tr>
<tr><th align="left">Course:</th><td align="left"><%=course%></td></tr>
<tr><th align="left">Rollno:</th><td align="left"><%=roll%></td></tr>
<tr><th align="left">D.O.B:</th><td align="left"><%=db%></td></tr>
<tr><td colspan="3" align="right">Principal</td></tr>
<tr><td colspan="3" align="center">WG Dt A.P email: svec_tadepalligudem@rediffmail.com</td></tr>
</table>
</td></tr></table>
<br/>
<center><input type="button" value="  Print  " onclick="window.print()">&nbsp;&nbsp;&nbsp;
<input type="button" value="  Quit  " onclick="window.close()">
</center>
</body>
</html>