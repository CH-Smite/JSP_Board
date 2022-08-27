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
		<div class="jumbotron">
			<div class="container">
			<h1>우당탕탕 코딩</h1>
			<p>우당탕탕 JSP_Web Project.</p>
			<p><a class="btn btn-primary btn-pull" href="https://velog.io/@ch_dev" role="button"
			data-toggle="tooltip" data-placement="bottom" title="우당탕탕 velog로 이동합니다.">우당탕탕 velog</a></p>
			</div>
		</div>

		<div id="slidcarousel" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#slidcarousel" data-slide-to="0"
					class="active"></li>
				<li data-target="#slidcarousel" data-slide-to="1"></li>
				<li data-target="#slidcarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://picsum.photos/1200/400" class="img-fluid"  alt="Random_img_1">
				</div>
				<div class="carousel-item">
					<img src="https://picsum.photos/1201/400" class="img-fluid"  alt="Random_img_2">
				</div>
				<div class="carousel-item">
					<img src="https://picsum.photos/1202/400" class="img-fluid" alt="Random_img_3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-target="#slidcarousel" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-target="#slidcarousel" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</button>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> <!-- jquery 참조하기 위함 -->
	<script src="js/bootstrap.js"></script> <!-- bootstarp.js 파일 참조하기 위함 -->
</body>
</html>