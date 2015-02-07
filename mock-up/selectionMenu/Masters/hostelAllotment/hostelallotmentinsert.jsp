<%@page import="java.sql.*,vdb.Db" %>
<html>
<body>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
try{
    con=Db.connect(); 
    
}
catch(Exception e)
{

}
 String hostelcode=request.getParameter("hostelcode");
 //System.out.println(hostelcode);
 String roomno=request.getParameter("room_num");
 //System.out.println(roomno);
 String rollno=request.getParameter("rollno");
 //System.out.println(rollno);
 String month=request.getParameter("month");
 //System.out.println(month);
 String year=request.getParameter("year");
 //System.out.println(year);
 String date=request.getParameter("Date");
 String date1=date+"/"+month+"/"+year; 
 pst=con.prepareStatement("select * from student_accomodation_details_tab where roll_num=?");
pst.setString(1,rollno);
 rs=pst.executeQuery();
if(rs.next())
{
pst=con.prepareStatement("update student_accomodation_details_tab set hostel_code=?,room_num=?,reg_date=? where roll_num=?");  
pst.setString(1,hostelcode);
pst.setString(2,roomno);
pst.setString(4,rollno);
pst.setString(3,date1);
pst.executeUpdate();
pst.close();
}
else{
pst=con.prepareStatement("insert into student_accomodation_details_tab(roll_num,hostel_code,room_num,reg_date) values(?,?,?,?)");
pst.setString(1,rollno);
pst.setString(2,hostelcode);
pst.setString(3,roomno);
pst.setString(4,date1);
pst.executeUpdate();
pst.close();
con.close();
}
%>
<jsp:forward page="./hostelallotmentnewmodify.jsp"/>
