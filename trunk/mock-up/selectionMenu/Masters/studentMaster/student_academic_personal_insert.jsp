<%@page import="java.sql.*,vdb.Db" %>

<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
try{
    con=Db.connect(); 
    
}
catch(Exception e)
{

}
try{
 String rollno=session.getAttribute("rollno").toString();
 //6.Student_perm_address_details
 String pdoorno=request.getParameter("pdoorno");//======//======

 System.out.println("1="+pdoorno);
 String pstreet=request.getParameter("pstreet");//======

 System.out.println("2="+pstreet);
 String parea=request.getParameter("parea");//======

 System.out.println("3="+parea);
 String pdistrict=request.getParameter("pdistrict");//======

 System.out.println("4="+pdistrict);
 int ppin=Integer.parseInt(request.getParameter("ppin"));//======

 System.out.println("5="+ppin);
 String blood=request.getParameter("bg");//======

 System.out.println("35="+blood);
 String accno=request.getParameter("acno");//======

 System.out.println("36="+accno);
 String bankname=request.getParameter("bankname");//======

 System.out.println("37="+bankname);
 String bankbranch=request.getParameter("bankbranch");//======
 System.out.println("38="+bankbranch);
 String checkvalue=request.getParameter("disc");
 if(checkvalue==null)
	  checkvalue="off";

 String dateleave=null,discdate=null;
  if(checkvalue.equals("on"))
  {
	   discdate=request.getParameter("ddate"); //======
	   System.out.println("13="+discdate);
 		dateleave=request.getParameter("ldate");//======
		System.out.println("14="+dateleave);
		
  }
  //7.student_bus_acc_details_tab
  String busfacility=request.getParameter("avail");//======
	
 System.out.println("55="+busfacility);
 String busarea="",busregdate="",buscanceldate="";
 int busno=0;
 
  if(busfacility.equals("yes"))
  {
   busregdate=request.getParameter("bregdate");//======
   System.out.println("56="+busregdate);
   busarea=request.getParameter("busarea");//======
   System.out.println("57="+busarea);
   busno=Integer.parseInt(request.getParameter("busno"));//======
   System.out.println("58="+busno);
   buscanceldate=request.getParameter("bcdate");//======
  System.out.println("59="+buscanceldate);
  }

  //9.student_accomidation_details_tab
  System.out.println("-----------------here-------------------");
  String accomfacility=request.getParameter("avail1");//======


String acchostelcode="";
String accregdate="",accroomno="",accguardian="",accphno="",acccanceldate="";
if(accomfacility.equals("0"))
{
	 request.getParameter("acchostelcode");//======
	System.out.println("85="+acchostelcode);
  accregdate=request.getParameter("accregdate");//======
	
	System.out.println("86="+accregdate);
	accroomno=request.getParameter("accroomno");//======

	System.out.println("87="+accroomno);
	accguardian=request.getParameter("guardian");//======

	System.out.println("88="+accguardian);
	accphno=request.getParameter("accphno");//======

	System.out.println("89="+accphno);
	acccanceldate=request.getParameter("acccdate");//======

	System.out.println("90="+acccanceldate);
}

pst=con.prepareStatement("select * from student_tab where roll_num=?");
pst.setString(1,rollno);
ResultSet rs=pst.executeQuery();
int flag=0;
System.out.println("flag="+flag);

  if(rs.next())
  {
	  
	  //6.Student_perm_address_details updation
	  pst=con.prepareStatement("select * from student_perm_address_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		pst=con.prepareStatement("update student_perm_address_details_tab set pdoor_num=?,pstreet_name=?,parea_name=?,pdistrict_name=?,ppin=? where roll_num=?");
		pst.setString(1,pdoorno);
		pst.setString(2,pstreet);
		pst.setString(3,parea);
		pst.setString(4,pdistrict);
		pst.setInt(5,ppin);
		pst.setString(6,rollno);
		pst.executeUpdate();
		pst.close();
		System.out.println("6.student_perm_address_details updated");
		}
		else
		{
			// 6.Student_perm_address_details insertion
			pst=con.prepareStatement("insert into student_perm_address_details_tab values(?,?,?,?,?,?)");
			pst.setString(1,rollno);
			pst.setString(2,pdoorno);
			pst.setString(3,pstreet);
			pst.setString(4,parea);
			pst.setString(5,pdistrict);
			pst.setInt(6,ppin);
			pst.executeUpdate();
			pst.close();
			System.out.println("6.student_perm_address_details inserted");
				
		}
		//student academic details updation
		 pst=con.prepareStatement("select * from student_academic_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs2=pst.executeQuery();
		if(rs2.next())
		{
	  pst=con.prepareStatement("update student_academic_details_tab set discontinued_date=?, date_leave=?  where roll_num=?");
	  pst.setString(1,discdate);
	  pst.setString(2,dateleave);
	  pst.setString(3,rollno);
	  System.out.println("before updating query");
	  pst.executeUpdate();
	  System.out.println("2.student_academic_details updated");
	  pst.close();
		}
		else{
			//student academic details.
			pst=con.prepareStatement("insert into student_academic_details_tab (roll_num,discontinued_date,date_leave) values(?,?,?)");
			pst.setString(1,rollno);
			pst.setString(2,discdate);
			pst.setString(3,dateleave);
			pst.executeUpdate();
			System.out.println("2.student_academic_details inserted");
			pst.close();	
		}
		 pst=con.prepareStatement("select * from student_other_details_tab where roll_num=?");
	      pst.setString(1,rollno);
			ResultSet rs3=pst.executeQuery();
			if(rs3.next())
			{
		pst=con.prepareStatement("update student_other_details_tab set blood_group=?,saccount_num=?,sbank_name=?,sbranch=? where roll_num=?");
		pst.setString(1,blood);
		pst.setString(2,accno);
		pst.setString(3,bankname);
		pst.setString(4,bankbranch);
		pst.setString(5,rollno);
		pst.executeUpdate();
		System.out.println("student_other_details updated");
			}
			else
			{
				// 4.Student_other_details insertion
				pst=con.prepareStatement("insert into student_other_details_tab (roll_num,blood_group,saccount_num,sbank_name,sbranch) values(?,?,?,?,?)");
				pst.setString(1,rollno);
				pst.setString(2,blood);
				pst.setString(3,accno);
				pst.setString(4,bankname);
				pst.setString(5,bankbranch);
				pst.executeUpdate();
				pst.close();
				System.out.println("4.student_other_details inserted");		
			}
		//7.student_bus_acc_details_tab updation
		pst=con.prepareStatement("select * from student_bus_acc_details_tab where roll_num=?");
	      pst.setString(1,rollno);
			ResultSet rs4=pst.executeQuery();
			if(rs4.next())
			{
	  	if(busfacility.equals("yes"))
	      {
			pst=con.prepareStatement("update student_bus_acc_details_tab set bus_reg_date=?, area_name=?, bus_num=?,bus_cancel_date=? where roll_num=?");
				pst.setString(1,busregdate);
				pst.setString(2,busarea);
				pst.setInt(3,busno);
				pst.setString(4,buscanceldate);
				pst.setString(5,rollno);
				pst.executeUpdate();
				pst.close();
				System.out.println("7.student_bus_acc__details_tab updated");
			  }
			}
			else
			{
				//7.student_bus_acc_details_tab insertion
		      	if(busfacility.equals("yes"))
		          {
					pst=con.prepareStatement("insert into student_bus_acc_details_tab values(?,?,?,?,?)");
						pst.setString(1,rollno);
						pst.setString(2,busregdate);
						pst.setString(3,busarea);
						pst.setInt(4,busno);
						pst.setString(5,buscanceldate);
						pst.executeUpdate();
						pst.close();
						System.out.println("7.student_bus_acc__details_tab inserted");
					  }
						
			}
    	//9.student_accomidation_details_tab updation
    	pst=con.prepareStatement("select * from student_accomodation_details_tab where roll_num=?");
	      pst.setString(1,rollno);
			ResultSet rs5=pst.executeQuery();
			if(rs5.next())
			{
	  	
			if(accomfacility.equals("0"))  
				{
	  				 pst=con.prepareStatement("update student_accomodation_details_tab set hostel_code=?,reg_date=?,room_num=?,guardian=?,acc_ph_no=?,cancel_date=? where roll_num=?");
	  				 pst.setString(1,acchostelcode);
	  				 pst.setString(2,accregdate);
	  				 pst.setString(3,accroomno);
	   				 pst.setString(4,accguardian);
	  				 pst.setString(5,accphno);
	  				 pst.setString(6,acccanceldate);
	   				 pst.setString(7,rollno);
	  				 pst.executeUpdate();
	  				 pst.close();
	   				 System.out.println("9.student_accomodation_details updated");
	   	 		}
			}
		else{

		      //9.student_accomidation_details_tab insertion
		        if(accomfacility.equals("0"))  
		        {
		     	   pst=con.prepareStatement("insert into student_accomodation_details_tab values(?,?,?,?,?,?,?)");
		     	   pst.setString(1,acchostelcode);
		     	   pst.setString(2,rollno);
		     	   pst.setString(3,accregdate);
		       	   pst.setString(4,accroomno);
		     	   pst.setString(5,accguardian);
		     	   pst.setString(6,accphno);
		     	   pst.setString(7,acccanceldate);
		     	   pst.executeUpdate();
		     	   pst.close();
		     	   System.out.println("9.student_accomodation_details inserted");
		        }	
			}
	   	   
      	%>
      	<<jsp:forward page="student_qualification_details.jsp"></jsp:forward>
    	<% }
 	 else
  	{	%>
  		<h3> Details cannot be inserted as there is no tuple in student table with this roll number.</h3> <h3>Please make sure that data with this roll number is inserted in student table </h3>
  		<input type="button" value="quit" onclick="window.close()">
  	<%
  	
  }
  }

  	catch(Exception e)
  	{
  	      out.println(e);
  	}

		%>
 
