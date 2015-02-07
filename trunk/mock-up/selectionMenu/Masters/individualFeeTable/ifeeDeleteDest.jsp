<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Individual Fee Table Delete</title>
</head>
<body bgcolor="skyblue">

<%
String roll=request.getParameter("roll_num");
String fee_name=request.getParameter("fee_name");
String discount=request.getParameter("discount");
String amount=request.getParameter("fee");
String month=request.getParameter("month");
String rcno=request.getParameter("rcno");
%>
<form action="DeleteIfee.jsp">
<input type="hidden" name="roll_num" value=<%=roll %>>
<input type="hidden" name="old_fee_name" value=<%=fee_name %>>
<input type="hidden" name="old_amount" value=<%=amount %>>
<input type="hidden" name="old_discount" value=<%=discount %>>
<input type="hidden" name="rc_num" value=<%=rcno %>>
<br><br><br><br><br>
<center>
<table border="1">

<h3><%=roll %> on   <%=month %>  <%=fee_name %> of  <%=amount %> with <%=discount %> </h3>

</table><br><br><h4>Delete?</h4><br><br>

          
           <input type="submit" value="  Yes  "> 
           <input type="button" value="   No  " onclick="javascript:history.go(-1)"></center>
       </form>

</body>
</html>