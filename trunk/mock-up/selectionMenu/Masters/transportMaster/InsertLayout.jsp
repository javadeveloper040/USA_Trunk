<%@page import="mis.Dbcon"%>
<%@page import="java.sql.*"%>
<%
String layout=request.getParameter("arealist");
System.out.println(layout);
Connection con = null;

StringBuffer sb=new StringBuffer();
try{
	
	 Dbcon d= new Dbcon();
	 con=d.getConnection();
PreparedStatement pst=con.prepareStatement("insert into layout_tab values(?)");
pst.setString(1,layout);
pst.executeUpdate();
System.out.println("inserted successfully");
Statement st=con.createStatement();
ResultSet rs= st.executeQuery("select * from layout_tab");
while(rs.next()){
	sb.append(rs.getString(1));
	sb.append("$");
}
System.out.println(sb);
out.print(sb);
}  catch (Exception e) {
e.printStackTrace();
}  	  	    

%>