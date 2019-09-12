<%/*작성자 공민철 박서윤*/ %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>게임 리뷰 홈페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body id="top">

			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				<section id="banner" data-video="images/banner.jpg">
					<div class="inner">
						<header>
							<h1>GAME REVIEW HOMEPAGE</h1>
							<p>Open source programing project<br />
							made by 12 team Kong, Park, Choi</p>
						</header>
						<a href="#main" class="more">Learn More</a>
					</div>
				</section>

			<!-- Main -->
				<div id="main">
					<div class="inner">
						<div class="thumbnails">
						<%
						if (session.getAttribute("name") == null) {
						%>
						<a class="button style4 fit" onclick="signin()">Sign in</a>
						<a class="button style4 fit" onclick="signup()">Sign up</a>
					<!-- 
					<a href="signin.jsp" class="button style4 fit" data-poptrox="iframe,380x280">Sign in</a>
					<a href="signup.jsp" class="button style4 fit" data-poptrox="iframe,380x590">Sign up</a>
					 -->
						<%
						}else{
						%>
						<p>
						<%= session.getAttribute("name")%>님 접속중&nbsp;</p>
						<p onclick="logout()" style="cursor:pointer"><font color="yellow"><u>로그아웃</u></font></p>
						<%}%>
</div>
					<!-- Boxes -->
						<div class="press">

							<div class="box">
								<a href="review_list.jsp?pg=1" class="image fit"><img src="images/pic01.jpg" alt="" /></a>
								<div class="inner">
									<h3>유저 PC 게임 리뷰</h3>
									<p>PC 게임을 자유롭게 리뷰할 수 있습니다.</p>
									<input OnClick="window.location='review_list.jsp?pg=1'" class="button fit" value="게임 리뷰 목록" />
								</div>
							</div>

							<div class="box">
								<a href="info_list.jsp?pg=1" class="image fit"><img src="images/pic02.jpg" alt="" /></a>
								<div class="inner">
									<h3>PC 게임 정보</h3>
									<p>PC 게임 정보를 볼 수 있는 게시판 입니다.</p>
									<input OnClick="window.location='info_list.jsp?pg=1'" class="button fit" value="게임 정보 목록" />
								</div>
							</div>

							<div class="box">
								<a href="free_list.jsp?pg=1" class="image fit"><img src="images/pic03.jpg" alt="" /></a>
								<div class="inner">
									<h3>자유게시판</h3>
									<p>자유롭게 게시글을 작성할 수 있습니다.</p>
									<input OnClick="window.location='free_list.jsp?pg=1'" class="button fit" value="자유게시판 목록" />
								</div>
							</div>

						</div>

					</div>
				</div>

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<h2>오픈소스 전문 프로젝트</h2>
						<p>12조 프로젝트 </p><p>게임 리뷰 홈페이지 입니다.</p>

						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a href="http://coverr.co/">Coverr</a>.</p>
					</div>
				</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

<script language="javascript">
			function signin(){
				var url="signin.jsp";
				var name="popup";
				window.open(url,name,"width=365, height=275, toolbar=no, status=no, scrollbar=no, menubar=no");
			}
			function signup(){
				var url="signup.jsp";
				var name="popup";
				window.open(url,name,"width=365, height=460, toolbar=no, status=no, scrollbar=no, menubar=no");
			}
			function logout(){
				window.location.replace("logout.jsp");
			}
			</script>

	</body>
</html>
