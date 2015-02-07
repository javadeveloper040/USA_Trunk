<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String rc_num=request.getParameter("rc_num");
//String month=request.getParameter("month");
//String year=request.getParameter("year");



Dbcon d=new Dbcon();
Connection con= d.getConnection();

try {
	Statement st1=con.createStatement();
	st1.executeUpdate("delete from student_fee_tab  where serial='"+rc_num+"' " );
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

	RequestDispatcher rd=request.getRequestDispatcher("ifeeTableDeleteSource.jsp");
	rd.forward(request,response);


	

%>