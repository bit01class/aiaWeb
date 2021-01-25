<%@page import="java.io.Writer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>result page<%=request.getMethod() %></h1>
	<p>id:<%=request.getParameter("id") %></p>
	<p>pw:<%=request.getParameter("pw") %></p>
	<p>ra:<%=request.getParameter("ra") %></p>
	<%
	String[] chs=request.getParameterValues("ch");
	if(chs!=null){
	for(int i=0; i<chs.length;i++){
	%>
	<p>check:<%=chs[i] %></p>
	<%}} %>
	<p>select:<%=request.getParameter("sel") %></p>
	<%
	String ta=request.getParameter("ta");
	ta=ta.replace("\r\n", "<br>");
	System.out.println(ta);
	%>
	<p><%=ta %></p>
	
	<%
	System.out.println("--------------------");
	java.util.Enumeration<String> enu=null;
	enu=request.getParameterNames();
	
	while(enu.hasMoreElements()){
		System.out.println(enu.nextElement());
	}
	//Writer out=response.getWriter();
	
	out.println();
	%>
</body>
</html>













