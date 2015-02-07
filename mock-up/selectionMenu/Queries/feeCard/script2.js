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
function getAvailable(){

	var acccode=document.getElementById("accountcode").value;
	var accode="accode="+acccode;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponse(request)};
	request.open("POST","accountcheckblur.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(accode);
}	

function getAvailable1(){
	
	var accselected=document.getElementById("acclist").value;
	
	var acselected="accselected="+accselected;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponse(request)};
	request.open("POST","accountcheckclick.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(acselected);
	}
var ok=0;
function getDetails(){
	
	var rollnumber=document.getElementById("roll_num").value;
	var len=rollnumber.length;

	if(len<10){ok=0;
	alert("enter no correct number");
	}else{ok=1;
	var rollno="rollno="+rollnumber;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponseIfee(request)};
	request.open("POST","ifeedetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(rollno);
	}
}
function getFee(){

	var ac_year=document.getElementById("name").value;

	var roll_num=document.getElementById("roll_num").value;

	var a_year="academic_year="+ac_year+"&roll_num="+roll_num;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponseFee(request)};
	request.open("POST","FeeCheck.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(a_year);
}	


function handleResponseIfee(request){

	if(request.readyState==4){
	
		a=request.responseText;

		a1=String(a);
		a2=a1.split("*");
		a3=a2[0].split("$");
		a4=a2[1].split("$");	
		document.form1.branch.value=a3[1];
		document.form1.sem.value=a3[2];
		document.form1.student_name.value=a3[3];
		document.form1.parent_name.value=a3[4];
		document.form1.sImage.src=a3[5];
		
		
		document.getElementById("name").length=0;
		
 		var option1=document.createElement("OPTION");
 
 	
 		
 		
		for(i=1;i<a4.length-1;i++){ 
			addOption(document.getElementById("name") ,a4[i],a4[i]);
		}
		var option=document.createElement("OPTION");
		var last=a4[a4.length-1];
		last=last.substring(0,4);
		option.text=last;
		option.value=last;
		document.getElementById("name").options.add(option);
	}		
}	
function addOption(sBox,text,value){
	var option=document.createElement("OPTION");
	option.text=text;
	option.value=value;
	sBox.options.add(option);
}		
function handleResponse(request){
	
	if(request.readyState==4){
	
		a=request.responseText;
		
		a1=String(a);
		a2=a1.split("$");
		document.form1.accountcode.value=a2[1];
		document.form1.accname.value=a2[2];
		document.form1.bankname.value=a2[3];
		document.form1.bankaddress.value=a2[4];

	}

	}

function handleResponseFee(request){
	
	if(request.readyState==4){
	document.getElementById("fillTable").innerHTML=request.responseText;
		document.form1.name.value=request.responseText;
	}
}	
