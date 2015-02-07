<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel Vacated List</title>
</head>
<body bgcolor="skyblue">
<form action="./HostelVacatedList.jsp">
<table>
<tr><td><fieldset><legend>Select Hostel</legend><table><tr><td>
Hostel:<select id="hostel" name="hostel"><option value="select" >select</option>
<%Dbcon d= new Dbcon();
Connection con=d.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select distinct hostel_name from hostel_tab");
while(rs.next())
{
 %>
				<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
<%} %>    
 
</select> </td>
<td></tr></table></fieldset></td>
</tr>
</table>
<center><input type="submit" value="View " >&nbsp;&nbsp;&nbsp;
<input type="button" value="PRINT"onclick="window.print()">
&nbsp;&nbsp;<input type="button" value="  Quit  " onclick="window.close()">
</center>
</form>
</body>
</html>