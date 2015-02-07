 <%@ page import="java.sql.*" %>
 <%! ResultSet res=null; %>
 <% 
	try { 
		    Statement st = vdb.Db.connect().createStatement();
	        String room_num=request.getParameter("room_num");
	        String room_capacity=request.getParameter("room_capacity");
	        res=st.executeQuery("select * from  hostel_room where hostel_code='"+session.getAttribute("hostel_code")+"' and room_num='"+room_num+"'");
	  out.println(session.getAttribute("hostel_code"));
	  	        session.setAttribute("hostel_code",request.getParameter("hostel_code"));
	        if(!res.next()) {
	        	st.execute("insert into hostel_room values('"+session.getAttribute("hostel_code")+"','"+room_num+"','"+room_capacity+"')");
	        	out.println("4");
RequestDispatcher rd=request.getRequestDispatcher("./roomdetails.jsp");
	        	rd.forward(request,response);	        	
	        	
	        }
	        else {
	        	//st.execute("delete from  hostel_room where hostel_code='"+session.getAttribute("hostel_code")+"' and room_num='"+room_num+"'");
	        	//st.execute("insert into hostel_room values('"+session.getAttribute("hostel_code")+"','"+room_num+"','"+room_capacity+"')");
	        	st.executeUpdate("update hostel_room set room_capacity='"+room_capacity+"' where hostel_code='"+session.getAttribute("hostel_code")+"' and room_num='"+room_num+"'");
	        	st.close();
	        		res.close();        	
	        	RequestDispatcher rd=request.getRequestDispatcher("./roomdetails.jsp");
	        	rd.forward(request,response);
	        }
	        res.close();
		}
	      catch (Exception s){
	    		res.close();        	
	        	RequestDispatcher rd=request.getRequestDispatcher("./roomdetails.jsp");
	        	rd.forward(request,response);
	      
	      }
	  %>