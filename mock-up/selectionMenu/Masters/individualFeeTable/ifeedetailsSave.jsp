<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Individual Fee Table Save</title>
</head>
<body>
<% String roll_num=(String)request.getParameter("roll_num");
	String fee_name=(String)request.getParameter("fee_name"); 
	String rc;
	String amount=(String)request.getParameter("feeamt");
	String discount=(String)request.getParameter("discount");
	Date date=new Date();
	int year=date.getYear();
	year=year+1900;
	int datei=date.getDate();
	int month=date.getMonth();
	String dates=""+year+"."+month+"."+datei;
	System.out.println(dates);
	System.out.println("year    :"+year+"month      :"+ month+"date     :"+datei);
	Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st=con.createStatement();
	try{
	ResultSet res=st.executeQuery("select max(reciept_num) from individualfee");
	res.next();
	String max=res.getString(1);    	
	System.out.println(max);    	
	String max1=max.substring(2);
	System.out.println(max1);
	int i=Integer.parseInt(max1);
	System.out.println(i);
		i++;
	rc="rc"+i;
	System.out.println(rc);
	
	
	
	  }
      catch(NullPointerException e) {
      	e.printStackTrace();
      	rc="rc1";
       	System.out.println("hi");
	      	
      }
      st.executeUpdate("insert into individualfee values('"+roll_num+"','"+rc+"','"+fee_name+"','"+dates+"','"+amount+"','"+discount+"')");
	System.out.println("in db"+roll_num+fee_name+amount+rc+discount+dates);
%>
<jsp:forward page="ifeeTableNew.jsp"></jsp:forward>

</body>
</html>