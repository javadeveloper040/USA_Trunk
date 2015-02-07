<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<html> 
<head>
<title>Hostel Vacated List</title>
</head>
<body bgcolor="skyblue">
<%
	
	String from=request.getParameter("fromdate");
	System.out.println(from);
	String to=request.getParameter("todate");
	System.out.println(to);
	String hostel_name=request.getParameter("hostel");
	System.out.println(hostel_name);
	int t=0;
	int m=0,f=0;
	String code="",roll_no="";
	StringBuffer sb=new StringBuffer();
	out.println("<table border=1 width='100%'><tr bgcolor='#339999'><th>Student_name</th><th>Branch</th></tr>");
		try {
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	    Statement st = con.createStatement();  
	    ResultSet rs=st.executeQuery("select hostel_code from hostel_tab where hostel_name='"+hostel_name+"'");
	    if(rs.next())
	    {
	    	code=rs.getString(1);
	    	System.out.println(code);
	    }
	  
	    Statement st1=con.createStatement();
	    ResultSet rs1=st1.executeQuery("select * from student_accomodation_details_tab where hostel_code='"+code+"' and cancel_date!=''");
	    while(rs1.next())
	    {
	    	roll_no=rs1.getString(1);
	    	System.out.println(roll_no);
	      	Statement st2=con.createStatement();
	    	ResultSet rs2=st2.executeQuery("select * from student_tab where roll_num='"+roll_no+"'");
	    	System.out.println(rs2.next());
	    	String name=rs2.getString("roll_num");
	    	System.out.println(name);
	    	String branch=rs2.getString("branch_name");
	    	System.out.println(branch);
	    		    out.println("<tr><td>"+name+"</td><td>"+branch+"</td></tr>");	
	    	
	    	//sb.append("<tr><td>"+name+"</td><td>"+branch+"</td></tr>");
	    	
	    }
	   
	    //sb.append("</table>");
	    
		    
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println(e);
	}
	//out.print(sb);
	
	//System.out.println(sb);
	%>
	<center><input type="button" value="  Quit  " onclick="window.close()"></center>
	<br/>
</body>
</html>	
	        