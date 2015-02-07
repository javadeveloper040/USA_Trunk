<html>
<head><link rel="stylesheet" href="../../sheet1.css">

<script>
function val()
{
document.getElementById("ima2").src=document.getElementById("uploadfile").value;
}
</script>
</head>
<body bgcolor="skyblue">
<form method="post" action="userupload.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
    <td>
    <td><img src="" id="ima2" height="140" width="110">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	</td>
    </tr>
    <tr>
      <td align="left">
	  <b><font color="black">Select an image to upload :</font></b></td>
    </tr>
    <tr>
      <td align="left">
        <input type="file" id="uploadfile" name="uploadfile" size="50" >
        </td>
    </tr>
   <tr>
      <td align="left">
		<input type="hidden" name="todo" value="upload">
		
		<input type="button" name="Upload" value="Upload" onclick="val()">
           <input type="submit" name="Done" value="Done">
        <input type="reset" name="Reset" value="Cancel">
        <input type="button" value="quit" onclick="window.close()">
        </td>
    </tr>
  </table>  
</form>
</body>
</html>