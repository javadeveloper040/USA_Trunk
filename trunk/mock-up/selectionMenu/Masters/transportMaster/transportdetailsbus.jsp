
<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon" %>
<%
	String bus_num=request.getParameter("busno");


try {
	 
 StringBuffer sb=new StringBuffer();
 		Dbcon d= new Dbcon();
		Connection con=d.getConnection();
      	Statement st = con.createStatement();
      	ResultSet rs= st.executeQuery("select * from bus_details_tab where bus_num='"+bus_num+"'");
      while(rs.next()){
    	  String dbus_num=rs.getString(1);
    	 
    	  String seats=rs.getString(2);
    	  
    	  String layout_name=rs.getString(11);
    	 
    	  String driver_name=rs.getString(3);
    	  
    	  String driver_mob=rs.getString(4);
    	
    	  String faculty_name=rs.getString(5);
    	
    	  String faculty_mob=rs.getString(6);
    	 
    	  String coordinator_name=rs.getString(7);
    	 
    	  String coordinator_mob=rs.getString(8);
    	 
    	  String incharge_name=rs.getString(9);
    	
    	  String incharge_mob=rs.getString(10);
    	 
    	  if(dbus_num.equalsIgnoreCase(bus_num)){
    		  sb.append("$");
    			sb.append(seats);
    			sb.append("$");
    			sb.append(layout_name);
    			sb.append("$");
    			sb.append(driver_name);
    			sb.append("$");
    			sb.append(driver_mob);
    			sb.append("$");
    			sb.append(faculty_name);
    			sb.append("$");
    			sb.append(faculty_mob);
    			sb.append("$");
    			sb.append(coordinator_name);
    			sb.append("$");
    			sb.append(coordinator_mob);
    			sb.append("$");
    			sb.append(incharge_name);
    			sb.append("$");
    			sb.append(incharge_mob);
    			sb.append("$");
    		
    		  
    	  }
      }
  	out.println(sb);
  	System.out.println("onchange"+sb);
}
    catch (Exception s){
      System.out.println("SQL code does not execute"+s);
    }%>
	
	
	
		
	


