<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>
<% int i=0;
		String area_code=request.getParameter("area_code");
		String area_name=request.getParameter("area_name");
		String area_fee=request.getParameter("area_fee");
		try {
			Dbcon d= new Dbcon();
			Connection con=d.getConnection();
			Statement st = con.createStatement(); 
			ResultSet rs=st.executeQuery("select area_code,area_name from area_tab");
			while(rs.next()){
			      String darea_code=rs.getString("area_code");
			      String darea_name=rs.getString("area_name");
			      if(darea_code.equalsIgnoreCase(area_code)){
			        System.out.println("rs.next()");
			        st.executeUpdate("update area_tab set area_name='"+area_name+"',area_fee='"+area_fee+"' where area_code='"+area_code+"'");
			        i=1;break;
			      }
			       if(darea_name.equalsIgnoreCase(area_name)){
			        i=2;break;
			       }
			}	
			 if(i==0){
			    st.executeUpdate("insert into area_tab values('"+area_code+"','"+area_name+"','"+area_fee+"')");
			    RequestDispatcher rd=request.getRequestDispatcher("transport1.jsp");
			    rd.forward(request,response);
			  }else{
			        		
			      RequestDispatcher rd=request.getRequestDispatcher("transport1.jsp");
				  rd.forward(request,response);
			    }
		}
		 catch (Exception s){
		        s.printStackTrace();
		      }
		 %>	 