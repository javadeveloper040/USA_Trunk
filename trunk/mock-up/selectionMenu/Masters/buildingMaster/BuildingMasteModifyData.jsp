<%@page import="java.sql.*" %>
<%@page import="vdb.Db;"%>
<html>
<head>
<title>Building Master Modify</title>
</head>
<body>
<center><h2>Building Details</h2></center>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
String sem=null;
String branch=null;
String course=null;
String bc=null;
 %>
<%
try{
    con=Db.connect();     
}
catch(Exception e){}
 String blockno=request.getParameter("block_num");
 //System.out.println(blockno);
 String roomno=request.getParameter("room_num");
 //System.out.println(roomno);
 String alloted=request.getParameter("alloted");
 
 System.out.println(alloted);
 if(alloted==null)
 {
 alloted="off";
 sem="0";
 branch=null;
 }
 else
 {
  branch=request.getParameter("branch");
  course=request.getParameter("course");
  bc=branch+"-"+course;
  System.out.println(bc);
  sem=request.getParameter("sem");
 }
 pst=con.prepareStatement("select* from building_tab where block_name=? and room_num=?");
 pst.setString(1,blockno);
 pst.setString(2,roomno);
rs=pst.executeQuery();
if(rs.next())
{
pst=con.prepareStatement("update building_tab set alloted_status=?,sem=?,branch_name=? where block_name=? and room_num=?");  
pst.setString(5,roomno);
pst.setString(1,alloted);
pst.setString(3,bc);
pst.setInt(2,Integer.parseInt(sem));
pst.setString(4,blockno);
pst.executeUpdate();
pst.close();
}
else{
pst=con.prepareStatement("insert into building_tab values(?,?,?,?,?)");
pst.setString(1,roomno);
pst.setString(2,blockno);
pst.setString(3,bc);
pst.setInt(4,Integer.parseInt(sem));
pst.setString(5,alloted);
pst.executeUpdate();
pst.close();
con.close();

}
 %>
 <jsp:forward page="./BuildingMasterModify.jsp"/>