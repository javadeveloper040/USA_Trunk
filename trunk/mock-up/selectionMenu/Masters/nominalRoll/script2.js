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
	
	
function getDetails(){
	var rollnumber=document.getElementById("roll_number").value;
	var rollno="rollno="+rollnumber;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponse1(request)};
	request.open("POST","ifeedetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(rollno);
}


function getFee(){
	var feecode=document.getElementById("fcode").value;
	alert(feecode);
	var fcode="fcode="+feecode;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseFee(request)};
	request.open("POST","feecheck.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(fcode);
}	


function handleResponse1(request){
		if(request.readyState==4){
		a=request.responseText;
		alert(a);
		a1=String(a);
		a2=a1.split("$");
		document.form1.branch.value=a2[1];
		document.form1.sem.value=a2[2];
		document.form1.student.value=a2[3];
		document.form1.parent.value=a2[4];
		document.form1.pick.src=a2[5];
		
	}		
}	

		
function handleResponse(request){
		if(request.readyState==4){
			a=request.responseText;
		alert(a);
		a1=String(a);
		a2=a1.split("$");
		document.form1.accountcode.value=a2[1];
		document.form1.accname.value=a2[2];
		document.form1.bankname.value=a2[3];
		document.form1.bankaddress.value=a2[4];
		document.form1.accnumber.value=a2[5];
		
	}
}


function handleResponseFee(request){
		if(request.readyState==4){
			document.form1.name.value=request.responseText;
	}
}	





function handleResponseclick1(request){
	if(request.readyState==4){
	a=request.responseText;
		a1=String(a);
		a2=a1.split("$");
		document.nr.boys.value=a2[0];
		document.nr.girls.value=a2[1];
		document.nr.total.value=a2[2];
		}		
}	

	var branch_sem="";
	var branch_n=""; 
	var sem_n="";
	
function handleResponseclick(request){

	if(request.readyState==4){
	a=request.responseText;
		a1=String(a);
		a2=a1.split("$");
		document.adm.boys.value=a2[0];
		document.adm.girls.value=a2[1];
		document.adm.total.value=a2[2];
		}		
}	


function getBranDetails(){
var branch_n1=document.getElementById("branch1").value;	
branch_n=branch_n1;
if(branch_n=="select")
{
document.getElementById("sem").disabled=true;
document.getElementById("sem").value='select';
}
else
document.getElementById("sem").disabled=false;
}

var branch2="";

function getSemDetails(){
var sem_n=document.getElementById("sem").value;			
var branch=document.getElementById("branch1").value;
if(branch!="select"&&sem_n!="select")
{

var branch2="branch1="+branch+"&semester="+sem_n;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseclick1(request)};
	request.open("POST","strengthDetails.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(branch2);
}

}

var course="";
var branch="";
var sem_n="";
var course_n="";
var branch_n="";

function getCourseDetails(){
var course_n1=document.getElementById("course").value;	
course_n=course_n1;
if(course_n=="select")
{
document.getElementById("branch1").disabled=true;
document.getElementById("branch1").value='select';
}
else
document.getElementById("branch1").disabled=false;
}



function getBranchDet()
{
var branch_n=document.getElementById("branch1").value;
if(branch_n=="select")
{
document.getElementById("semester").disabled=true;
document.getElementById("semester").value='select';
}
else
document.getElementById("semester").disabled=false;

}


function getSemDet()
{
var sem_n=document.getElementById("semester").value;
var branch=document.getElementById("branch1").value;
var course=document.getElementById("course").value;
alert(sem_n);
alert(branch);
alert(course);
if(branch!="select"&&sem_n!="select"&&course!="select")
{
var courseDet="course="+course+"&branch="+branch+"&semester="+sem_n;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseclick(request)};
	request.open("POST","strengthDetails1.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(courseDet);
}
}


function pview(){
	var bran=document.getElementById("branch1").value;
	var sem=document.getElementById("sem").value;
	if(bran=="select"||sem=="select")
	alert("select the required fields");
	else{
	var branch1="branch="+bran+"&semester="+sem;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseview(request)};
	request.open("POST","StrengthDisplay.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(branch1);
	}
}


function handleResponseview(request){

	//if(request.readyState==4){
	//a=request.responseText;
	//var tbl=document.getElementById("newtable");
	//for(var i=tbl.rows.length;i>0;i--)
	//{
	//tbl.deleteRow(i-1);
//	}
	//	total=String(a);
		//both=total.split("*");
		//var sub;
		//for(i=0;i<both.length-1;i++)
		//{
	 	//var row=tbl.insertRow(i);
	 
		 //sub=both[i].split("$");
			//for(j=0;j<sub.length-1;j++)
			//{
				//var cell=row.insertCell(j);
					//cell.width="170";
				//cell.innerHTML=sub[j];
			//}
		//}
	//}	
	if(request.readyState==4){
		res=request.responseText;
		
		var fillspan=document.getElementById("newtable");
		fillspan.innerHTML=res;
	
		
	}			
}

	var val="";
function gen()
{

for(i=0; i<document.adm.radio.length;i++ )
{
if(document.adm.radio[i].checked == true )
val = document.adm.radio[i].value;
}
alert( "val = " + val );
alert("select course,branch");

}


function gen1()
{
var sem_n=document.getElementById("semester").value;
var branch=document.getElementById("branch1").value;
var course=document.getElementById("course").value;
if(sem_n=="select"||branch=="select"||course=="select")
{
alert("enter the required values");
}
else
{
alert(val);
alert(course);
alert(branch);
alert(sem_n);
var details="course="+course+"&branch="+branch+"&semester="+sem_n+"&generate="+val;
alert(details);
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseview(request)};
	request.open("POST","generate.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(details);
}
}

function savefee()
{
alert("hdshfds");
var r=document.getElementById("roll_number").value;
var f=document.getElementById("fee_name").value;
var m=document.getElementById("month").value;
var y=document.getElementById("year").value;
alert("hii");
for(i=0; i<document.form1.concession.length;i++ )
{
if(document.form1.concession[i].checked == true )
val =document.form1.concession[i].value;
}
alert( "val = " + val );
var a=document.getElementById("feeamt").value;
 var fdetails="rollnumber="+r+"&feename="+f+"&month="+m+"&year="+y+"&discount="+val+"&amt="+a;
	
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponsefsave(request)};
	request.open("POST","ifeesave.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(fdetails);
}


