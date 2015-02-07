<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="mis.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fee Discount List</title>
<script src="script.js" type="text/javascript"></script>
</head>
<body bgcolor="skyblue">
<form name="discount">


<fieldset>
<legend>Fee Discount List</legend><br/>
<table width="100%" border=0>
<tr>
<th>
<input type="checkbox" name="all" id="all" value="all"  onclick="toggleDisplay()">All concessions<br/>
</th>
</tr>
<tr>
<th>
<div id="some">
&nbsp;Fee name:<select name="fname" id="flist" onchange="changeFee()">
<option value="Select">Select
    <%
Dbcon d=new Dbcon();
Connection con= d.getConnection();
Statement st1=con.createStatement();
ResultSet rs=st1.executeQuery("select fee_name from feemaster_tab");
while(rs.next()){%>
				<option value=<%=rs.getString(1) %>><%=rs.getString(1) %></option>
    <%} %>
   </select><br/>
   <input type="checkbox" name="flist" id="showdlist" onclick="showdiscount()">Filter list
</div>
<div id="dlistlayer" style="visibility: hidden;" >
<select name="dlist" id="dlist" onchange="changeDiscount()" >
<option value="Select">Select</option>
<option value="Concession">Concession</option>
<option value="Merit">Merit</option>
<option value="Discount">Discount</option>
<option value="Others">Others</option>

   </select>
</div>
</th>
</tr>
</table>
   </fieldset>
<br/>
<center>
     <input name="view" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;view&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" size="20" onclick="getDetails()"/>
        <input name="quit" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" size="20" onclick="window.close()"/>

<span id="fillTable"></span>
</center>
</form>
</body>
</html>