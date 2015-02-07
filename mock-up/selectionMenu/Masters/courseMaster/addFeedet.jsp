 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_name=request.getParameter("fee_name");
  			int month=Integer.parseInt(request.getParameter("month"));
  			int year=Integer.parseInt(request.getParameter("year"));
  			float amount=Float.parseFloat(request.getParameter("amount"));
  			st.execute("insert into fee_coursemaster_details values('"+course_name+"','"+fee_name+"',"+month+","+year+","+amount+")");
	        session.setAttribute("course_name","");
		       vdb.Db.connect().close();
	        response.sendRedirect("./course_new.jsp");      
  	   }
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_new.jsp");
	      }
	  %>