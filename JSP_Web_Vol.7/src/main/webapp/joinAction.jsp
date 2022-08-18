<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!-- user 패키지의 UserDAO 를 불러옴 -->
<%@ page import='java.io.PrintWriter' %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 회원정보를 담는 user 클래스를 JavaBean로 사용 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!-- 회원가입 페이지에서 넘어온 userID, userPassword, userName, UserEmail를 담기 위해 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우당탕탕 코딩 게시판 웹 프로그래밍</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		} // 로그인 상태 시 회원가입 불가

		if (user.getUserID() == null || user.getUserPassword() == null
		|| user.getUserName() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정보를 모두 입력해 주세요.')");
			script.println("history.back()");
			script.println("</script>");
			// 회원가입 정보 누락 시 검증
		}else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			// user 인스턴스가 join 함수 수행
			if (result == -1 ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 존재합니다.')");
				script.println("history.back()");
				script.println("</script>");
			} // 값이 유일해야 하는 아이디가 이미 존재할 경우 경고 창 출력
			else {
				PrintWriter script = response.getWriter();
				session.setAttribute("userID", user.getUserID());
				// 로그인 성공 시 세션 발급
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
				// 회원가입 완료 시 main.jsp로 이동
			}
		}
	%>
</body>
</html>