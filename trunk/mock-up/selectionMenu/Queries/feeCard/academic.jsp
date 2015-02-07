<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>

<% 
	//String roll_num=request.getParameter("roll_num");
	//System.out.println(roll_num);
	//String ayear=request.getParameter("academic");
	//System.out.println(ayear);
	String roll_num="06a81a0555";
	try {
		System.out.println("db");
	    
	    Dbcon d= new Dbcon();
		Connection con=d.getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select fee_payment_date from student_fee_tab where roll_num='"+roll_num+"'");
		System.out.println("rs.next()......................");
		while(rs.next()){
			System.out.println("rs.next()......................");
		String ac_year=rs.getString("fee_payment_date");
		System.out.println(ac_year);
		//int academic_year=Integer.parseInt(ac_year);
		String aca_year=ac_year.substring(4,8);
		System.out.println(aca_year);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>