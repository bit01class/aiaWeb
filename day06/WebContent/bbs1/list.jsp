<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../template/header.jspf" %>
<% String path="../"; %>
<%@ include file="../template/menu3.jspf" %>
<h1>첫번째 게시판 리스트</h1>
<table width="80%" align="center">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
	</tr>
<%@ page import="java.sql.*" %>	
	<%
//	String sql="select num, case when length(sub)<=5 then "
//+" sub when length(sub)>5 then concat(substr(sub,1,5),'...')"
//+" end sub,id,nalja from bbs05 order by num desc";

java.util.ArrayList<com.bit.dto.Bean> list=null;
list=new java.util.ArrayList<com.bit.dto.Bean>();
String sql="select num,sub,id,nalja from bbs05 order by num desc";
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){ 
			com.bit.dto.Bean bean=new com.bit.dto.Bean();
			bean.setNum(rs.getInt("num"));
			bean.setId(rs.getString("id"));
			bean.setSub(rs.getString("sub"));
			bean.setNalja(rs.getDate("nalja"));
			list.add(bean);
		}	
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	} 
	for(int i=0; i<list.size(); i++){
		com.bit.dto.Bean bean=list.get(i);
	%>
	<tr>
		<td><%=bean.getNum() %></td>
		<td><%=bean.getSub() %></td>
		<td><%=bean.getId()%></td>
		<td><%=bean.getNalja() %></td>
	</tr>
	<%}%>	
</table>
<a href="add.jsp">[입 력]</a>

<%@ include file="../template/footer.jspf" %>
</body>
</html>





