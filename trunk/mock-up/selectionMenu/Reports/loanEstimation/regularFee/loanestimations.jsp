<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<html>
<head>
<title>Loan Estimation</title>
</head>
<body onload="window.resizeTo(800,700)">
<% String name=request.getParameter("student");
String parent=request.getParameter("parent");
String path=request.getParameter("path");
int ifee=Integer.parseInt(request.getParameter("if"));
String branch=request.getParameter("branch");
int ef=Integer.parseInt(request.getParameter("ef"));
String sem=request.getParameter("sem");
String reg=request.getParameter("roll");
int eb=Integer.parseInt(request.getParameter("eb"));
int st=Integer.parseInt(request.getParameter("st"));
int eq=Integer.parseInt(request.getParameter("eq"));
Date date=new java.util.Date();
String d=date.getDate()+"/"+(date.getMonth()+1)+"/"+(date.getYear()+1900);
%>
<div id="le">
<table border="2" style="border-color:black">
<tr><td>
<table border=0>
<tr><td align="center" colspan="2"><B>SRI VASAVI ENGINEERING COLLEGE</B></td></tr>
<tr><td align="center" colspan="2">(Approved by AICTE,New Delhi & Affliated to JNTU, Kakinada)</td></tr>
<tr><td align="center" colspan="2">PEDATADEPALLI, TADEPALLIGUDEM - 534 101, W.G.DIST, (A.P)</td></tr>
<tr><td align="center" colspan="2">Telephone : 08818-284355,284322</td></tr>
<tr><td ALIGN="CENTER" colspan="2"><img src="logo.jpg" width="70" height="70"></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="center" colspan="2"><b><I><u>LOAN ESTIMATION REPORT</u></I></b></td></tr>
<tr><td align="right" colspan="2">Date:<%=d%></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="right" colspan="2"><pre>This    is   to   certify    that  <b>Mr/Miss.  <%=name%> </b></pre></td></tr>
<tr><td align="center" colspan="2"><pre>S/o/D/o  <b><%=parent%></b>   with  RegdNo.  <b><%=reg%></b> is  a  bonafide  student  of  this</pre></td></tr>
<tr><td align="left" colspan="2"><pre>institution, studying   <b><%=sem%></b> semester  in  <b><%=branch%></b> and this certificate</pre></td></tr>
<tr><td align="center" colspan="2"><pre>is  being generated on  his  request to  enable  him  to apply  for necessary  bank  loan</pre></td></tr>
<tr><td align="center" colspan="2"><pre>and   hereby  we  solemnly  declare  that  his  behaviour  is  good  as  a   student .</pre></td></tr>
<tr><td align="right" colspan="2"><pre> Estimated report regarding academic expenses of Mr/Miss.<%=name%> </pre></td></tr>
<tr><td align="left">Total Institution Fee:</td><td align="left"><%=ifee%>Rs/-</td></tr>
<tr><td align="left">Total Examination Fee:</td ><td align="left"><%=ef%>Rs/-</td></tr>
<tr><td align="left">Essential Books:</td ><td align="left"><%=eb%>Rs/-</td></tr>
<tr><td align="left">Stationary:</td ><td align="left"><%=st%>Rs/-</td></tr>
<tr><td align="left">Equipment:</td ><td align="left"><%=eq%>Rs/-</td></tr>
<tr><td align="left">And A Total Of Rupees:</td ><td align="left"><%=(ifee+ef+eb+st+eq)%>Rs/-</td></tr>
<tr><td align="right"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td ALIGN="LEFT"><PRE><B><I>Office Seal</I>   </B>                                                  <B>PRINCIPAL</B></PRE></td></tr>
<tr><td ALIGN="CENTER"></td></tr>

</table>
</td></tr></table>

</div>
<center><br/><br/>
<input type="button" value="PRINT DOCUMENT" onclick="window.print(le)">
&nbsp;&nbsp;&nbsp;<input type="button" value="        QUIT         " onclick="window.close()">
</center>
</body>



</html>