<!-- 오픈소스 12조
	이름 : 게임 리뷰 글쓰기
	작성자 : 공민철
	설명 : 게임 리뷰 게시판에 글을 쓴다.
 -->

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <title>게임 리뷰 홈페이지</title>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link rel="stylesheet" href="assets/css/main3.css"/>
            <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
              <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
              <script language="javascript">
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
                    <h1>GAME REVIEW</h1>
                    <p>Game Review<br/></p>
                  </header>
                  <a href="#main" class="more">Learn More</a>
                </div>
              </section>
              <!-- Main -->

              <div id="main">
                <div class="inner">

                  <!-- Boxes -->
                  <div class="thumbnails">
                    <form name="writeform" method="post" action="write_ok.jsp">
                      <table>
                        <tr>
                          <td>제목</td>
                          <td><input type="text" name="title"/></td>
                        </tr>
                        <tr>
                          <td>게임</td>
                          <td><input type="text" name="game"/></td>
                        </tr>
                        <tr>
                          <td>내용</td>
                          <td>
                            <textarea name="memo" rows="13" cols="50"></textarea>
                          </td>
                        </tr>
                        <tr>
                          <tr>
                            <td>평점</td>
                            <td>
                              <div class="stars">
                                <input class="star star-5" id="star-5-2" type="radio" name="star" value="5"/>
                                <label class="star star-5" for="star-5-2"></label>
                                <input class="star star-4" id="star-4-2" type="radio" name="star" value="4"/>
                                <label class="star star-4" for="star-4-2"></label>
                                <input class="star star-3" id="star-3-2" type="radio" name="star" value="3"/>
                                <label class="star star-3" for="star-3-2"></label>
                                <input class="star star-2" id="star-2-2" type="radio" name="star" value="2"/>
                                <label class="star star-2" for="star-2-2"></label>
                                <input class="star star-1" id="star-1-2" type="radio" name="star" value="1"/>
                                <label class="star star-1" for="star-1-2"></label>
                              </div>
                            </td>
                          </tr>
                        </table>
                      </form>
                    </div>

                    <input type="button" class="style2" name="write" value="등록" onclick="javascript:writeCheck();"/>
                    <input type="button" class="style3" name="list" value="목록" onclick="window.location='review_list.jsp'"/>
                  </div>
                </div>

                <!-- Footer -->
                <footer id="footer">
                  <div class="inner">
                    <h2>오픈소스 전문 프로젝트</h2>
                    <p>
                    </p>

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
                    <p class="copyright">&copy; Untitled. Design:
                      <a href="https://templated.co">TEMPLATED</a>. Images:
                      <a href="https://unsplash.com/">Unsplash</a>. Videos:
                      <a href="http://coverr.co/">Coverr</a>.</p>
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
