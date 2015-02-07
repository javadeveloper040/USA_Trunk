<%@page import="java.sql.*,vdb.*,java.io.*"%>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
String rollno=request.getParameter("rollno");
//System.out.println(rollno);
try{
    con=Db.connect(); 
  //PreparedStatement pst=con.prepareStatement("select * from student_tab where roll_num=?");
  //pst.setString(1,rollno);
  //System.out.println(pst);
 // rs=pst.executeQuery();
  //System.out.println(rs);
   //if(rs.next()){
    pst=con.prepareStatement("select * from student_tab where roll_num=?");
   // System.out.println(pst);
    pst.setString(1,rollno);
    //System.out.println(pst);
    rs=pst.executeQuery();
    if(rs.next()){
    //System.out.println(rs);
    String name=rs.getString("student_name");
    System.out.println(name);
    String branch=rs.getString("branch_name");
    System.out.println(branch);
    String sem=rs.getString("sem");
    System.out.println(sem);
    pst=con.prepareStatement("select parent_name from student_personal_details_tab where roll_num=?");
    pst.setString(1,rollno);
    ResultSet rs=pst.executeQuery();
    rs.next();
    String parentname=rs.getString("parent_name");
    System.out.println(parentname);
   // pst=con.prepareStatement("select * from student_accomodation_details_tab where roll_num=?");
   // pst.setString(1,rollno);    
    //System.out.println(pst);
    //rs=pst.executeQuery();
    //System.out.println(rs);
    //rs.next();
   //String hostelcode=rs.getString("hostel_code");
   //System.out.println(hostelcode);
   //String roomnum=rs.getString("room_num");
   //System.out.println(roomnum);
   //String date=rs.getString("date_join");
   //System.out.println(date);
   	String path1="../../images/"+rollno+".jpg";
	 RequestDispatcher rd=request.getRequestDispatcher("./student_hostel_disp.jsp");
   session.setAttribute("name",name+'$');
    System.out.println("tanuz");
    session.setAttribute("branch",branch+'$');
    session.setAttribute("sem",sem+'$');
    session.setAttribute("pname",parentname+'$');
    //request.setAttribute("abc4",hostelcode+'$');
    //request.setAttribute("abc5",roomnum+'$');
    // request.setAttribute("rno",rollno+'$'); 
     session.setAttribute("path",path1+"$");
     //request.setAttribute("abc7",date+"$");   
     //System.out.println(rollno);
      
    rd.forward(request,response);
 }
 else
{
RequestDispatcher rd=request.getRequestDispatcher("fail.jsp");
rd.forward(request,response);
}
}
catch(Exception e)
{
}
 %>
