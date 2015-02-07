<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String s1=request.getParameter("route");
int bus=0;
StringBuffer sb=new StringBuffer();
try {
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	    Statement st = con.createStatement();  
	    ResultSet rs=st.executeQuery("select * from  bus_details_tab where layout_name='"+s1+"'");
	    while(rs.next())
	    {
	    	bus=rs.getInt(1);
	    	//System.out.println(bus);
	    	sb.append(bus);
	    	sb.append("$");
	    }
	    out.print(sb);
	    //System.out.println(sb);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>