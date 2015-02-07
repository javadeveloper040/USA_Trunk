<%@page import="java.sql.*,vdb.*,java.io.*"%>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
PreparedStatement pst1=null;
ResultSet rs=null;
 %>
<%
String rollno=request.getParameter("rollno");
try{
    con=Db.connect(); 
    pst=con.prepareStatement("select * from student_accomodation_details_tab where roll_num=?");
    pst.setString(1,rollno);
   rs=pst.executeQuery();
   String cancel_date=null;
   
    if(rs.next()){
    String hostelcode=request.getParameter("hostelcode");
    System.out.println(hostelcode);
    String room=request.getParameter("room_num");
    System.out.println(room);
    String month=request.getParameter("month");
    System.out.println(month);
    String year=request.getParameter("year");
    System.out.println(year);
    String dat=request.getParameter("date");
    String date=dat+"/"+month+"/"+year;
    System.out.println(date);
    pst1=con.prepareStatement("update student_accomodation_details_tab set hostel_code=?,room_num=?,reg_date=?,cancel_date=? where roll_num=?");
    pst1.setString(1,hostelcode);
    pst1.setString(2,room);
    pst1.setString(3,date);
    pst1.setString(4,cancel_date);
    pst1.setString(5,rollno);

    int i=pst1.executeUpdate();
   System.out.println(i);
   RequestDispatcher rd=request.getRequestDispatcher("./workimghostelmodify.jsp");
   rd.forward(request,response);
 }
 else
{
RequestDispatcher rd=request.getRequestDispatcher("nodetails.jsp");
rd.forward(request,response);
}
}
catch(Exception e)
{
}
 %>
