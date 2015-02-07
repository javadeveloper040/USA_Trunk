
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" href="../../sheet1.css">

   <title>Delete Permissions</title>
   <script type="text/javascript">
    function check()
    {
    var roll=document.getElementById("roll_num").value;
    if(roll=="")
    {
    alert("enter the roll number");
     return false;
    }
    }
    function getRequestObject()
{
if(window.XMLHttpRequest)
	{
	return(new XMLHttpRequest());
	}
else if(window.ActiveXObject)
	{
	return(new ActiveXObject("Microsoft.XMLHTTP"));
	}
else
	{
	return(null);
	}
}
function check()
{
var rollno=document.getElementById("rollno").value;
   	var request=getRequestObject();
	request.onreadystatechange=function(){handleResponse(request);};
	request.open("GET","view_permission_display.jsp?rollno="+rollno,true);
	request.send(null);     
}
function handleResponse(request)
{
	if(request.readystate==4){
	var s=request.responseText;
	if(s=="abc"){
	p1.innerText="SORRY ENTERED ID HAS NO PERMISSIONS"
	document.getElementById("sem").innerText="";
	document.getElementById("branch").innerText="";
	document.getElementById("sname").innerText="";
	document.getElementById("pname").innerText="";
	document.getElementById("permfor").innerText="";
	document.getElementById("tardat").innerText="";
	document.getElementById("amnt").innerText="";
	document.getElementById("ins").innerText="";
	document.getElementById("pergvnny").innerText="";
}
	else{
	p1.innerText="";
	document.getElementById("data").style.visibility="visible";
	a1=String(s);
		x=a1.split('$');
	document.getElementById("sem").innerText=x[0];
	document.getElementById("branch").innerText=x[2];
	document.getElementById("sname").innerText=x[3];
	document.getElementById("pname").innerText=x[1];
	document.getElementById("permfor").innerText=x[4];
	document.getElementById("tardat").innerText=x[5];
	document.getElementById("amnt").innerText=x[6];
	document.getElementById("ins").innerText=x[7];
	document.getElementById("pergvnny").innerText=x[8];
	}}
}
  </script>
  </head>  
  <body bgcolor="skyblue">
  <form name="f1" action="./permissiondeldata.jsp">
  <fieldset><legend>View permissions</legend>
    <table id="tb1" align="center">
       <tr><td>Roll no:</td><td><input type="text" name="rollno" id="rollno" title="enter roll number"></td><td><p id="p1"></p></td></tr>
       <tr><td colspan="2"><center><input type="button" value="   View   " onclick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Delete">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="  Quit  " onclick="window.close()"></center></td></tr> 
   </table>
   </fieldset>
   <br>
   <div id="data" style="visibility:hidden">
   <fieldset><legend>Permission details</legend>
   <table id="tb2" border="1" align="center" width="100%">
       <tr><th align="left">Branch</th><td align="center"><p id="branch" ></p></td></tr>
       <tr><th align="left">Semester:</th><td align="center"><p id="sem" ></p></td></tr>
       <tr><th align="left">Student name:</th><td align="center"><p id="sname" ></p></td></tr>
       <tr><th align="left">Parent name:</th><td align="center"><p id="pname"></p></td></tr>
       <tr><th align="left">Permission for:</th><td align="center"><p id="permfor"></p></td></tr>
       <tr><th align="left">Target date:</th><td align="center"><p id="tardat"></p></td></tr>
       <tr><th align="left">Amount:</th><td align="center"><p id="amnt"></p></td></tr>
       <tr><th align="left">Number of instalments:</th><td align="center"><p id="ins"></p></td></tr>
       <tr><th align="left">Permissions given by:</th><td align="center"><p id="pergvnny"></p></td></tr>
   </table>
   </fieldset>
   </div>
   <br/><br/><br/>
<center>

</center>
  </form>
  </body>
</HTML>
