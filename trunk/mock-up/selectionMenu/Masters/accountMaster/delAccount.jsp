 <%@ page import="java.sql.*" %>
 <%
	try {
		 	
	        Statement st = vdb.Db.connect().createStatement();
	        String account_name=request.getParameter("account_name");
	        String account_code=request.getParameter("account_code");
	        if(account_name=="") {
	        st.execute("delete from  Account where account_code='"+account_code+"'");
	        }
	        else {
	        st.execute("delete from  Account where account_name='"+account_name+"'");
	        }
	        st.close();
	        vdb.Db.connect().close();
	        response.sendRedirect("./accountmasterdelete.jsp");
		}
	      catch (Exception s){
	        System.out.println("SQL code does not execute."+s);
	      }
	  %>