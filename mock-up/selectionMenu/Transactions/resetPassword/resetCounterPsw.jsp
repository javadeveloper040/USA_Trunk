<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Counter Password</title>
</head>
<body bgcolor="skyblue" oncontextmenu="return false">
<form action="./checkcounterpsw.jsp">
<fieldset>
<legend align="center"><b>Change System User Password</b></legend>
<table cellpadding="5" align="center" width="100%">
<tr>
<th align="right">User Id</th>
<td><input type="text" name="user_id" id="user_id"></td>
</tr>
<tr>
<th align="right">Old Password</th>
<td><input type="password" name="psw" id="psw"></td>
</tr>
<tr>
<th align="right">New Password</th>
<td><input type="password" name="psw1" id="psw1"></td>
</tr>
<tr>
<th align="right">Retype Password</th>
<td><input type="password" name="psw2" id="psw2"></td>
</tr>
<tr>
<th colspan="2"><input type="submit" value="Change">&nbsp;&nbsp;&nbsp;
<input type="reset" value="Cancel">&nbsp;&nbsp;&nbsp;
<input type="button" value="    Quit    " onclick="window.close()">
</th>
</tr>
</table>
</fieldset>
</form>
</body>
</html>