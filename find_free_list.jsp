<%/*작성자 공민철*/ %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
    	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
    String searchtype = null;
    String searchtext = null;
    searchtype = request.getParameter("searchtype");
    searchtext = request.getParameter("searchtext");
    System.out.println(searchtype);
    System.out.println(searchtext);
    //글검색 요청
   int pg = 1;
   int pageSize = 10;
   int pageBlock = 10;
   if(request.getParameter("pg")!=null)
   	pg = Integer.parseInt(request.getParameter("pg"));
   int total=0;
   int EndNo = (pg*pageSize);
   int StartNo = (pg*pageSize)-(pageSize);
   int startPage = ((pg-1)/pageSize*pageSize)+1;
   int endPage = ((pg-1)/pageSize*pageSize)+pageSize;
   int totalPage = 0;
   int prevBlock = (int)Math.floor((pg-1)/pageBlock)*pageBlock;
   int nextBlock = prevBlock + pageBlock + 1;
	System.out.println("pg : " + pg + " StartNo : " + StartNo + " EndNo : " + EndNo + "startPage : " + startPage + "endPage : " + endPage);
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema?useUnicode=true&characterEncoding=utf8";

	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();

		String sp = "select count(*) as cnt from `boardschema`.`freelist` where";
		if(searchtype.equals("findTitle")){
			sp = sp + " title='"+searchtext+"'";
			//pstmt.setString(1, "title");
			//pstmt.setString(2, searchtext);
		}
		else if(searchtype.equals("findWriter")){
			sp = sp + " writer='"+searchtext+"'";
			//pstmt.setString(1, "writer");
			//pstmt.setString(2, searchtext);
		}
		else if(searchtype.equals("findGame")){
			sp = sp + " game='"+searchtext+"'";
			//pstmt.setString(1, "game");
			//pstmt.setString(2, searchtext);
		}

		//x.id, x.title, x.game ...;
		//where rownum between 21 and 30;
		pstmt = conn.prepareStatement(sp);
		
		System.out.println("sp = "+ sp);
		/*
		if(searchtype.equals("findTitle")){
			pstmt.setString(1, "title");
			pstmt.setString(2, searchtext);
		}
		else if(searchtype.equals("findWriter")){
			pstmt.setString(1, "writer");
			pstmt.setString(2, searchtext);
		}
		else if(searchtype.equals("findGame")){
			pstmt.setString(1, "game");
			pstmt.setString(2, searchtext);
		}*/
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			total = rs.getInt("cnt");
		}
		System.out.println("total : " + total);
		String findsql1 = "select * from `boardschema`.`freelist` where";
		String findsql2 = "order by id desc limit ?, ?";
		//String findsql = "select * from `boardschema`.`freelist` where ? = ? order by id desc limit ?, ?";
		if(searchtype.equals("findTitle")){
			findsql1 = findsql1 + " title = '" + searchtext + "' ";
			//pstmt.setString(1, "title");
			//pstmt.setString(2, searchtext);		
		}
		else if(searchtype.equals("findWriter")){
			findsql1 = findsql1 + " writer = '" + searchtext + "' ";
			//pstmt.setString(1, "writer");
			//pstmt.setString(2, searchtext);
		}
		else if(searchtype.equals("findGame")){
			findsql1 = findsql1 + " game = '" + searchtext + "' ";
			//pstmt.setString(1, "game");
			//pstmt.setString(2, searchtext);
		}
		String findsql = findsql1 + findsql2;
		pstmt = conn.prepareStatement(findsql);
		
		System.out.println(StartNo + "/" + pageSize);
		pstmt.setInt(1, StartNo);
		pstmt.setInt(2, pageSize);
		rs = pstmt.executeQuery();
		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>게임 리뷰 홈페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main1.css" />
<style>
td {
	text-align: center;
}

th {
	text-align: center;
}
</style>
<script>
		function search_func(){
			var form = document.form2;
			if(!form.searchtext.value){
				alert("검색 내용을 입력하세요.");
				form.searchtext.focus();
				return;
			}
			form.submit();
			
		}
		function pleaseLogin(){
			alert("로그인 후 이용하세요.");
		}
		</script>
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
		<h1>FREE BOARD</h1>
		<p>
			FREE BOARD<br />
		</p>
		</header>
		<a href="#main" class="more">Learn More</a>
	</div>
	</section>

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Boxes -->
			<div class="thumbnails"></div>
			<div class="press" width="100%">
				<input onclick="window.location='index.jsp'" type="button"
					class="style2" style="margin-left: 20px; margin-bottom: 20px;"
					value="메인 화면" /> <input type="button" class="style3"
					style="margin-left: 20px;" value="게임 리뷰"
					onclick="window.location='review_list.jsp'" /> <input
					type="button" class="style2" style="margin-left: 20px;"
					value="게임 정보" onclick="window.location='info_list.jsp'"/> <input type="button" class="style3"
					style="margin-left: 20px;" value="자유게시판" onclick="window.location='free_list.jsp'"/>
				<p></p>

				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<!--  <tr height="5"><td width="5"></td></tr-->
					<tr
						style="text-align: center; background-color: white; color: black;">
						<td width="5"></td>
						<td width="56">글번호</td>
						<td width="500">리뷰 제목</td>
						<td width="73">작성자</td>
						<td width="56">작성일</td>
						<td width="56">조회수</td>
						<td width="7"></td>
					</tr>


					<%while (rs.next()) {

									int idx = rs.getInt("id");
									String game = rs.getString("game");
									String title = rs.getString("title");
									String writer = rs.getString("writer");
									String days = rs.getString("days");
									int view = rs.getInt("view");
									String memo = rs.getString("memo"); %>

					<tr>
						<td></td>
						<td><%=idx %></td>
						<td style="text-align: left; padding-left: 40px;"><a
							href="free_view.jsp?idx=<%=idx %>"><%=title %></a></td>
						<td><%=writer %></td>
						<td><%=days %></td>
						<td><%=view %></td>
						<td></td>
					</tr>

					<%}
								}catch(Exception e){
									e.printStackTrace();
								}
									%>
				</table>
				<table>
					<tr>
						<td style="background-opacity: 0.2;">
							<%
								totalPage = (int)Math.ceil(total/(double)pageSize);
								
								if(endPage > totalPage){
									endPage = totalPage;
								}
								if(pg>pageSize){%> <a href="find_free_list.jsp?pg=<%=1 %>&searchtype=<%=searchtype%>&searchtext=<%=searchtext%>">처음으로</a>
							<a href="find_free_list.jsp?pg=<%=startPage-1 %>&searchtype=<%=searchtype%>&searchtext=<%=searchtext%>">이전</a> <% } %>

							<%
								for(int i = startPage; i <= endPage; i++){
									if(i==pg){
									%> <%=i %> <%}else{%> <a href="find_free_list.jsp?pg=<%=i %>&searchtype=<%=searchtype%>&searchtext=<%=searchtext%>"><%=i %></a>
							<% }
								}%> <%if(endPage < totalPage){ %> <a
							href="find_free_list.jsp?pg=<%=endPage+1 %>&searchtype=<%=searchtype%>&searchtext=<%=searchtext%>">다음</a> <a
							href="find_free_list.jsp?pg=<%=totalPage %>&searchtype=<%=searchtype%>&searchtext=<%=searchtext%>">맨뒤로</a> <%} %>
						</td>
					</tr>
				</table>
				<table>
					<form name=form2 action="find_free_list.jsp?pg=<%=pg%>">
					<tr>
						<td width=20%;></td>
						<td><select name="searchtype"
							style="color: gray;">
								<option value="findTitle" selected>제목</option>
								<option value="findWriter">글쓴이</option>
						</select></td>
						<td>
						<input type="text" name="searchtext"/>
						</td>
						<td>
						<input type="button" value="검색" onclick="search_func();"style="background-color:black;" />
						</td>
						<td>
						<input type="button" value="글쓰기" class="style2" style="background-color:#3A2344; color:gray;" 
						<%if(session.getAttribute("ID")==null){ %>
						onclick="pleaseLogin();"
						<%}else{ %>
						onclick="window.location='free_write.jsp'" 
						<%} %>
						
						/>
						</td>
					</tr>
					</form>
				</table>



			</div>
		</div>
	</div>



	<!-- Footer -->
	<footer id="footer">
	<div class="inner">
		<h2>오픈소스 전문 프로젝트</h2>
		<p></p>

		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
		</ul>
		<p class="copyright">
			&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
			Images: <a href="https://unsplash.com/">Unsplash</a>. Videos: <a
				href="http://coverr.co/">Coverr</a>.
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

</body>
</html>