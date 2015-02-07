function getRequestObject(){

	if(window.XMLHttpRequest){
		return(new XMLHttpRequest());
	}else if(window.ActiveXObject){
		return(new ActiveXObject("Microsoft.XMLHTTP"));
	}
	else{
		return(null);
	}
}

function getDetails(){
	
	var rollnumber=document.getElementById("roll_num").value;
	
	var rollno="rollno="+rollnumber;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponse1(request)};
	request.open("POST","ifeedetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(rollno);
}
	


function handleResponse1(request){
	
	if(request.readyState==4){
	
		a=request.responseText;
	
		a1=String(a);
		a2=a1.split("$");
		document.form1.branch.value=a2[1];
		document.form1.sem.value=a2[2];
		document.form1.student.value=a2[3];
		document.form1.parent.value=a2[4];
		document.form1.pick.src=a2[5];
		document.getElementById("getFocus").focus();
		
	}		
}

function fillTable(){
	
	var rollnumber=document.getElementById("roll_num").value;

	
	
	

	request=getRequestObject();
	var tosend="roll_num="+rollnumber;
	request.onreadystatechange=function(){ handleResponsefillTable(request)};
	request.open("POST","IfeedetailsModify.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(tosend);
}	
function handleResponsefillTable(request){
	if(request.readyState==4){
		var res=request.responseText;
		
		document.getElementById("fills").innerHTML=res;
		
	}		
}

function fun(){

var r=document.getElementById("nag").selectedIndex;

}

