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
<%@ include file="/template/header.jspf" %>
<%@ include file="/template/menu3.jspf" %>
<h1>두번째 게시판 리스트</h1>

<table align="center" border="1" cellspacing="0">
	<tr>
		<th>번호</th>
		<th width="50%">제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
	</tr>
	<%
	java.util.ArrayList<Bbs06Bean> list;
	list=new java.util.ArrayList<Bbs06Bean>();
	String sql="select * from bbs06 where name like ? order by num desc";
	java.sql.PreparedStatement pstmt=null;
	try{
		conn=com.bit.util.MyOracle.getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,"%tester%");
		rs=pstmt.executeQuery();
		while(rs.next()){
			Bbs06Bean bean=new Bbs06Bean();
			bean.setNum(rs.getInt("num"));
			bean.setSub(rs.getString("sub"));
			bean.setName(rs.getString("name"));
			bean.setNalja(rs.getDate("nalja1"));
			list.add(bean);
		}
	}finally{
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}
	// 1.7~ 개선된 루프문 (향상된 for문)
	// 제네릭 함께
	for(Bbs06Bean bean:list){
	%>
	<tr>
		<td><%=bean.getNum() %></td>
		<td><%=bean.getSub() %></td>
		<td><%=bean.getName() %></td>
		<td><%=bean.getNalja() %></td>
	</tr>
	<%}
	%>
</table>
<a href="add.jsp">[입 력]</a>
<%@ include file="/template/footer.jspf" %>
</body>
</html>








