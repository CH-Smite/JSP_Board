<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <div class="dropdown">
  			<button class="btn dropdown-toggle" type="button" 
  			data-toggle="dropdown" aria-expanded="false">
    		접속하기
  			</button>
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="login.jsp">로그인</a>
		    <a class="dropdown-item" href="join.jsp">회원가입</a>
 		 </div> <!-- 접속하기(로그인, 회원가입) 드롭박스 구현 -->
		</div>
	  </div>
	</nav>
	<!-- 네비게이션 구현 -->
	<div class="container">
		<div class="jumbotron" style="margin-top: 60px; padding-top: 40px;">
			<form method="post" action="loginAction.jsp">
				<h1 style="text-align: center;">Login</h1>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div> <!-- 아이디 입력창 최대 입력수 20자 -->
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div> <!-- 비밀번호 입력창 최대 입력수 20자 -->
					<input type="submit" class="btn btn-primary form-control" value="로그인">
					 <!-- 값을 전달해주는 버튼 구현 -->
			</form> <!-- 로그인 화면 구현 -->
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- jquery 참조하기 위함 -->
	<script src="js/bootstrap.js"></script> <!-- bootstarp.js 파일 참조하기 위함 -->
</body>
</html>