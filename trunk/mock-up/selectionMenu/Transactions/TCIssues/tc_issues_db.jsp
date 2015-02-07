<%@ page import="java.sql.*" %>

<%
try {
String rollno=request.getParameter("rollno");
session.setAttribute("rollno",rollno);
System.out.println(rollno);
Connection con=vdb.Db.connect();
PreparedStatement pst=con.prepareStatement("select * from tc_issued_tab where roll_num=?");

System.out.println("123");
pst.setString(1,rollno);
System.out.println("1234");
ResultSet rs=pst.executeQuery();
System.out.println("123445");
if(rs.next())
{
	System.out.println("1234456");
	
	int ec=rs.getInt(1);
	//String rn=rs.getString(1);
	session.setAttribute("serial",String.valueOf(ec));
	//session.setAttribute("rollno",rn);
	//RequestDispatcher rd=request.getRequestDispatcher("./tc_dup.jsp");
	//rd.forward(request,response);
}
else
{
	System.out.println("1234457");
	PreparedStatement pst1=con.prepareStatement("select count(*) from tc_issued_tab");
	System.out.println("123445");
	ResultSet rs1=pst1.executeQuery();
	System.out.println("123445");
	if(rs1.next())
	{
		System.out.println("123445");
		int c=rs1.getInt(1);
		c++;
		System.out.println(String.valueOf(c));
		System.out.println("123445");
		session.setAttribute("serial",String.valueOf(c));
		System.out.println("123445");
		PreparedStatement pst2=con.prepareStatement("insert into tc_issued_tab values(?,?)");
		pst2.setInt(1,c);
		pst2.setString(2,rollno);
		pst2.executeUpdate();
		System.out.print("A log of the unique Serial number for the TC has been created");
		//RequestDispatcher rd=request.getRequestDispatcher("./tc1.jsp");
		//rd.forward(request,response);
	}
	
}
}
catch(Exception e) {
	System.out.println(e);
}
%>
<html>
<head>
<title>select TC generation Type</title>
</head>
<body bgcolor="skyblue">
<fieldset>
<legend><b>Select TC Generation type</b></legend>
<table width="100%" cellpadding="10">
<tr>
<th><input type="button" value=" Manual " onclick="window.navigate('./tc1.jsp')"></th>
</tr>
<tr>
<th><input type="button" value="  Auto  " onclick="window.navigate('./viewmodify.jsp')"></th>
</tr>
<tr>
<th><input type="button" value="   Quit   " onclick="window.close()" /></th>
</table>
</fieldset>
</body>

</html>

