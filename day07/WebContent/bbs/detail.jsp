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
<jsp:useBean id="bean" class="com.bit.bbs05.dto.Bbs05Dto"></jsp:useBean>
<jsp:setProperty property="num" name="bean"/>
<%
bean=com.bit.bbs05.dao.Bbs05Dao.selectOne(bean.getNum());
%>
<h1>상세 페이지</h1>
<table width="400" align="center">
	<tr>
		<td>글번호</td>
		<td><%=bean.getNum() %></td>
		<td>글쓴이</td>
		<td><%=bean.getId() %></td>
		<td>날짜</td>
		<td><%=bean.getNalja() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="5"><%=bean.getSub() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan="5"><%=bean.getContent() %></td>
	</tr>
	<tr>
		<td colspan="6">
			<a href="#">[수 정]</a>
			<a href="#">[삭 제]</a>
		</td>
	</tr>
</table>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>




