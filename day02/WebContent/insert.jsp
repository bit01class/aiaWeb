<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="5; url=/day02/list.jsp">
<title>Insert title here</title>
</head>
<body>
<!-- 
server.xml 
line 65 
<Connector port="8080" protocol="HTTP/1.1"
           connectionTimeout="20000"
           redirectPort="8443" URIEncoding="EUC-KR" />
 -->

<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="java.sql.*" %>
<%
String sub=request.getParameter("sub");
String name=request.getParameter("name");
String content=request.getParameter("content");
String sql="insert into bbs01 (num,sub,name,content,nalja) values (";

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";
OracleDriver driver=new OracleDriver();

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
int nextNum=0;
String subSql="select max(num)+1 from bbs01";
try{
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(subSql);
	if(rs.next()) nextNum=rs.getInt(1);
	stmt.close();
	sql+=nextNum+",'"+sub+"','"+name+"','"+content+"',sysdate)";
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}


%>
</body>
</html>













