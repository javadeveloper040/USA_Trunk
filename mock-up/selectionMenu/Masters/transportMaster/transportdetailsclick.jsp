<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mis.Dbcon"%>
<html>
<head>
<%@page import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String arealist1=request.getParameter("arealist");
	
	StringBuffer sb=new StringBuffer();
	try {
		
		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
	        Statement st = con.createStatement();  
	        ResultSet rs=st.executeQuery("select * from area_tab");
	        while(rs.next()){
	        	String area_code=rs.getString(1);
	        	String area_name=rs.getString(2);
	        	String area_fee=rs.getString(3);
	        	if(arealist1.equalsIgnoreCase(area_name)){
	        		sb.append("$");
	        		sb.append(area_code);
	        		sb.append("$");
	        		sb.append(area_name);
	        		sb.append("$");
	        		sb.append(area_fee);
	        		sb.append("$");
	        		
	        }
	} 
	}catch (Exception s){
        System.out.println("SQL code does not execute."+s);
    }
	
		out.println(sb);
		


%>
</body>
</html>