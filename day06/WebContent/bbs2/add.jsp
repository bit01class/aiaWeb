<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%! String path="../"; %>
<%
String method=request.getMethod();
if("POST".equals(method)){
	request.setCharacterEncoding("euc-kr");
	String sub=request.getParameter("sub");
	String name=request.getParameter("name");
	String content=request.getParameter("content");
	String sql="insert into bbs06 (num,sub,name,content,nalja1) ";
	sql+=" values (bbs06_seq.nextval,?,?,?,sysdate)";
	java.sql.PreparedStatement pstmt=null;
	try{
		conn=com.bit.util.MyOracle.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, sub);
		pstmt.setString(2, name);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
	}finally{
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	response.sendRedirect("list.jsp");
}

%>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu3.jspf" %>
	<h1>입력 페이지</h1>
	<form method="post">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="sub"></td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td></td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입 력">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</table>
	</form>
<%@ include file="../template/footer.jspf" %>
</body>
</html>











