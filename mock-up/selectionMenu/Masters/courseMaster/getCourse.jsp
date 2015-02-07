<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String course_name=request.getParameter("course_name");
	        session.setAttribute("course_name",course_name);
	        ResultSet res = st.executeQuery("SELECT * FROM  coursemaster_tab where course_name='"+course_name+"'");
	        if(res.next()) {
	        int i;
	        for(i=1;i<4;i++) 
	        {
	            String msg=res.getString(i);	        	
	            out.println(msg+"$");
	        }
	        
	          System.out.println(course_name);
	        session.setAttribute("course_name",res.getString(1));
	        
	        vdb.Db.connect().close();
	        res.close();
	      
	        }
	  }
	  catch(Exception e)
	  {
	  	e.printStackTrace();
	  }
%>