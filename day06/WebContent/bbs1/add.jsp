<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%!
	public String checkString(String msg){
		msg=msg.replace('-', '━');
		msg=msg.replace('\'', '’');
		msg=msg.replace('\"', '＂');
		msg=msg.replace('(', '（');
		msg=msg.replace(')', '）');
		msg=msg.replace('<', '〈');
		msg=msg.replace('>', '〉');
		msg=msg.replace('&', '＆');
		return msg;
	}
%>
<%
String path="../"; 

if(request.getMethod().equals("POST")){
	request.setCharacterEncoding("euc-kr");
	String sub,id,content;
	sub=checkString(request.getParameter("sub"));
	id=checkString(request.getParameter("id"));
	content=checkString(request.getParameter("content"));
	
	String sql="insert into bbs05 (num,sub,id,content,nalja)";
	sql+=" values (bbs05_seq.nextval,'"+sub+"','"
			+id+"','"+content+"',sysdate)";

	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		conn.createStatement().executeUpdate(sql);
	}finally{
		if(conn!=null)conn.close();
	}
	response.sendRedirect("list.jsp");
}

%>
<body>
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu3.jspf" %>

<h1>입력 페이지</h1>
<form action="add.jsp" method="post">
<table width="400" align="center">
	<tr>
		<td>제목</td>
		<td><input type="text" name="sub"></td>
	</tr>
	<tr>
		<td>id</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td></td>
		<td><textarea name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="입 력">
			<input type="reset" value="취 소">
			<input type="button" value="뒤 로" onclick="history.back();">
		</td>
	</tr>
</table>
</form>
<%@ include file="../template/footer.jspf" %>
</body>
</html>