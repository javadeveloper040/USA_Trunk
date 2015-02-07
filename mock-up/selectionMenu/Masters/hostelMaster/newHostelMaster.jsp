 <%@ page import="java.sql.*" %>
 <%! ResultSet res=null; %>
 <% 
	try { 
		    Statement st = vdb.Db.connect().createStatement();
	        String hostel_name=request.getParameter("hostel_name");
	        hostel_name=hostel_name.trim();
	       
	        res=st.executeQuery("select * from  hostel_tab where hostel_name='"+hostel_name+"'");
	       
	        if(!res.next()) {
	        	st.execute("insert into hostel_tab values('"+session.getAttribute("hostel_code")+"','"+request.getParameter("hostel_name")+"','"+request.getParameter("new_admn_fee")+"','"+request.getParameter("old_admn_fee")+"')");
	        	
RequestDispatcher rd=request.getRequestDispatcher("./hostel_newmodify.jsp");
	        	rd.forward(request,response);	        	
	        	
	        }
	        else {
	        	//st.execute("delete from  hostel_tab where hostel_name='"+hostel_name+"'");
	       // st.execute("insert into hostel_tab values('"+request.getParameter("hostel_code")+"','"+request.getParameter("hostel_name")+"','"+request.getParameter("new_admn_fee")+"','"+request.getParameter("old_admn_fee")+"')");
	       st.executeUpdate("update hostel_tab set hostel_code='"+request.getParameter("hostel_code")+"',new_admn_fee="+Float.parseFloat(request.getParameter("new_admn_fee"))+",old_admn_fee="+Float.parseFloat(request.getParameter("old_admn_fee"))+" where hostel_name='"+request.getParameter("hostel_name")+"'");
	        	st.close();
	        		res.close();        	
	        	RequestDispatcher rd=request.getRequestDispatcher("./hostel_newmodify.jsp");
	        	rd.forward(request,response);
	        }
	        res.close();
		}
	      catch (Exception s){
	        s.printStackTrace();
	      }
	  %>