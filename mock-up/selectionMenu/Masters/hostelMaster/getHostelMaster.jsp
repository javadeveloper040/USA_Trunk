<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String hostel_name=request.getParameter("hostel_name");
	        ResultSet res = st.executeQuery("SELECT * FROM  hostel_tab where hostel_name='"+hostel_name+"'");
	        if(res.next()) {
	        session.setAttribute("hostel_code",request.getParameter("hostel_code"));
	        int i;
	        for(i=1;i<=4;i++) 
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