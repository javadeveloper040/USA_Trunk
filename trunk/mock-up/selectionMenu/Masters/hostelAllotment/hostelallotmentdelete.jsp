<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,vdb.Db" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>Hostel Allotment Delete</title>
<link rel="stylesheet" href="../../sheet1.css">

  <script language="javascript">  
  function val1()
  {
  window.navigate("menu.html")
  }  
  </script>
  </head>  
  <body bgcolor="skyblue">
  <%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
try{
    con=Db.connect(); 
}
catch(Exception e){}
 %>
  <form name="f1" action="hostelrecorddelete.jsp">
  <br>
  <br>
  <fieldset>
  <legend>Enter the detaild for delete</legend>
  <table align="center">
  <tr><td>Rollnumber:</td><td><input type="text" id="d1" name="roll" title="Enter roll number and clickon delete"></td></tr>
  <tr></tr>
  <tr> <td><input type="submit" value="Delete"></td>
  <td><input type="button" value="  Quit  " onclick="window.close()"></td></tr>
  </table>
  </fieldset>
  <br>
  <br>
 <br>
 <table align="center" border="1"  width="100%">
<tr>
	<th>Roll Number</th>
	<th>HostelCode</th>
	<th>Room_num</th>
	<th>Date_join</th>
	</tr>
	<%
	pst=con.prepareStatement("select * from student_accomodation_details_tab order by roll_num");
	rs=pst.executeQuery();
	while(rs.next()) {
		if(rs.getString("cancel_date")==null){
		%>
		<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
		</tr>
		<%}	}
		pst.close();
		con.close();
		
		 %>
</table>
    </form>
  </body>
</html>
