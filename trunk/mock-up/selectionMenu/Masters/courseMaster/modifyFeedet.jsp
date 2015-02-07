 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String fee_name=request.getParameter("fee_name");
  			int month=Integer.parseInt(request.getParameter("month"));
  			int year=Integer.parseInt(request.getParameter("year"));
  			float amount=Float.parseFloat(request.getParameter("amount"));
  			ResultSet res=st.executeQuery("select * from fee_coursemaster_details where course_name='"+course_name+"' and fee_name='"+fee_name+"'");
  			if(!res.next()) {
	        st.execute("insert into fee_coursemaster_details values('"+course_name+"','"+fee_name+"',"+month+","+year+","+amount+")");
	        session.setAttribute("course_name","");
		       vdb.Db.connect().close();
	        response.sendRedirect("./course_modify.jsp");      
  			}
  			else {
  				//st.execute("delete from fee_coursemaster_details where course_name='"+course_name+"' and fee_name='"+fee_name+"'");
  				//st.execute("insert into fee_coursemaster_details values('"+course_name+"','"+fee_name+"',"+month+","+year+","+amount+")");
  				st.execute("update fee_coursemaster_details set month='"+month+"', year='"+year+"',amount='"+amount+"' where course_name='"+course_name+"' and fee_name='"+fee_name+"'");
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