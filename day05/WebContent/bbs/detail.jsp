<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.bit.MyOracle,java.sql.*,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int num=Integer.parseInt(request.getParameter("num"));
String sql="select * from bbs04 where num="+num;
class Bbs04{
	int num,cnt;
	String sub,id,content;
}
Bbs04 bean=new Bbs04();
try{
	Statement stmt=MyOracle.getConnection().createStatement();
	stmt.executeUpdate("update bbs04 set cnt=cnt+1 where num="+num);
	stmt=MyOracle.getConnection().createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next()){
		bean.num=rs.getInt("num");
		bean.sub=rs.getString("sub");
		bean.id=rs.getString("id");
		bean.cnt=rs.getInt("cnt");
		bean.content=rs.getString("content");
	}
	rs.close();
	stmt.close();
}finally{
	if(MyOracle.getConnection()!=null)
		MyOracle.getConnection().close();
}
%>
<table width="100%">
	<tr>
		<td><img src="../imgs/blue_logo.png"></td>
		<td width="200">
			<td width="200">
			<%if(session.getAttribute("loginResult")==null){ %>
				<a href="../join/login.jsp">[로그인]</a>/
				<a href="../join/add.jsp">[회원가입]</a>
			<%}else{ %>	
				<a href="../join/logout.jsp">[로그아웃]</a>
			<%} %>
			</td>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<a href="../index.jsp">[HOME]</a>
			<a href="../intro.jsp">[INTRO]</a>
			<a href="list.jsp">[B B S]</a>
			<a href="../guest/list.jsp">[GUEST]</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<center>
			<h1>상세 페이지</h1>
			<table width="400">
				<tr>
					<td>글번호</td>
					<td><%=bean.num %></td>
					<td>글쓴이</td>
					<td><%=bean.id %></td>
					<td>조회수</td>
					<td><%=bean.cnt %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="5"><%=bean.sub %></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="5"><%=bean.content %></td>
				</tr>
				<tr>
					<td colspan="6">
						<a href="#">[수 정]</a>
						<a href="del.jsp?num=<%=bean.num %>">[삭 제]</a>
					</td>
				</tr>
			</table>
			</center>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" bgcolor="gray" height="50">
		Copyright &copy; 비트캠프 All rights reserved
		</td>
	</tr>
</table>
</body>
</html>






