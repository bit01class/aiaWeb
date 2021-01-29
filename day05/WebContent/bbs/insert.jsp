<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.bit.MyOracle,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
// post방식 한글처리
// 1. 매번 작성되어야 함
// 2. 파라미터 파싱전에 엔코딩 되어야함
request.setCharacterEncoding("euc-kr");
String sub=request.getParameter("sub");
String id=request.getParameter("id");
String content=request.getParameter("content");
String sql="insert into bbs04 values (bbs04_seq.nextval,'"
			+sub+"','"+id+"',0,'"+content+"')";
try{
	Statement stmt=MyOracle.getConnection()
							.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
}finally{
	if(MyOracle.getConnection()!=null)
		MyOracle.getConnection().close();
}
response.sendRedirect("list.jsp");
%>
</body>
</html>









