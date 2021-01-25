<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>내장객체</h1>
	<%
	//javax.servlet.http.HttpServletRequest req=request;
	String addr=request.getRemoteAddr();
	String url=request.getRequestURI();
	String ctxt=request.getContextPath();
	System.out.println(ctxt);
	%>
	<p>내 아이피:<%=ctxt %></p>
	<p><a href="ex04.jsp?id=xyz">link1</a></p>
	<p><a href="ex04.jsp?id=abc&pw=1234">link2</a></p>
	
	<form action="ex04.jsp" method="get">
		<input type="text" name="id" value="abc"><br>
		<input type="password" name="pw"><br>
		<input type="radio" name="ra" value="item1" checked="checked">item1
		<input type="radio" name="ra" value="item2">item2
		<input type="radio" name="ra" value="item3">item3<br>
		<input type="checkbox" name="ch" value="ch1">ch1
		<input type="checkbox" name="ch" value="ch2">ch2
		<input type="checkbox" name="ch" value="ch3">ch3<br>
		<select name="sel">
			<option value="02">서울</option>
			<option value="032">대전</option>
			<option value="042">대구</option>
			<option value="052">부산</option>
			<option value="062">광주</option>
		</select><br>
		<select name="lst" size="5">
			<option value="02">서울</option>
			<option value="032">대전</option>
			<option value="042">대구</option>
			<option value="052">부산</option>
			<option value="062">광주</option>
		</select><br>
		<textarea rows="5" cols="10" name="ta"></textarea>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>



















