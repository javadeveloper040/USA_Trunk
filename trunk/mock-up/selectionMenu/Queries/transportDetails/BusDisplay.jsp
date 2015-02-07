<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String s2=request.getParameter("route");
String s1=request.getParameter("bus");
int sn=0,org=0;
String roll_no="",name="",branch="",regdt="";
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
	    Statement st1 = con.createStatement(); 
	    ResultSet rs=st.executeQuery("select * from  student_bus_acc_details_tab where bus_num='"+s1+"'");
	    //sb.append("<table border=1 >");
	    sb.append("<table align=\"center\" border=1><tr bgcolor='#339999'><th width=100>SNo</th><th width=100>Reg No</th><th width=100>Name</th><th width=100>Branch</th><th width=100>regd Date</th><th width=100>Paid_amt</th><th width=100>Due_amt</th></tr>");
	    while(rs.next())
	    {
	    	 int paid=0,tot=0,due=0;
	    	sn++;
	    	roll_no=rs.getString(1);
	    	regdt=rs.getString(2);
	   	    ResultSet rs1=st1.executeQuery("select * from  student_tab where roll_num='"+roll_no+"'");
	   	    if(rs1.next())
	   	    {
	   	    	name=rs1.getString(3);
	   	    	branch=rs1.getString(4);
	   	    }
	   	 Statement st3 = con.createStatement(); 
		    ResultSet rs3=st3.executeQuery("select * from  student_fee_tab where fee_name='bus_fee' and roll_num='"+roll_no+"'");
		    while(rs3.next())
		    {
		    	paid=rs3.getInt(2);
		    	tot=tot+paid;
		    }
		    due=org-tot;
		    sb.append("<tr><td width=44>"+sn+"</td><td width=90>"+roll_no+"</td><td width=100>"+name+"</td><td width=60>"+branch+"</td><td width=100>"+regdt+"</td><td width=60>"+paid+"</td><td width=100>"+due+"</td></tr>");
	    }
 sb.append("</table>");
 out.println(sb);
}catch (Exception s){
System.out.println("SQL code does not execute."+s);
s.printStackTrace();
}
%>
	       	