<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./stylesheet/sheet1.css">
<link rel="shortcut icon" href="./images/mis.ico" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WELCOME TO UNIVERSITY ADVANCE MANAGEMENT SYSTEM</title>
<script language="javascript" src="js/login.js">
</script>
</head>
<body onload="disableback()" oncontextmenu="return false" >
<br>
<marquee bgcolor="skyblue" behavior="scroll">
<h1>Welcome to University  Advance Management  System</h1>
</marquee><br>
<table width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		     <td colspan="3"> 
		      <div align="center">
				  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="320" height="200">
		          <param name=movie value="banner.swf">
		          <param name=quality value=high>
		          <embed src="images/banner.swf" quality=high pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="414" height="80">
		          </embed> 
		          </object>
		       </div>
		    </td>
		  </tr>
		</table>
		<br>
<fieldset><legend><b>Login</b></legend><br><br>
<form action="./check_login.jsp" method="post">
<table align="center" border=0>
<tr>
<th>Login ID:</th><td><input type="text" name="login_id" id="login_id"></td>
</tr>
<tr>
<th>Password:</th><td><input type="password" name="password" id="password"></td>
</tr>
<tr>
<td align="center" colspan="2">
<input type="submit" value="Log in" onclick="return fun()">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="Cancel"></td>
</tr>
<tr><td colspan="2" align="center"><br><p id="err"></p></td>
</tr>
</table>
</form>
</fieldset>
<br/><br/><br/>
<center>This site is best viewed in Internet Explorer 6 at 1012x720 resolution.</center>
<p align="center" style="height:16px;background-color:skyblue">Copyright &copy; 2015 <span title="">Team</span></p>
</body>
</html>