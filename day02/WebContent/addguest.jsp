<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="5;url=http://localhost:8080/day02/guest.jsp">
<title>Insert title here</title>
</head>
<body>
<%@ page import="oracle.jdbc.driver.OracleDriver,java.sql.*" %>
<%
String name=request.getParameter("name");
String content=request.getParameter("content");
String sql="insert into guest01 (name,content,nalja) values ('";
sql+=name+"','"+content+"',sysdate)";

OracleDriver driver=new OracleDriver();

Connection conn=null;
Statement stmt=null;
try{
DriverManager.registerDriver(driver);
conn=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
stmt=conn.createStatement();
stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
<h1>실행 중...</h1>
</body>
</html>
















