<%@page import="java.util.Enumeration"%>
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%String oldp=request.getParameter("old");
System.out.println(oldp);
String incharge_name=request.getParameter("incharge_name");
System.out.println(incharge_name);
		String newp=request.getParameter("new");
		Dbcon d=new Dbcon();
		Connection con= d.getConnection();
		try {
			Statement st= con.createStatement();
			int i=st.executeUpdate("update counter_tab set password='"+newp+"' where password='"+oldp+"' and incharge='"+incharge_name+"' ");
			HttpSession sess=request.getSession(false);
			if(i==1){
				sess.setAttribute("status","ok");
				sess.setAttribute("incharge",incharge_name);
				sess.setAttribute("newpassword",newp);
	RequestDispatcher rd=request.getRequestDispatcher("./loginToVerifyDetails.jsp");
				rd.forward(request, response);
		}
		else{
				sess.setAttribute("status","not ok");
				RequestDispatcher rd=request.getRequestDispatcher("./counterPasswordReset.jsp");
				rd.forward(request, response);	
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		%>