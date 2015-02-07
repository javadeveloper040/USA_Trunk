<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../sheet1.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="student_qualification.js" language="javascript">

</script>

</head>
<body bgcolor="skyblue">
<form name="studentmaster" action="student_qualification_insert.jsp" method="post" onsubmit="return val()">
<center>
<%
String rollno=session.getAttribute("rollno").toString();
%>
<b>RollNO:</b>&nbsp;&nbsp;<input type="text" name="rollno" id="rollno"  value=<%=rollno%> readonly="readonly">
</center>
<br>
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
<center>
			  <input  type="submit" value="Save"/>
			  <input   type="button" value="Quit"/>
			</center>
			</form>
</body>
</html>