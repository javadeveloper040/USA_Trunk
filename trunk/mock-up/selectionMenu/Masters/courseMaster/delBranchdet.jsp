 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String branch_code=request.getParameter("branch_code");
  			String branch_name=request.getParameter("branch_name");
  			String ref=request.getParameter("ref");
  			int seats=Integer.parseInt(request.getParameter("seats"));
  			ResultSet res=st.executeQuery("select * from  branch_coursemaster_details where course_name='"+course_name+"' and branch_code='"+branch_code+"'");
  			if(res.next()) {
	        st.execute("delete from branch_coursemaster_details where course_name='"+course_name+"' and branch_code='"+branch_code+"'");
  				session.setAttribute("course_name","");   
  		        vdb.Db.connect().close();
  		        response.sendRedirect("./course_delete.jsp");      	
	       }
	}
	      catch (Exception s){
	    	  response.sendRedirect("./course_delete.jsp");
	      }
	  %>