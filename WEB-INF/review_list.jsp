<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    <%
    	request.setCharacterEncoding("utf-8");
	    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>게임 리뷰 홈페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main3.css" />
		<style>
		td{
			text-align:center;
		}
		th{
			text-align:center;
			
		}
		</style>
	</head>
	<body id="top">

			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				<section id="banner" onclick="index.jsp">
					<div class="inner">
						<header>
							<h1>GAME REVIEW</h1>
							<p>Game Review<br /></p>
						</header>
						<a href="#main" class="more">Learn More</a>
					</div>
				</section>

			<!-- Main -->
				<div id="main">
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">
						</div>
						<div class="press" width="100%">
							<input onclick="window.location='index.jsp'" type="button" class="style2" style="margin-left:20px;margin-bottom:20px;"value="메인 화면"/>
							<input type="button" class="style3" style="margin-left:20px;" value="게임 리뷰"/>
							<input type="button" class="style2" style="margin-left:20px;"value="게임 정보"/>
							<input type="button" class="style3" style="margin-left:20px;"value="전문 리뷰"/><p></p>
						
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<!--  <tr height="5"><td width="5"></td></tr-->
								<tr style=" text-align:center; background-color:white; color:black;">
									<td width="5"></td>
									<td width="73">글번호</td>
									<td width="129">게임 제목</td>
									<td width="250">리뷰 제목</td>
									<td width="73">작성자</td>
									<td width="82">작성일</td>
									<td width="82">조회수</td>
									<td width="70">평점</td>
									<td width="7"></td>
								</tr>
								<% 
								Connection conn = null;
								PreparedStatement pstmt = null;
								
								String jdbc_driver = "com.mysql.jdbc.Driver";
								String jdbc_url = "jdbc:mysql://127.0.0.1/mysql";
								
								
								try{
									Class.forName(jdbc_driver);
									conn = DriverManager.getConnection(jdbc_url, "root", "1234");
									String sql = "select * from listboard order by id desc";
									pstmt = conn.prepareStatement(sql);
									ResultSet rs = pstmt.executeQuery();
									
									while(rs.next()){
										int idx = rs.getInt(1);
										String game = rs.getString(2);
										String title = rs.getString(3);
										String writer = rs.getString(4);
										String days = rs.getString(5);
										String review = rs.getString(6);
										int view = rs.getInt(7);
										String memo = rs.getString(8);
								%>
								<tr>
									<td></td>
									<td><%=idx %></td>
									<td><%=game %></td>
									<td><a href="review_view.jsp?idx=<%=idx %>"><%=title %></a></td>
									<td><%=writer %></td>
									<td><%=days %></td>
									<td><%=view %></td>
									<td><%=review %></td>
									<td></td>
								</tr>
								<%}
								}catch(Exception e){
									e.printStackTrace();
								}
									%>


							</table>
							<input type="button" value="글쓰기" onclick="window.location='review_write.jsp'"/>
							<input type="button" value="삭제" onclick="window.location='review_delete.jsp'"/>
							</div>
						</div>
						</div>

				

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<h2>오픈소스 전문 프로젝트</h2>
						<p>12조 개발중인 프로젝트 입니다. </p>

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

	</body>
</html>