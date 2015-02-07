<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<%String s=request.getParameter("layout");
		StringBuffer sb=new StringBuffer();
		System.out.print(s);
		
		 Dbcon d= new Dbcon();
			Connection con=d.getConnection();
	    
		try {
			Statement st=con.createStatement();
			int r=st.executeUpdate("delete from layout_tab where layout_name='"+s+"'");
			ResultSet rs= st.executeQuery("select * from layout_tab");
			while(rs.next()){
				sb.append(rs.getString(1));
				sb.append("$");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(sb);
		out.print(sb); %>