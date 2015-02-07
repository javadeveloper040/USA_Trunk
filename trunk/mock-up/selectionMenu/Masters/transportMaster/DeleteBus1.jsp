<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
String bus_num=request.getParameter("bus_num1");
StringBuffer sb=new StringBuffer();
System.out.println(bus_num);
try {
	System.out.println("db");
    
    Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st = con.createStatement();
    st.executeUpdate("delete from bus_details_tab where bus_num=+'"+bus_num+"'");
    ResultSet resbus=st.executeQuery("select distinct bus_num from bus_details_tab");
    while(resbus.next()){
		String Bus_num=resbus.getString(1);
		sb.append("$");
		sb.append(Bus_num);
		
	}
	sb.append("&");
	Statement st1=con.createStatement();

	ResultSet rsl=st1.executeQuery("select layout_name from layout_tab");
	while(rsl.next()){
		String dlayout_name=rsl.getString(1);
		sb.append("$");
		sb.append(dlayout_name);
		
	}
	System.out.println(sb);
	out.print(sb);
}catch(Exception e){
	e.printStackTrace();
}

%>