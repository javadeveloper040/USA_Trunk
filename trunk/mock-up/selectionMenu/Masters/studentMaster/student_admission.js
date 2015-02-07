                 //for image
function imageupload()
     {

     var rollno=document.getElementById("rollno").value;
     var path="../../images/"+rollno+".jpg";
     //var sr1="http://svec06:8070/misFinal/WebContent/images/v.jpg";
     //alert(sr1);
     document.getElementById("ima2").src=path;
     }

                         //validation for email
function echeck(str) {

		var at="@";
		var dot=".";
		var lat=str.indexOf(at);
		var lstr=str.length;
		var ldot=str.indexOf(dot);
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID");
		   return false;
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID");
		   return false;
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID");
		    return false;
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID");
		    return false;
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }

 		 return true	;				
	}
	
	function ValidateForm(){
	var emailID1=document.getElementById("email");
	if (echeck(emailID1.value)==false){
		emailID1.value="";
		emailID1.focus();
		return false;
	}
	var emailID2=document.getElementById("email");
	if (echeck(emailID2.value)==false){
		emailID2.value="";
		emailID2.focus();
		return false;
	}
	return true;
 }
 
 
                   //end of email validation 
function valid()
{
       //validation of general details
               var roll=document.getElementById("rollno").value;
              if(roll=="")
              {
              alert("enter the roll number");
              document.studentmaster.rollno.focus();
              return false;
              }
               if(document.getElementById("admissionnum").value=="")
              {
              alert("enter the admission number");
              document.studentmaster.admissionnum.focus();
              return false;
              }
               if(document.getElementById("fullname").value=="")
              {
              alert("enter the full name of the student");
              document.studentmaster.fullname.focus();
              return false;
              }
                            
              //end of validation of general details
              
               //validation of admission details
        var one=document.getElementById("admntyp1").checked;
 		var three=document.getElementById("admntyp2").checked;
 		var four=document.getElementById("admntyp3").checked;
		var two=document.getElementById("admntyp4").checked;
		if(!((one)||(two)||(three)||(four)))
		{
		alert("enter admission type correctly");
		return false;
		} 
	if(document.getElementById("catadmission").value=="0")
	{
	alert("enter the ctaegory of the admission");
	document.studentmaster.catadmission.focus();
	return false;
	}
	if(document.getElementById("seat").value=="0")
	{
	alert("enter the seat type correctly");
	document.studentmaster.seat.focus();
	return false;
	}
	if(document.getElementById("religion").value=="0")
	{
	alert("enter the Religion & caste correctly");
	document.studentmaster.religion.focus();
	return false;
	}
	if(document.getElementById("category").value=="")
	{
	alert("enter the category correctly");
	document.studentmaster.category.focus();
	return false;
	}
	if(document.getElementById("castename").value=="")
	{
	alert("enter the castename correctly");
	document.studentmaster.castename.focus();
	return false;
	}

	

	
	var db=document.getElementById("dob").value;
	if(db.length!=10)
	{
	alert("enter the dob in correct format");
	document.studentmaster.dob.focus();
	return false;
	}	
	if(document.getElementById("parentname").value=="")
	{
	alert("enter the parentname correctly");
	document.studentmaster.parentname.focus();
	return false;
	}

	
	if(document.getElementById("occupation").value=="")
	{
	alert("enter the occupation");
	document.studentmaster.occupation.focus();
	return false;
	}
	
	
	if(document.getElementById("land").value=="")
	{
	alert("enter the home land");
	document.studentmaster.land.focus();
	return false;
	}
	else
	{
	if(isNaN(document.getElementById("land").value))
	{
	alert("enter correct number");
	document.studentmaster.land.focus();
	return false;
	}
	}

	
	if(document.getElementById("parentmobile").value=="")
	{
	alert("enter the parentmobile");
	document.studentmaster.parentmobile.focus();
	return false;
	}
	else
	{
	if(isNaN(document.getElementById("parentmobile").value))
	{
	alert("enter correct number");
	document.studentmaster.parentmobile.focus();
	return false;
	}
	}


	if(document.getElementById("studentmobile").value=="")
	{
	alert("enter the studentmobile");
	document.studentmaster.studentmobile.focus();
	return false;
	}
	else
	{
	if(isNaN(document.getElementById("studentmobile").value))
	{
	alert("enter correct number");
	document.studentmaster.studentmobile.focus();
	return false;
	}
	}


	var emailID=document.getElementById("email");
	
	if ((emailID.value==null)||(emailID.value=="")){
		alert("Please Enter your Email ID");
		ValidateForm();
		emailID.focus();
		return false;
	}

	var emailID3=document.getElementById("aemail");
	
	if ((emailID3.value==null)||(emailID3.value=="")){
		alert("Please Enter your Alternate Email ID");
		ValidateForm();
		emailID3.focus();
		return false;
	}

	if(document.getElementById("doorno").value=="")
	{
    alert("enter the door number compulsory");
    document.studentmaster.doorno.focus();
	return false;
	}
	if(document.getElementById("street").value=="")
	{
    alert("enter the street");
    document.studentmaster.street.focus();
	return false;
	}
	if(document.getElementById("area").value=="")
	{
    alert("enter the area");
    document.studentmaster.area.focus();
	return false;
	}

	if(document.getElementById("dt").value=="")
	{
    alert("enter the district");
    document.studentmaster.dt.focus();
	return false;
	}
	if(document.getElementById("pin").value=="")
	{
    alert("enter the pincode");
    var len=document.getElementById("pin").value;
    if(len.length!=6)
    {
     alert("pincode must not be length of 6");
     document.studentmaster.pin.value="";
    }
    document.studentmaster.pin.focus();
	return false;

	}
	if(document.getElementById("Qualifyingtest").value=="")
	{
     	alert("enter the Qualifyingtest");
    	 document.studentmaster.Qualifyingtest.focus();
	 	return false;
	}
	if(document.getElementById("rank").value=="")
	{
    alert("enter the qulifying test rank");
    document.studentmaster.rank.focus();
	return false;
	}
	if(document.getElementById("hallticketno").value=="")
	{
    alert("enter the hallticket number");
   
	return false;
	}
	if(document.getElementById("sschallticketno").value=="")
	{
    alert("enter the sschallticket number");
	 
	return false;
	} 
 	if(document.getElementById("mothertongue").value=="0")
 	{
   	alert("select the mother tongue");
   	return false;
 	}
	if(document.getElementById("mole1").value=="")
	{
    alert("enter the identification mark1");
	  
	return false;
	}
	if(document.getElementById("mole2").value=="")
	{
    alert("enter the identification mark1");
 
	return false;
	}
   return true;                               //end of validation of admission details
}

// function checking  year
	function checkyear123(code)
	{
	var dt=document.getElementById(code).value;
   	if(dt=="")
   	 {
	    alert("enter "+code);
	    document.getElementById(code).focus();
	    return false;
	 }
   	else if(dt.length==10)
   	 {
   	   if(!correctdate(dt,code))
   	   {
   	     document.getElementById(code).focus();
   	    return false;
   	    }
   	    else
   	    {

   	      if(code=="admissiondate")
   	      {

   	      var str=dt.substring(6);
    	  var i=parseInt(str)+4;
    	  document.getElementById("complete").value=i;
    	  }
    	}
     }
  	else
  	  {
  	   alert("enter the "+code+" correctly"); 
	   document.getElementById(code).focus();
	   return false;
	   } 	  
  	}
	// function for correct date
	function correctdate(corrdate,code)
	{
	  
	    var dd1=parseInt(corrdate.substring(0,2),10);
        var mm1=parseInt(corrdate.substring(3,5),10);

       if((mm1==1)||(mm1==3)||(mm1==5)||(mm1==7)||(mm1==8)||(mm1==10)||(mm1==12))
         {
            if(dd1>31)
            {
             alert("enter the correct  day of the "+code);
             document.getElementById(code).focus();
             return false;
             }
         }
         else
         {
            if(mm1==2||mm1==4||mm1==6||mm1==9||mm1==11)
             {
              if(dd1>30)
               {
                alert("enter the correct the day of "+code);
             document.getElementById(code).focus();
             return false;
               }
                
             }
             else
             {
              alert("enter the month correctly for "+code);
               document.getElementById(code).focus();
              return false;
             }
            
         }
          return true;
	}

  