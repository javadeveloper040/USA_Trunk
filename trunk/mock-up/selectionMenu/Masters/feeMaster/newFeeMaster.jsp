 <%@ page import="java.sql.*" %>
 <%
	try {
	        String fee_code=request.getParameter("fee_code");
	        String fee_name=request.getParameter("fee_name");
	        String account_name=request.getParameter("account_name");
	        String fee_sched=request.getParameter("fee_sched");
	        String fine=request.getParameter("fine");
	        String refundable=request.getParameter("refundable");
	        String exclude=request.getParameter("exclude");
	        String fee_admin=request.getParameter("fee_admin");
	        String fee_cat=request.getParameter("fee_cat");
	        String fees_type=request.getParameter("fees_type");
	        String under_group=request.getParameter("under_group");
	        String counter_type=request.getParameter("counter_type");
	        int counter_num=Integer.parseInt(request.getParameter("counter_num"));
	        String counter_name=request.getParameter("counter_name");
	        String location=request.getParameter("location");
	        String incharge=request.getParameter("incharge");
	        String password=request.getParameter("password");
	        PreparedStatement pst = vdb.Db.connect().prepareStatement("select * from  feemaster_tab where fee_code='"+fee_code+"'");
	        ResultSet res=pst.executeQuery();
	        if(!res.next()) {
	        	pst=vdb.Db.connect().prepareStatement("insert into feemaster_tab(fee_code,fee_name,account_name,fee_sched,fine,refundable,exclude,fee_admin,fee_cat,fees_type,under_group,counter_type,counter_num,counter_name,location,incharge,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        	pst.setString(1,fee_code);
	        	pst.setString(2,fee_name);
	        	pst.setString(3,account_name);
	        	pst.setString(4,fee_sched);
	        	pst.setString(5,fine);
				pst.setString(6,refundable);
				pst.setString(7,exclude);  
	        	pst.setString(8,fee_admin);
	        	pst.setString(9,fee_cat);
	        	pst.setString(10,fees_type);
	        	pst.setString(11,under_group);
	        	pst.setString(12,counter_type);
	        	pst.setInt(13,counter_num);
	        	pst.setString(14,counter_name);
	        	pst.setString(15,location);
	        	pst.setString(16,incharge);
	        	pst.setString(17,password);
	        	pst.execute();
	        	response.sendRedirect("./FeeMaster_newmodify.jsp");      	
	        }
	        else {
	        	pst=vdb.Db.connect().prepareStatement("delete from  feemaster_tab where fee_code='"+fee_code+"'");
				pst.execute();
				pst=vdb.Db.connect().prepareStatement("insert into feemaster_tab(fee_code,fee_name,account_name,fee_sched,fine,refundable,exclude,fee_admin,fee_cat,fees_type,under_group,counter_type,counter_num,counter_name,location,incharge,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        	pst.setString(1,fee_code);
	        	pst.setString(2,fee_name);
	        	pst.setString(3,account_name);
	        	pst.setString(4,fee_sched);
	        	pst.setString(5,fine);
				pst.setString(6,refundable);
				pst.setString(7,exclude);  
	        	pst.setString(8,fee_admin);
	        	pst.setString(9,fee_cat);
	        	pst.setString(10,fees_type);
	        	pst.setString(11,under_group);
	        	pst.setString(12,counter_type);
	        	pst.setInt(13,counter_num);
	        	pst.setString(14,counter_name);
	        	pst.setString(15,location);
	        	pst.setString(16,incharge);
	        	pst.setString(17,password);
	        	pst.execute();
	        	response.sendRedirect("./FeeMaster_newmodify.jsp");      		        	
	        	pst.close();
	        	res.close();        	
	        	response.sendRedirect("./FeeMaster_newmodify.jsp");
	        }
	       vdb.Db.connect().close();
	        res.close();
		}
	      catch (Exception s){
	        s.printStackTrace();
	      }
	  %>