 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String course_name=(String)session.getAttribute("course_name");
	        String branch_code=request.getParameter("branch_code");
  			String branch_name=request.getParameter("branch_name");
  			String ref=request.getParameter("ref");
  			int seats=Integer.parseInt(request.getParameter("seats"));
// 		    st.execute("delete from branch_coursemaster_details where course_name='"+course_name+"' and branch_code='"+branch_code+"'");
  	//		st.execute("insert into branch_coursemaster_details values('"+course_name+"','"+branch_code+"','"+branch_name+"','"+ref+"',"+seats+")");
  			String q="update branch_coursemaster_details set branch_name='"+branch_name+"',ref='"+ref+"',seats="+seats+" where course_name='"+course_name+"' and branch_code='"+branch_code+"'";
  			System.out.println(q);	
  			st.executeUpdate(q);
  				System.out.println("hello");
  				 session.setAttribute("course_name","");   
  		        vdb.Db.connect().close();
  		        response.sendRedirect("./course_modify.jsp");      	
	       }
	      catch (Exception s){
	    	  s.printStackTrace();
	    	  response.sendRedirect("./course_modify.jsp");
	      }
	  %>