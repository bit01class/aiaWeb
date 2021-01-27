<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="100%">
<tr>
	<td><img src="../imgs/blue_logo.png"></td>
</tr>
<tr>
	<td bgcolor="gray" align="center">
		<a style="color:white" href="../">[HOME]</a>
		<a style="color:white" href="../intro.jsp">[INTRO]</a>
		<a style="color:white" href="./list.jsp">[B B S]</a>
		<a style="color:white" href="../login/form.jsp">[LOGIN]</a>
	</td>
</tr>
<tr>
	<td>
		<!-- content start -->
		<center>
		<h1>게시판 리스트</h1>
		<table border=1 cellspacing="0" width="85%">
			<tr>
				<th bgcolor="gray" width="80">글번호</th>
				<th bgcolor="gray">제목</th>
				<th bgcolor="gray" width="100">글쓴이</th>
				<th bgcolor="gray" width="100">날짜</th>
			</tr>
<%@ page import="java.sql.*" %>
<%
/* 
select * from 
  (select rownum as rn,num,sub,name from 
  (select num,sub,name from bbs02 
    where name='user1' order by num desc))
where rn between 11 and 20;
 */
int total=0;
int p=1;
try{
p=Integer.parseInt(request.getParameter("p"));
}catch(NumberFormatException e){}
String keyword=request.getParameter("word");
String colname=request.getParameter("key");
if(keyword==null) keyword="%";
if(colname==null) colname="sub";

String sql="select num,name,nalja,sub from bbs02 ";
sql+=" where "+colname+" like '%"+keyword+"%' ";
sql+=" and num between (select max(num)-"+((p-1)*10+9)+" from bbs02) and (select max(num)-"+(p-1)*10+" from bbs02)";
sql+=" order by num desc";


System.out.println(sql);

String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";
String driver="oracle.jdbc.driver.OracleDriver";

Class.forName(driver);

Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
try{
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select count(*) from bbs02");
	if(rs.next()) total=rs.getInt(1);
	rs.close();
	stmt.close();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()){
%>
			<tr>
				<td><%=rs.getInt("num") %></td>
				<td><%=rs.getString("sub") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getDate("nalja") %></td>
			</tr>
<%
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}
%>
		</table>
		<form action="list.jsp">
		<select name="key">
			<option value="sub">제목</option>
			<option value="name">글쓴이</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
		</form>
		<%
		int start=0,end=0;
		if(total%10==0){
			end=total/10;
		}else{
			end=total/10+1;
		}
		// p=1,2,3,4,5
		start=(p-1)/5*5;
		if(start+5<end){
			end=start+5;
		}
		if(p>5){
		%>
		<a href="list.jsp?p=<%=start %>">◀</a>
		<%
		}
		for(int i=start; i<end; i++){
			if(p!=i+1){
		%>
		<a href="list.jsp?p=<%=i+1 %>">[<%=i+1 %>]</a>
		<%
			}else{
				out.println("["+p+"]");
			}
		}
		if(start+5<total/10+1){
		%>
		<a href="list.jsp?p=<%=end+1 %>">▶</a>
		<%} %>
		</center>
		<!-- content end -->
	</td>
</tr>
<tr>
	<td bgcolor="gray" align="center">
<b>(주)비트컴퓨터</b><br>
	서울특별시 종로구 종로 69 YMCA 7층<br>
Copyright &copy; 비트캠프 All rights reserved.
	</td>
</tr>
</table>
</body>
</html>


















