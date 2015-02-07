<%@page import="java.sql.*" %>
<%
 try {
		 Statement st=vdb.Db.connect().createStatement();
	        String fee_code=request.getParameter("fee_code");
	        ResultSet res = st.executeQuery("SELECT * FROM  feemaster_tab where fee_code='"+fee_code+"'");
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