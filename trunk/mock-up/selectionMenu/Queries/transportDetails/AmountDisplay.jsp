<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String s2=request.getParameter("route");
String s1=request.getParameter("bus");
int sn=0,org=0,ta=0,taf=0,tac=0,tda=0,nos=0,fil=0;
//String roll_no="",name="",branch="",regdt="";
StringBuffer sb=new StringBuffer();
try {
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
		Statement st2 = con.createStatement(); 
	    ResultSet rs2=st2.executeQuery("select * from  area_tab where area_name='"+s2+"'");
	    if(rs2.next())
	    {
	    	org=rs2.getInt(3);
	    }
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
	   		int org1=0;
	   		fil=fil+1;
	   		//String an=rs1.getString(3);
	   		String roll=rs1.getString(1);
	   		Statement st4 = con.createStatement(); 
		    ResultSet rs4=st4.executeQuery("select sum(total_amount) from  student_fee_tab where roll_num='"+roll+"' and fee_name='bus_fee'");
		    if(rs4.next())
		    {
		    	org1=rs4.getInt(1);
		    }
		    tac=tac+org1;
	   	}
	   	System.out.println(fil);
	   	ta=org*nos;
	   	taf=org*fil;
	   	tda=taf-tac;
	   	sb.append(ta);
	   	sb.append("$");
	   	sb.append(taf);
	   	sb.append("$");
	   	sb.append(tac);
	   	sb.append("$");
	   	sb.append(tda);
	   	sb.append("$");
	   	out.println(sb);
}
catch(Exception e)
{
	System.out.println(e);
	e.printStackTrace();
}
%>
}
	   	