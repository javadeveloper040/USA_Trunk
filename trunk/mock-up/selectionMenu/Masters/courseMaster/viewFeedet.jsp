<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_name=request.getParameter("fee_name");
	        ResultSet res = st.executeQuery("SELECT * FROM  fee_coursemaster_details where course_name='"+course_name+"' and fee_name='"+fee_name+"'");
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