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
System.out.println("entered into student  academic details");
   //1.student_tab
String rollno=request.getParameter("rollno");//=======
System.out.println("1="+rollno);
int admnno=Integer.parseInt(request.getParameter("admissionnum"));//=======
System.out.println("2="+admnno);	
String fullname=request.getParameter("fullname");//=======
	System.out.println("3="+fullname);
String branch=request.getParameter("branch");//=======
System.out.println("4="+branch);
int sem=Integer.parseInt(request.getParameter("sem"));//=======
System.out.println("5="+sem);

			//2.student_academic_details
String qlfytest=request.getParameter("Qualifyingtest");//=======
	
System.out.println("6="+qlfytest);

int rank=Integer.parseInt(request.getParameter("rank"));//=======

System.out.println("7="+rank);

String htno=request.getParameter("hallticketno");//=======

System.out.println("8="+htno);

String sschtno=request.getParameter("sschallticketno");//=======
	
System.out.println("9="+sschtno);

String admntyp=request.getParameter("admntyp");//=======
System.out.println("10="+admntyp);

String admndate=request.getParameter("admissiondate");//=======

System.out.println("11="+admndate);

int yearofcompletion=Integer.parseInt(request.getParameter("complete"));//=======

System.out.println("12="+yearofcompletion);
String checkvalue=request.getParameter("disc");
 if(checkvalue==null)
	  checkvalue="off";

String dateleave="",discdate="";
  if(checkvalue.equals("on"))
  {
	   discdate=request.getParameter("ddate"); //======
	   System.out.println("13="+discdate);
 		dateleave=request.getParameter("ldate");//======
		System.out.println("14="+dateleave);
		
  }
  String resschlr=request.getParameter("rsch");//======
System.out.println("15="+ resschlr);

String feeschlr=request.getParameter("fsch");//======

System.out.println("16="+feeschlr);
String occup=request.getParameter("occupation");//=======

System.out.println("17="+occup);

   //--------------3.Student_personal_details
   
String dob=request.getParameter("dob");//=======
	
System.out.println("18="+dob);

String gen=request.getParameter("gender");//=======

System.out.println("19="+gen);
String pname=request.getParameter("parentname");//=======

System.out.println("20="+pname);
String landph=request.getParameter("land");//=======

System.out.println("21="+landph);
String pmobile=request.getParameter("parentmobile");//=======

System.out.println("22="+pmobile);
String stmobile=request.getParameter("studentmobile");//=======

System.out.println("23="+stmobile);
String email=request.getParameter("email");//=======

System.out.println("24="+email);
String aemail=request.getParameter("aemail");//=======

System.out.println("25="+aemail);
String category=request.getParameter("category");//======

System.out.println("26="+category);
String seat=request.getParameter("seat");//======

System.out.println("27="+seat);
String seatcategory=request.getParameter("catadmission");//======

System.out.println("28="+seatcategory);

   //------------4.Student_other_details
String nationality=request.getParameter("nationality");//======
	
System.out.println("29="+nationality);
String mothertounge=request.getParameter("mothertongue");//======

System.out.println("30="+mothertounge);
String identificationmark1=request.getParameter("mole1");//======

System.out.println("31="+identificationmark1);

String identificationmark2=request.getParameter("mole2");//======
	
System.out.println("32="+identificationmark2);
String castename=request.getParameter("castename");//=======

System.out.println("33="+castename);
String religion=request.getParameter("religion");//=======

System.out.println("34="+religion);
String blood=request.getParameter("bg");//======

System.out.println("35="+blood);
String accno=null;//======
accno=request.getParameter("acno");
System.out.println("36="+accno);
String bankname=request.getParameter("bankname");//======

System.out.println("37="+bankname);
String bankbranch=request.getParameter("bankbranch");//======
System.out.println("38="+bankbranch);
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
   //5.Student_corr_address_details


String street=request.getParameter("street");//=======
	
System.out.println("45="+street);   
String area=request.getParameter("area");//=======

System.out.println("46="+area);
String district=request.getParameter("dt");//=======

System.out.println("47="+district);
int pin=Integer.parseInt(request.getParameter("pin"));//=======

System.out.println("48="+pin);

String doorno=request.getParameter("doorno");//=======

System.out.println("49="+doorno);

   //6.Student_perm_address_details
String pdoorno=request.getParameter("pdoorno");//======//======

System.out.println("50="+pdoorno);
String pstreet=request.getParameter("pstreet");//======

System.out.println("51="+pstreet);
String parea=request.getParameter("parea");//======

System.out.println("52="+parea);
String pdistrict=request.getParameter("pdistrict");//======

System.out.println("53="+pdistrict);
int ppin=Integer.parseInt(request.getParameter("ppin"));//======

System.out.println("54="+ppin);
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
 if(resschlr==null)
 	  resschlr="no";
   if(feeschlr==null)
 	  feeschlr="no";
       //******************     updation of details    *********************

       			//checking the roll number
		pst=con.prepareStatement("select * from student_tab where roll_num=?");
         pst.setString(1,rollno);
		ResultSet rs=pst.executeQuery();
		int flag=0;
		System.out.println("flag="+flag);
		
		   if(rs.next())
		   {   
			                // 1.student_tab updation
	    	pst=con.prepareStatement("update student_tab set admn_num=?,student_name=? ,branch_name=?, sem=? where roll_num=?");
	    	pst.setInt(1,admnno);
	    	pst.setString(2,fullname);
	    	pst.setString(3,branch);
	    	pst.setInt(4,sem);
	    	pst.setString(5,rollno);
	    	pst.executeUpdate();
	    	System.out.println("1.student_tab details updated");
	    	pst.close();
	    	
	    	                  //2.student_academic_details updation
	    	
	  pst=con.prepareStatement("update student_academic_details_tab set qual_test=?, qual_test_rank=?, ht_num=?, ssc_ht_num=?,admn_type=?, admn_date=?, yearcompletion=?, discontinued_date=?, date_leave=?, feeschlr=?, resschlr=? where roll_num=?");
	  pst.setString(1,qlfytest);
	  pst.setInt(2,rank);
	  pst.setString(3,htno);
	  System.out.println("before sschtno");
	  pst.setString(4, sschtno);
	  System.out.println("before sschtno");
	  pst.setString(5,admntyp);
	  pst.setString(6,admndate);
	  pst.setInt(7,yearofcompletion);
	  pst.setString(8,discdate);
	  pst.setString(9,dateleave);
	  pst.setString(10,feeschlr);
	  pst.setString(11,resschlr);
	  pst.setString(12,rollno);
	  System.out.println("before updating query");
	  pst.executeUpdate();
	  System.out.println("2.student_academic_details updated");
	  pst.close();
	 				// 3.Student_personal_details updation
	 	
	 pst=con.prepareStatement("update student_personal_details_tab set dob=?,gender=?,parent_name=?,parent_occup=?,land_num=?,parent_mob=?,student_mob=?,email=?,alt_email=?,category=?,seat=?,seat_category=? where roll_num=?");
	pst.setString(1,dob);
	pst.setString(2,gen);
	pst.setString(3,pname);
	pst.setString(4,occup);
	pst.setString(5,landph);
	System.out.println("in 3");
	pst.setString(6,pmobile);
	pst.setString(7,stmobile);
	pst.setString(8,email);
	pst.setString(9,aemail);
	pst.setString(10,category);
	pst.setString(11,seat);
	pst.setString(12,seatcategory);
	System.out.println("in 3.1");
	pst.setString(13,rollno);
	System.out.println("before 3.2 exit");
	pst.executeUpdate();
	System.out.println("3.student_personal_details updated");
	pst.close();
	
						// 4.Student_other_details updation
	pst=con.prepareStatement("update student_other_details_tab set nationality=?,mother_lang=?,mole1=?,mole2=?,caste=?,religion_name=?,blood_group=?,saccount_num=?,sbank_name=?,sbranch=?,dob_certi=?,hallticketeei=?,inter_mom=?,rankcardeei=?,ssc=?,study_certi=?,caste_certi=?,tc=? where roll_num=?");
	pst.setString(1,nationality);
	pst.setString(2,mothertounge);
	pst.setString(3,identificationmark1);
	pst.setString(4,identificationmark2);
	pst.setString(5,castename);
	pst.setString(6,religion);
	pst.setString(7,blood);
	pst.setString(8,accno);
	pst.setString(9,bankname);
	pst.setString(10,bankbranch);
	pst.setString(11,dob_certificate);
	pst.setString(12,hallticket_eei);
	pst.setString(13,mom);
	pst.setString(14,rankcard);
	pst.setString(15,ssc_certificate);
	pst.setString(16,study_certificate);
	pst.setString(17,caste_certificate);
	pst.setString(18,tc);
	pst.setString(19,rollno);
	pst.executeUpdate();
	pst.close();
	System.out.println("4.student_other_details updated");
	
	              //5.Student_corr_address_details updation
	pst=con.prepareStatement("update student_corr_address_details_tab set door_num=?,street_name=?,area_name=?,district_name=?,pin=? where roll_num=?");
	pst.setString(1,doorno);
	pst.setString(2,street);
	pst.setString(3,area);
	pst.setString(4,district);
	pst.setInt(5,pin);
	pst.setString(6,rollno);
	pst.executeUpdate();
	pst.close();
	System.out.println("5.student_corr_address_details updated");
	             //6.Student_perm_address_details updation
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
	
	//7.student_bus_acc_details_tab updation
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
  		
  		pst=con.prepareStatement("select * from student_sscqualification_details_tab where roll_num=?");
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
  
        System.out.println("-----------hi----------");
    	pst=con.prepareStatement("update student_cert_status set ssc=?,intemediate=?,diploma=?,degree=?,ug=? where roll_num=?");
    	pst.setString(1,ssc1);
    	pst.setString(2,interm);
    	pst.setString(3,dip);
    	pst.setString(4,deg);
    	pst.setString(5,under);
    	pst.setString(6,rollno);
    	pst.executeUpdate();
    	pst.close();
    	System.out.println("8.6.student certificete table was updated");        
        	//9.student_accomidation_details_tab updation
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
	    	       flag=1;           
 }
 	
 
 
//******************    end of updation         *********************


   if(flag!=1)
   {
                            //1.student_tab insertion
	pst=con.prepareStatement("insert into student_tab(admn_num,roll_num,student_name,branch_name,sem) values(?,?,?,?,?)");
	pst.setInt(1,admnno);
	pst.setString(2,rollno);
	pst.setString(3,fullname);
	pst.setString(4,branch);
	pst.setInt(5,sem);
	
	pst.executeUpdate();
	System.out.println("1.student_tab inserted");
	pst.close();
	
                         //2.student_academic_details insertion.
   
     
      System.out.println("res="+resschlr+"\n feeschlr="+feeschlr);
	pst=con.prepareStatement("insert into student_academic_details_tab values(?,?,?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1,rollno);
	pst.setString(2,qlfytest);
	pst.setInt(3,rank);
	pst.setString(4,htno);
	pst.setString(5, sschtno);
	pst.setString(6,admntyp);
	pst.setString(7,admndate);
	pst.setInt(8,yearofcompletion);
	pst.setString(9,discdate);
	pst.setString(10,dateleave);
	pst.setString(11,feeschlr);
	pst.setString(12,resschlr);
	pst.executeUpdate();
	System.out.println("2.student_academic_details inserted");
	pst.close();

                        // 3.Student_personal_details insertion
                        System.out.println("=================*hi*=========");
	pst=con.prepareStatement("insert into student_personal_details_tab values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1,rollno);
	pst.setString(2,dob);
	pst.setString(3,gen);
	System.out.println("1=================*hi*=========");
	
	pst.setString(4,pname);
	pst.setString(5,occup);
	pst.setString(6,landph);
	System.out.println("2=================*hi*=========");
	pst.setString(7,pmobile);
	pst.setString(8,stmobile);
	System.out.println("3=================*hi*=========");
	pst.setString(9,email);
	pst.setString(10,aemail);
	pst.setString(11,category);
	pst.setString(12,seat);
	System.out.println("4=================*hi*=========");
	pst.setString(13,seatcategory);
	System.out.println("5=================*hi*=========");
	pst.executeUpdate();
	System.out.println("3.student_personal_details inserted");
	pst.close();
							// 4.Student_other_details insertion
	pst=con.prepareStatement("insert into student_other_details_tab values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1,rollno);
	pst.setString(2,nationality);
	pst.setString(3,mothertounge);
	pst.setString(4,identificationmark1);
	pst.setString(5,identificationmark2);
	pst.setString(6,castename);
	pst.setString(7,religion);
	pst.setString(8,blood);
	pst.setString(9,accno);
	pst.setString(10,bankname);
	pst.setString(11,bankbranch);
	pst.setString(12,dob_certificate);
	pst.setString(13,hallticket_eei);
	pst.setString(14,mom);
	pst.setString(15,rankcard);
	pst.setString(16,ssc_certificate);
	pst.setString(17,study_certificate);
	pst.setString(18,caste_certificate);
	pst.setString(19,tc);
	pst.executeUpdate();
	pst.close();
	System.out.println("4.student_other_details inserted");
								// 5.Student_corr_address_details insertion
	pst=con.prepareStatement("insert into student_corr_address_details_tab values(?,?,?,?,?,?)");
	pst.setString(1,rollno);
	pst.setString(2,doorno);
	pst.setString(3,street);
	pst.setString(4,area);
	pst.setString(5,district);
	pst.setInt(6,pin);
	pst.executeUpdate();
	pst.close();
	System.out.println("5.student_corr_address_details inserted");
	
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
                          //8.student_qualification_details_tab insertion
           //++++++   for ssc details
  	 if(ssc1.equals("yes"))
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
  	  //+++++++++  for intermediate  details insertion
  	  System.out.println("hjhdsfhsjdfhdsf");
  	  System.out.println("interm="+interm);
  	if(interm.equals("yes"))
	    {
  		    
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
  //+++++++++  for diploma  details insertion
  	if(dip.equals("yes"))
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
  //+++++++++  for degree  details insertion
  	if(deg.equals("yes"))
	    {
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
  //+++++++++  for ug  details insertion
  	if(under.equals("yes"))
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
  
    pst=con.prepareStatement("insert into student_cert_status values(?,?,?,?,?,?)");
    pst.setString(1,rollno);
    pst.setString(2,ssc1);
    pst.setString(3,interm);
    pst.setString(4,dip);
    pst.setString(5,deg);
    pst.setString(6,under);
    pst.executeUpdate();
    pst.close();
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
	flag=0;
       
 %>
 <h1>Student data was successfully Inserted</h1>      
 <input type="button" value="quit" onclick="window.close()">                 