<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="0" cellspacing="0"  width="600" align="center">
	<tr>
		<td bgcolor="#000000" colspan="6"><img src="imgs/header.jpg"></td>
	</tr>
	<tr>
		<td align="center" background="imgs/menu.jpg"><img src="imgs/menu.jpg"></td>
		<td align="center" width="100" background="imgs/menu.jpg"><a href="index.jsp">[HOME]</a></td>
		<td align="center" width="100" background="imgs/menu.jpg"><a href="intro.jsp">[INTRO]</a></td>
		<td align="center" width="100" background="imgs/menu.jpg"><a href="list.jsp">[B B S]</a></td>
		<td align="center" width="100" background="imgs/menu.jpg"><a href="guest.jsp">[방명록]</a></td>
		<td align="center" background="imgs/menu.jpg"><img src="imgs/menu.jpg"></td>
	</tr>
	<tr>
		<td colspan="6">
		<center>
		<h1>BBS List Page</h1>
		<table border="1" cellspacing="0" width="80%">
			<tr>
				<td width="80">글번호</td>
				<td>제목</td>
				<td width="120">글쓴이</td>
				<td width="100">날짜</td>
			</tr>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="java.sql.*" %>
<%
String sql="select num,sub,name,nalja from bbs01 order by num desc";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";
OracleDriver driver=new OracleDriver();
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()){
%>			
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getDate(4) %></td>
			</tr>
<%
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
		</table>
		</center>		
		</td>
	</tr>
</table>
</body>
</html>













