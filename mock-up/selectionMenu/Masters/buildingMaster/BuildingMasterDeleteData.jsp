<%@page import="java.sql.*,vdb.Db" %>
<html>
<body>
<center><h2>Building Details</h2></center>
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
 String blockno=request.getParameter("block_num");
 String roomno=request.getParameter("room_num");
  pst=con.prepareStatement("delete from building_tab where block_name=? and room_num=?");
 pst.setString(1,blockno);
 pst.setString(2,roomno);
 pst.executeUpdate();
 %>
 <jsp:forward page="BuildingMasterDelete.jsp"/>