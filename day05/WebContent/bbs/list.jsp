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
<%!
	class Bbs04{
		int num;
		String sub;
		String id;
		int cnt;
	}
%>
<%
	String sql="select num,sub,id,cnt from bbs04 order by num desc";
	ArrayList<Bbs04> list=new ArrayList<Bbs04>();
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			Bbs04 bean=new Bbs04();
			bean.num=rs.getInt("num");
			bean.sub=rs.getString("sub");
			bean.id=rs.getString("id");
			bean.cnt=rs.getInt("cnt");
			list.add(bean);
		}
	}finally{
		if(conn!=null)conn.close();
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
			<h1>리스트 페이지</h1>
			<table border="1" width="80%" align="center">
				<tr>
					<th width="80">번호</th>
					<th>제목</th>
					<th width="120">글쓴이</th>
					<th width="80">조회수</th>
				</tr>
				<%
				for(int i=0; i<list.size(); i++){
					Bbs04 bean=list.get(i);
				%>
				<tr>
					<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.num %></a></td>
					<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.sub %></a></td>
					<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.id %></a></td>
					<td><a href="detail.jsp?num=<%=bean.num %>"><%=bean.cnt %></a></td>
				</tr>
				<%} %>
			</table>
			<a href="add.jsp">[입 력]</a>
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






