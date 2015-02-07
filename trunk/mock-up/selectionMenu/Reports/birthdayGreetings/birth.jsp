<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Birthday Greetings</title>
</head>
<body background="hb.jpg" onload="window.resizeTo(800,600)">
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<table align="center" cellpadding="20">
<tr><th><h2>Name</h2></th><th><h2>Rollno</h2></th></tr>
<%

try {
String bd=request.getParameter("d");

Connection con=vdb.Db.connect();
PreparedStatement pst=con.prepareStatement("select roll_num from student_personal_details_tab where dob like '"+bd+"%'");
PreparedStatement pst1=con.prepareStatement("select student_name from student_tab where roll_num=?");


ResultSet rs=pst.executeQuery();

while(rs.next())
{
	String id=rs.getString(1);
	pst1.setString(1,id);
	ResultSet rs2=pst1.executeQuery();
	if(rs2.next())
	{
		String name=rs2.getString(1);
		
		%>
		<tr><td align="left"><h3><%=name%></h3></td><td align="right"><h3><%=id%></h3></td></tr>
		<%
		
	}
}
}
catch(Exception e) {
	System.out.println("error");
}
%>
<tr><th colspan="2"><input type="button" value="PRINT"onclick="window.print()">&nbsp;&nbsp;&nbsp;
<input type="button" value="    Quit    " onclick="window.close()">
</th></tr>
</table>
</body>
</html>
