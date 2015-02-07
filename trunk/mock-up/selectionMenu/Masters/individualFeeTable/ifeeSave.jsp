<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
String num="";
Dbcon d=new Dbcon();
Connection con=d.getConnection();
Statement st3=con.createStatement();
ResultSet rs=st3.executeQuery("select max(serial) from student_fee_tab");
try{
if(rs.next())
	{
num=rs.getString(1);
num=num.substring(2);
System.out.println("reciept number:"+num);
int numi=Integer.parseInt(num);
numi++;
num="rc"+numi;
	}
}catch(NullPointerException n){
	num="rc0";
}
System.out.println(num);
	String roll_num=request.getParameter("roll_num");
	System.out.println("naggggggggggg"+roll_num);
	String fee_name=request.getParameter("fee_name");
	
	String discount=request.getParameter("discount");
	String amount=request.getParameter("feeamt");
	System.out.println(amount);
	int iamt=Integer.parseInt(amount);
	System.out.println(iamt);
	int i=0,s1=0;
	StringBuffer sb=new StringBuffer();
	Date date=new Date();
	int dyear=date.getYear();
	int year=dyear+1900;
	System.out.println(dyear);
	int dmonth=date.getMonth();
	int month1=dmonth+1;
	String smonth1="";
	if(month1<=9){smonth1="0"+month1;}
	int date1=date.getDate();
	String sdate1="";
	if(date1<=9){sdate1="0"+date1;}
	else
	sdate1=""+date1;
	
	String dates=""+sdate1+"/"+smonth1+"/"+year;
	Statement st=con.createStatement();
	int j=st.executeUpdate("insert into student_fee_tab values('"+roll_num+"','"+iamt+"','"+dates+"','"+fee_name+"','"+discount+"','"+num+"')");
	response.sendRedirect("./ifeeTableNewSource.jsp");
%>
</body>
</html>