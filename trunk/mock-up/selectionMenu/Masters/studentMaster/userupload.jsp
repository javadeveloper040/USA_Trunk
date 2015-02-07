<%@ page language="java"  import="java.io.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../../sheet1.css">

<title>Uploading Image</title>
</head>
<body>
<%
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
//System.out.println("contentType:"+contentType);
	//here we are checking the content type is not equal to Null and  as well as the passed 
	//data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data0
		System.out.println(in);
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
			}
		String file = new String(dataBytes);
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		// creating a new file with the same name and writing the content in new file
		String filePath = "C:\\Program Files\\Apache Software Foundation\\Tomcat 5.0\\webapps\\misFinal19\\images\\"+ saveFile;
		FileOutputStream fileOut = new FileOutputStream(filePath);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
		session.setAttribute("filen", saveFile);
		session.setAttribute("filep",filePath );
		String type="silver";
		System.out.print(type);
		if(type.equals("silver"))
			response.sendRedirect("imageupload.jsp");
		else
			response.sendRedirect("pay.html");
		
		%> <%
		
		 
		} else {
			out.print("not recieved");
		}
%>

</body>
</html>