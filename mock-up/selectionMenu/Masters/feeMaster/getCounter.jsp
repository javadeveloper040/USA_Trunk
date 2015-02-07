<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String counter_name=request.getParameter("counter_name");
	        ResultSet res = st.executeQuery("SELECT * FROM  counter_tab where counter_name='"+counter_name+"'");
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