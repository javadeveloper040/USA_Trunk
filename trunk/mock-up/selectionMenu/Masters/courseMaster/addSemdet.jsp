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
  			System.out.println(course_name+year+semester+comp_course+annual_exam);
	        st.execute("insert into semester_coursemaster_details values('"+course_name+"',"+year+","+semester+",'"+comp_course+"','"+annual_exam+"')");
	        session.setAttribute("course_name","");  
	        vdb.Db.connect().close();
	        response.sendRedirect("./course_new.jsp");      	
		}
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_new.jsp");
	      }
	  %>