<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%! String path="../"; %>
<%
String sql="update bbs06 set del=1, "
+" nalja2=to_char(?+1,'yyyy-mm-dd') where num=?";
int num=Integer.parseInt(request.getParameter("idx"));
java.sql.PreparedStatement pstmt=null;
if("POST".equals(request.getMethod())){
	
	try{
		Class.forName(driver);
		conn=com.bit.util.MyOracle.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(2, num);
		pstmt.setDate(1
		,new java.sql.Date(System.currentTimeMillis()));
		pstmt.executeUpdate();
	}finally{
		if(conn!=null)conn.close();
	}
	
	response.sendRedirect("list.jsp");
}
%>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu3.jspf" %>
	<h1>삭제하시겠습니까?</h1>
	<form method="post">
		<input type="hidden" name="idx" value="<%=num%>">
		<input type="submit" value="삭 제">
		<input type="button" value="취 소" onclick="history.back();">
	</form>
<%@ include file="../template/footer.jspf" %>
</body>
</html>