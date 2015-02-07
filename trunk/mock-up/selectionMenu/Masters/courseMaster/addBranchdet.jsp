 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String branch_code=request.getParameter("branch_code");
  			String branch_name=request.getParameter("branch_name");
  			String ref=request.getParameter("ref");
  			int seats=Integer.parseInt(request.getParameter("seats"));
  			st.execute("insert into branch_coursemaster_details values('"+course_name+"','"+branch_code+"','"+branch_name+"','"+ref+"',"+seats+")");
	        session.setAttribute("course_name","");   
	        vdb.Db.connect().close();
	        response.sendRedirect("./course_new.jsp");      	
  			
	       }
	      catch (Exception s){
	    	  response.sendRedirect("./course_new.jsp");
	      }
	  %>