<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String sub=request.getParameter("sub");
String content=request.getParameter("content");
String sql="insert into bbs03 "
	+" (num,name,nalja,sub,content,ref,ord,lev) values ("
	+"bbs03_seq.nextval,'"+name+"',sysdate,'"
	+sub+"','"+content+"',bbs03_seq.currval,0,0)";
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";

Connection conn=null;
Statement stmt=null;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
	response.sendRedirect("index.jsp");
%>
</body>
</html>








