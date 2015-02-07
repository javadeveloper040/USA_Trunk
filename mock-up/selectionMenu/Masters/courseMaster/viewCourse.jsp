<%@page import="java.sql.*" %>
<%
 try {
			Statement st=vdb.Db.connect().createStatement();
	        String course_name=request.getParameter("course_name");
	        String course_duration=null;
	        String university_name=null;
	        session.setAttribute("course_name",course_name);
	        System.out.println(course_name);
	        ResultSet res = st.executeQuery("SELECT * FROM  coursemaster_tab where course_name='"+course_name+"'");
	        if(res.next()) {
	        	course_name=res.getString(1);
	        	course_duration=res.getString(2);
	        	university_name=res.getString(3);
	        }
	        vdb.Db.connect().close();
	        res.close();
	        response.sendRedirect("./course_new1.jsp?course_name="+course_name+"&course_duration="+course_duration+"&university_name="+university_name);
	  }
	  catch(Exception e)
	  {
		  response.sendRedirect("./course_new.jsp");
	  	e.printStackTrace();
	  }
%>