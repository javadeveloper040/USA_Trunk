function viewCoursebyname()
{
  var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse(req);
  							};
  req.open("GET","getCourse.jsp?course_name="+document.form1.course_name.value,true);
  req.send(null);
}
function viewCourse(c)
{
  window.navigate("./viewCourse.jsp?course_name="+c);
}
function modifyCourse(c)
{
  window.navigate("./modifyCourse.jsp?course_name="+c);
}
function delCourse(c)
{
  window.navigate("./delCourse.jsp?course_name="+c);
}
function viewCoursedetails(c)
{
  window.navigate("./viewCoursedetails.jsp?course_name="+c);
}

function handleResponse(req)
{ 

 if(req.readyState==4)
 {
var s=req.responseText;
var p=s.split("$");
document.form1.course_name.value=p[0];
document.form1.course_duration.value=p[1];
document.form1.university_name.value=p[2];
var i=1; 
var univ=p[2].substr(2);
while(i<4) 
{
	var ch="s"+i;
	var ch2=document.getElementById(ch).value;
	if(ch2==univ) 
	{
		document.getElementById(ch).selected="selected";
		break;
	}
	i++;
}
p=null;
}
}
function getRequestObject()
{
  if(window.XMLHttpRequest)
  {
    return(new XMLHttpRequest());
  }
  else if(window.ActiveXObject)
  {
    return(new ActiveXObject("Microsoft.XMLHTTP"));    
  }
  else
  return(null);
} 
function valCourse() {
	var a1=document.form1.course_name.value;
	var a2=document.form1.course_duration.value;
	var a3=document.form1.university_name.value;
	if(a1=="" || a2=="" || a3=="") {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function valFee() {
	
	var a1=document.form2.fee_name.value;
	var a2=document.form2.amount.value;
	if(a1=="" || a2=="") {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function valBranch() {
	var a1=document.form3.branch_code.value;
	var a2=document.form3.branch_name.value;
	var a3=document.form3.ref.value;
	var a4=document.form3.seats.value;
	if(a1=="" || a2=="" || a3=="" || a4=="") {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function valSeat() {
	var a1=document.form4.fee_category.value;
	var a2=document.form4.seat_category.value;
	var a3=document.form4.percentage.value;
	if(a1=="" || a2=="" || a3=="" ) {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function valSem() {
	var a1=document.form5.year.value;
	var a2=document.form5.semester.value;
	if(a1=="" || a2=="" ) {
		alert("Please fill all the fields");
		return false;
	}
	return true;
}
function viewFee() {
	var fee_name=document.form2.fee_name.value;
	var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse1(req);
  							};
  req.open("GET","viewFeedet.jsp?fee_name="+fee_name,true);
  req.send(null);
}
function handleResponse1(req)
{ 

 if(req.readyState==4)
 {
var s=req.responseText;
var p=s.split("$");
document.form1.course_name.value=p[0];
document.form2.fee_name.value=p[1];
document.form2.month.value=p[2];
document.form2.year.value=p[3];
document.form2.amount.value=p[4];
p=null;
 }
}
function viewBranch() {
	alert("branch");
	var branch_code=document.form3.branch_code.value;
	var req=getRequestObject();
  req.onreadystatechange=function(){
  							handleResponse2(req);
  							};
  req.open("GET","viewBranchdet.jsp?branch_code="+branch_code,true);
  req.send(null);
}
function handleResponse2(req)
{ 

 if(req.readyState==4)
 {
var s=req.responseText;
var p=s.split("$");
document.form1.course_name.value=p[0];
document.form3.branch_code.value=p[1];
document.form3.branch_name.value=p[2];
document.form3.ref.value=p[3];
document.form3.seats.value=p[4];
p=null;
 }
}
function home() {
	window.navigate("http://localhost:8089/Masters/menu.html");
}