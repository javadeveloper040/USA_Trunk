var proceed="no"
function checkPwds(){
	var pwd=document.getElementById("new").value;
	var pwdagain=document.getElementById("newagain").value;
	if(pwd!=pwdagain){		
		alert("password not matched");
		proceed="no";
	}else proceed="yes";
	 
}
function checkincharge(){
	var incharge=document.getElementById("incharge_name").value;
	if(incharge==""){	
		alert("incharge name should not be empty");
		document.getElementById("incharge_name").focus();
		proceed="no";
	}else proceed="yes";
}
function check(){
	if(proceed=="yes")
		return true;
	else
		return false;
}