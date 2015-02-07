 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=request.getParameter("course_name");
	        ResultSet res=st.executeQuery("select * from coursemaster_tab where course_name='"+course_name+"'");
  			if(res.next()) {
	        st.execute("delete from coursemaster_tab where course_name='"+course_name+"'");
  			}
  			vdb.Db.connect().close();
  		        response.sendRedirect("./course_delete.jsp");      	
		       }
	      catch (Exception s){
	    	  response.sendRedirect("./course_delete.jsp");
	      }
%>