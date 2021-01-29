<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.bit.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getMethod().equals("POST")){
	String sql="delete from bbs04 where num="
				+request.getParameter("num");
	try{
		MyOracle.getConnection()
				.createStatement()
				.executeUpdate(sql);
	}finally{
		if(MyOracle.getConnection()!=null)
			MyOracle.getConnection().close();
	}
}
response.sendRedirect("list.jsp");
%>
</body>
</html>











