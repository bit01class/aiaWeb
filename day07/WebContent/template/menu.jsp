<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String path=request.getParameter("path");
    %>
	<tr>
		<td bgcolor="gray" align="center">
			<a href="<%=path %>index.jsp">[HOME]</a>
			<a href="<%=path %>intro.jsp">[INTRO]</a>
			<a href="<%=path %>bbs/list.jsp">[B B S]</a>
			<a href="#">[LOGIN]</a>
		</td>
	</tr>
	<tr>
		<td>
			<!-- 내용시작 -->
