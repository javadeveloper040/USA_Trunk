<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%
StringBuffer sb=new StringBuffer();
String area_name=request.getParameter("area_name");
System.out.println(area_name);

try {
	 
    ResultSet res=null;
    Dbcon d= new Dbcon();
	Connection con=d.getConnection();
        Statement st = con.createStatement();
        st.executeUpdate("delete from area_tab where area_name=+'"+area_name+"'");
        ResultSet rs=st.executeQuery("select area_name from area_tab");
        while(rs.next()){
        	String darea_name=rs.getString("area_name");
        	sb.append("$");
        	sb.append(darea_name);
        	
        	
        }
}   	catch (Exception s){
System.out.println("SQL code does not execute...................23"+s);
}  
out.print(sb);




%>