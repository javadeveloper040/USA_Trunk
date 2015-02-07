<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Individual Fee Table New or Modify</title>
<script src="scriptForModify.js" type="text/javascript">
</script>
</head>

	
<body bgcolor="skyblue" >
<form name="form1"  >
<table cellpadding="10" cellspacing="10" align="center"><tr><td>
<fieldset><legend><b>Student Details</b></legend>
<table cellpadding="7" >
	<tr><th>Roll No:</th>
		<td><input name="roll_num" id="roll_num" type="text" size="10" maxlength="10" title="enter rollnumber" onblur="getDetails()"/>
		</td>
		<th>Branch:</th>
			<td><input name="branch" type="text"  size="5" maxlength="5"  /></td>
		<th>Sem:</th>
		<td><input name="sem" type="text"  size="7" maxlength="5"   /></td></tr>
	<tr><th>Student:</th>
		<td colspan="5"><input name="student" type="text"  size="50" maxlength="50" style="width:100%"  /></td></tr>
	<tr><th>Parent:</th>
		<td colspan="5"><input name="parent" type="text"  size="50" maxlength="50" style="width:100%"  /></td></tr></table></fieldset></td>
		<td><img src="" width="130" height="130" name="pick"/></td></tr>

	<tr><td>
		 <center>
  				<input type="button" value="  Modify  " onclick="fillTable()" id="getFocus"/> &nbsp;
  			<input name="quit" value="     Quit       " type="button"  onclick="window.close()"/>
			</center>
		 
		<span id="fills" ></span> 	</td></tr></table>
</form>


</body>
</html>




