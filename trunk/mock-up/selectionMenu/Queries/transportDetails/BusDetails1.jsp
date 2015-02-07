<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String s1=request.getParameter("bus");
int nos=0,fil=0,vac=0;
StringBuffer sb=new StringBuffer();
try {
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	    Statement st = con.createStatement();  
	    ResultSet rs=st.executeQuery("select * from  bus_details_tab where bus_num='"+s1+"'");
	    while(rs.next())
	    {
	    	nos=rs.getInt(2);
	    }
	    Statement st1 = con.createStatement();  
	    ResultSet rs1=st1.executeQuery("select * from  student_bus_acc_details_tab where bus_num='"+s1+"'");
	   	while(rs1.next())
	   	{
	   		fil=fil+1;
	   	}
	   	vac=nos-fil;
	   	sb.append(nos);
	   	sb.append("$");
	   	sb.append(fil);
	   	sb.append("$");
	   	sb.append(vac);
	   	sb.append("$");
	    out.print(sb);
	    System.out.println(sb);
}
catch(Exception e)
{
	e.printStackTrace();
}
%>