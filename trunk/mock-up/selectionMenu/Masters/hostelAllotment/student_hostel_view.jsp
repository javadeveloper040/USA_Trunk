<%@page import="java.sql.*,vdb.*,java.io.*"%>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
String rollno=request.getParameter("rollno");
System.out.println(rollno);
try{
    con=Db.connect(); 
    PreparedStatement pst=con.prepareStatement("select * from student_tab where roll_num=?");
	pst.setString(1,rollno);
	System.out.println(pst);
	 rs=pst.executeQuery();
	 rs.next();
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
   pst=con.prepareStatement("select * from student_accomodation_details_tab where roll_num=?");
   pst.setString(1,rollno);    
  rs=pst.executeQuery();
  rs.next();
  String hostelcode=rs.getString("hostel_code");
   System.out.println(hostelcode);
   String roomnum=rs.getString("room_num");
   System.out.println(roomnum);
   String date=rs.getString("reg_date");
   System.out.println(date);
   String canceldate=rs.getString("cancel_date");
   System.out.println(canceldate);
   
   if(canceldate==null){canceldate="STILL IN HOSTEL";}
     String path="../../images/"+rollno+".jpg";
	RequestDispatcher rd=request.getRequestDispatcher("./student_hostel_view1.jsp");
	System.out.println("in setattribute");
   request.setAttribute("abc",name+'$');
   System.out.println(name);
    request.setAttribute("abc1",branch+'$');
    System.out.println(branch);
    request.setAttribute("abc2",sem+'$');
    System.out.println(sem);
   request.setAttribute("abc3",parentname+'$');
    System.out.println(parentname);
    request.setAttribute("abc4",hostelcode+'$');
    System.out.println(hostelcode);
    request.setAttribute("abc5",roomnum+'$');
    System.out.println(roomnum);
     request.setAttribute("abc6",rollno+'$');
     System.out.println(rollno);
    request.setAttribute("abc8",path+"$");
     System.out.println(path);
    request.setAttribute("abc7",date+"$"); 
    System.out.println(date);
    request.setAttribute("abc9",canceldate+"$");
    System.out.println(date);
    
      
    rd.forward(request,response);
}
catch(Exception e)
{
}
 %>
