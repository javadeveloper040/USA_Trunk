<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String fee_name=request.getParameter("fee_name");
	        ResultSet res = st.executeQuery("SELECT * FROM  feemaster_tab where fee_name='"+fee_name+"'");
	        if(res.next()) {
	        int i;
	        for(i=1;i<18;i++) 
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