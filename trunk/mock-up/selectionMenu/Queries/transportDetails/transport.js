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

function getDet(){
	var s=document.getElementById("route").value;
	document.getElementById("bus").style.visibility='visible';
	var route="route="+s;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseclick(request)};
	request.open("POST","BusDetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(route);
}

function handleResponseclick(request){

	if(request.readyState==4){

   		var s=request.responseText;
   		//alert(s);
   		//s1=toString(s);
   		//alert(s1);
  		document.getElementById("bus").length=0;
		var words=s.split("$");
		//alert(words);
		addOption(document.getElementById("bus"),"select","select");
		 for(i=0;i<words.length-1;i++){ 
			addOption(document.getElementById("bus"),words[i],words[i]);
		}
	}	
}

function addOption(sBox,text,value){
	var option=document.createElement("OPTION");
	option.text=text;
	option.value=value;
	sBox.options.add(option);
}

function getBus()
{
	var s=document.getElementById("bus").value;
	var bus="bus="+s;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseFill(request)};
	request.open("POST","BusDetails1.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(bus);
}

function handleResponseFill(request){

	if(request.readyState==4){

   		var s=request.responseText;
   		//alert(s);
   		//s1=toString(s);
   		//alert(s1);
  		s1=s.split("$");
  		document.getElementById("num_of_seats").value=s1[0];
  		document.getElementById("filled_seats").value=s1[1];
  		document.getElementById("free_seats").value=s1[2];
  	}
}

function getDetails(){
	var r=document.getElementById("route").value;
	var b=document.getElementById("bus").value;
	if(r=="select"||b=="select")
	alert("select the required fields");
	else{
	var route1="route="+r+"&bus="+b;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseview(request)};
	request.open("POST","BusDisplay.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(route1);
	}
}

function handleResponseview(request){

	//if(request.readyState==4){
	//a=request.responseText;
	//alert(a);
	//document.getElementById("fillTable").innerHTML=a;
//}	
if(request.readyState==4){
		res=request.responseText;
		
		var fillspan=document.getElementById("filltable");
		fillspan.innerHTML=res;
	
		
	}			
}

function getAmount(){
	var r=document.getElementById("route").value;
	var b=document.getElementById("bus").value;
	if(r=="select"||b=="select")
	alert("select the required fields");
	else{
	var route1="route="+r+"&bus="+b;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseview1(request)};
	request.open("POST","AmountDisplay.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(route1);
	}
}

function handleResponseview1(request){

	if(request.readyState==4){
	s=request.responseText;
		s1=s.split("$");
  		document.getElementById("total_target_amount").value=s1[0];
  		document.getElementById("total_target_amount_for_filled").value=s1[1];
  		document.getElementById("total_collected_amount").value=s1[2];
  		document.getElementById("total_due_amount").value=s1[3];
  	}	
}

