<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>답글 페이지</h1>
	<form action="reinsert.jsp">
		<input type="hidden" name="ref" value="<%=request.getParameter("ref")%>">
		<input type="hidden" name="ord" value="<%=request.getParameter("ord")%>">
		<input type="hidden" name="lev" value="<%=request.getParameter("lev")%>">
		<table align="center">
			<tr>
				<td width="100" bgcolor="gray">제목</td>
				<td><input type="text" name="sub"></td>
			</tr>
			<tr>
				<td bgcolor="gray">글쓴이</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td bgcolor="gray"></td>
				<td><textarea rows="5" cols="60" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입 력">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>