<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>

<%StringBuffer sb=new StringBuffer();
		String area_code=request.getParameter("area_code");
		String area_name=request.getParameter("area_name");
		String area_fee=request.getParameter("area_fee");
		
		try {
			Dbcon d= new Dbcon();
			Connection con=d.getConnection();
			        Statement st = con.createStatement(); 
			        System.out.println("in Areamodify");
			        st.executeUpdate("update area_tab set area_name='"+area_name+"',area_fee='"+area_fee+"' where area_code='"+area_code+"'");

			        ResultSet rs=st.executeQuery("select area_name from area_tab");
			        while(rs.next()){
			        	String darea_name=rs.getString(1);
			        	System.out.println(darea_name);
			        	sb.append("$");
			        	sb.append(darea_name);
			        	
			       }out.print(sb);
			        
		}catch (Exception e) {
			e.printStackTrace();
		}
		 %> 	 