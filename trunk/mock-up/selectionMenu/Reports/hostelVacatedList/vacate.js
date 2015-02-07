 function getRequestObject(){
 alert("req");
	if(window.XMLHttpRequest){
		return(new XMLHttpRequest());
	}else if(window.ActiveXObject){
		return(new ActiveXObject("Microsoft.XMLHTTP"));
	}
	else{
		return(null);
	}
}
function getVacated(){
	var fdate=document.getElementById("fromdate").value;
	alert(fdate);
	var tdate=document.getElementById("todate").value;
	alert(tdate);
	var select=document.getElementById("hostel").value;
	alert(select);
	var details="fromdate="+fdate+"&todate="+tdate+"&select1="+select;
	alert(details);
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponsea(request)};
	request.open("POST","HostelVacatedList.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(details);
}	

function handleResponsea(request){
	alert(request);
	if(request.readyState==4){
		alert("nagggggg");
		a1=request.responseText;
		alert(a1);
		document.getElementById("filltable").value=a1;
	}
		
		}