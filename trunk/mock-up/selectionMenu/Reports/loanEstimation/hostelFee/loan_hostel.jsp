<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<html>
<head>
<title>Loan Estimation</title>
</head>
<body onload="window.resizeTo(780,730)">
<% String name=request.getParameter("student");
String parent=request.getParameter("parent");
int rr=Integer.parseInt(request.getParameter("rr"));
String branch=request.getParameter("branch");
int mb=Integer.parseInt(request.getParameter("mb"));
String sem=request.getParameter("sem");
String reg=request.getParameter("roll");

Date date=new java.util.Date();
String d=date.getDate()+"/"+(date.getMonth()+1)+"/"+(date.getYear()+1900);
%>
<div id="le">
<table border="2" style="border-color:black"><tr><td>
<table >
<tr><td align="center" colspan="2"><B>SRI VASAVI ENGINEERING COLLEGE</B></td></tr>
<tr><td align="center" colspan="2">(Approved by AICTE,New Delhi & Affliated to JNTU, Kakinada)</td></tr>
<tr><td align="center" colspan="2">PEDATADEPALLI, TADEPALLIGUDEM - 534 101, W.G.DIST, (A.P)</td></tr>
<tr><td align="center" colspan="2">Telephone : 08818-284355,284322</td></tr>
<tr><td ALIGN="CENTER" colspan="2"><img src="logo.jpg" width="70" height="70"></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="center" colspan="2"><b><I><u> HOSTEL LOAN ESTIMATION REPORT</u></I></b></td></tr>

<tr><td align="right" colspan="2">Date:<%=d%></td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr><td align="right" colspan="2"><pre>This    is   to   certify    that  <b>Mr/Miss.  <%=name%> </b></pre></td></tr>
<tr><td align="center" colspan="2"><pre>S/o/D/o  <b><%=parent%></b>   with  RegdNo.  <b><%=reg%></b> is  a  bonafide  student  of  this</pre></td></tr>
<tr><td align="left" colspan="2"><pre>institution, studying   <b><%=sem%></b> semester  in  <b><%=branch%></b> and this certificate</pre></td></tr>
<tr><td align="center" colspan="2"><pre>is  being generated on  his  request to  enable  him  to apply  for necessary  bank  loan</pre></td></tr>
<tr><td align="center" colspan="2"><pre>and   hereby  we  solemnly  declare  that  his  behaviour  is  good  as  a   student .</pre></td></tr>


<tr><td align="right" colspan="2"><pre> Estimated report regarding HOSTEL expenses of Mr/Miss.<%=name%> </pre></td></tr>




<tr><td align="left">Room Rent:</td ><td align="left"><%=rr%>Rs/-</td></tr>
<tr><td align="left">Mess Bill:</td ><td align="left"><%=mb%>Rs/-</td></tr>
<tr><td align="left">And A Total Of Rupees:</td ><td align="left"><%=(rr+mb)%>Rs/-</td></tr>
<tr><td align="right"></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td ALIGN="LEFT"><PRE><B><I>Office Seal</I>   </B>                                                 <B>PRINCIPAL</B></PRE></td></tr>
<tr><td ALIGN="CENTER"></td></tr>

</table>
</td></tr></table>

</div>
<center>
<input type="button" value="PRINT DOCUMENT" onclick="window.print(le)">
&nbsp;&nbsp;&nbsp;<input type="button" value="        QUIT         " onclick="window.close()">
</center>







</body>



</html>