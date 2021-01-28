<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String sub=request.getParameter("sub");
String content=request.getParameter("content");
int ref=Integer.parseInt(request.getParameter("ref"));
int ord=Integer.parseInt(request.getParameter("ord"));
int lev=Integer.parseInt(request.getParameter("lev"));
String sql=null;

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";

Connection conn=null;
Statement stmt=null;

if(lev==0){
	// 주 글의 답글
	sql="insert into bbs03 "
	+"(num,name,nalja,sub,content,ref,ord,lev) "
	+"values (bbs03_seq.nextval,'"+name+"',sysdate,'"
	+sub+"','"+content+"',"+ref
	+",(select count(*) from bbs03 where ref="+ref+"),1)";
	
	try{
		conn=DriverManager.getConnection(url, user, password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
}else{
	// 답글의 답글
	try{
	sql="update bbs03 set ord=ord+1 where ord>"+ord;
	conn=DriverManager.getConnection(url, user, password);
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	sql="insert into bbs03 "
	+"(num,name,nalja,sub,content,ref,ord,lev) "
	+"values (bbs03_seq.nextval,'"+name+"',sysdate,'"
	+sub+"','"+content+"',"+ref+","+(ord+1)+","+(lev+1)+")";
	stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
}


response.sendRedirect("index.jsp");
%>
</body>
</html>










