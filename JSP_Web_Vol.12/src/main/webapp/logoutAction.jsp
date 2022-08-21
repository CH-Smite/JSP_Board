<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우당탕탕 코딩 게시판 웹 프로그래밍</title>
</head>
<body>
	<%
		session.invalidate();
	// 세션 해제
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>