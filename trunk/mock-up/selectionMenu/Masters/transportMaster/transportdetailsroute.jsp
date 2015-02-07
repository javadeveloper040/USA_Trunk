<%@page import="java.sql.*"%>
<%@page import="mis.Dbcon"%>

<%
	String route=request.getParameter("route");
	String busno=request.getParameter("busno");
	String stagename=request.getParameter("stagename");
	
	String s=route+busno+stagename;
	StringBuffer sb=new StringBuffer();
	System.out.println(route+busno+stagename);
	
	Dbcon d= new Dbcon();
	Connection con=d.getConnection();
	Statement st = con.createStatement();
	
	if(stagename!=null){
	ResultSet ino=st.executeQuery("select max(serial) from stage_tab");
	ino.next();
	int oi=ino.getInt(1);
	oi++;
	st.executeUpdate("insert into stage_tab values('"+oi+"','"+busno+"','"+route+"','"+stagename+"')");
	}
		
	ResultSet rs=st.executeQuery("select * from stage_tab");
	sb.append("<table>");
	sb.append("<table align=\"center\" border=1><tr><th width=100>SI</th><td width=100>Route</td><td width=100>Bus No</td><td width=100>Stage</td></tr>");
	while(rs.next()){
		int si=rs.getInt(1);
		//sb.append(si);
		//sb.append("$");
		String subroute=rs.getString(3);
		//sb.append(subroute);
		//sb.append("$");
		int bus_num=rs.getInt(2);
		//sb.append(bus_num);
		//sb.append("$");
		String stage=rs.getString(4);
		//sb.append(stage);
		//sb.append("$");
		//sb.append("*");
		sb.append("<tr><td width=100>"+si+"</td><td width=100>"+subroute+"</td><td width=100>"+bus_num+"</td><td width=100>"+stage+"</td></tr>");
	 }
	sb.append("</table>");
	System.out.print(sb);
	out.print(sb);
%>
