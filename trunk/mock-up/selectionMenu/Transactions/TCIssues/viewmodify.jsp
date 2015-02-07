<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,javax.servlet.*,javax.servlet.http.*"%>
    <%!ResultSet rs=null;
    String sname=null;
    String bname=null;
    String admnno=null;
    String pname=null;
    String dob=null;
    String gender=null;
    String caste=null;
    String religion=null;
    String nationality=null;
    String admndate=null;
    String dateleave=null;
    int d1=0,m=0,y=0,y1=0;String path=null;
    
    %>
<%
String serial=session.getAttribute("serial").toString();
String rollno=session.getAttribute("rollno").toString();
path="../../images/"+rollno+".jpg";
System.out.print(rollno);


%><%
try {

	 Date d=new Date();
	 System.out.println(d);
	 
	 d1=d.getDate();
	 m=d.getMonth()+1;
	 y=d.getYear();
	 y1=y+1900;
	 System.out.println(d1);
	 System.out.println(m);
	 System.out.println(y1);
	 
Connection con=vdb.Db.connect();
PreparedStatement pst=con.prepareStatement("select p1.student_name,p1.branch_name,p1.admn_num,p2.parent_name,p2.dob,p2.gender,p3.caste,p3.religion_name,p3.nationality,p4.admn_date ,p4.date_leave from student_tab p1,student_personal_details_tab p2,student_other_details_tab p3,student_academic_details_tab p4 where p1.roll_num=? and p2.roll_num=? and p3.roll_num=? and p4.roll_num=?");


pst.setString(1,rollno);
pst.setString(2,rollno);
pst.setString(3,rollno);
pst.setString(4,rollno);

rs=pst.executeQuery();
if(rs.next())
{
	 sname=rs.getString(1);
    bname=rs.getString(2);
   admnno=rs.getString(3);
     pname=rs.getString(4);
     dob=rs.getString(5);
     gender=rs.getString(6);
     caste=rs.getString(7);
     religion=rs.getString(8);
     nationality=rs.getString(9);
     admndate=rs.getString(10);
     dateleave=rs.getString(11);
}

	


}
catch(Exception e) {
	System.out.println(e);
}
%>

<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TC Issue</title>
<script language="javascript">
function fun()
{
	window.resizeTo(1000,700);
}
</script>
</head>


<body bgcolor="skyblue" onload="fun()">

<form action="tc2.jsp" method="get">
<fieldset><legend>TC Issues</legend>
<table>
<tr>
<td>
<fieldset><table cellspacing="4">
<tr>
<td>Reg/HT/Roll.No:<br/><input type="text" name="rollno" id="rollno" size="20" value="<%=rollno%>"></td>
<td>Sl No:<br/><input type="text" name="srno" id="srno" value="<%=serial%>" size="10"></td>
<td>TC Date:<br/><input type="text" name="tcdate" id="tcdate" size="15" value="<%=d1%>/<%=m%>/<%=y1%>"></td>
<td>AdmnNo:<br/><input type="text" name="admno" id="admno" size="15" value="<%=admnno%>"></td>
</tr>
<tr><td>Name Of The<br/> Student:(As Per<br/> SSC Records)</td><td colspan="3"><input type="text" name="name" id="name" size="40" value="<%=sname%>"></td></tr>
<tr><td>Name Of The Parent:</td><td colspan="3"><input type="text" name="pname" id="pname" size="40" value="<%=pname%>"></td></tr>
<tr><td>Nationality And Religion:</td><td colspan="3"><input type="text" name="nr" id="nr" size="40" value="<%=nationality%>,<%=religion%>"></td></tr>
<tr><td>Gender:</td><td><input type="text" name="sex" id="sex" size="10" value="<%=gender%>"></td><td>Date Of Birth(As<br/> Per SSC):</td><td><input type="text" name="dob" id="dob" size="10" value="<%=dob%>"></td></tr>
<tr><td>Whether Student<br/> Belongs To <br/>SC/ST/BC(If Yes <br/>Mention Caste):</td><td colspan="3"><input type="text" name="cast" id="cast" size="40" value="<%=caste%>"></td></tr>
<tr><td>Course And Branch In<br/> Which The Student Is<br/> Studying At The Time<br/> Of Leaving:</td><td colspan="3"><input type="text" name="branch" id="branch" size="40" value="<%=bname%>"></td></tr>
<tr><td>Date And Year In Which<br/> The Student Was<br/> Admitted:</td><td><input type="text" name="admndate" id="admndate" size="20" value="<%=admndate%>"></td></tr>
</table></fieldset>
</td>
<td>
<fieldset><table cellspacing="4">
<tr><td>Date On Which The<br/> Student Was Actually<br/> Left:</td><td><input type="text" name="leftdate" id="leftdate" size="10" value="<%=dateleave %>"></td><td rowspan="4"><img src="<%=path%>"  height="140" width="110"></td></tr>
<tr><td>Weather Qualified For<br/> Promotion To The<br/> Higher Class:</td><td><input type="text" name="promote" id="promote" size="10" value="yes"></td></tr>
<tr><td>Weather The Student<br/> Has Paid All Fees:</td><td><input type="text" name="fees" id="fees" size="10" value="yes"></td></tr>
<tr><td>Date On Which<br/> Application For TC<br/> Was Made By The<br/> Parent/Guardian:</td><td><input type="text" name="appdate" id="appdate" size="10" value="<%=d1%>/<%=m%>/<%=y1%>"></td></tr>
<tr><td>Reason For Leaving/<br/>Giving TC:</td><td colspan="2"><input type="text" name="reason" id="reason" size="40" value="course completed"></td></tr>
<tr><td>Conduct Of The<br/>Student:</td><td colspan="2"><input type="text" name="conduct" id="conduct">
</td></tr>
<tr><td>Genereal Remarks:</td><td colspan="2" rowspan="2"><textarea name="remarks" id="remarks" rows="5" cols="40"></textarea></td></tr>
<tr><td><input type="submit" value="VIEW TC" ></td></tr>
</table></fieldset>
</td>
</tr>
</table></fieldset>
</form>

</body>
</html>