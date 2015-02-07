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
 String rollno=request.getParameter("rollno");
 session.setAttribute("roll",rollno);
 String permission=request.getParameter("fee_name");
 session.setAttribute("per",permission);
 String date=request.getParameter("date");
 String month=request.getParameter("month");
  String year=request.getParameter("year");
  String hi=date+"-"+month+"-"+year;
	session.setAttribute("date",hi);  
   String amount=request.getParameter("amount");
   session.setAttribute("amo",amount);
   String ins=request.getParameter("ins");
   session.setAttribute("ins",ins);
   String perby=request.getParameter("perby");
   session.setAttribute("per1",perby);
 pst=con.prepareStatement("select * from permissions_tab where roll_num=?");
 pst.setString(1,rollno);
 rs=pst.executeQuery();
if(rs.next())
{ 
   pst=con.prepareStatement("update permissions_tab set roll_num=?,permissionfor=?,targatedate=?,amount=?,permissiongivenby=?,noofinstallments=? where roll_num=?");
   pst.setString(1,rollno);
   pst.setString(2,permission);
   pst.setString(3,hi);
   pst.setString(4,amount);
   pst.setString(5,perby);
   pst.setString(6,ins);
   pst.setString(7,rollno);
   pst.executeUpdate();
   }
   else
   {
   pst=con.prepareStatement("insert into permissions_tab values(?,?,?,?,?,?)");
   pst.setString(1,rollno);
   pst.setString(2,permission);
   String d=date+"-"+month+"-"+year;
   pst.setString(3,d);
   pst.setString(4,amount);
   pst.setString(5,perby);
   pst.setString(6,ins);
  pst.executeUpdate();
  }
  %>  
<jsp:forward page="permissionview.jsp"/>