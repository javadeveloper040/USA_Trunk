<%@ page import="java.sql.*" %>

<%
try {
String rollno=request.getParameter("rollno");

System.out.println(rollno);
Connection con=vdb.Db.connect();
PreparedStatement pst=con.prepareStatement("select p1.student_name,p1.branch_name,p1.sem from student_tab p1 where p1.roll_num=? ");

pst.setString(1,rollno);

ResultSet rs=pst.executeQuery();

rs.next();
String path1="../../../images/"+rollno+".jpg";
out.print(rs.getString(1)+"$"+rs.getString(2)+"$"+rs.getString(3)+"$"+path1);
}
catch(Exception e) {
	System.out.println("error");
}
%>

