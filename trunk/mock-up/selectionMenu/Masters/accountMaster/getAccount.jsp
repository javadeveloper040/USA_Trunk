<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String account_name=request.getParameter("account_name");
	        ResultSet res = st.executeQuery("SELECT * FROM  Account where account_name='"+account_name+"'");
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