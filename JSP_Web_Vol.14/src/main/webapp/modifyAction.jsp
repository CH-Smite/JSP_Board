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
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		} else {
			if (request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null
				|| request.getParameter("boardTitle").equals("") || request.getParameter("boardContent").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('내용을 모두 입력해 주세요.')");
				script.println("history.back()");
				script.println("</script>");
				// modify.jsp으로 부터 넘어온 값이 null 또는 공백 체크
			} else {
				FreeboardDAO freeboardDAO = new FreeboardDAO();
				int result = freeboardDAO.modify(boardID, request.getParameter("boardTitle"), request.getParameter("boardContent"));
				if (result == -1 ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 수정에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'board.jsp'");
					script.println("</script>");
					// 글 수정 완료 시 board.jsp로 이동
				}
		}

		}
	%>
</body>
</html>