<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String pname="main.jsp";
String p=request.getParameter("p");
if(p==null) pname="main.jsp";
else if(p.equals("intro")) pname="intro.jsp";
else if(p.equals("list")) pname="bbs/list.jsp";
else if(p.equals("add")) pname="bbs/add.jsp";
%>
<table width="800" align="center">
	<tr>
		<td><img src="imgs/blue_logo.png"></td>
	</tr>
	<tr align="center" bgcolor="gray">
		<td>
			<a href="./">[HOME]</a>
			<a href="./?p=intro">[INTRO]</a>
			<a href="./?p=list">[B B S]</a>
			<a href="./">[LOGIN]</a>
		</td>
	</tr>
	<tr>
		<td>
		<jsp:include page="<%=pname %>"></jsp:include>
		</td>
	</tr>
	<tr align="center" bgcolor="gray">
		<td>Copyright &copy; 비트캠프 All rights reserved.</td>
	</tr>
</table>
</body>
</html>