<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="0;url=/day02/list.jsp">
<title>Insert title here</title>
</head>
<body>
<%@ page import="oracle.jdbc.driver.OracleDriver,java.sql.*" %>
<%
String num=request.getParameter("num");
String sql="delete from bbs01 where num="+num;

new OracleDriver();
Connection conn=null;
Statement stmt=null;
try{
	conn=DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521:xe"
			,"scott","tiger");
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
</body>
</html>












