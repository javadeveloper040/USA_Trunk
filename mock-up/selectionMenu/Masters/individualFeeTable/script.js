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
		
	}		
}

function fillTable(){

	var rollnumber=document.getElementById("roll_num").value;
	var feename=document.getElementById("fee_name").value;
	var month=document.getElementById("month").value;
	var year=document.getElementById("year").value;
	
	var dradio=document.form1.discountx;

	for(i=0;i<dradio.length;i++){
		if(dradio[i].checked==true){
			discount=dradio[i].value;
			break;
		}
	}
	
	
	request=getRequestObject();
	var tosend="roll_num="+rollnumber+"&fee_name="+feename+"&month="+month+"&year="+year+"&discount="+discount;
	request.onreadystatechange=function(){ handleResponsefillTable(request)};
	request.open("POST","./IfeeTableData",true);
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


var proceed="no";
function checkall(){

	var amount=document.getElementById("feeamt").value;
	var fee=document.getElementById("fee_name").value;
	if(fee=="select"){	
		alert("select a fee");
		proceed="no";
		
	}
	else if(amount==""){
		alert("fill the amount");
		proceed="no";
	}else proceed="yes";
	if(proceed=="yes"){
		return true;
	}else
	 return false;
}

