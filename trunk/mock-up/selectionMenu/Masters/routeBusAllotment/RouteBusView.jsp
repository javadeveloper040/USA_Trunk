<%@ page language="java" import="java.sql.*,vdb.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../../sheet1.css">
<title>Route Bus Allotment View</title>
<script language="javascript">
function sub()
{
document.f1.submit();
}
function val()
{
document.getElementById("roll_num").value="";
}
</script>
</head>
<body BGCOLOR="skyblue">
<%!String roll=null;    String canceldate=null; %>
<center>
<h3>VIEW</h3>
</center>
<form name="f1">
<%roll=request.getParameter("roll_num"); %>
<fieldset>
<legend>Enter the roll number</legend>
<table align="center">
<tr><th>Roll number:</th><td><input type="text" name="roll_num" title="EnterRoll Number" id="roll_num" <%if(roll==null)
{}
else
{%>
	value="<%=roll%>"
<%}
	%>></td><td><input type="button" value="View" onclick="sub()"> </td><td><input type="button" value="Clear" onclick="val()"></td><td><input type="button" value="Quit" onclick="window.close()"></td>
</tr>
</table>
</fieldset>

</form>

<%if(roll==null||roll=="")
	{
	
	}
	else
	{%>
		<table align="center" border="1" id="tab">
		<tr><th bgcolor="skyblue">ROLLNUMBER</th><th bgcolor="skyblue">DATE</th><th bgcolor="skyblue">ROUTE</th><th bgcolor="skyblue">BUSNUMBER</th><th>DISC DATE</th></tr>
		<%try{
   Connection con=Db.connect(); 
    PreparedStatement pst=con.prepareStatement("select * from student_bus_acc_details_tab where roll_num=?");
    
    pst.setString(1,roll);
    ResultSet rs=pst.executeQuery();
    if(rs.next())
    {
canceldate=rs.getString("bus_cancel_date");
System.out.println(canceldate);
    if(canceldate==null){canceldate="STILL USING THIS SERVICE";}
    %>
  <tr><td><%=rs.getString("roll_num") %></td><td><%=rs.getString("bus_reg_date") %></td><td><%=rs.getString("area_name") %></td><td><%=rs.getInt("bus_num") %></td><td><%=canceldate %></td></tr>
  <%} else
  {%>
	<jsp:forward page="fail.jsp"/>  
    <%}
		}
catch(Exception e)
{

}%>
		</table>
	<% }%>


</body>
</html>