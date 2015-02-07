
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bus Pass ID</title>
</head>
<body onload="window.resizeTo(500,380)">
<%
String name=request.getParameter("student");
String roll=request.getParameter("roll");
String from=request.getParameter("from");
String course=request.getParameter("branch");
String to=request.getParameter("to");
String validity=request.getParameter("validity");
String sem=request.getParameter("sem");
String path="../../../images/"+roll+".jpg";

%>

<body>
<table border="2" style="border-color:black"><tr><td>
<table>
<tr><td colspan="4"><img src="BUSPASSHEAD.jpg" width="420" height="70"></td></tr>
<tr><td rowspan="7"><img src="<%=path%>" width="80" height="100"></td></tr>
<tr><th align="left">Name:</th><td align="left"><%=name%></td></tr>
<tr><th align="left">Course:</th><td align="left"><%=course%></td></tr>
<tr><th align="left">Rollno:</th><td align="left"><%=roll%></td></tr>
<tr><th align="left">S.E.M:</th><td align="left"><%=sem%></td></tr>
<tr><th align="left"> Between:</th><td><%=from%> --- <%=to%></td></tr>
<tr><th align="left">Valid Until:</th><td ><%=validity%></td></tr>
</table>
</td></tr></table>
<br/>
<center><input type="button" value="  Print  " onclick="window.print()">&nbsp;&nbsp;&nbsp;
<input type="button" value="  Quit  " onclick="window.close()">
</center>
</body>
</html>
