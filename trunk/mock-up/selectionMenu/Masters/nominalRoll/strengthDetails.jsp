
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%
	String branch=request.getParameter("branch1");
String sem=request.getParameter("semester");
	
	int t=0;
	int m=0,f=0;
	StringBuffer sb=new StringBuffer();
	try {
		
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();  
	        ResultSet rs=st.executeQuery("select * from student_tab where branch_name='"+branch+"'and sem='"+sem+"'");
	       while(rs.next()){
	        	String no=rs.getString(2);
	        	Statement st1=con.createStatement();
	        	ResultSet rst=st1.executeQuery("select * from student_personal_details_tab where roll_num='"+no+"'");
	        	if(rst.next())
	        	{
	        		String g=rst.getString(3);
	        		if(g.equals("female"))
	        		{
	        			f=f+1;
	        		}
	        		else
	        		{
	        			m=m+1;
	        		}
	        	}
	       }
	        	 t=f+m;	 
	        		sb.append(m);
	        		sb.append("$");
	        		sb.append(f);
	        		sb.append("$");
	        		sb.append(t);
	        		sb.append("$");
	              

	        out.println(sb);
	}catch (Exception s){
        System.out.println("SQL code does not execute."+s);
    }
	
		//out.println(sb);
		


%>
