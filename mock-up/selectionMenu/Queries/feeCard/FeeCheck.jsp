<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String ac_year=request.getParameter("academic_year");
System.out.println(ac_year);
String year=ac_year;
System.out.println(year);
String roll_num=request.getParameter("roll_num");
System.out.println(roll_num);
StringBuffer sb=new StringBuffer();

//sb.append("<table border=1 width='100%'>");
//sb.append("<tr><th>AC Year/FEE NAME</th><th>Paid</th><th>Rec No/Dt</th><th>Due</th><th>Payable Fee</th></tr>");
try {
	int paidTotal=0;
	int origTotal=0;
	int dueTotal=0;
	Dbcon d=new Dbcon();
	Connection con=d.getConnection();
	Statement st=con.createStatement();
	sb.append("<table align=\"center\" border=1 width='100%'><tr><th>AC Year/FEE NAME</th><th>Paid</th><th>Rec No/Dt</th><th>Due</th><th>Payable Fee</th></tr>");
	
	ResultSet rs=st.executeQuery("select fee_name,total_amount,fee_payment_date,serial from student_fee_tab where  roll_num='"+roll_num+"' and fee_payment_date like '%"+year+"'");
	while(rs.next()){
						int paid=rs.getInt(2);
		String fee_name=rs.getString(1);
		int tamount=rs.getInt(2);
		System.out.println(fee_name+"  "+tamount);
		String date=rs.getString(3);
		System.out.println(date);
		String reciept=rs.getString(4);
		Statement st2=con.createStatement();
		ResultSet rs2=st2.executeQuery("select orig_amount from feemaster_tab where fee_name='"+rs.getString(1)+"'");
		
		if(rs2.next()){
		int orig_amount=rs2.getInt(1);
		
		System.out.println(paid);
		int due=(orig_amount-paid);
		System.out.println("The values are"+"  "+paid+"  "+due+"   "+orig_amount+"  "+date);
		paidTotal=paidTotal+paid;
		origTotal=origTotal+orig_amount;
		dueTotal=dueTotal+due;	
		sb.append("<tr><td>"+fee_name+"</td><td>"+paid+"</td><td>("+reciept+")"+date+"</td><td>"+due+"</td><td>"+orig_amount+"</td></tr>");
		}
		
	}
	System.out.println("Total; paid"+paidTotal+"    "+"total due="+dueTotal+"    "+"Tota; orig"+origTotal);
	sb.append("<tr><td></td><td>Total</td><td>"+paidTotal+"</td><td>"+dueTotal+"</td><td>"+origTotal+"</td></tr>");
	sb.append("</table>");
	out.print(sb);
		
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>