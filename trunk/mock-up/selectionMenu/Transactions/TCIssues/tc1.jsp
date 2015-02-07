<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,javax.servlet.*,javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TC issue</title>
<script language="javascript">
function fun()
{
	window.resizeTo(800,720);
}
</script>
</head>
<body onload="fun()">
<%!HttpSession sess;
String serial=null;
%>
<%serial=session.getAttribute("serial").toString(); %>
<div id="tc">
<table><tr><td>
<table width="650" align="center">
<tr><td><img src="logo.jpg" width="80" height="80"></td><td>&nbsp;</td><td align="center"><B>SRI VASAVI ENGINEERING COLLEGE</B><br/>
(Approved by AICTE,New Delhi & Affliated to JNTU, Kakinada)<br/>PEDATADEPALLI, TADEPALLIGUDEM - 534 101, W.G.DIST, (A.P)</td></tr>
</table>
<table width="650" align="center"><tr><td align="center"><u>TRANSFER CERTIFICATE</u></td></tr></table>
<br/>
<br/>

<table width="700" align="center"><tr><td>S.No:<%=serial%></td><td>Admission No:</td><td>Roll No:</td></tr></table>
<br/>
<table align="center" width="700">
<tr><th align="left" width="10">1</th><td width="320" align="left">Name of the Student</td><td width="370">:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">2</th><td>Name of the Parent/Guardian</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">3</th><td>Nationality and religion</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">4</th><td>Sex</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">5</th><td>Date of birth( in words)<br/>( as entered in the admission register)</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">6</th><td>whether the candidate belongs to <br/> SC/ST or BC(if so, state caste and group)</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">7</th><td>Class and branch in which the student<br/>was studying at the time of leaving</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

<tr><th align="left">8</th><td>Date on which student was<br/> admitted in college</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>

<tr><th align="left">9</th><td>Date on which the student had left the colege</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">10</th><td>Whether qualified for promotion to another class</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">11</th><td>whether the student had paid all fees</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">12</th><td>a) Date on which the application for TC was<br/>made by parent/guardian<br/><br/>b)Date on TC issued</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">13</th><td>Reason for giving TC</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">14</th><td>Conduct and character of the student</td><td>:</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><th align="left">15</th><td>General remarks</td><td>:</td></tr>
</table>
<br/>
<br/>
<table width="700"><tr><td>prepared by</td><td>verified by</td><td>Principal</td></tr></table>
</td></tr></table><br/><br/>
</div>
<table width="100%">
<tr>
<th><input type="button" value=" Print " onclick="window.print(tc)"></th>
<th><input type="button" value="   Quit   " onclick="window.close()" /></th>
</tr>
</table>
</body>
</html>