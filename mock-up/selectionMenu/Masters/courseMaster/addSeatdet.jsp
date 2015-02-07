 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_category=request.getParameter("fee_category");
	        String seat_category=request.getParameter("seat_category");
	        float percentage=Float.parseFloat(request.getParameter("percentage"));
			st.execute("insert into seat_coursemaster_details values('"+course_name+"','"+fee_category+"','"+seat_category+"',"+percentage+")");
			session.setAttribute("course_name","");  
			vdb.Db.connect().close();
	        response.sendRedirect("./course_new.jsp");      	
		}
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_new.jsp");
	      }
	  %>