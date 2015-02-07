function checkPwd(){
	var pwd=document.getElementById("password").value;
	var pwd1=document.getElementById("password1").value;
	if(pwd!=pwd1){
	alert("passwords do not match");
		document.getElementById("password1").value="";
		document.getElementById("password").select();		
	}
}
function cH()
{
 var cname=document.getElementById('counter_name').value;
 var loc=document.getElementById('location').value;
 var id=document.getElementById('incharge_id').value;
 var psw1=document.getElementById('password').value;
 var psw2=document.getElementById('password1').value;
 if((cname=="")||(loc=="")||(id=="")||(psw1=="")||(psw2==""))
 {
   alert("Please fill all the fields");
 }
 else if(psw1!=psw2)
 {
  alert("Passwords do not match");
 }
 else
 {
   return true;
 }
 return false;
}
function get()
{

var uid=document.getElementById("user_id").value;
if(uid=="")
{
	alert("enter any userid");
	document.getElementById("user_id").focus();
}
else
{
var req=getRequestObject();
req.onreadystatechange=function(){handleResponse(req);}
req.open("get","check_db.jsp?uid="+uid,true);
req.send(null);
}
}
function handleResponse(req)
{
if(req.readyState==4)
{
var s=req.responseText;
document.getElementById("check").innerHTML=s;
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

