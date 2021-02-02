<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>게시판</h1>
<table width="80%" align="center">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
	</tr>
	<%
	String sql="select * from bbs05 order by num desc";
	String driver="oracle.jdbc.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String password="tiger";
	
	java.sql.Connection conn=null;
	java.sql.PreparedStatement pstmt=null;
	java.sql.ResultSet rs=null;
	try{
		Class.forName(driver);
		conn=java.sql.DriverManager.getConnection(url,user,password);
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
	%>
	<tr>
		<td><%=rs.getInt("num") %></td>
		<td><%=rs.getString("sub") %></td>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getDate("nalja") %></td>
	</tr>
	<%
		}
	}finally{
		if(conn!=null)conn.close();
	}
	%>
</table>
<a href="./?p=add">[입 력]</a>
</body>
</html>








