<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Master</title><link rel="stylesheet" href="../../sheet1.css">
<script src="student_admission.js" language="javascript">
</script>
</head>
<body bgcolor="skyblue">
<form name="studentmaster" action="student_admission_insert.jsp" method="post" onsubmit="return valid()">
<table>
<tr><td>RollNO</td><td><input type="text" name="rollno" id="rollno"></td>
<td>Admission no</td><td><input type="text" name="admissionnum" id="admissionnum"></td>
<td>Fullname</td><td><input type= "text" name="fullname" id="fullname" size="40"></td>
<td>Branch</td><td><select name="branch"><option value="cse">CSE</option>
<option value="ece">ECE</option><option value="eee">EEE</option><option value="it">IT</option>
</select>
</td>
<td><b>Semester</b></td><td><select name="sem" id="sem"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="7">7</option><option value="8">8</option></td>
</tr></table>
<fieldset>
<legend>Admission details</legend>
<table align="center" cellpadding="5">
<tr>
<td>
<table width="250" height="350" border="0" cellpadding="5" cellspacing="0" align="center">
   <tr>
		<input type="radio" name="admntyp" id="admntyp1" value="newadmission"/>New Admission<br>
		<input type="radio" name="admntyp" id="admntyp2" value="lateralentry">Lateral Entry<br>
		<input type="radio" name="admntyp" id="admntyp3" value="jkc">JKC<br>
		<input type="radio" name="admntyp" id="admntyp4" value="spotadmission">Spot Admission<br>
    <td width="284" scope="row" align="left"colspan="2">Category of admission &amp; seat <br>
    <select name="catadmission" id="catadmission">
    <option value="0">select category</option>
    <option value="NRI">NRI</option>
    <option value="GENERAL">GENERAL</option>
    <option value="SPORTS/EX-ARMY">SPORTS/EX-ARMY</option>
    <option value="PHC">PHC</option>
     </select>&nbsp;
    <select name="seat" id="seat"><option value="0">seat type</option><option value="OC">OC</option>
    <option value="BC">BC</option>
    <option value="SC">SC</option>
    <option value="ST">ST</option><option value="PHC">PHC</option>
    </select>
    </td>
    <hr>
  </tr>
  <tr>
    <td scope="row" align="left" colspan="2">Religion &amp; caste &nbsp; &nbsp; &nbsp;
    Category<br/><select name="religion" id="religion"><option value="0">select religion</option><option value="hindu">Hindu</option><option value="muslim">Muslim</option><option value="christian">Christian</option><option value="jains">Jains</option><option value="sikhs">Sikhs</option></select>&nbsp; &nbsp;
    <input type="text" name="category" id="category" size="5">
    </td>
    
</tr>
<tr>
    <td width="300" scope="row" align="left"colspan="2">Caste Name<br><input type="text" id="castename" name="castename"></td>
</tr>
<tr><td colspan="2"><input type="checkbox" id="rsch" name="rsch" value="yes">Reservation Scholarship</td></tr>
<tr><td colspan="2"><input type="checkbox"  id="fsch" name="fsch" value="yes">Fees Scholarship</td></tr>
<tr><td width="284" scope="row" align="left" colspan="2">Admission Date(dd/mm/yyyy)<br>
	<input type="text" id="admissiondate" name="admissiondate" onblur="checkyear123(this.id)" value="  /  /    "></td>
</tr>
<tr>
	<td width="284" scope="row" align="left">Year of completion<br><input type="text" id="complete" name="complete" ></td>
</tr>

</table>
</td>
<td>
     <table width="350" height="350" border="0" cellspacing="2" cellpadding="2" align="center">
    	<tr>
     	 <th  scope="row" align="left">DOB (DD/MM/YYYY)</th>
     	 <td><input type="text" name="dob" id="dob" onblur="checkyear123(this.id)" value="  /  /   ">
     	 </td></tr>
     	 <tr><th align="left">
     	 Gender:</th><td><select name="gender" id="gender" ><option value="male">male</option><option value="female">female</option>
     	 </select>
     	 </td>
     	</tr>     
    <tr>
      <th scope="row" align="left">Parentname</th>
      <td><input type="text" name="parentname" id="parentname" size="20"></td>
    </tr>
    <tr>
      <th scope="row" align="left">Occupation</th>
      <td><label>
        <input type="text" name="occupation" id="occupation" size="20">
      </label></td>
     
    </tr>
    <tr>
      <th scope="row" align="left">Home Land PH</th>
      <td><label>
        <input type="text" name="land" id="land" size="20"/>
      </label>
    </tr>
    <tr>
      <th scope="row" align="left">Parent mobile</th>
      <td><label>
        <input type="text" name="parentmobile" id="parentmobile" size="20"/>
      </label></td>
      
    </tr>
    <tr>
      <th scope="row" align="left">Student mobile</th>
      <td><label>
        <input type="text" name="studentmobile" id="studentmobile" size="20"/>
      </label></td>
      
    </tr>

    <tr>
      <th scope="row" align="left">Email</th>
      <td><label>
        <input type="text" name="email" id="email" size="20"  />
      </label></td>
      
    </tr>

    <tr>
      <th scope="row" align="left">Alternative Email</th>
      <td><label>
        <input type="text" name="aemail" id="aemail" size="20" onblur="ValidateForm()" />
      </label></td>
      
    </tr>

    
</table>
<fieldset>
<legend>Correspondance address seperate fields</legend>
<table border=0>
<tr>
      <th scope="row" align="left">Doorno</th>
      <td><label>
        <input type="text" name="doorno" id="doorno"/>
      </label></td>
      
    </tr>
    <tr>
      <th scope="row" align="left">Street</th>
      <td><label>
<input type="text" name="street" id="street" />
      </label></td>
      
    </tr>

   <tr>
      <th scope="row" align="left">Area</th>
      <td><label>
        <input type="text" name="area" id="area"/>
      </label></td>
      
    </tr>

    <tr>
      <th scope="row" align="left">District</th>
      <td><label>
        <input type="text" name="dt" id="dt"/>
      </label></td>
      </tr><tr>
      <th>pin</th><td><input type="text" name="pin" id="pin"></td>
      
    </tr>
  </table>
</fieldset>
  <br/>
  </td>
 <td><img src="" id="ima2" height="140" width="110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="button" name="Refresh" value="Refresh" onclick="imageupload()">
<input type="button" value="browse" onclick=window.open("imageupload.jsp","","location=0,directories=0,menubar=0,toolbar=0,status=0,scrollbars=auto,resizable=0,top=0,left=2") />

 <fieldset><legend>Qual.Test Details</legend>   
 <table width="300" height="170" border="0" cellspacing="2" cellpadding="2" align="center">
  <tr>
    <th width="126" scope="row">Qualifying text</th>
    <td width="194" ><select name="Qualifyingtest" id="Qualifyingtest">
      <option value="eamcet">EAMCET</option>
      <option value="ecet">ECET</option>
      <option value="icet">ICET</option>
    </select></td>
  </tr>
  <tr>
    <th scope="row"><strong>Rank</strong></th>
    <td ><input type="text" name="rank" id="rank">
    </td>
  </tr>
  <tr>
    <th scope="row"><strong>Hallticket No</strong></th>
    <td><label>
      <input type="text" name="hallticketno" id="hallticketno" />
    </label></td>
  </tr>
   <tr>
    <th scope="row"><strong>SSC Hallticket No</strong></th>
    <td><label>
      <input type="text" name="sschallticketno" id="sschallticketno"/>
    </label></td>
  </tr>
  <tr>
    <th scope="row"><strong>Nationality</strong></th>
    <td><label>
      <select name="nationality" id="nationality"><option value="indian">INDIAN</option>
      <option value="angindian">Anglo INDIAN</option></select>
    </label></td>
  </tr>
   <tr>
    <th scope="row"><strong>Mother Tongue</strong></th>
    <td><label>
      <select name="mothertongue" id="mothertongue" />
      <option value="0">select</option>
      <option value="telugu">Telugu</option>
      <option value="hindi">Hindi</option>
      <option value="english">English</option>
      <option value="tamil">Tamil</option>
    </label></td></tr><br>
<tr>
<td colspan="2">
<fieldset><legend>Identification marks</legend>
	<table>
	<tr><td>
	1) &nbsp;<input type="text" id="mole1" name="mole1" size="30">
	</td></tr>
	<tr><td>
	2) &nbsp;<input type="text" id="mole2" name="mole2" size="30">
	</td></tr>
	</table>
</fieldset>
</td>
</table>
</tr>
</table>
</fieldset>
<br>
<center>
			  <input  type="submit" value="Next"/>
			  <input   type="button" value="Quit" onclick="window.close()"/>
			</center>
			</form>
</body>
</html>