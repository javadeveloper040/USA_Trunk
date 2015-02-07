<%@page import="java.sql.*,java.io.*,vdb.Db" %>
<html>
<head>
<title></title>
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
System.out.println("entered into student  academic details");
   //1.student_tab
String rollno=request.getParameter("rollno");//=======
session.setAttribute("rollno",rollno);
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
String resschlr=request.getParameter("rsch");//======
System.out.println("13="+ resschlr);

String feeschlr=request.getParameter("fsch");//======

System.out.println("14="+feeschlr);
String occup=request.getParameter("occupation");//=======

System.out.println("15="+occup);

   //--------------3.Student_personal_details
   
String dob=request.getParameter("dob");//=======
	
System.out.println("16="+dob);

String gen=request.getParameter("gender");//=======

System.out.println("17="+gen);
String pname=request.getParameter("parentname");//=======

System.out.println("18="+pname);
String landph=request.getParameter("land");//=======

System.out.println("19="+landph);
String pmobile=request.getParameter("parentmobile");//=======

System.out.println("20="+pmobile);
String stmobile=request.getParameter("studentmobile");//=======

System.out.println("21="+stmobile);
String email=request.getParameter("email");//=======

System.out.println("22="+email);
String aemail=request.getParameter("aemail");//=======

System.out.println("23="+aemail);
String category=request.getParameter("category");//======

System.out.println("24="+category);
String seat=request.getParameter("seat");//======

System.out.println("25="+seat);
String seatcategory=request.getParameter("catadmission");//======

System.out.println("26="+seatcategory);

   //------------4.Student_other_details
String nationality=request.getParameter("nationality");//======
	
System.out.println("27="+nationality);
String mothertounge=request.getParameter("mothertongue");//======

System.out.println("28="+mothertounge);
String identificationmark1=request.getParameter("mole1");//======

System.out.println("29="+identificationmark1);

String identificationmark2=request.getParameter("mole2");//======
	
System.out.println("30="+identificationmark2);
String castename=request.getParameter("castename");//=======

System.out.println("31="+castename);
String religion=request.getParameter("religion");//=======

System.out.println("32="+religion);
//5.Student_corr_address_details


String street=request.getParameter("street");//=======
	session.setAttribute("street",street);
System.out.println("33="+street);   
String area=request.getParameter("area");//=======
session.setAttribute("area",area);
System.out.println("34="+area);
String district=request.getParameter("dt");//=======
session.setAttribute("district",district);
System.out.println("35="+district);
String pin1=request.getParameter("pin");//=======
	int pin=Integer.parseInt(pin1);
	session.setAttribute("pin1",pin1);
System.out.println("36="+pin);

String doorno=request.getParameter("doorno");//=======

System.out.println("37="+doorno);
session.setAttribute("doorno",doorno);
pst=con.prepareStatement("select * from student_tab where roll_num=?");
pst.setString(1,rollno);
ResultSet rs=pst.executeQuery();
int flag=0;
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
	
	PreparedStatement psmnt = vdb.Db.connect().prepareStatement("SELECT photo FROM student_tab WHERE roll_num = ?");
	psmnt.setString(1,rollno); 
	rs = psmnt.executeQuery();
	//System.out.println(file1);
	
	                  //2.student_academic_details updation
	if(resschlr!="yes")
 	  resschlr="no";
   if(feeschlr!="yes")
 	  feeschlr="no";
pst=con.prepareStatement("update student_academic_details_tab set qual_test=?, qual_test_rank=?, ht_num=?, ssc_ht_num=?,admn_type=?, admn_date=?, yearcompletion=?,feeschlr=?, resschlr=? where roll_num=?");
pst.setString(1,qlfytest);
pst.setInt(2,rank);
pst.setString(3,htno);
System.out.println("before sschtno");
pst.setString(4, sschtno);
System.out.println("before sschtno");
pst.setString(5,admntyp);
pst.setString(6,admndate);
pst.setInt(7,yearofcompletion);
pst.setString(8,feeschlr);
pst.setString(9,resschlr);
pst.setString(10,rollno);
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
pst=con.prepareStatement("update student_other_details_tab set nationality=?,mother_lang=?,mole1=?,mole2=?,caste=?,religion_name=? where roll_num=?");
pst.setString(1,nationality);
pst.setString(2,mothertounge);
pst.setString(3,identificationmark1);
pst.setString(4,identificationmark2);
pst.setString(5,castename);
pst.setString(6,religion);
pst.setString(7,rollno);
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
flag=1;
%>
<h1>Student data was successfully updated</h1>      
 <input type="button" value="quit" onclick="window.close()">
<%
  }
  if(flag!=1)
  {
                           //1.student_tab insertion
	pst=con.prepareStatement("insert into student_tab(admn_num,roll_num,student_name,branch_name,sem) values(?,?,?,?,?)");
	pst.setInt(1,admnno);
	pst.setString(2,rollno);
	pst.setString(3,fullname);
	pst.setString(4,branch);
	pst.setInt(5,sem);
	//pst.setBinaryStream(6,fin,(int)imgfile.length());
	//pst.setString(7,newpath1);
	pst.executeUpdate();
	System.out.println("1.student_tab inserted");
	pst.close();
	
	PreparedStatement psmnt = vdb.Db.connect().prepareStatement("SELECT photo FROM student_tab WHERE roll_num = ?");
	psmnt.setString(1,rollno); 
	rs = psmnt.executeQuery();
//	System.out.println(file1);
	

	
                        //2.student_academic_details insertion.
  if(resschlr==null)
 	  resschlr="no";
   if(feeschlr==null)
 	  feeschlr="no";
 
    
     System.out.println("res="+resschlr+"\n feeschlr="+feeschlr);
	pst=con.prepareStatement("insert into student_academic_details_tab (roll_num,qual_test,qual_test_rank,ht_num,ssc_ht_num,admn_type,admn_date,yearcompletion,feeschlr,resschlr) values(?,?,?,?,?,?,?,?,?,? )");
	pst.setString(1,rollno);
	pst.setString(2,qlfytest);
	pst.setInt(3,rank);
	pst.setString(4,htno);
	pst.setString(5, sschtno);
	pst.setString(6,admntyp);
	pst.setString(7,admndate);
	pst.setInt(8,yearofcompletion);
	pst.setString(9,feeschlr);
	pst.setString(10,resschlr);
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
	pst=con.prepareStatement("insert into student_other_details_tab (roll_num,nationality,mother_lang,mole1,mole2,caste,religion_name) values(?,?,?,?,?,?,?)");
	pst.setString(1,rollno);
	pst.setString(2,nationality);
	pst.setString(3,mothertounge);
	pst.setString(4,identificationmark1);
	pst.setString(5,identificationmark2);
	pst.setString(6,castename);
	pst.setString(7,religion);
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
  }
  flag=0;%>
  <jsp:forward page="student_academic_personal_details.jsp"></jsp:forward>
  <%
}
catch(Exception e)
{
	out.println(e);
}
%>
