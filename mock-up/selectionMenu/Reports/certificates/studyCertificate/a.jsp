<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script language="javascript" src="script.js">

 </script>
</head>
<body BGCOLOR="SKYBLUE">


<form action="StudyCerficate.jsp" method="get"><table><tr><td>
<fieldset><legend>Study Certificate</legend>
<table height="100" width="100"> 
        
        <tr><th>Regd.No:</th><td><input type="text" id="roll" name="roll" size="15" onblur="get()"></td><td rowspan="3"><img id="photo" style="visibility:visible" src="" height="140" width="110"></img></td></tr>
        <tr><th>Branch:</th><td><input type="text" id="branch" name="branch" size="15"></td></tr>
        <tr><th>Sem:</th><td><input type="text" id="sem" name="sem" size="15"></td></tr>
        <tr><th>Student:</th><td colspan="2"><input type="text" id="student" name="student" size="40"></td></tr>
        <tr><th>Parent:</th><td colspan="2"><input type="text" id="parent" name="parent" size="40"></td></tr>
        <tr><th>Purpose:</th><td colspan="2"><input type="text" id="purpose" name="purpose" size="40" disabled></td></tr>
        <tr><th>Between:</th><td colspan="2"><input type="text" id="year" name="year" size="20">Eg:(2009-2010)</td></tr>
        <tr><td colspan="3" align="right"><input type="submit" value="VIEW"><input type="button" value="QUIT" onclick="window.close()"></td></tr>





</table>
</fieldset>
</td>
</tr>
</table>





</form>

</body>
</html>