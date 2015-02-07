
<%@page import="java.sql.*,java.util.*"%>
<%@page import="mis.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.sql.ResultSet"%>

<%
	String r=request.getParameter("rollnumber");
	System.out.println(r);
	String f=request.getParameter("feename");
	System.out.println(f);	
	String d=request.getParameter("discount");
	System.out.println(d);	
	String a=request.getParameter("amt");
	System.out.println(a);
	String rc1="";
	int aa=Integer.parseInt(a);
	System.out.println(aa);
	int i=0,s1=0;
	StringBuffer sb=new StringBuffer();
	Date date=new Date();
	int year=date.getYear();
	int years=year+1900;
	System.out.println(years);
	int datei=date.getDate();
	int date2=datei+1;
	String sdate="";
	if(date2<=9){
		sdate="0"+date2;
	}else
		sdate= ""+date2;
	System.out.println(sdate);
	int month=date.getMonth();
	int month1=month+1 ;
	String month2="";
	if(month1<=9){
		month2="0"+month1;
		
	}else
		month2=""+month1;
	System.out.println(month1);
	String dates=""+sdate+"/"+month2+"/"+years;
	System.out.println(dates);
	
	Dbcon d1= new Dbcon();
	Connection con=d1.getConnection();

		try {
			ResultSet res=null;
			  Statement st = con.createStatement();       
		        res=st.executeQuery("select max(serial) from student_fee_tab");
		        res.next();
		        
		        	String max=res.getString(1);    	
		        	System.out.println(max);    	
		        		String max1=max.substring(2);
		        		 i=Integer.parseInt(max1);
		   				i++;
		        		 rc1="rc"+String.valueOf(i);
		        		System.out.println(rc1);
	    }
	    catch(NullPointerException e) {
	    	
	     rc1="rc0";
		        		
	    }
		catch (Exception s){
		     System.out.println("SQL code does not execute."+s);
		}Statement st1=con.createStatement();
		
		int j=st1.executeUpdate("insert into student_fee_tab values('"+r+"','"+aa+"','"+dates+"','"+f+"','"+d+"','"+rc1+"')");
		
		          
	%>
	   
