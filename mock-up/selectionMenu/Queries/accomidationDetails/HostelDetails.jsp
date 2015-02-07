<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%
System.out.println("entered hostel details.jsp");
	String hostel=request.getParameter("hostel_n");
	System.out.println("hostel="+hostel);
	int s=0,c=0,free=0,cac=0,fil=0,kal=0,num=0;
	int m=0,f=0,v=0,count=0;
	String code="",no="",fill="";
	StringBuffer sb=new StringBuffer();
	int nfee=0,ofee=0;
	try {
		System.out.println("inside try");
			Dbcon d= new Dbcon();
			Connection con=d.getConnection();
	        Statement st = con.createStatement();  
	        ResultSet rs=st.executeQuery("select * from hostel_tab where hostel_name='"+hostel+"'");
	       	if(rs.next()){
	       		System.out.println("inside if");
	        	code=rs.getString(1);
	        	nfee=rs.getInt(3);
	          	ofee=rs.getInt(4);
	      	}
	      	ResultSet rst=st.executeQuery("select * from hostel_room where hostel_code='"+code+"'");
	        while(rst.next())
	        {
	        	s=s+1;
	        	System.out.println("s="+s);
	        	int cap=rst.getInt(3);
	        	
	        	
	        	System.out.println("cap="+cap);
	        	m=m+cap;
	        	System.out.println("m="+m);
	       }       	
	        ResultSet rst1=st.executeQuery("select * from student_accomodation_details_tab where hostel_code='"+code+"'");
	        while(rst1.next())
	      	{
	       		f=f+1;
	       		System.out.println("f="+f);
	       	}
	        
	        v=m-f;
	        System.out.println("v="+v);
	        sb.append(s);
 		    sb.append("$");
   		    sb.append(m);
   		    sb.append("$"); 
   		    sb.append(v);
  		    sb.append("$");
   		    sb.append(ofee);
   		    sb.append("$");
   		    sb.append(nfee);
   	  	 	sb.append("$$$");
	       Statement st1=con.createStatement();
       	   ResultSet rst2=st.executeQuery("select * from hostel_room where hostel_code='"+code+"'");      	   
       	   while(rst2.next())
       		{
       			no=rst2.getString(2);
      			num=Integer.parseInt(no);
       			cac=rst2.getInt(3);     		
       			ResultSet rs3=st1.executeQuery("select  * from student_accomodation_details_tab where room_num='"+num+"'and hostel_code='"+code+"'");
       			while(rs3.next())
       			 {
       				//if(rs3.next())//{
       				 fil=fil+1;
       				 //}
       				//else
       					//fil=fil+0;
       			 }
       			System.out.println(fil);
          		kal=cac-fil;
        		sb.append(num);
          		sb.append("$");
        		sb.append(kal);
          		sb.append("$");
        		sb.append("*");
       		}    			
       	   out.println(sb);
}
	catch (Exception e){
        e.printStackTrace();
		System.out.println("SQL code does not execute."+e);
}
%>
