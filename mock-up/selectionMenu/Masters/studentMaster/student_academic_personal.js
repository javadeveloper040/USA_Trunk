
function val()
{
  if(document.getElementById("rollno").value=="")
  {
     alert("enter the roll number");
     return false;
  }
  if(document.getElementById("pdoorno").value=="")
  {
    alert("enter the permanet address door number");
    document.studentmaster.pdoorno.focus();
    return false;
  }
  if(document.getElementById("pstreet").value=="")
  {
    alert("enter the permanet address street name");
    document.studentmaster.pstreet.focus();
    return false;
  }
  if(document.getElementById("parea").value=="")
  {
    alert("enter the permanent address area name");
    document.studentmaster.parea.focus();
    return false;
  }
  if(document.getElementById("pdistrict").value=="")
  {
    alert("enter the permanet address district name");
    document.studentmaster.pdistrict.focus();
    return false;
  }
  if(document.getElementById("ppin").value=="")
  {
    alert("enter the permanet address area pincode");
    document.studentmaster.ppin.focus();
    return false;
  }
    if(document.getElementById("addc").value=="")
  {
    alert("enter the correspondence address details fully");
    document.studentmaster.addc.focus();
    return false;
  }
      if(document.getElementById("addp").value=="")
  {
    alert("enter the permanet address details fully");
    document.studentmaster.addp.focus();
    return false;
  }
      if(document.getElementById("bg").value=="")
  {
    alert("enter the blood group");
    document.studentmaster.bg.focus();
    return false;
  }
      if(document.getElementById("acno").value=="")
  {
    alert("enter the accountnumber");
    document.studentmaster.acno.focus();
    return false;
  }
       if(document.getElementById("bankname").value=="")
  {
    alert("enter the bank name");
    document.studentmaster.bankname.focus();
    return false;
  }
      if(document.getElementById("bankbranch").value=="")
  {
    alert("enter the branch name of the bank");
    document.studentmaster.bankbranch.focus();
    return false;
  }
 
  if(document.getElementById("disc").checked)
  {
       if(document.getElementById("ddate").value=="")
       {
        alert("enter the discontinued date");
        document.studentmaster.ddate.focus();
      return false;
       }
     if(document.getElementById("ldate").value=="")
      {
       alert("enter the leaving  date");
       document.studentmaster.ldate.focus();
     return false;
     }
  } 
  if(!(document.getElementById("bno").checked))
  {
    if(document.getElementById("bregdate").value=="")
    {
      alert("enter the registered date for bus");
      document.studentmaster.bregdate.focus();
      return false;
     }
    if(document.getElementById("busarea").value=="0")
     {
      alert("select the area for bus stop");
      document.studentmaster.busarea.focus();
      return false;
     }
    if(document.getElementById("busno").value=="0")
    {
      alert("select the bus number");
      document.studentmaster.busno.focus();
      return false;
    }
     if(document.getElementById("bcdate").value=="")
    {
      alert("enter the cancellation date for bus");
      document.studentmaster.bcdate.focus();
      return false;
    }
      
  }
  if(!(document.getElementById("ano").checked))
  {
    if(document.getElementById("accregdate").value=="")
    {
     alert("enter the registered date for accomodation");
     document.studentmaster.accregdate.focus();
     return false;
    }
    if(document.getElementById("acchostelname").value=="0")
    {
     alert("select the hostel name for accomodation");
     document.studentmaster.acchostelname.focus();
     return false;
    }
    if(document.getElementById("accroomno").value=="0")
   {
     alert("select the room number for accomodation");
     document.studentmaster.accroomno.focus();
     return false;
   } 
    if(document.getElementById("guardian").value=="")
     {
      alert("enter the guardian name for accomodated hostel");
      document.studentmaster.guardian.focus();
      return false;
    }
    if(document.getElementById("accphno").value=="")
      {
       alert("enter the phone number of accomodated hostel");
       document.studentmaster.accphno.focus();
       return false;
     }
     if(document.getElementById("acccdate").value=="")
     {
      alert("enter the cancel dateof accomodation");
      document.studentmaster.acccdate.focus();
      return false;
     }
       
   }
}

function permanent()
{
  if(document.getElementById("mergep").checked)
  {
   var door=document.getElementById("pdoorno").value;
   var street=document.getElementById("pstreet").value;
   var area=document.getElementById("parea").value;
   var dt=document.getElementById("pdistrict").value;
   var pin=document.getElementById("ppin").value;
   document.getElementById("addp").value="Door no:"+door+", Street:"+street+", Area:"+area+",District:"+dt+",Pin:"+pin;
   return false;
 }
 else
 {
      document.getElementById("addp").value="";
      return false;
 }
}

function availability()
{

 if(document.getElementById("bno").checked)
 {
  document.getElementById("bregdate").disabled=true;
  document.getElementById("busarea").disabled=true;
  document.getElementById("busno").disabled=true;
  document.getElementById("bcdate").disabled=true;
  return false;
  }
  else if(document.getElementById("byes").checked)
   {
    document.getElementById("bregdate").disabled=false;
	document.getElementById("busarea").disabled=false;
	document.getElementById("busno").disabled=false;
	document.getElementById("bcdate").disabled=false;
	return false;
   }
}
  //checking accomodation availability
function checkavail()
{

    if(document.getElementById("ano").checked)
	{
		document.getElementById("accregdate").disabled=true;
		
		document.getElementById("acchostelcode").disabled=true;
		document.getElementById("accroomno").disabled=true;
		document.getElementById("accphno").disabled=true;
		document.getElementById("guardian").disabled=true;
		document.getElementById("acccdate").disabled=true;
	  
		return false;
	}
	else if(document.getElementById("ayes").checked)
	{
	 
		document.getElementById("accregdate").disabled=false;
		
		document.getElementById("acchostelcode").disabled=false;
		document.getElementById("accroomno").disabled=false;
		document.getElementById("accphno").disabled=false;
		document.getElementById("guardian").disabled=false;
		document.getElementById("acccdate").disabled=false;
		return false;
	}
}
 				//checking the discontinution date field
 function checkdisc()
 {
     if(document.getElementById("disc").checked)
     {
        document.getElementById("ddate").disabled=false;
        document.getElementById("ddate").value="";
	    document.getElementById("ldate").disabled=false;
	    document.getElementById("ldate").value="";
	    return false;
     }
    else
     {
       document.getElementById("ddate").disabled=true;
       document.getElementById("ddate").value="disabled";
	   document.getElementById("ldate").disabled=true;
	   document.getElementById("ldate").value="disabled";
	   return false;
     }
 }
 
function checkthis()
{
          var on=document.getElementById("same").checked;
        
          if(on==false){
        document.getElementById("pdoorno").value="";
       document.getElementById("pstreet").value="";
       document.getElementById("parea").value="";
       document.getElementById("pdistrict").value="";
       document.getElementById("ppin").value="";
       return false;
       }
       
}
 
 function dtval(code)
      {
      if(code=="discontinue")
      {
      var reg=document.getElementById("ddate").value;
      var cal=document.getElementById("ldate").value;
      }
      else
      {
      var reg=document.getElementById(code+"regdate").value;
      var cal=document.getElementById(code+"cdate").value;
      }
      if((reg.length!=10)||(cal.length!=10))
       		 {
       				 if(code=="acc")
       		 		{
         	  		alert("enter the accomodation register and cancellation dates correctly");
         	  		}
         	  	if(code=="b")
         	  		{
         	  	 alert("enter the bus register and cancellation dates correctly");
         			  }
         			 if(code=="discontinue")
         			 {
         			 alert("enter the discontinued date and leaving date correctly");
         			 } 
          	 return false;     
       		 }
       		 else
       		 { 
        		var x=reg.split("/");
        		var y=cal.split("/");
        		var dd1=parseInt(x[0],10);
        		var mm1=parseInt(x[1],10);
        		var dd2=parseInt(y[0],10);
        		var mm2=parseInt(y[1],10);
        		if((mm1==1)||(mm1==3)||(mm1==5)||(mm1==7)||(mm1==8)||(mm1==10)||(mm1==12))
        	 	{
        	  
        	 
           		 if(dd1>31)
           		 {
           		 if(code=="acc")
       		  	{
         	  	  alert("enter the correct  day in the accomodation registered date");
         	  	}
         	  	 if(code=="b")
       		  	{
         	  	  alert("enter the correct  day in the bus registered date");
         	  	}
         	  	if(code=="discontinue")
         	  	{
         	  	   alert("enter the correct day in the discontinued date");
         	  	}
           		return false;
            	 }
             	}
        	 else
        	 {
           			if((mm1==2)||(mm1==4)||(mm1==6)||(mm1==9)||(mm1==11))
           			{
           	
            	if(dd2>30)
           		 {
            		 if(code=="acc")
       		  			{
         	  				   alert("enter the correct  day in the accomodation cancellation date");
         	  			}
         	  		 if(code=="b")
       		  			{
         	 				alert("enter the correct the day in the bus cancellation date");
         	  			}
         	  	     if(code=="discontinue")
         	  	     {
         	  	         alert("enter the correct day in the leaving date");
         	  	     }       
             	return false;
             	}
             }
             }
        	 if(mm1>12)
        	 {
         
              			if(code=="acc")
       		  			{
         	  			   alert("month must not be greater than 12 in accomodation registered date");
         	  			}
         	 		 if(code=="b")
       		  		{
         			alert("month must not be greater than 12 in bus registered date");
         	  			}
                    if(code=="discontinue")
                    {
                       alert("month must not be greater than 12 in discontinued date");
                    }
           return false;
           }
        	   if(mm2>12)
        		   {
          		 if(code=="acc")
       		 		 	{
         	 		 	   alert("month must not be greater than 12 in accomodation cancellation date");
         	 		 	}
         	 		 	 if(code=="b")
       		 		 	{
         			alert("month must not be greater than 12 in bus cancellation date date");
         			  	}
                if(code=="discontinue")
                    {
                       alert("month must not be greater than 12 in leaving  date");
                    }
           			return false;
           			}
          var x=reg.split("/");
          var y=cal.split("/");
          var i1=parseInt(x[2],10);
           var i2=(parseInt(x[1],10)*100)+(i1*10000);
           var i3=parseInt(x[0],10)+i2;
          var j1=parseInt(y[2],10);
          var j2=(parseInt(y[1],10)*100)+(j1*10000);
          var j3=parseInt(y[0],10)+j2;
        
          		 if(j3<i3)
          		 {
        
               		  if(code=="acc")
       		  			{
         	  		 alert("cancellation date must be greater than registered date in accomodation details");
         	  		}
        
         	  		 if(code=="b")
       		  			{
         	  			  alert("cancellation date must be greater than registered date in bus availability details");
         	 		 	}
     
         	 		 	if(code=="discontinue")
         	 		 	{
         	 		 	alert("leaving date must be greater than discontinued date");
         	 		 	}
             		 return false;
            	 }
      
                		 
        }
      }
     
      function checktick(){
     
     
      var x=document.getElementById("hid").value;
      i=0;
      while(i<=x.length)
      {
     x1=x.replace("#"," ");
     x=x1;
     i++;
      }
     
      
      y=x.split("$");
     
     y0=y[0].replace("#"," ");
     y1=y[1].replace("#"," ");//alert(y1);
     y2=y[2].replace("#"," ");//alert(y2);
     y3=y[3].replace("#"," ");//alert(y3);
     y4=y[4].replace("#"," ");//alert(y4);
    
        if(document.getElementById("same").checked){
    	      document.getElementById("pdoorno").value=y0;
     	      document.getElementById("pstreet").value=y1;
      		  document.getElementById("parea").value=y2;
      		  document.getElementById("pdistrict").value=y4;
      		  document.getElementById("ppin").value=y3;     
           }else{
           document.getElementById("pdoorno").value=" ";
     	      document.getElementById("pstreet").value=" ";
      		  document.getElementById("parea").value=" ";
      		  document.getElementById("pdistrict").value=" ";
      		  document.getElementById("ppin").value=" ";
           }
      
      }    
function correspondence()
{
 
  var x1=document.getElementById("hid").value;
      i=0;
  while(i<=x1.length)
      {
     x=x1.replace("#"," ");
     x1=x;
     i++;
      }
 
      y1=x1.split("$");
 
if(document.getElementById("mergec").checked)
  {
  
  document.getElementById("addc").value="Door no:"+y1[0]+", Street:"+y1[1]+", Area:"+y1[2]+",District:"+y1[4]+",Pin:"+y1[3];
   return false;
 }
 else
 {
      document.getElementById("addc").value="";
      return false;
 }
} 