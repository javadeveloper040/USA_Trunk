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


 String area=request.getParameter("route");
 System.out.println(area);
 String rollno=request.getParameter("rollno");
 System.out.println(rollno);
 int bus_num=Integer.parseInt(request.getParameter("bus_num"));
 System.out.println(bus_num);
 String cancel_date=null;
String date=new java.util.Date().toString();
String dt=date.substring(4,7)+"-"+date.substring(8,10)+"-"+date.substring(24,28);

 pst=con.prepareStatement("select * from student_bus_acc_details_tab where roll_num=?");
pst.setString(1,rollno);
 rs=pst.executeQuery();
if(rs.next())
{
pst=con.prepareStatement("update student_bus_acc_details_tab set bus_reg_date=?,area_name=?,bus_num=?,bus_cancel_date=? where roll_num=?");  
pst.setString(1,dt);
pst.setString(2,area);
pst.setInt(3,bus_num);
pst.setString(4,cancel_date);
pst.setString(5,rollno);

pst.executeUpdate();
pst.close();
}
else{
pst=con.prepareStatement("insert into student_bus_acc_details_tab(roll_num,bus_reg_date,area_name,bus_num) values(?,?,?,?)");
pst.setString(1,rollno);
pst.setString(2,dt);
pst.setString(3,area);
pst.setInt(4,bus_num);
pst.executeUpdate();
pst.close();
con.close();
System.out.println("------------");
}
%>
<jsp:forward page="RouteBusAllot.jsp"/>
