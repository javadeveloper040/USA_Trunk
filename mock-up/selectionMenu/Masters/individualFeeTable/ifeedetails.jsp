<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="mis.Dbcon"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Individual Fee Table Details</title>
</head>
<body >
<%

String roll_num=request.getParameter("rollno");
System.out.println("actually........"+roll_num);
Dbcon d=new Dbcon();
Connection con= d.getConnection();
Statement st1=con.createStatement();
String branch="";
String sem="",name="",pname="";
ResultSet rs1=st1.executeQuery("select s.branch_name,s.sem,s.student_name,p.parent_name from student_tab s,student_personal_details_tab p where s.roll_num=p.roll_num and s.roll_num='"+roll_num+"'");
if(rs1.next()){
	name=rs1.getString(3);
	branch=rs1.getString(1);
	sem=rs1.getString(2);
	pname=rs1.getString(4);
//	InputStream is=rs1.getBinaryStream(4);
//	FileOutputStream fos=new FileOutputStream("d:\\aazam.jpg");
//	int k;
//	while((k=is.read())!=-1){
//		fos.write(k);
//	}
//	System.out.println("image retrieved");
//	fos.close();
}
String path1="../../images/"+roll_num+".jpg";
StringBuffer sb=new StringBuffer();

	sb.append("$");
	sb.append(branch);
	sb.append("$");
	sb.append(sem);
	sb.append("$");
	sb.append(name);
	sb.append("$");
	sb.append(pname);
	sb.append("$");
	sb.append(path1);
	sb.append("$");
	out.println(sb);

%>
</body>
</html>