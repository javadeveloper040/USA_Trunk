 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=request.getParameter("course_name");
	        int course_duration=Integer.parseInt(request.getParameter("course_duration"));
  			String university_name=request.getParameter("university_name");
  			ResultSet res=st.executeQuery("select * from coursemaster_tab where course_name='"+course_name+"'");
  			if(!res.next()) {
	        st.execute("insert into coursemaster_tab values('"+course_name+"',"+course_duration+",'"+university_name+"')");
	        vdb.Db.connect().close();
	        response.sendRedirect("./course_modify.jsp");      	
		
  			}
  			else {
  				//st.execute("delete from coursemaster_tab where course_name='"+course_name+"'");
  				//st.execute("insert into coursemaster_tab values('"+course_name+"',"+course_duration+",'"+university_name+"')");
  				st.executeUpdate("update coursemaster_tab set course_duration="+course_duration+",university_name='"+university_name+"'where course_name='"+course_name+"' ");
  				vdb.Db.connect().close();
  		        response.sendRedirect("./course_modify.jsp");      	
  			
  			}
		       }
	      catch (Exception s){
	    	  response.sendRedirect("./course_modify.jsp");
	      }
	  %>