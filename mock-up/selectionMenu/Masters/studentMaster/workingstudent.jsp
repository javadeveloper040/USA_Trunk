<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script src="SpryAssetsstudent/testing.js" language="javascript">

</script>

<link href="SpryAssetsstudent/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />

</head>

<body bgcolor="skyblue">
<form name="studentmaster" action="student_academic_details_insert.jsp" method="post" onsubmit="return val()">
<table><tr><td><b>RollNO</b></td><td><input type="text" name="rollno" id="rollno"  ></td>
<td>Admission no</td><td><input type="text" name="admissionnum" id="admissionnum"></td>
<td>Fullname</td><td><input type="text" name="fullname" id="fullname" size="40"></td>
<td>Branch</td><td><select name="branch"><option value="cse">CSE</option>
<option value="ece">ECE</option><option value="eee">EEE</option><option value="it">IT</option>
</select>
</td>
<td><b>Semester</b></td><td><select name="sem" id="sem"><option value="1">1st Semester</option><option value="2">2nd Semester</option></td>
</tr></table>

<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">Admission Details</li>
    <li class="TabbedPanelsTab" tabindex="0">Academic And Personal Details</li>
    <li class="TabbedPanelsTab" tabindex="0">Qualification</li>

  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">						    		
<table align="center" cellpadding="5">
<tr>
<td>
<table width="250" height="350" border="0" cellpadding="5" cellspacing="0" align="center">
   <tr>
		<input type="radio" name="admntyp" id="admntyp1" value="newadmission">New Admission<br>
		<input type="radio" name="admntyp" id="admntyp2" value="lateralentry">Lateral Entry<br>
		<input type="radio" name="admntyp" id="admntyp3" value="jkc">JKC<br>
		<input type="radio" name="admntyp" id="admntyp4" value="spotadmission">Spot Admission<br>
    <td width="284" scope="row" align="left"colspan="2">Category of admission &amp; seat <br>
    <select name="catadmission" id="catadmission">
    <option value="0">select category</option>
    <option value="myname">myname</option>
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
<tr>
	<td width="284" scope="row" align="left" colspan="2">Admission Date(DD/MM/YYYY)<br>
	<input type="text" id="admissiondate" name="admissiondate" onblur="checkyear123()"/></td>
</tr>
<tr>
	<td width="284" scope="row" align="left">Year of completion<br><input type="text" id="complete" name="complete" ></td>
</tr>
<tr><td rowspan="2" colspan="2"><fieldset ><legend>Class Rooms Alloted</legend></fieldset></td></tr>
</table>
</td>
<td>
     <table width="430" height="350" border="0" cellspacing="2" cellpadding="2" align="center">
    	<tr>
     	 <th width="198" scope="row" align="left">DOB</th>
     	 <td><input type="text" name="dob" id="dob">
     	 Gender:<select name="gender" id="gender" ><option value="male">male</option><option value="female">female</option>
     	 </select>
     	 </td>
     	</tr>     
    <tr>
      <th scope="row" align="left">Parentname</th>
      <td><input type="text" name="parentname" id="parentname" size="40"></td>
    </tr>
    <tr>
      <th scope="row" align="left">Occupation</th>
      <td><label>
        <input type="text" name="occupation" id="occupation" size="40">
      </label></td>
     
    </tr>
    <tr>
      <th scope="row" align="left">Home Land PH</th>
      <td><label>
        <input type="text" name="land" id="land" size="40"/>
      </label>
    </tr>
    <tr>
      <th scope="row" align="left">Parent mobile</th>
      <td><label>
        <input type="text" name="parentmobile" id="parentmobile" size="40"/>
      </label></td>
      
    </tr>
    <tr>
      <th scope="row" align="left">Student mobile</th>
      <td><label>
        <input type="text" name="studentmobile" id="studentmobile" size="40"/>
      </label></td>
      
    </tr>

    <tr>
      <th scope="row" align="left">Email</th>
      <td><label>
        <input type="text" name="email" id="email" size="40"  />
      </label></td>
      
    </tr>

    <tr>
      <th scope="row" align="left">Alternative Email</th>
      <td><label>
        <input type="text" name="aemail" id="aemail" size="40" onblur="ValidateForm()" />
      </label></td>
      
    </tr>

    
</table>
<fieldset>
<legend>Correspondance address seperate fields</legend>
<table>
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
      </label></td><td><b>&nbsp;&nbsp;pin</b>&nbsp;<input type="text" name="pin" id="pin"></td>
      
    </tr>
  </table>
</fieldset>
  <br/>
  </td>
 <td><img src="" id="photo" height="140" width="110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="button" name="Refresh" value="Refresh" onclick="showimage()">
 <input type="file" id="path" name="path">
 <fieldset><legend>Qual.Test Details</legend>   <table width="340" height="170" border="0" cellspacing="2" cellpadding="2" align="center">
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
	1) &nbsp;<input type="text" id="mole1" name="mole1" size="40">
	</td></tr>
	<tr><td>
	2) &nbsp;<input type="text" id="mole2" name="mole2" size="40">
	</td></tr>
	</table>
</fieldset>
</td>
</table>
</tr>
</table>
    </div>
    <div class="TabbedPanelsContent">									
				<table width="1000" cellpadding="5"  align="center">
				
				<tr>
					<td>
						<fieldset><legend>Permanent address seperate feilds</legend><table>
						<tr><td>Dr.No:</td><td><input type="text" name="pdoorno" id="pdoorno" size="20"></td></tr>
						<tr><td>Street:</td><td><input type="text" name="pstreet" id="pstreet" size="20"></td></tr>
						<tr><td>Area:</td><td><input type="text" name="parea" id="parea" size="20"></td></tr>
						<tr><td>District:</td><td><input type="text" name="pdistrict" id="pdistrict" size="20"></td></tr>
						<tr><td>Pin:</td><td><input type="text" name="ppin" id="ppin" size="10"></td></tr>
						<tr><td colspan="2"><input type="checkbox" id="same" name="same" onclick="checkthis()">&nbsp;Same as correspondence address.</td></tr>
						</table>
						</fieldset>
					</td>
					<td>
						<fieldset><legend>Address Merged Fields</legend>
							<table>
								<tr>
									<td>Correspondence:&nbsp;<input type="checkbox" id="mergec" name="mergec" onclick="correspond()">:Merge corr add fields
									<br><textarea id="addc" name="addc" rows="3" cols="30"></textarea>
									<br>Permanent:&nbsp;<input type="checkbox" id="mergep" name="mergep" onclick="permanent()">:Merge perm add fields
									<br><textarea id="addp" name="addp" rows="3" cols="30"></textarea>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td>
						<table>
							<tr>
								<td>
									<fieldset><legend>Other Details</legend>
										<table>
											<tr>
												<td>Blood Group:</td>
												<td><input type="text" id="bg" name="bg" size="5" ></td>
												<td>A/C No:</td>
												<td><input type="text" id="acno" name="acno" size="20"></td>
											</tr>
											<tr>
												<td>Bank name:</td>
												<td colspan="3"><input type="text" id="bankname" name="bankname" size="40"></td>
											</tr>
											<tr>
												<td>Branch:</td>
												<td colspan="3"><input type="text" id="bankbranch" name="bankbranch" size="40"></td>
											</tr>											
										</table>
									</fieldset>
								</td>
							</tr>
							<tr>
								<td>
									<fieldset><legend>Discontinuation/Leaving Details</legend>
										<table>
											<tr>
												<td><input type="checkbox" id="disc" name="disc" value="yes" onclick="checkdisc()">&nbsp;
												Discontinued date:</td><td><input type="text" id="ddate" name="ddate" size="10" value="disabled" disabled="disabled">
													
												</td>												
											</tr>
											<tr>
												<td align="right">Date of Leaving:</td><td><input type="text" id="ldate" name="ldate" size="10" disabled="disabled"></td>
											</tr>
										</table>
									</fieldset>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
				<tr>
				<td><fieldset><legend>Bus Facility</legend><table>
				<tr><td><table><tr><td><input type="radio" name="avail" id="byes" value="yes"  onclick="availability()"></td><td>Available</td></tr></table></td>
				<td><input type="radio" name="avail" id="bno"  value="no" checked="checked" onclick="availability()">Not Available</td></tr>
				<tr><td>Reg Date:</td><td><input type="text" size="30" name="bregdate" id="bregdate" disabled="disabled"></td></tr>
				<tr><td>Area:</td><td><select name="busarea" id="busarea" disabled="disabled">
				<option value="0">select area</option>
				</select></td></tr>
				<tr><td>Bus No:</td><td><select name="busno" id="busno" disabled="disabled"><option value="0">Select Bus</option>
				<option value="1">876</option>
				</select></td></tr>
				<tr><td>Cancel Date:</td><td><input type="text" size="30" name="bcdate" id="bcdate" disabled="disabled" onblur="busregcan()"></td></tr>
				</table></fieldset></td>
				<td colspan="2"><fieldset><legend>Accomodation Facility</legend><table>
				<tr><td><input type="radio" name="avail1" id="ayes" value="0"  onclick="checkavail()">Available</td><td><input type="radio" name="avail1" id="ano" value="1" checked="checked" onclick="checkavail()">Not Available</td></tr>
				<tr><td>Reg Date:</td><td><input type="text" size="30" name="accregdate" id="accregdate" disabled="disabled"></td></tr>
				<tr><td>Hostel Code:</td><td><select name="acchostelcode" id="acchostelcode" disabled="disabled"><option value="0">Select the hostel code</option></select></td></tr>
				<tr><td>Floor/Room No:</td><td><select name="accroomno" id="accroomno" disabled="disabled"><option value="0">floor no</option></select></td><td>Guardian:</td>
				<td><input type="text" name="guardian" id="guardian" disabled="disabled"/></td></tr>
				<tr><td>Phone:</td><td><input type="text" id="accphno" name="accphno" disabled="disabled"/></td>
				<td>Cancel Date:</td><td><input type="text" id="acccdate" name="acccdate" disabled="disabled"onblur="hostelregcan()"></td></tr>
				</table>
				
				</fieldset>
				
				</td>
				</tr>
				</table>
    </div>
        <div class="TabbedPanelsContent">
        
        <fieldset><legend >Qualification details </legend>									
<table cellpadding="5" align="center">
	<tr>
	   <th></th>
	   <th></th>
	   <th>Institution</th>
	   <th>Medium</th>
	   <th>Division</th>
	   <th>Percentage</th>
	   <th>Year</th>
    </tr>
    <tr>
     <td><input type="checkbox" name="ssc" id="ssc" value="on" onclick="checkssc()"/></td><td>SSC</td><td><input type="text" name="sscins" id="sscins" disabled="disabled"></td>
     <td><select name="sscmedium" id="sscmedium" disabled="disabled"><option value="0">select medium
          <option value="EM">English medium<option value="TM">Telugu Medium</td>
     <td><select name="sscdivision" id="sscdivision" disabled="disabled"><option value="0">select<option value="first">First
          <option value="second">Second<option value="third">Third</td>
      <td><input type="text" name="sscpercentage" id="sscpercentage" disabled="disabled"></td>
      <td><input type="text" name="sscyear" id="sscyear" disabled="disabled"></td>
    </tr>
    <tr>
     <td><input type="checkbox" name="inter" id="inter" value="on" onclick="checkinter()"></td><td>Intermediate</td><td><input type="text" name="interins" id="interins" disabled="disabled"></td>
     <td><select name="intermedium" id="intermedium" disabled="disabled"><option value="0">select medium
          <option value="EM">English medium<option value="TM">Telugu Medium</td>
     <td><select name="interdivision" id="interdivision" disabled="disabled"><option value="0">select<option value="first">First
          <option value="second">Second<option value="third">Third</td>
      <td><input type="text" name="interpercentage" id="interpercentage" disabled="disabled"></td>
      <td><input type="text" name="interyear" id="interyear" disabled="disabled"></td>
    </tr>
    <tr>
     <td><input type="checkbox" name="diploma" id="diploma" value="on" onclick="checkdiploma()"></td><td>diploma</td><td><input type="text" name="diplomains" id="diplomains" disabled="disabled"></td>
     <td><select name="diplomamedium" id="diplomamedium" disabled="disabled"><option value="0">select medium
          <option value="EM">English medium<option value="TM">Telugu Medium</td>
     <td><select name="diplomadivision" id="diplomadivision" disabled="disabled"><option value="0">select<option value="first">First
          <option value="second">Second<option value="third">Third</td>
      <td><input type="text" name="diplomapercentage" id="diplomapercentage" disabled="disabled"></td>
      <td><input type="text" name="diplomayear" id="diplomayear" disabled="disabled"></td>
    </tr>
    <tr>
     <td><input type="checkbox" name="degree" id="degree" value="on" onclick="checkdegree()"></td><td>degree</td><td><input type="text" name="degreeins" id="degreeins" disabled="disabled"></td>
     <td><select name="degreemedium" id="degreemedium" disabled="disabled"><option value="0">select medium
          <option value="EM">English medium<option value="TM">Telugu Medium</td>
     <td><select name="degreedivision" id="degreedivision" disabled="disabled"><option value="0">select<option value="first">First
          <option value="second">Second<option value="third">Third</td>
      <td><input type="text" name="degreepercentage" id="degreepercentage" disabled="disabled"></td>
      <td><input type="text" name="degreeyear" id="degreeyear" disabled="disabled"></td>
    </tr>
    <tr>
     <td><input type="checkbox" name="ug" id="ug"  value="on" onclick="checkug()"></td><td>Under Graduate</td><td><input type="text" name="ugins" id="ugins" disabled="disabled"></td>
     <td><select name="ugmedium" id="ugmedium" disabled="disabled"><option value="0">select medium
          <option value="EM">English medium<option value="TM">Telugu Medium</td>
     <td><select name="ugdivision" id="ugdivision" disabled="disabled"><option value="0">select<option value="first">First
          <option value="second">Second<option value="third">Third</td>
      <td><input type="text" name="ugpercentage" id="ugpercentage" disabled="disabled"></td>
      <td><input type="text" name="ugyear" id="ugyear" disabled="disabled"></td>
    </tr>
</table>
</fieldset>
<br>
  <fieldset>
  <legend>Details of certificates submitted</legend>
   <table cellpadding="5" align="center">
       <tr><td><input type="checkbox" name="dob_certificate" id="dob_certificate" value="on"></td><td>DOB certificate</td>
       <td><input type="checkbox" name="hallticket_eei" id="hallticket_eei"></td><td>Hall ticket(EAMCET/ECET/ICET)</td>
       <td><input type="checkbox" name="mom" id="mom"></td><td>Memorandum of marks in Intermediate</td></tr>
       <tr><td><input type="checkbox" name="rankcard" id="rankcard"></td><td>Rank Card(EAMCET/ECET/ICET)</td>
       <td><input type="checkbox" name="ssc_certificate" id="ssc_certificate"></td><td>SSC</td>
       <td><input type="checkbox" name="study_certificate" id="study_certificate"></td><td>Study/Bonafied Certificate</td></tr>
       <tr>
       <td><input type="checkbox" name="caste_certificate" id="caste_certificate"></td><td>Caste certificate</td>
       <td><input type="checkbox" name="tc" id="tc"></td><td>Transfer certificate</td>
       </tr>
   </table>
  </fieldset>  
  <br>
 </div>

  </div>
</div>
<center>
			  <input  type="submit" value="New"/>
			  <input  type="button" value="Save" />
			  <input   type="button" value="quit" onclick="window.close()"/>
			</center>
</form>




<script type="text/javascript">
<!--
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
//-->
</script>
</body>
</html>
