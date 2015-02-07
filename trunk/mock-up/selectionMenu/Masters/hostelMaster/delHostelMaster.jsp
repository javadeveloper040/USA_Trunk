 <%@ page import="java.sql.*" %>
 <%
	try {
		 session.setAttribute("hostel_code",request.getParameter("hostel_code"));
	        Statement st = vdb.Db.connect().createStatement();
	        String hostel_name=request.getParameter("hostel_name");
	        st.execute("delete from hostel_tab where hostel_name='"+hostel_name+"'");
	        st.close();
	        vdb.Db.connect().close();
	        response.sendRedirect("./hostel_delete.jsp");
		}
	      catch (Exception s){
		        response.sendRedirect("./hostel_delete.jsp");	        
	      }
	  %>