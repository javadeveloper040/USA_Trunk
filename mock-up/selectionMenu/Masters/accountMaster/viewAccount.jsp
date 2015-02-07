<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String account_code=request.getParameter("account_code");
	        ResultSet res = st.executeQuery("SELECT * FROM  Account where account_code='"+account_code+"'");
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
	        else {
	        out.println("Inavalid");
	        }
	  }
	  catch(Exception e)
	  {
	  	e.printStackTrace();
	  }
%>