<%@page import="com.bit.bbs06.Bbs06Bean"%>
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
<%@ include file="../template/header.jspf" %>
<%@ include file="../template/menu3.jspf" %>
<%
int num=Integer.parseInt(request.getParameter("idx"));
String sql="select * from bbs06 where num=?";
java.sql.PreparedStatement pstmt=null;
Bbs06Bean bean=new Bbs06Bean();
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url,user,password);
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	rs=pstmt.executeQuery();
	while(rs.next()){
		bean.setNum(rs.getInt("num"));
		bean.setName(rs.getString("name"));
		bean.setSub(rs.getString("sub"));
		bean.setContent(rs.getString("content"));
		bean.setNalja(rs.getDate("nalja1"));
		bean.setNalja2(rs.getString("nalja2"));
	}
}finally{
	if(rs!=null)rs.close();
	if(pstmt!=null)pstmt.close();
	if(conn!=null)conn.close();
}
%>
<h1>상세페이지</h1>
<table width="400" align="center">
	<tr>
		<td>글번호</td>
		<td><%=bean.getNum() %></td>
		<td>글쓴이</td>
		<td><%=bean.getName() %></td>
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
			<a href="edit.jsp?idx=<%=bean.getNum()%>">[수 정]</a>
			<a href="delete.jsp?idx=<%=bean.getNum()%>">[삭 제]</a>
		</td>
	</tr>
</table>
<%@ include file="../template/footer.jspf" %>
</body>
</html>







