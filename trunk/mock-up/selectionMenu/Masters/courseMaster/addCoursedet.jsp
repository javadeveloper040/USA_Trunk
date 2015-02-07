 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=request.getParameter("course_name");
	        String course_duration=request.getParameter("course_duration");
  			String university_name=request.getParameter("university_name");
  			st.execute("insert into coursemaster_tab values('"+course_name+"','"+course_duration+"','"+university_name+"')");
	        vdb.Db.connect().close();
	        response.sendRedirect("./course_new.jsp");      	
		
		       }
	      catch (Exception s){
	    	  response.sendRedirect("./course_new.jsp");
	      }
	  %>