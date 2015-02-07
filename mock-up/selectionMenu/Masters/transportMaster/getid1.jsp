<%@page import="mis.Dbcon"%>

<%@page import="java.sql.*"%>

<%
try {
		 Connection con = null;
	   
	    //String s1=null;
	    ResultSet res=null;
	    Dbcon d= new Dbcon();
		con=d.getConnection();
	        Statement st = con.createStatement();       
	        res=st.executeQuery("select max(area_code) from area_tab");
	        res.next();
	        
	        	String max=res.getString(1);    	
	        	System.out.println(max);    	
	        		String max1=max.substring(2,5);
	        		int i=Integer.parseInt(max1);
	   				i++;
	        		String ac1="ac"+String.valueOf(i);
	        		%><%=ac1%><%
      }
      catch(NullPointerException e) {
      	e.printStackTrace();
      	String ac1="ac101";
	        	System.out.println("hi");
	        		%><%=ac1%><%	
      }
      catch (Exception s){
	        System.out.println("SQL code does not execute."+s);
	      }
      %>
