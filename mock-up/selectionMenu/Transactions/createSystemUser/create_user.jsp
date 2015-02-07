<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>Create System User</title>
<script language="javascript" src="check_id.js">

 </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body bgcolor="skyblue">
<fieldset>
<legend><b>CREATE SYSTEM USERS</b></legend>
<form action="./check_user.jsp" method="post">
<table cellpadding="5" border=0><tr><td>
Enter User id:</td><td><input type="text" name="user_id" id="user_id" size="40" onblur="get()"></td></tr>
<tr><td>
Enter Password:</td><td><input type="password" name="password" id="password" size="40" ></td></tr>
<tr><td>
Retype Password:</td><td><input type="password" name="password1" id="password1" size="40" onblur="checkPwd()"></td></tr>
<tr><td>
Select Access privilege :</td><td>
<select name="cat" id="cat" ><option value="select">select</option><option value="deo">DATA ENTRY OPERATOR</option>
<option value="clerk">CLERK</option>
<option value="cashier">CASHIER</option>
</select>
</td>
</tr>
<tr><td colspan="2" align="center"><input type="submit" value="CREATE USER" >&nbsp;&nbsp;&nbsp;<input type="reset" value="     CLEAR     ">
&nbsp;&nbsp;&nbsp;<input type="button" value="      QUIT      " onclick="window.close()"></td></tr>
<TR><th colspan="2"><b><p id="check"></p></b></th>
</TR>
</table>
</form>
</fieldset>
</body>
</html>