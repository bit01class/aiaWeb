<%@page import="java.sql.CallableStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String sub=request.getParameter("sub");
String id=request.getParameter("id");
String content=request.getParameter("content");
String driver="oracle.jdbc.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String password="tiger";
/*
-- BBS05_INSERT
CREATE OR REPLACE PROCEDURE BBS05_INSERT 
(
  V_SUB bbs05.sub%type  
, V_ID bbs05.id%type
, V_CONTENT bbs05.content%type
) AS 
BEGIN
  insert into bbs05 (num,id,sub,content,nalja) 
  values (bbs05_seq.nextval, v_id,v_sub,v_content,sysdate);
  commit;
END;
/
*/
String sql="{call bbs05_insert('"+sub+"','"+id+"','"+content+"')}";

java.sql.Connection conn=null;
CallableStatement cstmt=null;
try{
	Class.forName(driver);
	conn=java.sql.DriverManager.getConnection(url,user,password);
	cstmt=conn.prepareCall(sql);
	cstmt.execute();
}finally{
	
}

response.sendRedirect("../?p=list");
%>
</body>
</html>








