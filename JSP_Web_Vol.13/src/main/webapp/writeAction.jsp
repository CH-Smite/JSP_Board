<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="freeboard.FreeboardDAO" %>
<%@ page import='java.io.PrintWriter' %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="freeboard" class="freeboard.Freeboard" scope="page" />
<jsp:setProperty name="freeboard" property="boardTitle" />
<jsp:setProperty name="freeboard" property="boardContent" />
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
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
			// 로그인 검증
		} else {
			if (freeboard.getBoardTitle() == null || freeboard.getBoardContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('내용을 모두 입력해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
				// 제목, 내용 누락 검증
			}else {
				FreeboardDAO freeboardDAO = new FreeboardDAO();
				int result = freeboardDAO.write(freeboard.getBoardTitle(), userID, freeboard.getBoardContent());
				if (result == -1 ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 작성에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
					// 글 작성 완료 시 board.jsp로 이동
				}
		}

		}
	%>
</body>
</html>