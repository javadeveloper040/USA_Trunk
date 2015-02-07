<%@ page import="vdb.*,java.sql.*" %>

<%
try {
String uid=request.getParameter("uid");

System.out.println(uid);
Connection con=Db.connect();
PreparedStatement pst=con.prepareStatement("select * from users_tab  where user_id=?");

pst.setString(1,uid);

ResultSet rs=pst.executeQuery();

if(rs.next())
{
	System.out.print(rs.getString(1));
	out.print("USER ID IS NOT AVAILABLE");
}



}
catch(Exception e) {
	e.printStackTrace();
	System.out.println("error");
}
%>

