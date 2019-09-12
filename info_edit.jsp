<!-- 오픈소스 12조
	이름 : 게임 리뷰 게시글 수정
	작성자 : 공민철, 최현웅
	설명 : 게임 리뷰 게시글 수정 기능이다.
	작성한 내용을 불러와 내용을 수정하여 등록가능
 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ page import="java.sql.*"%>
		<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";

	String game = null;
	String title = null;
	String writer = null;
	String days = null;
	String review = null;
	int view = -1;
	String memo = null;
	
	
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		String sql = "select * from infolist where id =" + idx;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			//idx = rs.getInt(1);
			game = rs.getString(2);
			title = rs.getString(3);
			writer = rs.getString(4);
			days = rs.getString(5);

			view = rs.getInt(6);
			memo = rs.getString(7);
		}
		pstmt.executeQuery();
		rs.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e){e.printStackTrace();}
	%>
			<!DOCTYPE html>
			<html>
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
						<title>게임 리뷰 홈페이지</title>
						<meta charset="utf-8"/>
						<meta name="viewport" content="width=device-width, initial-scale=1"/>
						<link rel="stylesheet" href="assets/css/main2.css"/>
						<link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
							<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
							<script>
								function writeCheck() {
									var form = document.writeform;
									if (!form.title.value) {
										alert("제목을 입력하세요.");
										form.title.focus();
										return;
									}
									if (!form.memo.value) {
										alert("내용을 입력하세요.");
										form.memo.focus();
										return;
									}
									form.submit();
								}
							</script>
							<style>
								td {
									text-align: center;
								}
								th {
									text-align: center;
								}
							</style>
						</head>
						<body id="top">

							<!-- Banner -->
							<!-- To use a video as your background, set data-video to the name of your video without its extension (eg. images/banner). Your video must be available in both .mp4 and .webm formats to work correctly. -->
							<section id="banner" onclick="index.jsp">
								<div class="inner">
									<header>
										<h1>GAME INFORMATION</h1>
										<p>
											GAME INFORMATION<br/>
										</p>
									</header>
									<a href="#main" class="more">Learn More</a>
								</div>
							</section>

							<!-- Main -->
							<div id="main">
								<div class="inner">

									<!-- Boxes -->
									<div class="thumbnails">
									<!-- 기존 내용 불러오기 -->
										<form name="writeform" method="post" action="edit_ok.jsp?idx=<%=idx %>">
											<table>
												<tr>
													<td>제목</td>
													<td><input type="text" name="title" value="<%=title %>"/></td>
												</tr>
												<tr>
													<td>내용</td>
													<td>
														<textarea name="memo" rows="13" cols="50"><%=memo %></textarea>
													</td>
												</tr>

												
											</table>
										</form>
									</div>

									<input type="button" class="style2" name="write" value="등록" onclick="javascript:writeCheck();"/>
									<input type="button" class="style3" name="list" value="목록" onclick="window.location='info_list.jsp'"/>
								</div>
							</div>

							<!-- Footer -->
							<footer id="footer">
								<div class="inner">
									<h2>오픈소스 전문 프로젝트</h2>
									<p></p>

									<ul class="icons">
										<li>
											<a href="#" class="icon fa-twitter">
												<span class="label">Twitter</span>
											</a>
										</li>
										<li>
											<a href="#" class="icon fa-facebook">
												<span class="label">Facebook</span>
											</a>
										</li>
										<li>
											<a href="#" class="icon fa-instagram">
												<span class="label">Instagram</span>
											</a>
										</li>
										<li>
											<a href="#" class="icon fa-envelope">
												<span class="label">Email</span>
											</a>
										</li>
									</ul>
									<p class="copyright">
										&copy; Untitled. Design:
										<a href="https://templated.co">TEMPLATED</a>. Images:
										<a href="https://unsplash.com/">Unsplash</a>. Videos:
										<a href="http://coverr.co/">Coverr</a>.
									</p>
								</div>
							</footer>

							<!-- Scripts -->
							<script src="assets/js/jquery.min.js"></script>
							<script src="assets/js/jquery.scrolly.min.js"></script>
							<script src="assets/js/jquery.poptrox.min.js"></script>
							<script src="assets/js/skel.min.js"></script>
							<script src="assets/js/util.js"></script>
							<script src="assets/js/main.js"></script>
							<script src="assets/js/StarRating.js"></script>

						</body>
					</html>
