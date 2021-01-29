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
String msg="<h1>가입을 축하드립니다</h1><a href=\"login.jsp\">[로그인]</a>";

request.setCharacterEncoding("euc-kr");
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String re=request.getParameter("re");
String name=request.getParameter("name");
String age=request.getParameter("age");

if(pw.equals(re)){
	String sql="insert into user04 values "
		+" (user04_seq.nextval,'"+id+"','"
		+pw+"','"+name+"','"+age+"')";
	
	try{
		MyOracle.getConnection()
				.createStatement()
				.executeUpdate(sql);
	}finally{
		if(MyOracle.getConnection()!=null)
			MyOracle.getConnection().close();
	}
}else{
	msg="<h1>패스워드 불일치</h1><a href=\"add.jsp\">돌아가기</a>";
	//response.sendRedirect("add.jsp");
}
%>

<table width="100%">
	<tr>
		<td><img src="../imgs/blue_logo.png"></td>
		<td width="200">
			<a href="login.jsp">[로그인]</a>/
			<a href="add.jsp">[회원가입]</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<a href="../index.jsp">[HOME]</a>
			<a href="../intro.jsp">[INTRO]</a>
			<a href="../bbs/list.jsp">[B B S]</a>
			<a href="../guest/list.jsp">[GUEST]</a>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<center>
			<%=msg %>
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