<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%
String roll_num=request.getParameter("roll_num");


StringBuffer sb1=new StringBuffer();
try {
	Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st=con.createStatement();
	//if(month.equalsIgnoreCase("select")&&year.equalsIgnoreCase("select")&&fee_name.equalsIgnoreCase("select")&&discount.equalsIgnoreCase("others")){
		ResultSet rs=st.executeQuery("select * from student_fee_tab where roll_num='"+roll_num+"'");
		 sb1=getRows(rs);
//	}
//	else if(!fee_name.equalsIgnoreCase("select")){
//		System.out.println("in 2");
//		ResultSet rs=st.executeQuery("select * from student_fee_tab where roll_num='"+roll_num+"' and fee_name='"+fee_name+"'");
//		sb1=getRows(rs);
		
		
//	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} 
out.print(sb1);
%>
<%!
public StringBuffer getRows(ResultSet rs){
StringBuffer sb=new StringBuffer();
try {
	sb.append("<table>");
	sb.append("<table align=\"center\" border=1><tr><th>Receipt No</th><td>fee name</td><td>month</td><td>discount</td><td>amount</td></tr>");
	while(rs.next()){
		String roll_num=rs.getString(1);
		String dfee_name=rs.getString(4);
		String ddate=rs.getString(3);
		String drcno=rs.getString(6);
		//int imonth=Integer.parseInt(smonth);
		String ddiscount=rs.getString(5);
		String dfee=rs.getString(2);
		String s="ifeeModifyDest.jsp?roll_num="+roll_num+"&fee_name="+dfee_name+"&discount="+ddiscount+"&fee="+dfee+"&month="+ddate+"&rc_num="+drcno;
		sb.append("<tr><td>"+drcno+"</td><td>"+dfee_name+"</td><td>"+ddate+"</td><td>"+ddiscount+"</td><td>"+dfee+"</td></tr>");
		
	}
	sb.append("</table>");
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return sb;

}
%>