<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Counter Password</title>
<script src="script.js " type="text/javascript"></script>
</head>
<body bgcolor="skyblue">
<form action="Check.jsp" onsubmit="return check()">
<center>
<fieldset>
<legend align="center"><b>Reset Counter Incharge Password</b></legend>
<table width="100%" cellpadding="5">
<tr><th>Incharge Name:</th><td> <input type="text" name="incharge_name" id="incharge_name" title="enter incharge name" onblur="checkincharge()"></td></tr>
<tr><th>Old Password:</th><td> <input type="password" name="old" title="enter old password"></td></tr>
<tr> <th>New Password:</th> <td> <input type="password" name="new" id="new" title="enter new password"></td> </tr>
<tr> <th>Retype Password:</th><td> <input type="password" id="newagain" name="newagain" title="enter newpasword again" onblur="checkPwds()"></td></tr>
<tr><th colspan="2"><input type="submit" value="Update">&nbsp;&nbsp;&nbsp;
<input type="reset" value="Cancel">&nbsp;&nbsp;&nbsp;<input type="button" value="    Quit    " onclick="window.close()"></th></tr>
</table>
</fieldset>
</center>
</form>
</body>
</html>