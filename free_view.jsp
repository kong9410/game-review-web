<!-- 오픈소스 12조
   이름 : 게임 리뷰 게시글 보기
   작성자 : 공민철
   설명 : 게임 리뷰 게시글을 보여준다.
   수정, 삭제, 목록 기능
 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*" %>
    <%
       request.setCharacterEncoding("utf-8");
      String ID=(String)session.getAttribute("ID");
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
      td{
         text-align:center;
      }
      th{
         text-align:center;
         
      }
      </style>
      <script>
         function list_delete(){
            document.form1.submit();
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
                     <p>FREE BOARD<br /></p>
                  </header>
                  <a href="#main" class="more">Learn More</a>
               </div>
            </section>

         <!-- Main -->
            <div id="main">
               <div class="inner">

               <!-- Boxes -->
                  <div class="press">
                  <!--div width="100%">
                     <input onclick="window.location='index.jsp'" type="button" class="style2" style="margin-left:20px;margin-bottom:20px;"value="메인 화면"/>
                     <input type="button" class="style3" style="margin-left:20px;" value="게임 리뷰"/>
                     <input type="button" class="style2" style="margin-left:20px;"value="게임 정보"/>
                     <input type="button" class="style3" style="margin-left:20px;"value="전문 리뷰"/>
                  </div-->
                     <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <% 
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        
                        String jdbc_driver = "com.mysql.jdbc.Driver";
                        String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
                        int idx = Integer.parseInt(request.getParameter("idx"));
                        String game = null;
                        String title = null;
                        String writer = null;
                        String days = null;
                        int view = -1;
                        String memo = null;
                        
                        try{
                           Class.forName(jdbc_driver);
                           conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
                           String sql = "select * from freelist where id=" + idx;
                           pstmt = conn.prepareStatement(sql);
                           ResultSet rs = pstmt.executeQuery();
                           
                           if(rs.next()){
                              //idx = rs.getInt(1);
                              title = rs.getString(3);
                              writer = rs.getString(4);
                              days = rs.getString(5);
                  
                              view = rs.getInt(7);
                              view++;
                              memo = rs.getString(8);
                           }
                           sql = "update freelist set view="+view+" where id="+idx;
                           pstmt.executeUpdate(sql);
                           rs.close();
                           pstmt.close();
                           conn.close();
                           
                        }catch(Exception e){e.printStackTrace();}
                        %>
                        <form name='form1' action="freedelete_ok.jsp?idx=<%=idx %>">
                           
                           <tr>
                              <td style="border-right:1px solid gray" width=20%>
                              제목
                              </td>
                              <td colspan=3>
                              <%=title %>
                              </td>
                           </tr>
                           <tr>
                              <td style="border-right:1px solid gray">
                              글쓴이
                              </td>
                              <td colspan=3>
                              <%=writer %>
                              </td>
                           </tr>
                           <tr>
                              <td style="border-right:1px solid gray">
                              조회수
                              </td>
                              <td colspan=3>
                              <%=view %>
                              </td>
                           </tr>
                           <tr height=400>
                              <td style="border-right:1px solid gray">
								  내용
                              </td>
                              <td colspan = 4 style="text-align:left; padding-left:10pt;">
                              <%=memo.replaceAll("\r\n", "<br/>")%>
                              </td>
                           </tr>
                        </table>
                        <input type="button" value="목록" onclick="window.location='free_list.jsp'" style="margin-right:20px;"/>
                        <!-- 로그인시에만 수정 가능 -->
                         <input type="button" value="수정" style="margin-right:20px;"
                        <%if(session.getAttribute("ID")==null){ %>
                        onclick="pleaseLogin();"
                        <%}else if(!ID.equals(writer)){ %>
                        onclick="notlog()"
                        <%}else{ %>
                        onclick="window.location='free_edit.jsp?idx=<%=idx %>'"
                        <%} %>
                        />
                        <!-- 로그인시에만 삭제 가능 -->
                        <input type="button" value="삭제" 
                        <%if(session.getAttribute("ID")==null){ %>
                        onclick="pleaseLogin();"
                        <%}else if(!ID.equals(writer)){ %>
                        onclick="notlog()";
                         <%}else{ %>
                        onclick="window.location='freedelete_ok.jsp?idx=<%=idx %>'"
                        <%} %>
                        />
                     </form>

                  </div><br><br>
                  <div class="press">
                  <table width="100%" cellpadding="0" cellspacing="0" border="0">
                           <%
                           if (ID != null) {
                           %>
                           <tr>
                              <form id="form" name="form">
                              <td style="border-right:1px solid gray" width=20%>
                              <%= ID %>
                              </td>
                              <td colspan=3>
                              <input type="text" name="comment3"><input type="hidden" name="refnum" value="<%=idx%>"></td>
                              <td style="border-left:1px solid gray" width=15%>
                              <input type="submit" class="button style4 fit" value="등록" onclick="validate();">
                              </td>
                              </form>
                           </tr>
                              <% }
                              else{}%>
                              <%
                              try{
                                 Class.forName(jdbc_driver);
                                 conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");
                                 String sql = "select * from comment3 where refnum = "+idx;
                                 pstmt = conn.prepareStatement(sql);
                                 ResultSet rs = pstmt.executeQuery();
                                 String comm_writer;
                                 String comm_content;
                                 int comm_num;
                                 
                                 while(rs.next()){
                                    comm_num = rs.getInt("num");
                                    comm_writer = rs.getString("writer");
                                    comm_content = rs.getString("content"); %>
                              <tr>
                                 <td style="border-right:1px solid gray" width=20%>
                                    <%= comm_writer %>
                                 </td>
                                 <td colspan=3 width=70%>
                                    <%= comm_content %>
                                 </td>
                                 <td width=10%>
                                    <% if (ID.equals(comm_writer)){ %>
                                    <a href="comm_delete3_ok.jsp?comm_num=<%=comm_num%>&ref_num=<%=idx%>" style="cursor:pointer"><font color="yellow"><u>삭제</u></font></a>
                                    <% } else {} %>
                                 </td>
                              </tr>
                                 <% }
                                 rs.close();
                                 pstmt.close();
                                 conn.close();
                                 
                              }catch(Exception e){e.printStackTrace();}
                              %>
                           </table></div>
               </div>
            </div>

         <!-- Footer -->
            <footer id="footer">
               <div class="inner">
                  <h2>오픈소스 전문 프로젝트</h2>

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
         function validate(){
            //var comment3 = document.getElementById("comment3").value;
            //if(document.getElementById("comment3").value==""){
            //   alert("내용을 입력하세요.");
            //   return false;
            //}
             form.action=("comment_ok3.jsp");
             form.method=("post");
             form.submit();
            return true;
         }
         function notlog(){
        	 alert("허용되지 않은 접근입니다.");
         }
         </script>
   </body>
</html>