<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
StringBuffer sb=new StringBuffer();
String need1=request.getParameter("need1");
String need2=request.getParameter("need2");
System.out.println(need1);
System.out.println(need2);
if(need1!=null&&need1.equalsIgnoreCase("all")){
	//getting all values from student_fee_tab
	System.out.println("getting all values from student_fee_tab");
	try {
		Dbcon d=new Dbcon();
		Connection con= d.getConnection();
		Statement st=con.createStatement();
		ResultSet rs= st.executeQuery("select st.branch_name,st.sem,st.roll_num,st.student_name,sf.total_amount,sf.discount_type  from student_fee_tab sf,student_tab st where sf.roll_num=st.roll_num");
		sb.append("<table align=\"center\" border=1>");
		sb.append("<tr bgcolor='#339999'><td>Branch</td><td>Sem</td><td>Admission No</td><td>Student Name</td><td>payable</td><td>Discount Amount</td><td>Discount Type</td></tr>");
		while(rs.next()){
			sb.append("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getInt(5)+"</td><td>1000</td><td>"+rs.getString(6)+"</td></tr>");
			System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getInt(5)+"  "+rs.getString(6));
		}
		sb.append("</table>");
		out.print(sb);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}else if(need2==null){
	try {
		Dbcon d=new Dbcon();
		Connection con= d.getConnection();
		Statement st=con.createStatement();
		ResultSet rs= st.executeQuery("select st.branch_name,st.sem,st.roll_num,st.student_name,sf.total_amount,sf.discount_type  from student_fee_tab sf,student_tab st where sf.roll_num=st.roll_num and sf.fee_name='"+need1+"'");
		sb.append("<table align=\"center\" border=1>");
		sb.append("<tr><th>Branch</th><th>Sem</th><th>Admission No</th><th>Student Name</th><th>payable</th><th>Discount Amount</th><th>Discount Type</th></tr>");
		while(rs.next()){
			sb.append("<tr bgcolor='#339999'><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getInt(5)+"</td><td>1000</td><td>"+rs.getString(6)+"</td></tr>");
			System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getInt(5)+"  "+rs.getString(6));
		}
		sb.append("</table>");
		out.print(sb);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}else if(need1==null){
	try {
		Dbcon d=new Dbcon();
		Connection con= d.getConnection();
		Statement st=con.createStatement();
		ResultSet rs= st.executeQuery("select st.branch_name,st.sem,st.roll_num,st.student_name,sf.total_amount,sf.discount_type  from student_fee_tab sf,student_tab st where sf.roll_num=st.roll_num and sf.discount_type='"+need2+"' ");
		sb.append("<table align=\"center\" border=1>");
		sb.append("<tr bgcolor='#339999'><th>Branch</th><th>Sem</th><th>Admission No</th><th>Student Name</th><th>payable</th><th>Discount Amount</th><th>Discount Type</th></tr>");
		while(rs.next()){
			sb.append("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getInt(5)+"</td><td>1000</td><td>"+rs.getString(6)+"</td></tr>");
			System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getInt(5)+"  "+rs.getString(6));
		}
		sb.append("</table>");
		out.print(sb);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}else{
	try {
		Dbcon d=new Dbcon();
		Connection con= d.getConnection();
		Statement st=con.createStatement();
		ResultSet rs= st.executeQuery("select st.branch_name,st.sem,st.roll_num,st.student_name,sf.total_amount,sf.discount_type  from student_fee_tab sf,student_tab st where sf.roll_num=st.roll_num and sf.discount_type='"+need2+"' and sf.fee_name='"+need1+"' ");
		sb.append("<table align=\"center\" border=1>");
		sb.append("<tr><th>Branch</th><th>Sem</th><th>Admission No</th><th>Student Name</th><th>payable</th><th>Discount Amount</th><th>Discount Type</th></tr>");
		while(rs.next()){
			sb.append("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getInt(5)+"</td><td>1000</td><td>"+rs.getString(6)+"</td></tr>");
			System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getString(4)+"  "+rs.getInt(5)+"  "+rs.getString(6));
		}
		sb.append("</table>");
		out.print(sb);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

%>