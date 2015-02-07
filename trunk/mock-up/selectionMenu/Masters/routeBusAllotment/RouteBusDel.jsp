.<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,vdb.Db" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>Route Bus Allotment Delete</title>
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
  <form name="f1" action="routebusrecorddelete.jsp">
  <br>
  <br>
  <fieldset>
  <legend>Enter the details to delete Route/Bus alloted</legend>
  <table align="center">
  <tr><td><b>Rollnumber:</b></td><td><input type="text" id="d1" name="roll" title="Enter the Roll Number"></td></tr>
  <tr></tr>
  <tr> <td><input type="submit" value="Delete"></td>
  <td><input type="button" value=" Quit " onclick="window.close()"></td></tr>
  </table>
  </fieldset>
  <br>
  <br>
 <br>
<div style="overflow:auto;height:200">
 <table align="center" border="1"  width="90%">
<tr>
	<th>Roll Number</th>
	<th>Date</th>
	<th>AreaName</th>
	<th>BusNumber</th>
	</tr>
	<%
	pst=con.prepareStatement("select * from student_bus_acc_details_tab order by roll_num");
	rs=pst.executeQuery();
	while(rs.next()) {
		if(rs.getString("bus_cancel_date")==null){
		%>
		<tr><td><%=rs.getString("roll_num") %></td><td><%=rs.getString("bus_reg_date") %></td>
		<td><%=rs.getString("area_name") %></td><td><%=rs.getString("bus_num") %></td>
		</tr>
		<%}	}
		pst.close();
		con.close();
		
		 %>
</table>
</div>
    </form>
  </body>
</html>
