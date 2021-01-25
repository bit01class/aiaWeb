<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String num=request.getParameter("num");
String name=request.getParameter("name");
String kor=request.getParameter("kor");
String eng=request.getParameter("eng");
String math=request.getParameter("math");

String sql="insert into student01 values (";
sql+=num+",'"+name+"',"+kor+","+eng+","+math+")";
System.out.println(sql);
String url="jdbc:oracle:thin:@localhost:1521:xe";
String id="scott";
String pw="tiger";

OracleDriver driver=new OracleDriver();

DriverManager.registerDriver(driver);
Connection conn=null;
Statement stmt=null;
try{
conn=DriverManager.getConnection(url, id, pw);
stmt=conn.createStatement();
stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
<h1>입력 완료</h1>
<a href="ex07.jsp">리스트페이지로 이동</a>
</body>
</html>