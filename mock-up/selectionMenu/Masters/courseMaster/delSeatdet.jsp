 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_category=request.getParameter("fee_category");
	        String seat_category=request.getParameter("seat_category");
	        System.out.println("1");
	        ResultSet res=st.executeQuery("select * from  seat_coursemaster_details where course_name='"+course_name+"' and seat_category='"+seat_category+"'");
	        System.out.println("2");
  			if(res.next()) {
  		        System.out.println("3");
			st.execute("delete from seat_coursemaster_details where course_name='"+course_name+"' and fee_category='"+fee_category+"' and seat_category='"+seat_category+"'");
  			}
	        System.out.println("4");
	        session.setAttribute("course_name","");  
				vdb.Db.connect().close();
		        response.sendRedirect("./course_delete.jsp");
	   
		}
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_delete.jsp");
	      }
	  %>