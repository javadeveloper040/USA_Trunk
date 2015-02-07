var state="notall",fee="Select",discount="Select",proceed;
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
function toggleDisplay(){
	all=document.getElementById("all");
	if(all.checked){
		state="all";
		document.getElementById("fname").disabled=true;
		
		document.getElementById("showdlist").disabled=true;
		
		document.getElementById("dlist").disabled=true;
		
	}
	else{
		state="notall";
		document.getElementById("fname").disabled=false;
		document.getElementById("showdlist").disabled=false;
		document.getElementById("dlist").disabled=false;
			
	}
	
}

function showdiscount(){
	
	disc=document.getElementById("showdlist");
	if(disc.checked){
	state=""	
		document.getElementById("dlistlayer").style.visibility="visible";
		
	}
	else{
	state="";
		document.getElementById("dlistlayer").style.visibility="hidden";
	}
}
function changeFee(){
	fee=document.getElementById("flist").value;
	
}
function changeDiscount(){
discount=document.getElementById("dlist").value;
	
}
function getDetails(){
	if(state=="all"){
		
		var need="need1="+state;
		request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponse(request)};
	request.open("POST","FillTable.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(need);
	
	}
	else if(fee!="Select"&&discount!="Select"){
	
		fee=document.getElementById("fname").value;
 		discount=document.getElementById("dlist").value;
	
		
		var need="need1="+fee+"&need2="+discount;
		
		request=getRequestObject();
		request.onreadystatechange=function(){ handleResponse(request)};
		request.open("POST","FillTable.jsp",true);
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		request.send(need);
		
		
		}else if(fee=="Select"&&discount=="Select"){
			alert("select any one");
		}
		
		else if(fee=="Select"){
			discount=document.getElementById("dlist").value;
			
			
			var need="need2="+discount;
			
			request=getRequestObject();
			request.onreadystatechange=function(){ handleResponse(request)};
			request.open("POST","FillTable.jsp",true);
			request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			request.send(need);
					
		}else if(discount=="Select"){
	fee=document.getElementById("flist").value;
			
			var need="need1="+fee;
		request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponse(request)};
	request.open("POST","FillTable.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(need);
	
			
		}
	
}

function handleResponse(req){
	if(req.readyState==4){
	a=req.responseText;
		
		document.getElementById("fillTable").innerHTML=a;
	}
}

