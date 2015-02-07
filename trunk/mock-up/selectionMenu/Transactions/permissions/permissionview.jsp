<html>
<head>
<title>Permission View</title>
<link rel="stylesheet" href="../../sheet1.css">
</head>
<body bgcolor="skyblue">
<br>
<h3>Permission Details to <%=session.getAttribute("roll") %></h3>
<fieldset><legend>Permission Details</legend>
<table align="center" border="2" width="100%">
<tr><th>Rollno:</th><td><%=session.getAttribute("roll") %></td></tr>
<tr><th>Permission For:</th><td><%=session.getAttribute("per") %></td></tr>
<tr><th>TargerDate:</th><td><%=session.getAttribute("date") %></td></tr>
<tr><th>Ammount To Be Paid :</th><td><%=session.getAttribute("amo") %></td></tr>
<tr><th>No of Installments:</th><td><%=session.getAttribute("ins") %></td></tr>
<tr><th>Permission Given By:</th><td><%=session.getAttribute("per1") %></td></tr>
</table>
</fieldset>
<br>
<center>
<input type="button" value="  Quit  " onclick="window.close()">
</center>
</body>
</html>