<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String roll_num=request.getParameter("rollno");
System.out.println(roll_num);
StringBuffer sb=new StringBuffer();
try {
	System.out.println("db");
    
    Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	System.out.println("connection established");
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	ResultSet rs=st.executeQuery("select s.branch_name,s.sem,s.student_name,p.parent_name from student_tab s,student_personal_details_tab p where s.roll_num=p.roll_num and s.roll_num='"+roll_num+"'");
	String path1="../../images/"+roll_num+".jpg";
	if(rs.next()){
		String dstudent_name=rs.getString(3);
		System.out.println(dstudent_name);
		String dbranch_name=rs.getString(1);
		String dsem=rs.getString(2);
		String dparent_name=rs.getString(4);
		System.out.println(dparent_name);
			sb.append("$");
			sb.append(dbranch_name);
			sb.append("$");
			sb.append(dsem);
			sb.append("$");
			sb.append(dstudent_name);
			sb.append("$");
			sb.append(dparent_name);
			sb.append("$");
			sb.append(path1);
			
	}else System.out.print("mujh ki kya hua hai");
	sb.append("*");
	HashSet hs=new HashSet();
	ResultSet rs1=st1.executeQuery("select distinct fee_payment_date from student_fee_tab where roll_num='"+roll_num+"'");
			
				while(rs1.next()){
				String d1=rs1.getString(1);
				System.out.println(d1);
				String year=d1.substring(6);
				System.out.println(year);
				
				hs.add(year);
			}
				
				Iterator itr=hs.iterator();
				
				
				while(itr.hasNext()){
					sb.append("$");
					sb.append(itr.next());	
				}
				
				
			out.println(sb);
	
	
}catch(Exception e){
	e.printStackTrace();
	
}
%>
