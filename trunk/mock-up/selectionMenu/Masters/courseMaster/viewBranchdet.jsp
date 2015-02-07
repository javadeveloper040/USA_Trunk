<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String branch_code=request.getParameter("branch_code");
	        ResultSet res = st.executeQuery("SELECT * FROM  branch_coursemaster_details where course_name='"+course_name+"' and branch_code='"+branch_code+"'");
	        if(res.next()) {
	        int i;
	        for(i=1;i<6;i++) 
	        {
	            String msg=res.getString(i);	        	
	            out.println(msg+"$");
	        }  
	        vdb.Db.connect().close();
	        res.close();
	        }
	  }
	  catch(Exception e)
	  {
	  	e.printStackTrace();
	  }
%>