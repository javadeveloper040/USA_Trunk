<%@page import="java.sql.*,vdb.*,javax.servlet.*"%>
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
  pst.setString(1,rollno);
  rs=pst.executeQuery();
   if(rs.next()){
    String name=rs.getString("student_name");
    String branch=rs.getString("branch_name");
    String sem=rs.getString("sem");
    pst=con.prepareStatement("select parent_name from student_personal_details_tab where roll_num=?");
    pst.setString(1,rollno);
    ResultSet rs=pst.executeQuery();
    rs.next();
    String parentname=rs.getString("parent_name");
    RequestDispatcher rd=request.getRequestDispatcher("student_permission.jsp");
   request.setAttribute("abc",branch+'$');
    request.setAttribute("abc1",sem+'$');
    request.setAttribute("abc2",name+'$');
    request.setAttribute("abc3",parentname);
    
      // System.out.println(rollno); 
    rd.forward(request,response);
   


}else
{%>
<jsp:forward page="fail.jsp"/>
<%
}
}
catch(Exception e)
{
}
 %>

