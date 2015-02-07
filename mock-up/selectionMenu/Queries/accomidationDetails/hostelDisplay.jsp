<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("hostel_n");
	int c=1,s6=0,sum=0,org=0,rem=0,rem1=0,sum1=0;
	String s1="",s2="",s3="",s4="",s5="",s7="",s8="";
	StringBuffer sb=new StringBuffer();
	try {
			Dbcon d= new Dbcon();
			Connection con=d.getConnection();
			Statement st4=con.createStatement();
		    ResultSet rs4=st4.executeQuery("select * from feemaster_tab where fee_name='hostel'");
		    if(rs4.next())
		       {
		    	   org=rs4.getInt(18);
		       }
		    System.out.println(org);
	        Statement st = con.createStatement();  
	        ResultSet rs=st.executeQuery("select * from hostel_tab where hostel_name='"+name+"'");
	        while(rs.next()){
	        	String code=rs.getString(1);
	          	Statement st1 = con.createStatement();  
		        ResultSet rs1=st1.executeQuery("select * from student_accomodation_details_tab where hostel_code='"+code+"'");
		      	while(rs1.next()){
		        	s1=rs1.getString(1);
		        	System.out.println("roll no="+s1);
	         		s2=rs1.getString(3);        	
	        		s3=rs1.getString(4);        	   	
	        		s4=rs1.getString(5);       	
	           		s5=rs1.getString(6);
	          		Statement st2= con.createStatement();  
			        ResultSet rs2=st2.executeQuery("select * from student_tab where roll_num='"+rs1.getString(1)+"'");
					if(rs2.next()){
			     	  s6=c++;        	
	        		s7=rs2.getString(3);        	
	        		s8=rs2.getString(4);       	
	            	}
					Statement st3=con.createStatement();
				    ResultSet rs3=st3.executeQuery("select * from student_fee_tab where roll_num='"+s1+"' and fee_name='hostel'");
				    while(rs3.next())
				       {
				    	   sum=sum+rs3.getInt(2);
				       }
				    
				    rem=org-sum;
				    sum1=sum1+sum;
				    rem1=rem1+rem;
		      	 	sb.append(s6);
		      	 	sb.append("$");
		      		sb.append(s1);
		      	    sb.append("$");
		      		sb.append(s7);
		      	    sb.append("$");
		      		sb.append(s8);
		      	    sb.append("$");
		      		sb.append(s2);
		      	    sb.append("$");
		      		sb.append(s3);
		      	    sb.append("$");
		      		sb.append(s4);
		      	    sb.append("$");
		      		sb.append(s5);
		      	    sb.append("$");
		      		sb.append(sum);
		      	    sb.append("$");
		      		sb.append(rem);
		      	 	sb.append("$");
		      	    sb.append("*");
		      	 }      	 
	  }
	       sb.append("$$$");
	       sb.append(sum1);
	       sb.append("$");
	       sb.append(rem1);
	       sb.append("$");
	       out.println(sb);
	}     
	catch (Exception s){
        System.out.println("SQL code does not execute."+s);
        s.printStackTrace();
    }
%>
