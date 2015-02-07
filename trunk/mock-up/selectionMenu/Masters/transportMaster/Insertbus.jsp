<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%
System.out.println("ighuiguiggugu......");
StringBuffer sb=new StringBuffer();
int i=0;

try {
	
    
    Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st=con.createStatement();
	String bus_num=request.getParameter("bus_num");
	System.out.println(bus_num);
	String seats=request.getParameter("num_of_seats");
	String layout_name=request.getParameter("layout_name");
	String driver_name=request.getParameter("driver_name");
	String driver_mob=request.getParameter("driver_mob");
	String faculty_name=request.getParameter("faculty_name");
	String faculty_mob=request.getParameter("faculty_mob");
	String coordinator_name=request.getParameter("coordinator_name");
	String coordinator_mob=request.getParameter("coordinator_mob");
	String incharge_name=request.getParameter("incharge_name");
	String incharge_mob=request.getParameter("incharge_mob");
	ResultSet rsfirst=st.executeQuery("select bus_num from bus_details_tab where bus_num='"+bus_num+"'");
	if(rsfirst.next())
		st.executeUpdate("update bus_details_tab  set num_of_seats='"+seats+"',driver_name='"+driver_name+"',driver_mob='"+driver_mob+"',faculty_name='"+faculty_name+"',faculty_mob='"+faculty_mob+"',coordinator_name='"+coordinator_name+"',coordinator_mob='"+coordinator_mob+"',incharge_name='"+incharge_name+"',incharge_mob='"+incharge_mob+"',layout_name='"+layout_name+"' where bus_num='"+bus_num+"'");
			
	else
		st.executeUpdate("insert into bus_details_tab values('"+bus_num+"','"+seats+"','"+driver_name+"','"+driver_mob+"','"+faculty_name+"','"+faculty_mob+"','"+coordinator_name+"','"+coordinator_mob+"','"+incharge_name+"','"+incharge_mob+"','"+layout_name+"')");
			
			
			
			
			
			
			ResultSet rs=st.executeQuery("select bus_num from bus_details_tab");
			while(rs.next()){
				String Bus_num=rs.getString(1);
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
			
		
	
	
	
}catch (Exception s){
    System.out.println("SQL code does not execute"+s);
} 


%>