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

		ServletRequest req=pageContext.getRequest();
		ServletResponse res=pageContext.getResponse();
		String path=application.getContextPath();
		path=application.getRealPath("imgs/game1.png");
		out.print(path);
		out.print("출력");
%>
<img alt="" src="imgs/game1.png">
</body>
</html>










