<%@page import="java.sql.*,vdb.Db" %>

<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
String roll_num;
 %>
<%
try{
    con=Db.connect(); 
    
}
catch(Exception e)
{

}
try
{
roll_num=request.getParameter("rollno");
pst=con.prepareStatement("select * from student_tab where roll_num=?");
pst.setString(1,roll_num);
rs=pst.executeQuery();
if(rs.next())
{
	session.setAttribute("admission_num",rs.getString("admn_num"));
	System.out.println(rs.getString("admn_num"));
	session.setAttribute("fullname",rs.getString("student_name"));
	System.out.println(rs.getString("student_name"));
	session.setAttribute("branch",rs.getString("branch_name"));
	System.out.println(rs.getString("branch_name"));
	session.setAttribute("sem",rs.getString("sem"));
	System.out.println(rs.getString("sem"));
}
pst=con.prepareStatement("select * from student_personal_details_tab where roll_num=?");
pst.setString(1,roll_num);
rs=pst.executeQuery();
if(rs.next())
{
	session.setAttribute("dob",rs.getString("dob"));
	System.out.println(rs.getString("dob"));
	session.setAttribute("gender",rs.getString("gender"));
	System.out.println(rs.getString("gender"));
	session.setAttribute("parentname",rs.getString("parent_name"));
	System.out.println(rs.getString("parent_name"));
	session.setAttribute("occupation",rs.getString("parent_occup"));
	System.out.println(rs.getString("parent_occup"));
	
	session.setAttribute("landline",rs.getString("land_num"));
	System.out.println(rs.getString("land_num"));
	session.setAttribute("parentmobile",rs.getString("parent_mob"));
	System.out.println(rs.getString("parent_mob"));
	session.setAttribute("studentmobile",rs.getString("student_mob"));
	System.out.println(rs.getString("student_mob"));
	session.setAttribute("email",rs.getString("email"));
	System.out.println(rs.getString("email"));
	session.setAttribute("altemail",rs.getString("alt_email"));
	System.out.println(rs.getString("alt_email"));
}
pst=con.prepareStatement("select * from student_corr_address_details_tab where roll_num=?");
pst.setString(1,roll_num);
rs=pst.executeQuery();
if(rs.next())
{
	session.setAttribute("dorrno",rs.getString("door_num"));
	System.out.println(rs.getString("door_num"));
	session.setAttribute("street",rs.getString("street_name"));
	System.out.println(rs.getString("street_name"));
	session.setAttribute("area",rs.getString("area_name"));
	System.out.println(rs.getString("area_name"));
	session.setAttribute("district",rs.getString("district_name"));
	System.out.println(rs.getString("district_name"));
	session.setAttribute("pin",rs.getString("pin"));
	System.out.println(rs.getString("pin"));
}
pst=con.prepareStatement("select * from student_academic_details_tab where roll_num=?");
pst.setString(1,roll_num);
rs=pst.executeQuery();
if(rs.next())
{

session.setAttribute("qualifingtest",rs.getString("qual_test"));
System.out.println(rs.getString("qual_test"));
session.setAttribute("rank",rs.getString("qual_test_rank"));
System.out.println(rs.getString("qual_test_rank"));
session.setAttribute("hallticket",rs.getString("ht_num"));
System.out.println(rs.getString("ht_num"));
session.setAttribute("sschallticket",rs.getString("ssc_ht_num"));
System.out.println(rs.getString("ssc_ht_num"));
}
pst=con.prepareStatement("select * from student_other_details_tab where roll_num=?");
pst.setString(1,roll_num);
rs=pst.executeQuery();
if(rs.next())
{

session.setAttribute("nationality",rs.getString("pin"));
System.out.println(rs.getString("pin"));
session.setAttribute("mothertongue",rs.getString("pin"));
System.out.println(rs.getString("pin"));
}
}
catch(Exception e)
{
	System.out.println(e);
}



%>