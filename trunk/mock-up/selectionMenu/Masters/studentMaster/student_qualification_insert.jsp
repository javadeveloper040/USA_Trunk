<%@page import="java.sql.*,vdb.Db" %>
<html>
<head>
</head>
<body>
<center></center>
<%!String a[]=new String[5];
int i=0;
Connection con = null;
PreparedStatement pst=null;
ResultSet rs=null;
 %>
<%
try{
    con=vdb.Db.connect(); 
    
}
catch(Exception e)
{

}
try{
String rollno=session.getAttribute("rollno").toString();//=======
System.out.println("1="+rollno);
String dob_certificate=request.getParameter("dob_certificate");
if(dob_certificate==null)
{
	dob_certificate="off";
}

System.out.println("39="+dob_certificate);

String hallticket_eei=request.getParameter("hallticket_eei");
if(hallticket_eei==null)
{
	hallticket_eei="off";
}
System.out.println("40="+hallticket_eei);
String mom=request.getParameter("mom");
if(mom==null)
{
	mom="off";
}
System.out.println("41="+mom);
String rankcard=request.getParameter("rankcard");
if(rankcard==null)
{
	rankcard="off";
}
System.out.println("42="+rankcard);
String ssc_certificate=request.getParameter("ssc_certificate");
if(ssc_certificate==null)
{
	ssc_certificate="off";
}
System.out.println("43="+ssc_certificate);
String study_certificate=request.getParameter("study_certificate");
if(study_certificate==null)
{
	study_certificate="off";
}
System.out.println("44="+study_certificate);
String caste_certificate=request.getParameter("caste_certificate");
if(caste_certificate==null)
{
	caste_certificate="off";
}
System.out.println("43="+caste_certificate);
String tc=request.getParameter("tc");
if(tc==null)
{
	tc="off";
}
System.out.println("44="+tc);


   //8.student_qualification_details_tab
              //++ for ssc
   String sscins="",sscmedium="",sscdivision="";
   float sscpercentage=0;
   int sscyear=0;
   System.out.println("ssc="+request.getParameter("ssc"));
   String s=request.getParameter("ssc");
   if(s==null)
	   s="off";
   if(s.equals("on"))
   {
	  
	   System.out.println("1.1-------hello------");
	   sscins=request.getParameter("sscins");
	   System.out.println("60="+sscins);
	   sscmedium=request.getParameter("sscmedium");
	   System.out.println("61="+sscmedium);
	   sscdivision=request.getParameter("sscdivision");
	   System.out.println("62="+sscdivision);
	   sscpercentage=Float.parseFloat(request.getParameter("sscpercentage"));
	   System.out.println("63="+sscpercentage);
	   sscyear=Integer.parseInt(request.getParameter("sscyear"));
	   System.out.println("64="+sscyear);
   }
       //+++++++++  for intermediate
       System.out.println("1-------hello------");
       String interins="",intermedium="",interdivision="";
       float interpercentage=0;
       int interyear=0;
       System.out.println("2-------hello------");
      
    	String i=request.getParameter("inter");
    	if(i==null)
    		  i="off";
     
   if(i.equals("on"))
   {
	   
	   System.out.println("3-------hello------");
	   interins=request.getParameter("interins");
	   System.out.println("65="+interins);
	   intermedium=request.getParameter("intermedium");
	   System.out.println("66="+intermedium);
	   interdivision=request.getParameter("interdivision");
	   System.out.println("67="+interdivision);
	   interpercentage=Float.parseFloat(request.getParameter("interpercentage"));
	   System.out.println("68="+interpercentage);
	   interyear=Integer.parseInt(request.getParameter("interyear"));
	   System.out.println("69="+interyear);
   }
  
             //+++++++++++++++  for diploma
    String diplomains="",diplomamedium="",diplomadivision="";
    float diplomapercentage=0;
    int diplomayear=0;
   String di=request.getParameter("diploma");
   if(di==null)
	    di="off";
   if(di.equals("on"))
   {
	   diplomains=request.getParameter("diplomains");
	   System.out.println("70="+diplomains);
	   diplomamedium=request.getParameter("diplomamedium");
	   System.out.println("71="+diplomamedium);
	   diplomadivision=request.getParameter("diplomadivision");
	   System.out.println("72="+diplomadivision);
	   diplomapercentage=Float.parseFloat(request.getParameter("diplomapercentage"));
	   System.out.println("73="+diplomapercentage);
	   diplomayear=Integer.parseInt(request.getParameter("diplomayear"));
	   System.out.println("74="+diplomayear);
   }      
   
      //     +++++++++++++++  for degree
      
       String degreeins="",degreemedium="",degreedivision="";
      float degreepercentage=0;
      int degreeyear=0;
   String dg=request.getParameter("degree");
   if(dg==null)
	       dg="off";
   if(dg.equals("on"))
   {
	   degreeins=request.getParameter("degreeins");
	   System.out.println("75="+degreeins);
	   degreemedium=request.getParameter("degreemedium");
	   System.out.println("76="+degreemedium);
	   degreedivision=request.getParameter("degreedivision");
	   System.out.println("77="+degreedivision);
	   degreepercentage=Float.parseFloat(request.getParameter("degreepercentage"));
	   System.out.println("78="+degreepercentage);
	   degreeyear=Integer.parseInt(request.getParameter("degreeyear"));
	   System.out.println("79="+degreeyear);
   }      
  
      // ++++++++++++++++   for ug 
      
      
      String ugins="",ugmedium="",ugdivision="";
      float ugpercentage=0;
      int ugyear=0;
      String u=request.getParameter("ug");
      if(u==null)
    	     u="off";
   if(u.equals("on"))
   {
	   ugins=request.getParameter("ugins");
	   System.out.println("80="+ugins);
	   ugmedium=request.getParameter("ugmedium");
	   System.out.println("81="+ugmedium);
	   ugdivision=request.getParameter("ugdivision");
	   System.out.println("82="+ugdivision);
	   ugpercentage=Float.parseFloat(request.getParameter("ugpercentage"));
	   System.out.println("83="+ugpercentage);
	   ugyear=Integer.parseInt(request.getParameter("ugyear"));
	   System.out.println("84="+ugyear);
   }
   String ssc1,interm,deg,dip,under;
   if(s.equals("on"))
       	 ssc1="yes";
   else
   	ssc1="no";
   
   if(i.equals("on"))
   	interm="yes";
   else
   	interm="no"; 
   
   if(di.equals("on"))
   	dip="yes";
   else
   	dip="no";
   
   if(dg.equals("on"))
   	deg="yes";
   else
   	deg="no";
   
   if(u.equals("on"))
   	under="yes";
   else
   	under="no";
   //******************     updation of details    *********************

		//checking the roll number
pst=con.prepareStatement("select * from student_tab where roll_num=?");
pst.setString(1,rollno);
ResultSet rs=pst.executeQuery();


if(rs.next())
{
   //8.student_qualification_details_tab updation
	 //++++++   for ssc details
	 System.out.println("s="+s);
	 if(ssc1.equals("yes"))
 	    {
		 
		pst=con.prepareStatement("select * from student_sscqualification_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		    pst=con.prepareStatement("update student_sscqualification_details_tab set sname_institution=?,smedium=?,sdivision=?,spercentage=?,syear_of_pass=? where roll_num=?");
		    pst.setString(1,sscins);
			pst.setString(2,sscmedium);
			pst.setString(3,sscdivision);
			pst.setFloat(4,sscpercentage);
			pst.setInt(5,sscyear);
			pst.setString(6,rollno);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.1.student_sscqualification__details_tab updated");
 	    } 
		else
		{
			pst=con.prepareStatement("insert into student_sscqualification_details_tab values(?,?,?,?,?,?)");
		    pst.setString(1,rollno);
			pst.setString(2,sscins);
			pst.setString(3,sscmedium);
			pst.setString(4,sscdivision);
			pst.setFloat(5,sscpercentage);
			pst.setInt(6,sscyear);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.student_sscqualification__details_tab inserted");
		}
	}
	  //+++++++++  for intermediate  details updation
	if(interm.equals("yes"))
	    {
		
		pst=con.prepareStatement("select * from student_interqualification_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		    pst=con.prepareStatement("update student_interqualification_details_tab set iname_institution=?,imedium=?,idivision=?,ipercentage=?,iyear_of_pass=? where roll_num=?");
		    pst.setString(1,interins);
		    pst.setString(2,intermedium);
			pst.setString(3,interdivision);
			pst.setFloat(4,interpercentage);
			pst.setInt(5,interyear);
			pst.setString(6,rollno);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.2.student_interqualification__details_tab updated");
		}
		else{
			pst=con.prepareStatement("insert into student_interqualification_details_tab values(?,?,?,?,?,?)");
		    pst.setString(1,rollno);
		    pst.setString(2,interins);
		    pst.setString(3,intermedium);
			pst.setString(4,interdivision);
			pst.setFloat(5,interpercentage);
			pst.setInt(6,interyear);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.student_interqualification__details_tab inserted");
		}
	    }     
//+++++++++  for diploma  details updation
	if(dip.equals("yes"))
	    {
		    
		pst=con.prepareStatement("select * from student_sscqualification_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		    pst=con.prepareStatement("update student_diplomaqualification_details_tab set diname_institution=?,dimedium=?,didivision=?,dipercentage=?,diyear_of_pass=? where roll_num=?");
		    pst.setString(1,diplomains);
		    pst.setString(2,diplomamedium);
			pst.setString(3,diplomadivision);
			pst.setFloat(4,diplomapercentage);
			pst.setInt(5,diplomayear);
			pst.setString(6,rollno);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.3.student_diplomaqualification__details_tab updated");
		}
		else
		{
			pst=con.prepareStatement("insert into student_diplomaqualification_details_tab values(?,?,?,?,?,?)");
		    pst.setString(1,rollno);
		    pst.setString(2,diplomains);
		    pst.setString(3,diplomamedium);
			pst.setString(4,diplomadivision);
			pst.setFloat(5,diplomapercentage);
			pst.setInt(6,diplomayear);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.student_diplomaqualification__details_tab inserted");
		}
	    }  
//+++++++++  for degree  details updation
	if(deg.equals("yes"))
	    {
		
		pst=con.prepareStatement("select * from student_sscqualification_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		    pst=con.prepareStatement("update student_degreequalification_details_tab set dename_institution=?,demedium=?,dedivision=?,depercentage=?,deyear_of_pass=? where roll_num=?");
		    pst.setString(1,degreeins);
		    pst.setString(2,degreemedium);
			pst.setString(3,degreedivision);
			pst.setFloat(4,degreepercentage);
			pst.setInt(5,degreeyear);
			pst.setString(6,rollno);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.4.student_degreequalification__details_tab updated");
	    }
		else{
			pst=con.prepareStatement("insert into student_degreequalification_details_tab values(?,?,?,?,?,?)");
		    pst.setString(1,rollno);
		    pst.setString(2,degreeins);
		    pst.setString(3,degreemedium);
			pst.setString(4,degreedivision);
			pst.setFloat(5,degreepercentage);
			pst.setInt(6,degreeyear);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.student_degreequalification__details_tab inserted");
		}
	    }
//+++++++++  for ug  details updation
	if(under.equals("yes"))
	    {
		    
		pst=con.prepareStatement("select * from student_sscqualification_details_tab where roll_num=?");
      pst.setString(1,rollno);
		ResultSet rs1=pst.executeQuery();
		if(rs1.next())
		{
		    pst=con.prepareStatement("update student_ugqualification_details_tab set uname_institution=?,umedium=?,udivision=?,upercentage=?,uyear_of_pass=? where roll_num=?");
		    pst.setString(1,ugins);
		    pst.setString(2,ugmedium);
			pst.setString(3,ugdivision);
			pst.setFloat(4,ugpercentage);
			pst.setInt(5,ugyear);
			pst.setString(6,rollno);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.5.student_ugqualification__details_tab updated");
		}
		else
		{
			pst=con.prepareStatement("insert into student_ugqualification_details_tab values(?,?,?,?,?,?)");
		    pst.setString(1,rollno);
		    pst.setString(2,ugins);
		    pst.setString(3,ugmedium);
			pst.setString(4,ugdivision);
			pst.setFloat(5,ugpercentage);
			pst.setInt(6,ugyear);
			pst.executeUpdate();
			pst.close();
			System.out.println("8.student_ugqualification__details_tab inserted");
		}
	   }
	
		
		pst=con.prepareStatement("select * from student_other_details_tab  where roll_num=?");
	    pst.setString(1,rollno);
		ResultSet rs2=pst.executeQuery();
	if(rs2.next())
	{
		
	// 4.Student_other_details updation
	pst=con.prepareStatement("update student_other_details_tab set dob_certi=?,hallticketeei=?,inter_mom=?,rankcardeei=?,ssc=?,study_certi=?,caste_certi=?,tc=? where roll_num=?");
	pst.setString(1,dob_certificate);
	pst.setString(2,hallticket_eei);
	pst.setString(3,mom);
	pst.setString(4,rankcard);
	pst.setString(5,ssc_certificate);
	pst.setString(6,study_certificate);
	pst.setString(7,caste_certificate);
	pst.setString(8,tc);
	pst.setString(9,rollno);
	pst.executeUpdate();
	pst.close();
	System.out.println("4.student_other_details updated");
	}
	else
	{
		// 4.Student_other_details insertion
		pst=con.prepareStatement("insert into student_other_details_tab (roll_num,dob_certi,hallticketeei,inter_mom,rankcardeei,ssc,study_certi,caste_certi,tc) values(?,?,?,?,?,?,?,?,?)");
		pst.setString(1,rollno);
		pst.setString(2,dob_certificate);
		pst.setString(3,hallticket_eei);
		pst.setString(4,mom);
		pst.setString(5,rankcard);
		pst.setString(6,ssc_certificate);
		pst.setString(7,study_certificate);
		pst.setString(8,caste_certificate);
		pst.setString(9,tc);
		pst.executeUpdate();
		pst.close();
		System.out.println("4.student_other_details inserted");
					
	}
	
   
%>
<h1>Student data was successfully Inserted</h1>      
 <input type="button" value="quit" onclick="window.close()">                 
<%}
else
{%>
	<h3> Details cannot be inserted as there is no tuple in student table with this roll number.</h3> <h3>Please make sure that data with this roll number is inserted in student table </h3>
	<input type="button" value="quit" onclick="window.close()">
<%}
}
	catch(Exception e)
	{
	      out.println(e);
	}
	
%>
