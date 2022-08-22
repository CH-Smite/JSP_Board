<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="freeboard.Freeboard" %>
<%@ page import="freeboard.FreeboardDAO" %>
<%@ page import='java.io.PrintWriter' %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		}
		int boardID = 0;
		if(request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
		Freeboard freeboard = new FreeboardDAO().getFreeboard(boardID);
		if (!userID.equals(freeboard.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
				FreeboardDAO freeboardDAO = new FreeboardDAO();
				int result = freeboardDAO.delete(boardID);
				if (result == -1 ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
					// 글 삭제 완료 시 board.jsp로 이동
				}
		}
	%>
</body>
</html>