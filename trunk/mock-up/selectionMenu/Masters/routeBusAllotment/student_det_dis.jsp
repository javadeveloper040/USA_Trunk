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
 
    pst=con.prepareStatement("select * from student_tab where roll_num=?");
   System.out.println(pst);
    pst.setString(1,rollno);
    System.out.println(pst);
    rs=pst.executeQuery();
    if(rs.next()){
    System.out.println(rs);
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
  
    String path="../../images/"+rollno+".jpg";
	
	RequestDispatcher rd=request.getRequestDispatcher("./student_det_disp.jsp");
   session.setAttribute("name",name+'$');
    System.out.println("tanuz");
    session.setAttribute("branch",branch+'$');
    session.setAttribute("sem",sem+'$');
    session.setAttribute("pname",parentname+'$');
    //request.setAttribute("abc4",hostelcode+'$');
    //request.setAttribute("abc5",roomnum+'$');
    // request.setAttribute("rno",rollno+'$'); 
     session.setAttribute("path",path+"$");
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
