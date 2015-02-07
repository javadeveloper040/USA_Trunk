function checkAll(){
var bn=document.getElementById("branch").value;
	var rno=document.getElementById("roll").value;
	
	if((rno=="")||(bn=="error")){
		document.getElementById("branch").value="";
		return false;
	}
	else if((rno.length!=10)||(bn=="error"))
	{document.getElementById("branch").value="";
		return false;
		}
	else {
	return true;
	}
	return false;
}

function get()
{
var rno=document.getElementById("roll").value;

var req=getRequestObject();

req.onreadystatechange=function(){handleResponse(req);}
req.open("get","id_db.jsp?rollno="+rno,true);
req.send(null);
}
function handleResponse(req)
{
if(req.readyState==4)
{
var s=req.responseText;
var x=s.split("$");

document.getElementById("student").value=x[0];
document.getElementById("branch").value=x[1];
document.getElementById("sem").value=x[2];
document.getElementById("db").value=x[3];
document.getElementById("photo").src=x[4];
document.getElementById("path").value=x[4];

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