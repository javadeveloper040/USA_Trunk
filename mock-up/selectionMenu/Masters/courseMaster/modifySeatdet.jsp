 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_category=request.getParameter("fee_category");
	        String seat_category=request.getParameter("seat_category");
	        float percentage=Float.parseFloat(request.getParameter("percentage"));
	        ResultSet res=st.executeQuery("select * from  seat_coursemaster_details where course_name='"+course_name+"' and seat_category='"+seat_category+"'");
  			if(!res.next()) {
			st.execute("insert into seat_coursemaster_details values('"+course_name+"','"+fee_category+"','"+seat_category+"',"+percentage+")");
			session.setAttribute("course_name","");  
			vdb.Db.connect().close();
	        response.sendRedirect("./course_modify.jsp");
  			}
	        else {
	        	//st.execute("delete from seat_coursemaster_details where course_name='"+course_name+"' and seat_category='"+seat_category+"'");
	        	//st.execute("insert into seat_coursemaster_details values('"+course_name+"','"+fee_category+"','"+seat_category+"',"+percentage+")");
				st.executeUpdate("update seat_coursemaster_details set fee_category='"+fee_category+"',percentage="+percentage+" where course_name='"+course_name+"' and seat_category='"+seat_category+"'");
	        	session.setAttribute("course_name","");  
				vdb.Db.connect().close();
		        response.sendRedirect("./course_modify.jsp");
	        }
		}
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_modify.jsp");
	      }
	  %>