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
	
function handleResponseclick1(request){
	if(request.readyState==4){
		a=request.responseText;
		var tbl=document.getElementById("det");
		for(var i=tbl.rows.length;i>0;i--)
		{
			tbl.deleteRow(i-1);
		}
		total=String(a);
		both1=total.split("$$$");
		both=both1[1].split("*");
		var sub;
		for(i=0;i<both.length-1;i++)
		{
	 		var row=tbl.insertRow(i);
	    	sub=both[i].split("$");
			for(j=0;j<sub.length-1;j++)
			{
				var cell=row.insertCell(j);
				cell.width="10%";
				cell.innerHTML=sub[j];
			}
		}
		var a2=both1[0].split("$");
		document.nr.total_rooms.value=a2[0];
		document.nr.total_capacity.value=a2[1];
		document.nr.total_vacancy.value=a2[2];
		document.nr.ofee.value=a2[3];
		document.nr.nfee.value=a2[4];
		}		
}	

function getHostelDetails(){
	var hostel_n1=document.getElementById("hostel_name").value;	
	var hostel="hostel_n="+hostel_n1;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseclick1(request)};
	request.open("POST","HostelDetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(hostel);
}

function pview(){
	var hostel_n1=document.getElementById("hostel_name").value;	
	var hostel="hostel_n="+hostel_n1;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseview(request)};
	request.open("POST","hostelDisplay.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(hostel);
}

function handleResponseview(request){
	if(request.readyState==4){
		a=request.responseText;
		var tbl=document.getElementById("newtable");
		for(var i=tbl.rows.length;i>0;i--)
		{
			tbl.deleteRow(i-1);
		}
		total=String(a);
		both1=total.split("$$$");
		both=both1[0].split("*");
		var sub;
		for(i=0;i<both.length-1;i++)
		{
	 		var row=tbl.insertRow(i);
	    	 sub=both[i].split("$");
			for(j=0;j<sub.length-1;j++)
			{
				var cell=row.insertCell(j);
				cell.width="10%";
				cell.innerHTML=sub[j];
			}
		}
		both2=both1[1].split("$");
		document.nr.tca.value=both2[0];
		document.nr.tda.value=both2[1];
	}	
}
