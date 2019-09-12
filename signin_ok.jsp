<%/*작성자 박서윤*/ %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><body bgcolor="#2c2c32">
<% request.setCharacterEncoding("utf-8"); %>
<%
	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs; 

	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/boardschema";
	
	int flag=0;
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);

		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "root", "q1w2e3r4");//아이디-비밀번호

		// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
		
		String sql = "SELECT * FROM user WHERE ID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("ID"));
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString("PW").equals(request.getParameter("PW"))){
                	//로그인 성공
            		out.println("<script>");
            		out.println("window.close();");
            		session.setAttribute("name", rs.getString("name"));
            		session.setAttribute("ID", rs.getString("ID"));
            		session.setAttribute("PW", rs.getString("PW"));
            		session.setAttribute("email", rs.getString("email"));
            		session.setAttribute("admin", rs.getInt("admin"));
            		out.println("window.opener.location.reload(); ");
            		out.println("</script>");
            		flag=1;
                }
                else{//비밀번호 불일치
            		out.println("<script>alert('비밀번호가 틀렸습니다.')");
            		out.println("window.location='signin.jsp';");
            		out.println("</script>");
                }
            }
            if(flag==0){//아이디 없음
    		out.println("<script>alert('존재하지 않는 아이디입니다.')");
    		out.println("window.location='signin.jsp';");
    		out.println("</script>");
            }
        }
        catch(Exception e) {
		System.out.println(e);
	}
%>
<script language="javascript">
</script>
</body></html>