<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String roll_num=request.getParameter("roll_num");

String fee_name=request.getParameter("fee_name");

//String month=request.getParameter("month");
//String year=request.getParameter("year");
String discountx=request.getParameter("discountx");
String amount=request.getParameter("amount");

String rc_num=request.getParameter("rc_num");
System.out.println("to be modified"+roll_num+fee_name+discountx+amount);
Dbcon d=new Dbcon();
Connection con= d.getConnection();
int i=1;
try {
	Statement st1=con.createStatement();
	i = st1.executeUpdate("update student_fee_tab set total_amount='"+amount+"',fee_name='"+fee_name+"',discount_type='"+discountx+"' where serial='"+rc_num+"' " );
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

	RequestDispatcher rd=request.getRequestDispatcher("ifeeTableModifySource.jsp");
	rd.forward(request,response);


	

%>