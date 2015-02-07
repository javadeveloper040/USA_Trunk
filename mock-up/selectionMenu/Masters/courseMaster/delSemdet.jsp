 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        int year=Integer.parseInt(request.getParameter("year"));
	        int semester=Integer.parseInt(request.getParameter("semester"));
	       String comp_course=request.getParameter("comp_course");
  			if(comp_course==null) {
  				comp_course="no";
  			}
  			String annual_exam=request.getParameter("annual_exam");
  			if(annual_exam==null) {
  				annual_exam="no";
  			}
  			ResultSet res=st.executeQuery("select * from  semester_coursemaster_details where course_name='"+course_name+"' and year='"+year+"' and semester='"+semester+"'");
  			if(res.next()) {
	        	st.execute("delete from  semester_coursemaster_details where course_name='"+course_name+"' and year='"+year+"' and semester='"+semester+"'");
  			}
  				session.setAttribute("course_name","");  
  		        vdb.Db.connect().close();
  		        response.sendRedirect("./course_delete.jsp");	 			
		}
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_delete.jsp");
	      }
	  %>