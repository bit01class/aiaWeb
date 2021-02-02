<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../template/header.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<jsp:include page="../template/menu.jsp">
	<jsp:param value="../" name="path"/>
</jsp:include>
<h1>리스트 페이지</h1>
<table width="80%" align="center" border="1" cellspacing="0">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
	</tr>
	<%
	java.util.ArrayList<com.bit.bbs05.dto.Bbs05Dto> list;
	list=com.bit.bbs05.dao.Bbs05Dao.selectAll();
	for(com.bit.bbs05.dto.Bbs05Dto bean:list){
	%>
	<tr>
		<td><%=bean.getNum() %></td>
		<td><%=bean.getSub() %></td>
		<td><%=bean.getId() %></td>
		<td><%=bean.getNalja() %></td>
	</tr>
	<%} %>
</table>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>














