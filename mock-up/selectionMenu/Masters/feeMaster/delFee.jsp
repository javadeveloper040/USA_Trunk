 <%@ page import="java.sql.*" %>
 <%
	try {
		 	
	        Statement st = vdb.Db.connect().createStatement();
	        String fee_name=request.getParameter("fee_name");
	        String fee_code=request.getParameter("fee_code");
	        if(fee_name=="") {
	        st.execute("delete from  feemaster_tab where fee_code='"+fee_code+"'");
	        }
	        else {
	        st.execute("delete from  feemaster_tab where fee_name='"+fee_name+"'");
	        }
	        st.close();
	        vdb.Db.connect().close();
	        response.sendRedirect("./FeeMaster_delete.jsp");
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute."+s);
	      }
	  %>