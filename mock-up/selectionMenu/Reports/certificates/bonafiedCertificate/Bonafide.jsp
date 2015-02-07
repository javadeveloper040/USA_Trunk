<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bonafied Certificate</title>
</head>
<body onload="window.resizeTo(750,630)">
<% String name=request.getParameter("student");
String parent=request.getParameter("parent");
String purpose=request.getParameter("purpose");
String branch=request.getParameter("branch");
String year=request.getParameter("year");
String sem=request.getParameter("sem");
String reg=request.getParameter("roll");


%>
<div id="study"><table border="2" style="border-color:black"><tr><td>
<table >
<tr><td align="center"><B>SRI VASAVI ENGINEERING COLLEGE</B></td></tr>
<tr><td align="center">(Approved by AICTE,New Delhi & Affliated to JNTU, Kakinada)</td></tr>
<tr><td align="center">PEDATADEPALLI, TADEPALLIGUDEM - 534 101, W.G.DIST, (A.P)</td></tr>
<tr><td align="center">Telephone : 08818-284355,284322</td></tr>
<tr><td ALIGN="CENTER"><img src="logo.jpg" height="70" width="70"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td align="center"><b><I><u>STUDY CUM COURSE COMPLETION CERTIFICATE</u></I></b></td></tr>


<tr><td>&nbsp;</td></tr>
<tr><td align="right"><pre>This    is   to   certify    that <b>Mr. <%=name%></b></pre></td></tr>
<tr><td align="center"><pre>S/O <b><%=parent%></b>   with  RegdNo.<b><%=reg%></b> is  a  bonafide  student  of  this</pre></td></tr>
<tr><td align="left"><pre>institution,   during <%=year%> and has complected four years B.TECH Degree Course  </pre></td></tr>
<tr><td align="LEFT"><pre>in <%=branch%></pre></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td ALIGN="LEFT"><PRE><B><I>Office Seal</I>   </B>                                                      <B>PRINCIPAL</B></PRE></td></tr>
<tr><td></td></tr>

</table>
</td></tr></table>

</div>
<br/>
<br/>
<center>
<input type="button" value="Print Certificate" onclick="window.print(study)">&nbsp;<input type="button" value="  QUIT  " onclick="window.close()">
</center>
</body>
</html>