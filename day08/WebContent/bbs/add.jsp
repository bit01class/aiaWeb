<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>입력 페이지</h1>
<form action="bbs/insert.jsp">
	<table align="center">
		<tr>
			<td>제목</td>
			<td><input type="text" name="sub"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="입 력">
			</td>
		</tr>
	</table>
</form>
</body>
</html>