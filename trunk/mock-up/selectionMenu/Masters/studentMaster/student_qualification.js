function val()
{
  
                 var roll=document.getElementById("rollno").value;
              if(roll=="")
              {
              alert("enter the roll number");
              document.studentmaster.rollno.focus();
              return false;
              } 
                 //validation for ssc qualification 
   if(document.getElementById("ssc").checked)
   {
  
        if(document.getElementById("sscins").value=="")
          {
           alert("enter the ssc institution name");
           document.studentmaster.sscins.focus();
             return false;
          }
          if(document.getElementById("sscmedium").value=="0")
          {
           alert("enter the ssc medium");
           document.studentmaster.sscmedium.focus();
             return false;
          }
          if(document.getElementById("sscdivision").value=="0")
          {
           alert("enter the ssc division");
           document.studentmaster.sscdivision.focus();
            return false;
          }
          if(document.getElementById("sscpercentage").value=="")
          {
           alert("enter the ssc percentage");
           document.studentmaster.sscpercentage.focus();
            return false;
          }
          if(document.getElementById("sscyear").value=="")
          {
           alert("enter the ssc year of completion");
           document.studentmaster.sscyear.focus();
            return false;
          }
        
   }
   
   
               // validation for intermediate qualification
     
    if(document.getElementById("inter").checked)
   {
        if(document.getElementById("interins").value=="")
          {
           alert("enter the intermediate institution name");
           document.studentmaster.interins.focus();
           return false;
          }
          if(document.getElementById("intermedium").value=="0")
          {
           alert("enter the  intermediate medium");
           document.studentmaster.intermedium.focus();
           return false;
          }
          if(document.getElementById("interdivision").value=="0")
          {
           alert("enter the intermediate division");
           document.studentmaster.interdivision.focus();
           return false;
          }
          if(document.getElementById("interpercentage").value=="")
          {
           alert("enter the intermediate percentage");
           document.studentmaster.interpercentage.focus();
           return false;
          }
          if(document.getElementById("interyear").value=="")
          {
           alert("enter the intermediate year of completion");
           document.studentmaster.interyear.focus();
           return false;
          }
         
   } 
                 //validation for diploma qualification
      if(document.getElementById("diploma").checked)
   {
        if(document.getElementById("diplomains").value=="")
          {
           alert("enter the diploma institution name");
           document.studentmaster.diplomains.focus();
           return false;
          }
          if(document.getElementById("diplomamedium").value=="0")
          {
           alert("enter the diploma medium");
           document.studentmaster.diplomamedium.focus();
           return false;
          }
          if(document.getElementById("diplomadivision").value=="0")
          {
           alert("enter the diploma division");
           document.studentmaster.diplomadivision.focus();
           return false;
          }
          if(document.getElementById("diplomapercentage").value=="")
          {
           alert("enter the diploma percentage");
           document.studentmaster.diplomapercentage.focus();
           return false;
          }
          if(document.getElementById("diplomayear").value=="")
          {
           alert("enter the diploma year of completion");
           document.studentmaster.diplomayear.focus();
           return false;
          }
         
   }
             //validation for degree qualification 
   if(document.getElementById("degree").checked)
   {
        if(document.getElementById("degreeins").value=="")
          {
           alert("enter the degree institution name");
           document.studentmaster.degreeins.focus();
           return false;
          }
          if(document.getElementById("degreemedium").value=="0")
          {
           alert("enter the degree medium");
           document.studentmaster.degreemedium.focus();
           return false;
          }
          if(document.getElementById("degreedivision").value=="0")
          {
           alert("enter the degree division");
           document.studentmaster.degreedivision.focus();
           return false;
          }
          if(document.getElementById("degreepercentage").value=="")
          {
           alert("enter the degree percentage");
           document.studentmaster.degreepercentage.focus();
           return false;
          }
          if(document.getElementById("degreeyear").value=="")
          {
           alert("enter the degree year of completion");
           document.studentmaster.degreeyear.focus();
           return false;
          }
         
   }
   
    //validation for ug qualification 
   if(document.getElementById("ug").checked)
   {
        if(document.getElementById("ugins").value=="")
          {
           alert("enter the ug institution name");
           document.studentmaster.ugins.focus();
           return false;
          }
          if(document.getElementById("ugmedium").value=="0")
          {
           alert("enter the ug medium");
           document.studentmaster.ugmedium.focus();
           return false;
          }
          if(document.getElementById("ugdivision").value=="0")
          {
           alert("enter the ug division");
           document.studentmaster.ugdivision.focus();
           return false;
          }
          if(document.getElementById("ugpercentage").value=="")
          {
           alert("enter the ug percentage");
           document.studentmaster.ugpercentage.focus();
           return false;
          }
          if(document.getElementById("ugyear").value=="")
          {
           alert("enter the ug year of completion");
           document.studentmaster.ugyear.focus();
           return false;
          }
         
   }

                              //end of validation of academic and personal details

}
function checkssc()
   {
   
       if(document.getElementById("ssc").checked)
       {
            document.getElementById("sscins").disabled=false;
            document.getElementById("sscmedium").disabled=false;
            document.getElementById("sscdivision").disabled=false;
            document.getElementById("sscpercentage").disabled=false;
            document.getElementById("sscyear").disabled=false;
            return false;
           
       }
       else
       {
            document.getElementById("sscins").disabled=true;
            document.getElementById("sscmedium").disabled=true;
            document.getElementById("sscdivision").disabled=true;
            document.getElementById("sscpercentage").disabled=true;
            document.getElementById("sscyear").disabled=true;
          
           return false;
       }
   }
   function checkinter()
   {
   
       if(document.getElementById("inter").checked)
       {
            document.getElementById("interins").disabled=false;
            document.getElementById("intermedium").disabled=false;
            document.getElementById("interdivision").disabled=false;
            document.getElementById("interpercentage").disabled=false;
            document.getElementById("interyear").disabled=false;
            return false;
       }
       
       else
       {
            document.getElementById("interins").disabled=true;
            document.getElementById("intermedium").disabled=true;
            document.getElementById("interdivision").disabled=true;
            document.getElementById("interpercentage").disabled=true;
            document.getElementById("interyear").disabled=true;
            
          return false;
       }
   }
   function checkdiploma()
   {
   
       if(document.getElementById("diploma").checked)
       {
            document.getElementById("diplomains").disabled=false;
            document.getElementById("diplomamedium").disabled=false;
            document.getElementById("diplomadivision").disabled=false;
            document.getElementById("diplomapercentage").disabled=false;
            document.getElementById("diplomayear").disabled=false;
            return false;
           
       }
       else
       {
            document.getElementById("diplomains").disabled=true;
            document.getElementById("diplomamedium").disabled=true;
            document.getElementById("diplomadivision").disabled=true;
            document.getElementById("diplomapercentage").disabled=true;
            document.getElementById("diplomayear").disabled=true;
           return false;
            
       }
   }
   function checkdegree()
   {
   
       if(document.getElementById("degree").checked)
       {
            document.getElementById("degreeins").disabled=false;
            document.getElementById("degreemedium").disabled=false;
            document.getElementById("degreedivision").disabled=false;
            document.getElementById("degreepercentage").disabled=false;
            document.getElementById("degreeyear").disabled=false;
            
           return false;
       }
       else
       {
            document.getElementById("degreeins").disabled=true;
            document.getElementById("degreemedium").disabled=true;
            document.getElementById("degreedivision").disabled=true;
            document.getElementById("degreepercentage").disabled=true;
            document.getElementById("degreeyear").disabled=true;
          
          return false;
       }
   }
   function checkug()
   {
   
       if(document.getElementById("ug").checked)
       {
            document.getElementById("ugins").disabled=false;
            document.getElementById("ugmedium").disabled=false;
            document.getElementById("ugdivision").disabled=false;
            document.getElementById("ugpercentage").disabled=false;
            document.getElementById("ugyear").disabled=false;
           return false; 
       }
       else
       {
            document.getElementById("ugins").disabled=true;
            document.getElementById("ugmedium").disabled=true;
            document.getElementById("ugdivision").disabled=true;
            document.getElementById("ugpercentage").disabled=true;
            document.getElementById("ugyear").disabled=true;
           return false;
          
       }
   }