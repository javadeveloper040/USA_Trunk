 <%@ page import="java.sql.*" %>
 <%
	try {
	        Statement st = vdb.Db.connect().createStatement();
	        String account_name=request.getParameter("accname");
	        ResultSet res=st.executeQuery("select * from  Account where account_name='"+account_name+"'");
	        if(!res.next()) {
	        	st.execute("insert into Account values('"+session.getAttribute("account_code")+"','"+request.getParameter("accname")+"','"+request.getParameter("bankname")+"','"+request.getParameter("bankaddress")+"','"+request.getParameter("accnumber")+"')");
	        	response.sendRedirect("./accountmasternewmodify.jsp");      	
	        }
	        else {
	        	//st.execute("delete from  Account where account_name='"+account_name+"'");
	        	//st.execute("insert into Account values('"+request.getParameter("accountcode")+"','"+request.getParameter("accname")+"','"+request.getParameter("bankname")+"','"+request.getParameter("bankaddress")+"','"+request.getParameter("accnumber")+"')");
	        	st.executeUpdate("update Account set account_code='"+request.getParameter("accountcode")+"',bank_name='"+request.getParameter("bankname")+"',bank_address='"+request.getParameter("bankaddress")+"',account_number='"+request.getParameter("accnumber")+"' where account_name='"+account_name+"'");
	        	st.close();
	        		res.close();        	
	        	response.sendRedirect("./accountmasternewmodify.jsp");
	        }
	       vdb.Db.connect().close();
	        res.close();
		}
	      catch (Exception s){
	        s.printStackTrace();
	      }
	  %>