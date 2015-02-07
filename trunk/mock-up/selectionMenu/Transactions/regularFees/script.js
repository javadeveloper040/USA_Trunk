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
	
	var rollnumber=document.getElementById("roll_number").value;
	
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
			discount=dradio[i].checked;
			break;
		}
	}
	
	
	request=getRequestObject();
	var tosend="roll_num="+rollnumber+"&fee_name="+feename+"&month="+month+"&year="+year+"&discount="+discount;
	request.onreadystatechange=function(){ handleResponsefillTable(request)};
	request.open("POST","ifeeTableData.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(tosend);
}	
function handleResponsefillTable(request){
	if(request.readyState==4){
		var tbl=document.getElementById("fillMe");
		var res=request.responseText;
	
	
		for(var i=tbl.rows.length;i>0;i++){
			tbl.deleteRow(i-1);
		}
		
		both=res.split("*");
		var sub;
		for(i=0;i<both.length-1;i++){	
			var row=tbl.insertRow(i);
			sub=both[i].split("$");
			for(j=0;j<sub.length-1;j++){
				
				var cell=row.insertCell(j);
				cell.width=100;
				cell.innerHTML=sub[j];
		}
		}
		
	}		
}

var proceed="no";
function savefee()
{

	var r=document.getElementById("roll_number").value;
	var f=document.getElementById("fee_name").value;
if(f=="Select"){	
		alert("select a fee");
		proceed="no";
		
	}
var a=document.getElementById("feeamt").value;
if(a==""){
		alert("fill the amount");
		proceed="no";
	}else proceed="yes";
	for(i=0; i<document.form1.concession.length;i++ )
	{
	if(document.form1.concession[i].checked == true )
	val =document.form1.concession[i].value;
	}
	
	if(proceed=="yes"){
		var fdetails="rollnumber="+r+"&feename="+f+"&discount="+val+"&amt="+a;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponsefsave(request)};
	request.open("POST","ifeemod.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(fdetails);
	}
	else{alert("try with selecting all");
	
	}
	
	
}
  
  
 

