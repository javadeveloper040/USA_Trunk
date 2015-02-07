function getAcc(account_name)
{
  var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse(req);
  							};
  req.open("GET","./getAccount.jsp?account_name="+account_name,true);
  req.send(null);
}

function viewAcc() {

	var v=document.form1.accountcode.value;
	var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse(req);
  							};
  req.open("GET","./viewAccount.jsp?account_code="+v,true);
  req.send(null);
}
function handleResponse(req)
{ 

 if(req.readyState==4)
 {
	var s=req.responseText;
	var p=s.split("$");
		document.form1.accountcode.value=p[0];
		document.form1.accname.value=p[1];
		document.form1.bankname.value=p[2];
		document.form1.bankaddress.value=p[3];
		document.form1.accnumber.value=p[4];
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
function delAcc() {
var account_name=document.form1.accname.value;
var account_code=document.form1.accountcode.value;
window.navigate("./delAccount.jsp?account_name="+account_name+"&account_code="+account_code);
}
function val() {
	var a1=document.form1.accountcode.value;
	var a2=document.form1.accname.value;
	var a3=document.form1.bankname.value;
	var a4=document.form1.bankaddress.value;
	var a5=document.form1.accnumber.value;
	if(a1=="" || a2=="" || a3=="" ||a4=="" || a5=="") {
		alert("Please fill all the fields..");
		return false;
	}
	return true;
}
