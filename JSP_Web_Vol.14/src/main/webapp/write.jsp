<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<!-- 브라우저 너비를 장치 너비에 맞추어 표시하되 배율은 100%로 (모바일 브라우저의 뷰포트 크기조절을 위해) -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- bootstrap.css 파일 참조하기 위함 -->
<title>우당탕탕 코딩 게시판 웹 프로그래밍</title>
</head>
<body> 
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} // 세션 아이디가 발급되었다면 userID에 저장
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="main.jsp">JSP 웹 프로그래밍</a> 
	  <button class="navbar-toggler" type="button" data-toggle="collapse"
	  data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
	  aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="main.jsp">Home</a>
	      </li> <!-- Home 네비게이션 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="board.jsp">게시판</a>
	      </li> <!-- 게시판 네비게이션 -->
	      <li class="nav-item active">
	        <a class="nav-link" href="https://github.com/udangtangtang/JSP_Board">우당탕탕 Git</a>
	      </li> <!-- 우당탕탕 깃허브 네비게이션 -->
	    </ul>
	    <%
	    	if(userID == null) {
	    %>
	     <div class="dropdown">
  			<button class="btn dropdown-toggle" type="button" 
  			data-toggle="dropdown" aria-expanded="false">
    		접속하기
  			</button>
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="login.jsp">로그인</a>
		    <a class="dropdown-item" href="join.jsp">회원가입</a>
 		 </div> <!-- 로그인 상태가 아닌 경우 -->
		</div>   
	    <%
	    	} else {
	    %>
		<div class="dropdown">
  			<button class="btn dropdown-toggle" type="button" 
  			data-toggle="dropdown" aria-expanded="false">
    		내 계정
  			</button>
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
 		 </div> <!-- 로그인 상태인 경우 -->
		</div>
	    <%
	    	}
	    %>
	  </div>   
	</nav>
	<!-- 네비게이션 구현 -->
	<div class="container">
		<form method="post" action="writeAction.jsp">
			<div class="row">
				<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목을 입력하세요" name="boardTitle" maxlength="40"></td>			
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용을 적어주세요" name="boardContent" maxlength="2048" style="height: 350px;"></textarea></td>
							<!-- 글 작성, 내용 입력 폼 -->
						</tr>
					</tbody>
				</table>
			</div>
			<input type="submit" class="float-right btn btn-primary" value="글 작성">
		</form>
	</div> <!-- 게시판 컨테이너 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- jquery 참조하기 위함 -->
	<script src="js/bootstrap.js"></script> <!-- bootstarp.js 파일 참조하기 위함 -->
</body>
</html>