 <%@ page import="java.sql.*" %>
 <%
	try {
		 
	        Statement st = vdb.Db.connect().createStatement();
	        String hostel_code=request.getParameter("hostel_code");
	        String room_num=request.getParameter("room_num");
	        String que="delete from hostel_room where hostel_code='"+hostel_code+"' and room_num='"+room_num+"'";
	        out.println(que);
	        st.execute(que);
	        st.close();
	        //conec.DriverMan.conn().close();
	        response.sendRedirect("./roomdetails.jsp?hostel_code="+hostel_code);
		}
	      catch (Exception s){
	    	  response.sendRedirect("./roomdetails.jsp");
	      }
	  %>