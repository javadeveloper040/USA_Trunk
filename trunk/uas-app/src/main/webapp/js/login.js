function disableback()
{
   window.history.forward(1);
   document.getElementById('login_id').focus();
}
function fun()
{
var id=document.getElementById("login_id").value;
var psw=document.getElementById("password").value;
if((id=="")||(psw==""))
{
document.getElementById("err").innerHTML="Invalid User Id or Password";
return false;
}
return true;
}