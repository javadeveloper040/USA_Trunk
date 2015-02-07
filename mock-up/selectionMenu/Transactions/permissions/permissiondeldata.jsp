<%@page import="java.sql.*,vdb.*"%>
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
   pst=con.prepareStatement("delete from permissions_tab where roll_num=?");
   pst.setString(1,rollno);
   pst.executeUpdate();
   
}
catch(Exception e)
{
}
 %>
<jsp:forward page="./permissiondelete.jsp" />
