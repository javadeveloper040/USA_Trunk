<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
String cname=request.getParameter("counter_name");
System.out.println(cname);
String pwd=request.getParameter("pwd");
System.out.println(pwd);
int s=0;

HttpSession hs=request.getSession();
hs.setAttribute("f1",cname);

try {
	
    
    Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from counter_tab");
	while(rs.next())
	{
		String cn=rs.getString(2);
		System.out.println(cn);
		String p=rs.getString(5);
		System.out.println(p);
		if(cname.equals(cn)&&pwd.equals(p))
		{
			s=1;
			break;
		}
	}
	if(s==1)
	{
		response.sendRedirect("./ifee.jsp");
	}
	else
	{
		RequestDispatcher rd=request.getRequestDispatcher("./regular.jsp");
		rd.forward(request, response);
	}
}  
catch (Exception e) {
	e.printStackTrace();
}


%>