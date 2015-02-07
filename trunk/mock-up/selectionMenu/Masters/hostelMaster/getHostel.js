function getHost(hostel_name)
{
	
  var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse(req);
  							};
  req.open("GET","getHostelMaster.jsp?hostel_name="+hostel_name,true);
  req.send(null);
}
function home() {
	window.navigate("http://localhost:8089/Masters/menu.html");
}
function handleResponse(req)
{ 

 if(req.readyState==4)
 {
var s=req.responseText;
var p=s.split("$");
document.form1.hostel_code.value=p[0];
document.form1.hostel_name.value=p[1];
document.form1.new_admn_fee.value=p[2];
document.form1.old_admn_fee.value=p[3];

p=null;
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
  return(null);
} 
function delHos() {
var hostel_name=document.form1.hostel_name.value;
window.navigate("delHostelMaster.jsp?hostel_name="+hostel_name);
}
function val() {
	var a1=document.form1.hostel_code.value;
	var a2=document.form1.hostel_name.value;
	var a3=document.form1.new_admn_fee.value;
	if(a1=="" || a2=="" || a3=="" ) {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function gotorooms() {
window.navigate("./roomdetails.jsp?hostel_code="+document.form1.hostel_code.value);
}